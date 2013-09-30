% func_data_graphs_dynamic.m - Display Graphs Function (Dynamic).
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


function func_data_graphs_dynamic(func_data, direct, approved, direct_approved)

	if direct == 1
		% XY Coords and Direct Keys
		figure(1)
		stem3(func_data.xy_coord(:,1),func_data.xy_coord(:,2),func_data.key_direct(:,1))
		title('XY Coords and Direct Keys')
		xlabel('X Coord')
		ylabel('Y Coord')
		zlabel('No. of Direct Keys')
		grid on
	end

	if approved == 1
		% XY Coords and Approved Keys
		figure(2)
		stem3(func_data.xy_coord(:,1),func_data.xy_coord(:,2),func_data.key_approved(:,1))
		title('XY Coords and Approved Keys')
		xlabel('X Coord')
		ylabel('Y Coord')
		zlabel('No. of Approved Keys')
		grid on
	end

	if direct_approved == 1
		% XY Coords and Direct+Approved Keys
		figure(3)
		stem3(func_data.xy_coord(:,1),func_data.xy_coord(:,2),func_data.key_total(:,1))
		title('XY Coords and Direct+Approved Keys')
		xlabel('X Coord')
		ylabel('Y Coord')
		zlabel('No. of Direct+Approved Keys')
		grid on
	end

	if direct == 1 || approved == 1 || direct_approved == 1
		% Make sure you refresh the graphs
		pause(0.1);
	end

end
