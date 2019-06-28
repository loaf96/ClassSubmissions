import os
import csv

# Set the path of the file that I wish to read 
pollresults_path = os.path.join('electioin_data.csv')
# Allows for reading of the file to collect desired results
with open pollresults_path as results_poll:
    read_results = csv.reader(results_poll, delimiter=',')
     