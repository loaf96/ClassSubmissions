import os
import csv

# Set the path of the file that I wish to read 
pollresults = os.path.join('election_data.csv')

# Allows for reading of the file to collect desired results
with open(pollresults) as results_poll:
    # sets the file type for the reader and the delimiter
    read_results = csv.reader(results_poll, delimiter=',')
    # Skips the header row 
    poll_hdr = next(read_results)
    # finds the total number of votes that were casted by counting the number
    # of rows
    votes = [row[2] for row in read_results]
    tot_votes = len(votes)
    # find the possible candidates by putting them into a set
    # which will not allow for repeated instances, then converting
    # it to a list for indexing purposes
    cands = {x for x in votes}
    cands = list(cands)
    # creates an empty list for the data to be stored of the candidate and their 
    # number of votes
    cands_votes = []
    for x in cands:
        got_vote = votes.count(x)
        per_vote = f'({round((got_vote/tot_votes) * 100, 2)}%)'
        cands_votes.append([x, got_vote, per_vote])
    next

    # function to be used for key to sort candidates in order from most to least 
    # amount of votes
    def sort_data(ds):
        return int(ds[1])

    # sorts the candidates with the sort_data function created, also could use lambda 
    # and write the function since it is not goint to be used again
    cands_votes.sort(key=sort_data, reverse=True)
    winner = cands_votes[0]
    winner = winner[0]


# creates text file with the ability of creating material on the 
# file
txt_file = os.path.join('Results.txt')
with open(txt_file, 'w') as txt_results:
    # writes header for the file
    txt_results.write('Election Results\n' + '-'*20 + '\n') 
    # displays the information that is dynamic in the data set
    for x in cands_votes:
        for y in x:
            txt_results.write(str(y))
            if y in cands:
                txt_results.write(': ')
            else:
                txt_results.write(' | ')
        next
        txt_results.write('\n\n')
    next
    txt_results.write('-' * 20 + '\n' + '!'*3 + 'Winner' + '!'*3 + '\n' + str(winner))

#Displays text file to terminal
with open('Results.txt', 'r') as final_results:
    print(final_results.read())
    
    