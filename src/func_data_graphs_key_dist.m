% func_data_graphs_key_dist.m - Key Distribution Graphing over Time.
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


function func_data_graphs_key_dist(func_data)

	% Direct key distribution over time
	figure(4)
	plot(func_data.time(:,1),func_data.time(:,2),'b')
	hold on
	plot(func_data.time(:,1),func_data.time(:,3),'r')
	plot(func_data.time(:,1),func_data.time(:,4),'m')
	title('System Key Distribution over Time')
	xlabel('Time (clicks)')
	ylabel('No of Keys Distributed')
	grid on

end
