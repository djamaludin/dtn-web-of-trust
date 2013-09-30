% func_memory_direct.m - Direct Key Exchange Function.
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


function [func_nodes] = func_memory_direct(func_nodes, node_a, node_b, func_clock, func_constants)

	mem_direct = func_constants.mem_direct;
	mem_mode = func_constants.mem_mode;
	element_indicate = max(ismember(func_nodes(node_a).key_direct(:,2), func_nodes(node_b).id));
	element_length = length(func_nodes(node_a).key_direct(:,2));
	if element_indicate == 0
	% That is node_b is not in node_a's direct key list, they haven't met before
		% Introduce yourselves
		% node_a should generate a trust value for node_b
		func_nodes(node_a).trust_relationship(node_b) = func_gen_random_double(func_constants.upper_trust, func_constants.lower_trust, 0); % Generate a trust value for node_b
		% Memory Management Section
		if mem_mode == 1 && element_length >= mem_direct
			% 1. First in Based - Don't Discard when you are full
			func_nodes(node_a).key_direct = func_nodes(node_a).key_direct; % Essentially do nothing
		elseif mem_mode == 2 && element_length >= mem_direct
			% 2. Time Based - Discard the oldest key
			func_nodes(node_a).key_direct(2,:) = []; % don't want to delete the owners key which is the first row
			func_nodes(node_a).key_direct = [func_nodes(node_a).key_direct; func_clock, func_nodes(node_b).key(2:3)];
		elseif mem_mode == 3 && element_length >= mem_direct
			% 3. Popularity Based - Discard the least popular key
			return_mem_mode = 3;
		elseif mem_mode == 4 && element_length >= mem_direct
			% 4. Trust Based - Discard the least trusted key
			return_mem_mode = 4;
		else
			% 0. No Memory Management
			func_nodes(node_a).key_direct = [func_nodes(node_a).key_direct; func_clock, func_nodes(node_b).key(2:3)];
		end
	else
	% That is node_b is in node_a's direct key list, do nothing and pass the input key list.
		func_nodes(node_a).key_direct = func_nodes(node_a).key_direct; % Essentially do nothing
	end
	func_nodes(node_a).key_direct = sortrows(func_nodes(node_a).key_direct); % Sort the rows based on func_clock

end
