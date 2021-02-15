AVM Plus
========

AVM Plus is the virtual machine to run ActionScript3 bytecode. This repository 
is based on a collaboration of a lot of people over years finally taken from
[tamarin](https://wiki.mozilla.org/Tamarin)

How to use
----------

Work in progress...

How to build
------------

Before start make sure you checked out git submodules.

You need cmake to build the project. Also to re-generate auto-generated 
code (is not requiered) and building tests you need python3 and java 
runtime (included using FindPython3 and FindJava packages from cmake)

    avm$ cmake -S . -B build
    ...
    -- Build files have been written to: .../avm/build

    avm$ cmake --build build --target avm
    ... a bunch of compilation warnings

    avm$ build/shell/avm -Dversion
    shell 2.1 release-debugger build cyclone
    features AVMSYSTEM_64BIT;...

For Windows you need to specify architecture for Visual Studio generator.

    avm> cmake -S . -B build -A x64 -G "Visual Studio 15 2017"

Supported platforms and compilers
---------------------------------

Current project configuration is targeting x86_64 build with following
cmake generators supported and tested:

- Visual Studio under Windows (2017 was tested)
- NMake Makefiles under Windows
- Xcode under MacOS
- Unix Makefiles under MacOS and Unix 

Right now it is also required to have Python3 executable and Java runtime

What that project is for
------------------------

That project is to bring life to the most common virtual machine over the
decades. The main goals are to make it available for modern desktop platforms. 
I will also make decisions according to the next terms:

- Simple is better than complex
- It is JIT-only and not AOT
- Fridge is not supported
- Custom features to VM should be removed from the base and easy to plug-in

License
-------

Most of it is available on MPLv2 for now and some parts are available
on other licenses (same as tamarin). I will make a final decision on that later.

Status
------

Work in progress...