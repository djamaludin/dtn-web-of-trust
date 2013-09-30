% func_flux_capacitor.m - Flux Capacitor Function (Time Travel).
% Copyright (C) 2011-2013  C.I.Djamaludin.
%
% This file is part of DTN Web of Trust simulator.
%
% DTN Web of Trust is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% DTN Web of Trust is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.

function [func_history] = func_flux_capacitor(func_nodes, func_history, func_constant, func_clock)

	if func_constant.history == 1
		func_history(func_clock).nodes = func_nodes;
	else
		func_history = func_history;
	end

% Format: sequence([clock]).nodes([node_number]).[attribute]

end
