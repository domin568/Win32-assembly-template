## My template for Windows x86 assembly programming

# Dependencies

Nasm, golink (included)

# How to build 
```
make all
```
# How to use Windows API functions ?

First declare it with extern like 
```
extern _MessageBoxA@16
```
names are mangled, so first character is underscore (_), after @ there is number of args * 4 (DWORD size)

# Convention 

entrypoint is set to be in _main function (set in golink manually)