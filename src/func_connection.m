% func_connection.m - Direct Key Exchange Function.
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


function [func_nodes] = func_connection(func_nodes, node_a, node_b, func_constant)

	element_indicate = max(ismember(func_nodes(node_a).key_direct(:,2), func_nodes(node_b).id));
	if element_indicate == 0
	% That is node_b is not in node_a's direct key list, they haven't met before
		% Introduce yourselves Something to do with Trust

		if func_constant.trust_type == 0
			% Everyone Trusts Everyone and you share keys freely
			func_nodes = func_trust_control(func_nodes, node_a, node_b, func_constant);
			func_nodes = func_trust_control(func_nodes, node_b, node_a, func_constant);
		elseif func_constant.trust_type == 1
			% Generate Trust values for the neighbouring nodes (randomly)
			func_nodes = func_trust_random(func_nodes, node_a, node_b, func_constant);
			func_nodes = func_trust_random(func_nodes, node_b, node_a, func_constant);
		elseif func_constant.trust_type == 2
			% Generate Trust values for the neighbouring nodes (Leverage common friends)
			func_nodes = func_trust_common(func_nodes, node_a, node_b, func_constant);
			func_nodes = func_trust_common(func_nodes, node_b, node_a, func_constant);
		end

		% Toggle some status indicators
		func_nodes(node_a).status_movement = 0; % node_a is stationary
		func_nodes(node_b).status_movement = 0; % node_b is stationary

		% Start the Countdown Timer and put Neighbour Node ID into connected value.
		func_nodes(node_a).status_timer = func_constant.data_time_all;
		func_nodes(node_a).connected = node_b;

		func_nodes(node_b).status_timer = func_constant.data_time_all;
		func_nodes(node_b).connected = node_a;
	end

end
