# Reasons for concurrency and parallelism


To complete this exercise you will have to use git. Create one or several commits that adds answers to the following questions and push it to your groups repository to complete the task.

When answering the questions, remember to use all the resources at your disposal. Asking the internet isn't a form of "cheating", it's a way of learning.

 ### What is concurrency? What is parallelism? What's the difference?
 > Concurrency is running different tasks at the same time, but it isn't really at the same time as they are executed after each other in time. Parallelism, on the other hand, is actually running different tasks at the same time, as this uses more tha one processor which concurrency does not.
 
 ### Why have machines become increasingly multicore in the past decade?
 > Machines have become increasingly more multicore in the past decade as the power consumption per square area is at such a great level that it is difficult to increase it without the heating getting out of hand. Multicore represents a method for increasing the amount of tasks which can be done by introducing more processors which run at a lower speed, but still completes the multiple tasks faster.
 
 ### What kinds of problems motivates the need for concurrent execution?
 (Or phrased differently: What problems do concurrency help in solving?)
 > The problems concurrency help in solving are problems where there are timing constraints and it also makes the use of multicore processors possible.
 
 ### Does creating concurrent programs make the programmer's life easier? Harder? Maybe both?
 (Come back to this after you have worked on part 4 of this exercise)
 > Concurrent programs can make the programmer's life harder as they have to take into consideration shared resources and handle those properly, while in non-concurrent programs there is no need to consider that factor. On the other hand, it also makes the life easier as it then is possible to create programs which can do things non-concurrent programs cannot.
 
 ### What are the differences between processes, threads, green threads, and coroutines?
 > The difference between processes and threads is that processes run in separate memory spaces while threads (which share process) have a shared memory space. The difference between threads and green threads is that the green threads don't rely on the OS' capabilities. On multicore CPU's the green threads only run on one, while threads can run on multiple. The difference between threads and coroutines is that coroutines only execute in one processor and is run concurrently, it is also controlled by the program or programmer while the threads are controlled by the processor itself and an algorithm it has.
 
 ### Which one of these do `pthread_create()` (C/POSIX), `threading.Thread()` (Python), `go` (Go) create?
 > These function calls create threads. 
 
 ### How does pythons Global Interpreter Lock (GIL) influence the way a python Thread behaves?
 > The Global Interpreter Lock (GIL) prevents multiple threads from executing bytecodes at the same time. This is introduced as the memory management is not thread-safe.
 
 ### With this in mind: What is the workaround for the GIL (Hint: it's another module)?
 > A possible solution to the problem with GIL is to use a module called multiprocessing, this module lets the user create multiple processes instead of threads such that each process has its own GIL and thus don't have to wait for the aquirement of the GIL.
 
 ### What does `func GOMAXPROCS(n int) int` change? 
 > This function changes how many of the system's available threads the program can use at any given time.
