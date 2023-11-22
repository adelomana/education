#
# execute as follows: /usr/bin/time -l python script.parallel.py
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
number_of_threads = 4
number_of_tasks = int(1e5)

#
# starting the main program
#

# protect the entry point
if __name__ == '__main__':

    # report a message
    print('about to start a parallel world...')

    # create the process pool
    with multiprocessing.Pool(number_of_threads) as pool:
        # perform calculations
        results = pool.map(costly_function, range(1, number_of_tasks))
    # report a message
    print('out of a parallel world')

    print(results[:5])
