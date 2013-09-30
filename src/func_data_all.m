% func_data_all.m - Data All Function.
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


function [func_data] = func_data_all(func_nodes, func_data, func_constant, func_clock)

	% Data Logging
	counter = 0;
	for counter = 1:func_constant.node_no,

		% Log XY Co-ordinate data	
		func_data.xy_coord(counter,:) = func_nodes(counter).xy_coord;

		% Log number of Direct Keys
		key_direct_size = size(func_nodes(counter).key_direct);
		func_data.key_direct(counter,:) = key_direct_size(1);

		% Log number of Approved Keys
		key_approved_size = size(func_nodes(counter).key_approved);
		func_data.key_approved(counter,:) = key_approved_size(1);
	end
	% Build the Data Structure
	func_data.key_total = func_data.key_direct + func_data.key_approved;
	func_data.all(:,2:3) = func_data.xy_coord;
	func_data.all(:,4) = func_data.key_direct;
	func_data.all(:,5) = func_data.key_approved;
	func_data.all(:,6) = func_data.key_total;


	% Data Over Time Logging
	if mod(func_clock,func_constant.time_steps_big)==0 && func_constant.dynamic_logging==1
		% figure out which big time step you are up to
		time_step_no = (func_clock/func_constant.time_steps_big)+1;
		func_data.time(time_step_no,1)=func_clock;
		% take a dump
		% use virtual_out degree, it's easier to calculate
		func_data.time(time_step_no,2) = (sum(func_data.all(:,4)))/func_constant.node_no; % Average number of Direct Keys in System
		func_data.time(time_step_no,3) = (sum(func_data.all(:,5)))/func_constant.node_no; % Average number of Approved Keys in System
		func_data.time(time_step_no,4) = (sum(func_data.all(:,6)))/func_constant.node_no; % Average number of Direct and Approved Keys in System
	end

end

