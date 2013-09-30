DTN Web of Trust
================

DTN Web of Trust is a Delay Tolerant Network (DTN) node simulator for 
Matlab or the open source Octave. It simulates key exchange and distribution 
of Pretty Good Privacy (PGP) keys through a Web of Trust in an autonomous
DTN.

> **NOTE**
> DTN Web of Trust is no longer being developed.


Requirements and Dependencies
-----------------------------

DTN Web of Trust was developed on Matlab 7.12-7.13 (R2011a-R2011b) and on 
Octave 3.2 and gnuplot. The simulator can be run in either of these 
programs.


Setting Up and Run Simulation
-----------------------------
1. The simulation needs a movement model as an input, which can be generated 
by using the included movement generators. This allows a consistent movement 
model to be re-used in different scenarios. If you want the simulation to 
generate the movement on the fly set the line in func_default_init.m
```
constant.movement_mode = 1;
```

2. Set other simulation parameters such as simulation space size, number of 
nodes, number of malicious nodes, and trust system constants.

3. In Matlab or Octave, run func_default_init.m to load up simulation 
constants.

4. Run simulation.m to start simulation.

5. Collect your results.


License
-------
Copyright 2011-2013 C.I.Djamaludin

Licensed under the GPLv3.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.


