% func_check_same.m - Checking same module.
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


equal = zeros(constant.node_no,2);
counter = 0;
for counter = 1:constant.node_no,
	nodes_1_temp = [];
	nodes_2_temp = [];

	nodes_1(counter).key_direct(:,3) = [];
	nodes_1_temp = nodes_1(counter).key_direct;

	nodes_2(counter).key_direct(:,3) = [];
	nodes_2_temp = nodes_2(counter).key_direct;

	equal(counter,1) = counter;
	equal(counter,2) = isequal(nodes_1_temp,nodes_2_temp);
end

clear nodes_1_temp
clear nodes_2_temp
clear counter
