from threading import Thread
import time

class obj(object):
    def __init__(self, d):
        for k, v in d.items():
            if isinstance(k, (list, tuple)):
                setattr(self, k, [obj(x) if isinstance(x, dict) else x for x in v])
            else:
                setattr(self, k, obj(v) if isinstance(v, dict) else v)

class Animation:
    def __init__(self, message=None) -> None:
        self.message = message
        self.loop = True
        self.frame = ["[/] ", "[-] ", "[\] ", "[|] "]
        self.index_frame = 0

    def __run__(self) -> None:
        while self.loop:
            print(self.frame[self.index_frame] + self.message, end="\r")
            self.index_frame += 1
            if self.index_frame >= len(self.frame):
                self.index_frame = 0
            time.sleep(0.2)
        print("[+] " + self.message)

    def start(self) -> None:
        Thread(target=self.__run__).start()

    def stop(self) -> None:
        self.loop = False