% func_trust_random.m - Generate Trust Function (Random).
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


function [func_nodes] = func_trust_random(func_nodes, node_a, node_b, func_constant)

	% Randomly Generate Trust values for the neighbouring nodes
	func_nodes(node_a).trust_relationship(node_b) = func_gen_random_double(func_constant.trust_upper, func_constant.trust_lower, 0);
%	func_nodes(node_b).trust_relationship(node_a) = func_gen_random_double(func_constant.trust_upper, func_constant.trust_lower, 0);
% Call this function twice with the node_a and node_b inverted.

end
