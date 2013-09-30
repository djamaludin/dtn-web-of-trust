% func_key_spread_bad.m - Key Penetration Analysis (Malicious Node).
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


function [func_data] = func_key_spread_bad(func_nodes, func_constant, func_data)

% Format
% [the node that the keylist is analysing]_[the owner of the bad key]_[direct/approved]


	% BAD NODE
	% Find how many direct keys it has met and changed
	func_data.malicious.bad_bad_direct = func_nodes(func_constant.malicious.node).key_direct;
	bad_bad_direct_empty = isempty(func_data.malicious.bad_bad_direct);
	security_status = func_nodes(func_constant.malicious.node).status_security;
	if bad_bad_direct_empty == 0 && security_status == 1
		func_data.malicious.bad_bad_direct_length = length(func_data.malicious.bad_bad_direct(:,2));
	else
		func_data.malicious.bad_bad_direct_length = 0;
	end
	clear bad_bad_direct_empty


	% Find how many approved keys it has approved and changed
	func_data.malicious.bad_bad_approved = func_nodes(func_constant.malicious.node).key_approved;
	bad_bad_approved_empty = isempty(func_data.malicious.bad_bad_approved);
	if bad_bad_approved_empty == 0 && security_status == 1
		func_data.malicious.bad_bad_approved_length = length(func_data.malicious.bad_bad_approved(:,2));
	else
		func_data.malicious.bad_bad_approved_length = 0;
	end
	clear bad_bad_approved_empty
	clear security_status


	% Other nodes
	% Find how many other nodes have the BAD Node and key in the Direct Key List
	func_data.malicious.other_bad_direct(:,1) = [1:func_constant.node_no];
	func_data.malicious.other_bad_direct(:,2) = 0;

	counter = 0;
	for counter = 1:func_constant.node_no,
		if counter ~= func_constant.malicious.node
			direct_node_list = func_nodes(counter).key_direct(:,3);
			find_bad_direct_key = find(direct_node_list == func_constant.malicious.key);
			length_find_bad_direct_key = length(find_bad_direct_key);

			% Cycle through the length of the direct key list with a bad key
			if length_find_bad_direct_key > 0 % Only if you have the bad key should you cycle through the key list
				counter_2 = 0;
				for counter_2 = 1:length_find_bad_direct_key,
					pointer = find_bad_direct_key(counter_2); % Where you are in the length of the bad key
					condition_a = func_nodes(counter).key_direct(pointer,3); % The bad node key
					condition_b = func_nodes(counter).key_direct(pointer,2); % The bad node ID
					if condition_a == func_constant.malicious.key && condition_b == func_constant.malicious.node
						% That is you have a bad key and it belongs to the bad node
						func_data.malicious.other_bad_direct(counter,2) = func_data.malicious.other_bad_direct(counter,2) + 1;
					end
				end
			end
		end
	end

	% Tally it up
	func_data.malicious.other_bad_direct_length = sum(func_data.malicious.other_bad_direct(:,2)); % since it's a tally of the x nodes, it's the sum




	% Find how many other nodes have the BAD Node and key in the Approved Key List
	func_data.malicious.other_bad_approved(:,1) = [1:func_constant.node_no];
	func_data.malicious.other_bad_approved(:,2) = 0;

	func_data.malicious.other_other_approved(:,1) = [1:func_constant.node_no];
	func_data.malicious.other_other_approved(:,2) = 0;

	counter = 0;
	for counter = 1:func_constant.node_no,
		if counter ~= func_constant.malicious.node
			key_approved_length = length(func_nodes(counter).key_approved);
			if key_approved_length > 0
				approved_node_list = func_nodes(counter).key_approved(:,3);
				find_bad_approved_key = find(approved_node_list == func_constant.malicious.key);
				length_find_bad_approved_key = length(find_bad_approved_key);

				% Cycle through the length of the direct key list with a bad key
				if length_find_bad_approved_key > 0 % Only if you have the bad key should you cycle through the key list
					counter_2 = 0;
					for counter_2 = 1:length_find_bad_approved_key,
						pointer = find_bad_approved_key(counter_2); % Where you are in the length of the bad key
						condition_a = func_nodes(counter).key_approved(pointer,3); % The bad node key
						condition_b = func_nodes(counter).key_approved(pointer,2); % The bad node ID
						if condition_a == func_constant.malicious.key && condition_b == func_constant.malicious.node
							% That is you have a bad key and it belongs to the bad node
							func_data.malicious.other_bad_approved(counter,2) = func_data.malicious.other_bad_approved(counter,2) + 1;
						elseif condition_a == func_constant.malicious.key && condition_b ~= func_constant.malicious.node
							func_data.malicious.other_other_approved(counter,2) = func_data.malicious.other_other_approved(counter,2) + 1;
						end
					end
				end
			end
		end
	end

	% Tally it up
	func_data.malicious.other_bad_approved_length = sum(func_data.malicious.other_bad_approved(:,2)); % since it's a tally of the x nodes, it's the sum
	func_data.malicious.other_other_approved_length = sum(func_data.malicious.other_other_approved(:,2)); % since it's a tally of the x nodes, it's the sum

	% Totals
	func_data.malicious.direct_total = func_data.malicious.bad_bad_direct_length + func_data.malicious.other_bad_direct_length;
	func_data.malicious.approved_total = func_data.malicious.bad_bad_approved_length + func_data.malicious.other_bad_approved_length + func_data.malicious.other_other_approved_length;

	% Grand Total
	func_data.malicious.grand_total = func_data.malicious.direct_total + func_data.malicious.approved_total;

	% Find how many other nodes have the BAD Key but a good node in the Direct Key List
	% Not likely to happen, nodes hang onto their own keys, if it has the BAD key it is therefore bad.

	% Find how many other nodes have the BAD Key but a good node in the Approved Key List

end
