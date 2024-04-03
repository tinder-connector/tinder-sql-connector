from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

from core import Core
from utils import Animation

from model.smokingfrequency import SmokingFrequency
from model.alcohol import Alcohol
from model.personality import Personality
from model.communication import Communication
from model.languageoflove import LanguageOfLove
from model.language import Language
from model.astrologicalsign import AstrologicalSign
from model.sleephabits import SleepHabits
from model.sport import Sport
from model.pet import Pet
from model.bloodgroup import BloodGroup
from model.users import Users
from model.position import Position
from json import load as jsonload

from model.sexualorientation import SexualOrientation

import os

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
            if not just_get_id:
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
        if isinstance(d, dict) and key in list(d.keys()):
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
        so_id = get_value("user", "sexual_orientations")
        if so_id is not None:
            so_id = so_id[0]["id"]
        utilisateur = Users(
            id_tinder=get_value("user", "_id"), 
            bio=get_value("user", "bio"), 
            birth_date=get_value("user", "birth_date"), 
            name=get_value("user", "name"), 
            gender=get_value("user", "gender"), 
            sexual_orientation_id=add_or_get_id_from_value(SexualOrientation, "code", so_id, just_get_id=True), 
            job_id=None, 
            school_id=None, 
            measurement=selected_descriptors_by_id("de_30"), 
            astrological_sign_id=add_or_get_id_from_value(AstrologicalSign, "label", selected_descriptors_by_id("de_1")), 
            level_study_id=None, 
            family_projects_id=None, 
            covid_vaccine="Vacciné•e" in str(selected_descriptors_by_id("de_34")), 
            personality_id=add_or_get_id_from_value(Personality, "label", selected_descriptors_by_id("de_13")), 
            communication_id=add_or_get_id_from_value(Communication, "label", selected_descriptors_by_id("de_2")), 
            language_of_love_id=add_or_get_id_from_value(LanguageOfLove, "label", selected_descriptors_by_id("de_35")), 
            blood_group_id=add_or_get_id_from_value(BloodGroup, "label", selected_descriptors_by_id("de_14")), 
            pet_id=add_or_get_id_from_value(Pet, "label", selected_descriptors_by_id("de_3")), 
            alcohol_id=add_or_get_id_from_value(Alcohol, "label", selected_descriptors_by_id("de_22")), 
            smoking_frequency_id=add_or_get_id_from_value(SmokingFrequency, "label", selected_descriptors_by_id("de_11")), 
            sport_id=add_or_get_id_from_value(Sport, "label", selected_descriptors_by_id("de_10")), 
            food_preferences_id=None, 
            social_networks_id=None, 
            sleep_habits_id=add_or_get_id_from_value(SleepHabits, "label", selected_descriptors_by_id("de_17")), 
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
