How to use the low-level interrupt facilities
=============================================

There are two low-level ways to interrupt a running Self program [#f1]_ , Control-C and Control-\\. The
second way works even if the Self process scheduler is not running.
In response to the interrupt, you will see one of two things. If the Self scheduler is not running,
you will be returned directly to the ``VM#`` prompt. If the scheduler is running, you will be presented
with a list of Self processes (the process menu)::

    Self 9> 100000 * 100000 do: []
    ^C
        ----------------Interrupt-----------------
        Ready:
            <25> scheduling process 100000 * 100000 do: []
        ------------------------------------------
        Select a process (or q to quit scheduler): 25
        Select <return> for no action
            p to print the stack
            k to kill the process
            b to resume execution of the process in the background
            s to suspend execution of the process
        for process 25: k
        Process 25 killed.
        ------------------------------------------
    Self 10>

In this example, the loop was interrupted by typing Control-C, and the process menu was used to
abort the process. If the user had typed “q” to quit the scheduler, all current processes would have
been aborted along with the scheduler itself::

        ...
        ------------------------------------------
        Select a process (or q to quit scheduler): q
        Scheduler shut down.
        ------------------------------------------
    prompt
    VM#

The scheduler has been stopped, returning the user to the VM# prompt. The command prompt
start restarts the scheduler::

    VM# prompt start
    Self 11>

Although the VM# prompt can be used to evaluate expressions directly, the scheduler supports
much nicer error messages and debugging, so it is usually best to run the scheduler. (The scheduler
is started automatically when the default world is created.)

Certain virtual machine operations like garbage collection, reading a snapshot, and compilation
cannot be interrupted; interrupts during these operations will be deferred until the operation is
complete. As a last resort (e.g., if the system appears to be “hung”), you can force an abort by
pressing Control-\\ five times in a row.


.. 	rubric::	 Footnotes

.. [#f1] Normally, you would use debugging facilities provided in the programming environment.
