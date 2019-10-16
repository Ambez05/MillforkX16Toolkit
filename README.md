# MillforkX16Toolkit

This Toolkit is adding features for Millfork and the X16 system to simplify application development for the X16 System.  This is currently in a very early stage and is likely to significantly change going forward.

This is also integrated into the VSCode extension.  A fucntion has been added that will downlaod this  Toolkit from GitHub and store it in the local directory.


The main file to import is the X16.mpk file and over time this could be separated multiple modules.  There is also a set of Tests in the Test folder.  These do not have a local copy of the X16 Module and the X16 Extension should be updated to include a additioanl import diretory of the parent directory.

Currently there are three groupings of functions.

* V_* for Vera related logic
* G_* for GUI based functions
* U_* for Utilies
* K_* for Kernel based logic

There are also future plans to improve the VS Extension to have basic intellisense covering these functions.

If any issues are detected or other functionality is required please update the GitHub page.


*Notes.*

 Currently the Millfork system has several files imported when selecting the Millfork target.  One of these is Include/x16_hardware.mfk.  This currently does not have a function for vera_peek.  Until this is fixed this logic should be placed in this file.

```
inline byte vera_peek(int24 address) {
    vera_addr_lo = address.b0
    vera_addr_mi = address.b1
    vera_addr_hi = address.b2
    vera_ctrl = 0
    return vera_data1
}
```
