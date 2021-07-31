from apscheduler.schedulers.blocking import BlockingScheduler
from apscheduler.triggers.cron import CronTrigger
import os
import types




def job():
    print("hello world")
    workingDirectory = os.path.dirname(os.path.realpath(__file__))

    for i in range(1, 3):
        outFile = open(f"{workingDirectory}/dataset{str(i)}_processed.csv")
        with open(f"{workingDirectory}/dataset{str(i)}.csv", "w+") as f:
            pass
        outFile.close()


# if __name__ == "__main__":
#     sched = BlockingScheduler()
#     trigger = CronTrigger(hour=1)
#     sched.add_job(job, trigger=trigger)
#     sched.start()

