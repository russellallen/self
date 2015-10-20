Debugging Optimized Code with Dynamic Deoptimization
====================================================

`Urs Hölzle <http://www.cs.ucsb.edu/~urs>`_, `Craig Chambers <http://www.cs.washington.edu/people/faculty/chambers.html>`_, and David Ungar

**Abstract:**

Self's debugging system provides complete 
source-level debugging (expected behavior) with globally 
optimized code. It shields the debugger from optimizations 
performed by the compiler by dynamically deoptimizing 
code on demand. Deoptimization only affects the procedure 
activations that are actively being debugged; all other code 
runs at full speed. Deoptimization requires the compiler to 
supply debugging information at discrete interrupt points; 
the compiler can still perform extensive optimizations 
between interrupt points without affecting debuggability. At 
the same time, the inability to interrupt between interrupt 
points is invisible to the user. Our debugging system also 
handles programming changes during debugging. Again, 
the system provides expected behavior: it is possible to 
change a running program and immediately observe the 
effects of the change. Dynamic deoptimization transforms 
old compiled code (which may contain inlined copies of the 
old version of the changed procedure) into new versions 
reflecting the current source-level state. To the best of our 
knowledge, Self is the first practical system providing full 
expected behavior with globally optimized code.

*Proceedings of the ACM SIGPLAN '92 Conference on Programming Language
Design and Implementation, pp. 32-43, San Francisco, June, 1992.*

*Published as SIGPLAN Notices 27(7), July, 1992.*

 `PDF <_static/dynamic-deoptimization.pdf>`_

