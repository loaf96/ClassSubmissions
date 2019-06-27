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
    data_sets = {row[0]: int(row[1]) for row in budgetread}
    # The number of data sets will also show the amount of
    # months that are used for the data 
    num_mon = int(len(data_sets))
    # Finds the net profit for the company by appending the values
    # of the dictionary created early in the form of integers. Then
    # I calculated the sum and saved it to the variable net_profit
    prof_loss = [money for money in data_sets.values()]
    net_prof = sum(prof_loss)
    # Finds the average of the profit or losses column
    avg_money = net_prof/num_mon
    # Finds greatest increase and decrease
    greatest_inc = max(prof_loss)
    greatest_dec = min(prof_loss)
    mon_amon_inc = ''
    mon_amon_dec = ''
    for x in data_sets.items():
        if x[1] == greatest_inc:
            mon_amon_inc = x
        elif x[1] == greatest_dec:
            mon_amon_dec = x
        else:   
            next

   
# This will be used to write the text file with the information
# that has been previously gathered.
txt_file = os.path.join('Results.txt')
with open(txt_file, 'w') as outputdata:
    outputdata.write(f'Financial Analysis\nTotal Months: {num_mon}\nNet Profit: {net_prof}\n'
    f'Average Change: {avg_money}\nGreatest Increase: {mon_amon_inc[0]}: ${mon_amon_inc[1]}\nGreatest Decrease: {mon_amon_dec[0]}: ${mon_amon_dec[1]}')

