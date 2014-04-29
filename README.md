puppet-garli
===================

Puppet modules for deployment of garli 
Source files are cloned from the latest branch on github:  https://github.com/stamatak/standard-garli

Parameters
-------------
All parameters are set as defaults in init.pp or can be overwritten using the Foreman or Hieradata

Classes
-------------
- garli

Dependencies
-------------
- no module dependencies.


Parameters
-------------
nclsvn, version and packages, defaults to the packages needed for compiling from source.


```
  $nclsvn              = false ,  ' do a svn checkout before compiling code. 
  $version             = '2.01',
  $packages            = ['build-essential','autoconf','subversion','libtool','pkg-config','openjdk-6-jdk'] 

```

Result
-------------
garli binary, compiled from source 
Source files, documentation and binary are in /opt/garli-2.01
symlink to binary in /usr/bin/Garli

Usage: mpirun -np <# of processors to use> <MPI GARLI executable name> <# of times to execute the GARLI "garli.conf" file>
Usage Example for running on 8 Cores
```
cd /opt/garli-2.01/example/basic
mpirun -np 8 Garli 20
```

Limitations
-------------
This module has been built on and tested against Puppet 3 and higher.

The module has been tested on:
- Ubuntu 12.04LTS


Authors
-------------
Author Name <hugo.vanduijn@naturalis.nl>

