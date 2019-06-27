import csv
import os

# Path to csv file that will be used
budget_data = os.path.join('budget_data.csv')

# Read the csv file
with open(budget_data) as budget_data:
    budgetread = csv.reader(budget_data, delimiter=',')
    # Reads the header row 
    b_header = next(budgetread)
    # Creates a dict for the data with months as key and the 
    # profit or loss as the value
    data_sets = {row[0]: row[1] for row in budgetread}
    # The number of data sets will also show the amount of
    # months that are used for the data 
    num_mon = int(len(data_sets))
    # Finds the net profit for the company by appending the values
    # of the dictionary created early in the form of integers. Then
    # I calculated the sum and saved it to the variable net_profit
    prof_loss = [int(money) for money in data_sets.values()]
    net_prof = sum(prof_loss)
    # Finds the average of the profit or losses column
    avg_money = net_prof/num_mon
    # Finds greatest increase and decrease
    greatest_inc = max(prof_loss)
    greatest_dec = min(prof_loss)
    print(f'Greatest: {greatest_inc}\nLowest: {greatest_dec}')
    

