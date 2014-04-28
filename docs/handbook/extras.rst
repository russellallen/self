******
Extras
******

    Last updated 4 February 2014 for Self 4.5.0

The default Self source code tree comes with a number of extra objects and features which aren't included in the default Self World. These can in general be loaded by doing::

  'path/to/file.self' runScript
  
or::

  bootstrap load: 'file' From: 'path/to'
  
where the current working directory is the `objects` directory of the source code tree.

These extra features include:

.. toctree::
   :maxdepth: 2

   ui1
