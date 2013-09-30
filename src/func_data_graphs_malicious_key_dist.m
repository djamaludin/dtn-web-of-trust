% func_data_graphs_malicious_key_dist.m - Key Distribution Graphing over Time (malicious).
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


function func_data_graphs_malicious_key_dist(func_data_control, func_data_random, func_data_common)

	% Graph of Bad nodes Direct Keys over time
	figure(5)
	plot(func_data_control.malicious.time(:,1),func_data_control.malicious.time(:,2),'b')
	hold on
	plot(func_data_random.malicious.time(:,1),func_data_random.malicious.time(:,2),'r')
	plot(func_data_common.malicious.time(:,1),func_data_common.malicious.time(:,2),'g')
	title('Bad node Direct key receiving over Time')
	xlabel('Time (clicks)')
	ylabel('No of Keys received')
	grid on

	% Graph of Bad nodes Approved Keys over time
	figure(6)
	plot(func_data_control.malicious.time(:,1),func_data_control.malicious.time(:,3),'b')
	hold on
	plot(func_data_random.malicious.time(:,1),func_data_random.malicious.time(:,3),'r')
	plot(func_data_common.malicious.time(:,1),func_data_common.malicious.time(:,3),'g')
	title('Bad node Approved key receiving over Time')
	xlabel('Time (clicks)')
	ylabel('No of Keys approved')
	grid on

	% Graph of Other nodes accepting Bad Nodes Direct Keys over time
	figure(7)
	plot(func_data_control.malicious.time(:,1),func_data_control.malicious.time(:,4),'b')
	hold on
	plot(func_data_random.malicious.time(:,1),func_data_random.malicious.time(:,4),'r')
	plot(func_data_common.malicious.time(:,1),func_data_common.malicious.time(:,4),'g')
	title('Bad Node key Distribution over Time (Direct Keys)')
	xlabel('Time (clicks)')
	ylabel('No of Direct Keys Distributed')
	grid on

	% Graph of Other nodes accepting Bad Nodes Approved Keys over time
	figure(8)
	plot(func_data_control.malicious.time(:,1),func_data_control.malicious.time(:,5),'b')
	hold on
	plot(func_data_random.malicious.time(:,1),func_data_random.malicious.time(:,5),'r')
	plot(func_data_common.malicious.time(:,1),func_data_common.malicious.time(:,5),'g')
	title('Bad Node key Distribution over Time (Approved Keys)')
	xlabel('Time (clicks)')
	ylabel('No of Approved Keys Distributed')
	grid on

	% Graph of Other nodes having spoofed keys over time
	figure(9)
	plot(func_data_control.malicious.time(:,1),func_data_control.malicious.time(:,6),'b')
	hold on
	plot(func_data_random.malicious.time(:,1),func_data_random.malicious.time(:,6),'r')
	plot(func_data_common.malicious.time(:,1),func_data_common.malicious.time(:,6),'g')
	title('Spoofed Keys Approved over Time (Approved Keys)')
	xlabel('Time (clicks)')
	ylabel('No of Spoofed keys Approved')
	grid on

	% Nice Graphs
	figure(10)
	plot(func_data_control.malicious.time(:,1),func_data_control.malicious.time(:,2),'b')
	hold on
	plot(func_data_control.time(:,1),func_data_control.time(:,2),'r')
	title('Nice!')
	xlabel('Time (clicks)')
	ylabel('No of Keys Distributed')
	grid on

end
