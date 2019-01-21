# Mutex and Channel basics

### What is an atomic operation?
> Atomic operations in concurrent programming are program operations that run completely independent of any other processes. This means that the process executing the task reads and writes a resource in the same bus operation.

### What is a semaphore?
> A semaphore is a variable or struct which is used to control the access to a resource. One method is a counting semaphore which has two operations; wait() and signal(), wait() decrements the counter unless it is negative and signal() increments the counter.

### What is a mutex?
> A mutex is a flag or variable that controls which one of the processes or threads can access a shared resource.

### What is the difference between a mutex and a binary semaphore?
> A binary semaphore is one kind of semaphore which also can be used as the simplest lock mutex. The binary semaphore ensures exclusive access to the locked resource.

### What is a critical section?
> A critical section is a part of the concurrent program where a shared resource can be accessed by more than one process/thread

### What is the difference between race conditions and data races?
 > A race condition is a situation where the result of an operation depends on the timing of some operations, while a data race is a situation where two (or more) threads access the same shared resource at the same time

### List some advantages of using message passing over lock-based synchronization primitives.
> - Easier to control the process that are next in queue  
> - Can be implemented asynchronously  
> - Easier to scale  
> - Does not use a shared memory, as each thread/process has its own memory

### List some advantages of using lock-based synchronization primitives over message passing.
> - Easier algorithms used to implement  
> - Improved performance as no need to generate a message for each access  
> - Less memory used as there is only need for one shared memory
