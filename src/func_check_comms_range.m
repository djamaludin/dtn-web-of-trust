% func_check_comms_range.m - Check Comms Range Function.
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


function [func_nodes] = func_check_comms_range(func_nodes, func_constant, node_a)
	min_x = func_nodes(node_a).xy_coord(1) - func_constant.comms_range;
	max_x = func_nodes(node_a).xy_coord(1) + func_constant.comms_range;
	min_y = func_nodes(node_a).xy_coord(2) - func_constant.comms_range;
	max_y = func_nodes(node_a).xy_coord(2) + func_constant.comms_range;

	% Get a list of nodes that are in the area who are not connected
	counter = 0;
	node_radius = [];
	func_nodes(node_a).radius = [];
	for counter = 1:func_constant.node_no,
		node_id = func_nodes(node_a).id;
		if node_id~=counter
			if (func_nodes(counter).xy_coord(1)<=max_x) && (func_nodes(counter).xy_coord(1)>=min_x) && (func_nodes(counter).xy_coord(2)<=max_y) && (func_nodes(counter).xy_coord(2)>=min_y) % Check for comms range
				if func_nodes(counter).status_timer == 0
					func_nodes(node_a).radius = [func_nodes(node_a).radius, func_nodes(counter).id];
				end
			else
				func_nodes = func_nodes;
			end
		end
	end

end
