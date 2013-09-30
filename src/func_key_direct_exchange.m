% func_key_direct_exchange.m - Direct Key Exchange Function.
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


function [func_nodes] = func_key_direct_exchange(func_nodes, node_a, node_b, func_clock)

% Direct Key Exchange for node_a (a is receiving, b is transmitting)
	func_nodes(node_a).status_comms = 0; % node_a is listening
	func_nodes(node_b).status_comms = 1; % node_b is transmitting
	element_indicate = max(ismember(func_nodes(node_a).key_direct(:,2), func_nodes(node_b).id));
	if element_indicate == 0
	% That is node_b is not in node_a's direct key list. Add it.
%		func_nodes(node_a).key_direct = [func_nodes(node_a).key_direct; func_clock, func_nodes(node_b).key(2:3)];
		% The malicious node check.
		if func_nodes(node_a).status_security == 1
			% That is the receiving node is the bad node, then you want to replace the incoming key with your own concoction
			func_nodes(node_a).key_direct = [func_nodes(node_a).key_direct; func_clock, func_nodes(node_b).key(2), func_nodes(node_a).key(3)];
		else
			% Treat it like normal
 			func_nodes(node_a).key_direct = [func_nodes(node_a).key_direct; func_clock, func_nodes(node_b).key(2:3)];
		end
	else
	% That is node_b is in node_a's direct key list, you already have the key.
		func_nodes(node_a).key_direct = func_nodes(node_a).key_direct; % Essentially do nothing. Maybe you would want to increment the counter and the trust value, maybe have a check on the actual key?
	end
	func_nodes(node_a).key_direct = sortrows(func_nodes(node_a).key_direct); % Sort the rows based on time


	% Add a check in the approved list, since direct takes priority
	key_approved_length = length(func_nodes(node_a).key_approved);
	if key_approved_length > 0	
		element_indicate = max(ismember(func_nodes(node_a).key_approved(:,2), func_nodes(node_b).id));
		if element_indicate == 1
			[tf, key_approved_location] = ismember(func_nodes(node_b).id,func_nodes(node_a).key_approved(:,2)); % Location of the neighbouring node (node_b) in node_a's approved key list
			clear tf
			func_nodes(node_a).key_approved(key_approved_location,:) = [];
		end
	end


end
