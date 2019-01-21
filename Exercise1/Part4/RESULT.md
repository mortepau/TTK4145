
Part 4: Results
-----------------

The results from the simulations show that by creating multiple threads which share the same variable the execution isn't as expected. The expected result is that i = 0, but it rather gets different results as the shared variable is written and modified by the 2 threads at the same time which is unwanted.
