import os
# SQL
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

from core import Core
from utils import Animation
from json import load as jsonload
# MODEL
from model.alcohol import Alcohol
from model.astrologicalsign import AstrologicalSign
# from model.badge import Badge
# from model.base import Base
from model.bloodgroup import BloodGroup
from model.communication import Communication
# from model.config import Config
# from model.familyprojects import FamilyProjects
from model.foodpreferences import FoodPreferences
from model.job import Job
# from model.language import Language
from model.languageoflove import LanguageOfLove
from model.levelstudy import LevelStudy
from model.personality import Personality
from model.pet import Pet
# from model.photo import Photo
from model.position import Position
from model.relationshipintent import RelationshipIntent
from model.school import School
from model.sexualorientation import SexualOrientation
from model.sleephabits import SleepHabits
from model.smokingfrequency import SmokingFrequency
from model.sport import Sport
# from model.userbadge import UserBadge
# from model.userlanguage import UserLanguage
from model.users import Users

dbconfig = Core.config.database
engine = create_engine(f"mysql+mysqlconnector://{dbconfig.login.user}:{dbconfig.login.password}@{dbconfig.host}:{dbconfig.port}/{dbconfig.name}")

Session = sessionmaker(bind=engine)
session = Session()

data:str

def isAlreadySaved(id_tinder, latitude, longitude) -> bool:
    query = session.query(Users).join(Users.position).filter(Users.id_tinder == id_tinder, Position.latitude == latitude, Position.longitude == longitude)
    return len(query.all()) > 0

def selected_descriptors_by_id(id_:str) -> dict:
    if "selected_descriptors" not in data["user"]:
        return None
    def get_value(elm) -> str:
        for t in ["choice_selections", "measurable_selection"]:
            if t in list(elm.keys()):
                for v in ["name", "value"]:
                    if isinstance(elm[t], dict) and v in list(elm[t].keys()):
                        return elm[t][v]
                    elif isinstance(elm[t], list) and v in list(elm[t][0].keys()):
                        return elm[t][0][v]
    for elm in data["user"]["selected_descriptors"]:
        if elm["id"] == id_:
            return get_value(elm)
    return None

def add_or_get_id_from_value(table, column:str|tuple[str], value:str|tuple[str], just_get_id:bool=False) -> int|None:
    if value is None:
        return None
    
    Session = sessionmaker(bind=engine)
    session = Session()

    try:
        if isinstance(column, tuple):
            colval = {column[i]:value[i] for i in range(len(column))}
        else:
            colval = {column:value}

        res = session.query(table).filter_by(**colval).first()

        if res is None:
            if not just_get_id and len([colval[key] for key in colval.keys() if colval[key] is not None]) > 0:
                session.add(table(**colval))
                session.commit()
                res = session.query(table).filter_by(**colval).first()
            else:
                return None

        return res.id

    except Exception as e:
        print(str(e))
        return None

    finally:
        session.close()

def get_value(*keys) -> str|int|list|None:
    d = data
    for key in keys:
        if (isinstance(d, dict) and key in list(d.keys())) or (isinstance(d, list) and len(d) > 0):
            d = d[key]
        else:
            return None
    return d

datapath = "./data/"

annim = Animation()
annim.message = "En cours d'enregistrement... "
annim.start()

for filename in os.listdir(datapath):

    timestamp, latitude, longitude = filename.replace(".json", "").split("_")

    file = open(datapath + filename, "rb")
    data = jsonload(file)

    if "results" not in data["data"]:
        continue

    data_content = data["data"]["results"]

    for record in data_content:
        data = record
        if isAlreadySaved(get_value("user", "_id"), latitude, longitude):
            continue

        utilisateur = Users(
            id_tinder=get_value("user", "_id"), 
            bio=get_value("user", "bio"), 
            birth_date=get_value("user", "birth_date"), 
            name=get_value("user", "name"), 
            gender=get_value("user", "gender"), 
            sexual_orientation_id=add_or_get_id_from_value(SexualOrientation, "code", get_value("user", "sexual_orientations", 0, "id"), just_get_id=True), 
            job_id=add_or_get_id_from_value(Job, ("company", "profession"), (get_value("user", "jobs", 0, "company", "name"), get_value("user", "jobs", 0, "title", "name"))), 
            school_id=add_or_get_id_from_value(School, "label", get_value("user", "schools", 0, "name")), 
            measurement=selected_descriptors_by_id("de_30"), 
            astrological_sign_id=add_or_get_id_from_value(AstrologicalSign, "label", selected_descriptors_by_id("de_1"), just_get_id=True), 
            level_study_id=add_or_get_id_from_value(LevelStudy, "label", selected_descriptors_by_id("de_9")), 
            family_projects_id=None, 
            covid_vaccine="Vacciné•e" in str(selected_descriptors_by_id("de_34")), 
            personality_id=add_or_get_id_from_value(Personality, "label", selected_descriptors_by_id("de_13"), just_get_id=True), 
            communication_id=add_or_get_id_from_value(Communication, "label", selected_descriptors_by_id("de_2")), 
            language_of_love_id=add_or_get_id_from_value(LanguageOfLove, "label", selected_descriptors_by_id("de_35")), 
            blood_group_id=add_or_get_id_from_value(BloodGroup, "label", selected_descriptors_by_id("de_14")), 
            pet_id=add_or_get_id_from_value(Pet, "label", selected_descriptors_by_id("de_3")), 
            alcohol_id=add_or_get_id_from_value(Alcohol, "label", selected_descriptors_by_id("de_22")), 
            smoking_frequency_id=add_or_get_id_from_value(SmokingFrequency, "label", selected_descriptors_by_id("de_11")), 
            sport_id=add_or_get_id_from_value(Sport, "label", selected_descriptors_by_id("de_10")), 
            food_preferences_id=add_or_get_id_from_value(FoodPreferences, "label", selected_descriptors_by_id("de_7")), 
            social_networks_id=None, 
            sleep_habits_id=add_or_get_id_from_value(SleepHabits, "label", selected_descriptors_by_id("de_17")), 
            relationship_intent_id=add_or_get_id_from_value(RelationshipIntent, "label", get_value("relationship_intent", "body_text")), 
            distance=get_value("distance_mi"), 
            position_id=add_or_get_id_from_value(Position, ("latitude", "longitude"), (latitude, longitude))
        )

        session.add(utilisateur)

    try:
        session.commit()
    except Exception as e:
        session.rollback()
        print("Une erreur s'est produite lors de l'enregistrement de l'utilisateur :", str(e))
    finally:
        session.close()

annim.message = "Données enregistrées" + " "*10
annim.stop()
