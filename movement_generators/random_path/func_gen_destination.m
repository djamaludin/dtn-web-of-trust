%% func_gen_destination.m - Generate Destination and Resolve XY Components Function.
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


function [func_nodes] = func_gen_destination(func_nodes,func_constant,node_a)

	% Generate new destination for node a
	func_nodes(node_a).xy_dest = [func_gen_random_double(func_constant.workspace_x,0,0),func_gen_random_double(func_constant.workspace_y,0,0)];

	% Generate new speed for node a
	func_nodes(node_a).speed = func_gen_random_double(func_constant.speed_upper,func_constant.speed_lower,0);

	% Generate new delay (for when you get to destinaiton) for node a
	func_nodes(node_a).delay = func_gen_random_double(func_constant.delay_upper,func_constant.delay_lower,1);

	% Resolve XY Components for Simulation

	% Measure Difference
	xy_diff = func_nodes(node_a).xy_dest - func_nodes(node_a).xy_coord;
	x_value = xy_diff(1);
	y_value = xy_diff(2);

	% X and Y Magnitudes
	x_magnitude = abs(xy_diff(1));
	y_magnitude = abs(xy_diff(2));

	% Resolve X component
	x_comp = (func_nodes(node_a).speed*cos(atan(y_magnitude/x_magnitude)));

	% Resolve Y component
	y_comp = (func_nodes(node_a).speed*sin(atan(y_magnitude/x_magnitude)));

	% Resolve Quadrant

	% X component
	if x_value < 0
		x_comp = x_comp*(-1);
	else
		x_comp = x_comp;
	end
	% Y component
	if y_value < 0
		y_comp = y_comp*(-1);
	else
		y_comp = y_comp;
	end

	func_nodes(node_a).xy_component = [x_comp,y_comp];

end
