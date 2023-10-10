#
# execute as follows: /usr/bin/time -l python script.single.py
#

#
# example of a program that uses all cpu cores
#
import math
import multiprocessing

# define a cpu-intensive task
def costly_function(arg):
    return sum([math.sqrt(i) for i in range(1, arg)])

#
# user-defined variables
#
number_of_tasks = int(1e5)

#
# starting the main program
#

# protect the entry point
print('about to start working in a single thread...')
results = []
for element in range(1, number_of_tasks):
    result = costly_function(element)
    results.append(result)
print(results[:5])
