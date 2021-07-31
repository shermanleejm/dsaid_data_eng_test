from apscheduler.schedulers.blocking import BlockingScheduler
from apscheduler.triggers.cron import CronTrigger
import os
import types


def job():
    print("hello world")
    workingDirectory = os.path.dirname(os.path.realpath(__file__))
    dataset1_out = open(f"{workingDirectory}/dataset1_processed.csv")



if __name__ == "__main__":
    sched = BlockingScheduler()
    trigger = CronTrigger(hour=1)
    sched.add_job(job, trigger=trigger)
    sched.start()

