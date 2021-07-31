# Documentation

## Description

I utilised the python package APScheduler with the BlockingScheduler.

This python file will need to be kept running inside of the server that contains the dataset files.  
The file is a blocking file and will continue to run regardless of environment (e.g. linux, windows, OSX) as long as python and required packages are installed.  
I chose this over cron as I was unsure of the environment this would be run in.

Steps to install dependecies are below.

## Assumptions

If the price is less than 100, the `above_100` field will be empty

## Dependencies

The dependencies are listed in requirements.txt

Install using pip: `pip install -r requirements.txt`

## Output file

The output file name would be the same as the input file name with "\_processed" appended to the end
E.g. dataset1.csv --> dataset1_processed.csv

## APScheduler

Using APScheduler to perform the cron job. More info can be found here https://apscheduler.readthedocs.io/en/stable/index.html
