% func_key_carrier_exchange.m - Carrier Key Exchange Function.
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


function [func_nodes] = func_key_carrier_exchange(func_nodes, node_a, node_b, func_clock, func_constant)

	trust_threshold = func_constant.trust_threshold;

	% Compile a list of keys you don't have each
	the_nodes = [func_nodes(node_a).key; func_nodes(node_b).key];
	the_nodes = (the_nodes(:,2))';
	the_direct_a = (func_nodes(node_a).key_direct(:,2))';
	the_direct_b = (func_nodes(node_b).key_direct(:,2))';
	

	temp_key_untrusted = setxor(the_direct_b, the_nodes);	% Give the set of keys without the ones we own
	temp_key_untrusted = setdiff(temp_key_untrusted, the_direct_a);	% Return only the keys that are not in the direct key list.

	key_approved_length = length(func_nodes(node_a).key_approved);
	if key_approved_length > 0
		the_approved_a = (func_nodes(node_a).key_approved(:,2))';
		temp_key_untrusted = setdiff(temp_key_untrusted, the_approved_a);	% Return only the keys that are not in the approved key list.
	end
	clear key_approved_length
	clear the_direct_a
	clear the_direct_b
	clear the_approved_a
	% node_a is left with just the keys it doesn't have in the direct or approved lists.

	counter3 = 0;
	untrusted_size = 0;
	untrusted_size = length(temp_key_untrusted); % How many untrusted keys you have


	if untrusted_size > 0
	% if there are some keys that you don't yet have
		for counter3 = 1:untrusted_size,
		% for every key that you don't yet have, do the following
			key_received_id = temp_key_untrusted(counter3); % the key you're getting from neighbouring node
			[tf, key_received_location] = ismember(key_received_id,func_nodes(node_b).key_direct(:,2)); % Location of the received key in the neighbouring nodes direct key list.
			clear tf
			key_received_sig = func_nodes(node_b).key_direct(key_received_location,3);
			element_test = 0;
			element_test = ismember(node_b, func_nodes(node_a).key_untrusted(key_received_id).received); % Have I received this key from the same neighbour before?
			% Insert the signature of the key here, should also add a test to make sure the signature is correct

			if element_test == 0
			% If not then, increment both the untrusted matrix and the trust accumulation matrix
				func_nodes(node_a).key_untrusted(key_received_id).received = union(func_nodes(node_a).key_untrusted(key_received_id).received, node_b);
				func_nodes(node_a).key_untrusted(key_received_id).sig = key_received_sig;
				func_nodes(node_a).trust_accumulate(key_received_id) = func_nodes(node_a).trust_accumulate(key_received_id) + func_nodes(node_a).trust_relationship(node_b);
			end

			if func_nodes(node_a).trust_accumulate(key_received_id) >= trust_threshold
			% if you have exceeded the trust threshold then the key is approved.
				func_nodes(node_a).key_approved = [func_nodes(node_a).key_approved; func_clock, func_nodes(node_b).key_direct(key_received_location,2), func_nodes(node_b).key_direct(key_received_location,3)];
			else
			% if not return the original key_approved list
				func_nodes(node_a).key_approved = func_nodes(node_a).key_approved;
			end
		end
	else
		func_nodes(node_a).key_approved = func_nodes(node_a).key_approved;
	end
	func_nodes(node_a).key_approved = sortrows(func_nodes(node_a).key_approved); % Sort the rows based on time


	% Malicious Node only
	malicious_key_approved_empty = isempty(func_nodes(node_a).key_approved);
	if func_nodes(node_a).status_security == 1 && malicious_key_approved_empty == 0
		% That is the receiving node is the bad node, then you want to replace the approved keys with your own concoction
		func_nodes(node_a).key_approved(:,3) = func_nodes(node_a).key(3);
	end
	clear malicious_key_approved_empty

end


