import csv
import os

# Path to csv file that will be used
budget_data = os.path.join('budget_data.csv')

# Read the csv file
with open(budget_data) as budget_data:
    budgetread = csv.reader(budget_data, delimiter=',')
    # Reads the header row 
    b_header = next(budgetread)
    data_sets = [{row[0]: row[1]} for row in budgetread]
    num_mon = int(len(data_sets))
    print(data_sets)
