% func_trust_common.m - Generate Trust Function (Common Friends).
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


function [func_nodes] = func_trust_common(func_nodes, node_a, node_b, func_constant)

% func_constant.trust_upper = 1.0
% func_constant.trust_lower = 0

% Formula
% T(A) wrt B = [m1 * no.of_contacts(A)] + [(Sum of common contacts between A and B) * m2] + initial constant 
% func_constant defined in func_default_init

	% Generate Trust values for the neighbouring nodes


	% First Stage
	node_a_contacts = length(func_nodes(node_a).key_direct(:,2));
	first_stage = node_a_contacts * func_constant.m1;




	% Second Stage
	common_friends_list = intersect(func_nodes(node_a).key_direct(:,2),func_nodes(node_b).key_direct(:,2)); % get the list of nodes that are common to the two nodes
	common_friends_list_length = length(common_friends_list);

	common_friends_keys = intersect(func_nodes(node_a).key_direct(:,3),func_nodes(node_b).key_direct(:,3)); % get the list of keys that are common to the two nodes
	common_friends_keys_length = length(common_friends_keys);

	common_friends_all = intersect(func_nodes(node_a).key_direct(:,2:3),func_nodes(node_b).key_direct(:,2:3),'rows'); % get the list of nodes that are common to the two nodes
	common_friends_all_length = length(common_friends_all(:,1));


	if common_friends_list_length > 0
		if common_friends_list_length == common_friends_all_length
		% Shortcut to say that they are all equal
			second_stage = common_friends_all_length * func_constant.m2;
		else
			counter = 0;
			master_counter = 0;
			bad_counter = 0;
			for counter = 1:common_friends_list_length,
				node_no_lookup = common_friends_list(counter);

				row_node_a = find(func_nodes(node_a).key_direct(:,2) == node_no_lookup);
				key_node_a = func_nodes(node_a).key_direct(row_node_a,3);

				row_node_b = find(func_nodes(node_b).key_direct(:,2) == node_no_lookup);
				key_node_b = func_nodes(node_b).key_direct(row_node_b,3);

				if key_node_a == key_node_b
					master_counter = master_counter + 1;
				else
%					Can add some deduction in trust points
					bad_counter = bad_counter + 1;
				end

			end

			% Second stage is addition m2 for in common keys, and subtract m3 for bad keys
			second_stage = (master_counter * func_constant.m2) + (bad_counter * func_constant.m3);

		end
	else
		% There are no common friends, value of zero for common connections
		second_stage = 0;
	end




	% Third Stage
	third_stage = func_constant.initial_c;



	% Combine all the stages to get a final trust value for node_a with respect to node_b
	trust_common_total = first_stage + second_stage + third_stage;

	% Check that the final trust value does not exceed the upper trust value
	if trust_common_total > func_constant.trust_upper
		% Clip the trust value to the upper trust value
		trust_common_total = func_constant.trust_upper;
	elseif trust_common_total < func_constant.trust_lower
		% Clip the trust value to the lower trust value
		trust_common_total = func_constant.trust_lower;
	else
		trust_common_total = trust_common_total;
	end


	% Write it to the node data structure
	func_nodes(node_b).trust_relationship(node_a) = trust_common_total;

end
