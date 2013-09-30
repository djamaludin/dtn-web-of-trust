% func_malicious_node.m - Malicious Node Event Function.
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


function [func_nodes] = func_malicious_node(func_nodes, func_data, func_clock, bad_node)
	func_nodes(bad_node).key(3) = 101110101101; % Set the key to the bad key
	key_direct_length = length(func_nodes(bad_node).key_direct(:,1));
	counter = 0;
	for counter = 1:key_direct_length,
		func_nodes(bad_node).key_direct(counter,3) = 101110101101;
	end
	% I am now a Malicious Node, so flag my security status for tracking purposes.
	func_nodes(bad_node).status_security = 1;
	func_nodes(bad_node).status_malicious_ts = func_clock;
%	func_data.malicious_events = [func_data.malicious_events;func_clock,bad_node]
end

