from apscheduler.schedulers.blocking import BlockingScheduler
from apscheduler.triggers.cron import CronTrigger
import os
from typing import Tuple


def cleanLine(string: str) -> Tuple[bool, str]:
    if string.split(",")[0] == "name":
        return True, "first_name,last_name,price,above_100"
    if string.split(",")[0] == "":
        return False, ""

    name = string.split(",")[0]
    price = string.split(",")[1]

    nameArr = name.split(" ")
    lastName = nameArr[-1]
    firstName = nameArr[0]
    if len(nameArr) > 2:
        firstName = nameArr[1]
    elif len(nameArr) == 1:
        firstName = nameArr[0]
        lastName = ""

    above100 = ""
    try:
        cleanPrice = float(price)
        if cleanPrice > 100:
            above100 = "true"
    except ValueError:
        print("invalid price")
        return False, ""

    return True, f"{firstName},{lastName},{str(cleanPrice)},{above100}\n"


def job():
    workingDirectory = os.path.dirname(os.path.realpath(__file__))

    for i in range(1, 3):
        outFile = open(f"{workingDirectory}/dataset{str(i)}_processed.csv", "w+")
        with open(f"{workingDirectory}/dataset{str(i)}.csv") as f:
            for line in f:
                resBool, resString = cleanLine(line.strip())
                if resBool:
                    outFile.write(resString)
        outFile.close()

if __name__ == "__main__":
    sched = BlockingScheduler()
    trigger = CronTrigger(hour=1)
    sched.add_job(job, trigger=trigger)
    sched.start()

