% func_data_malicious.m - Data Malicious Function.
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


function [func_data] = func_data_malicious(func_nodes, func_data, func_constant, func_clock)

	% Data Logging


	% Build the Data Structure

	% How many Bad Direct keys of bad nodes (bad_bad_direct)
	func_data.malicious.all(func_constant.malicious.node,2) = func_data.malicious.bad_bad_direct_length;
	% How many Bad Approved keys of bad nodes (bad_bad_approved)
	func_data.malicious.all(func_constant.malicious.node,3) = func_data.malicious.bad_bad_approved_length;
	% How many Bad Direct keys of other nodes (other_bad_direct)
	func_data.malicious.all(:,4) = func_data.malicious.other_bad_direct(:,2);
	% How many Bad Approved keys of other nodes (other_bad_approved)
	func_data.malicious.all(:,5) = func_data.malicious.other_bad_approved(:,2);
	% How many Other Approved keys of other nodes (other_other_approved)
	func_data.malicious.all(:,6) = func_data.malicious.other_other_approved(:,2);


	% Data Over Time Logging
	if mod(func_clock,func_constant.time_steps_big)==0 && func_constant.dynamic_logging==1
		% figure out which big time step you are up to
		time_step_no = (func_clock/func_constant.time_steps_big)+1;
		func_data.malicious.time(time_step_no,1)=func_clock;
		% take a dump
		% use virtual_out degree, it's easier to calculate
		func_data.malicious.time(time_step_no,2) = func_data.malicious.bad_bad_direct_length;
		func_data.malicious.time(time_step_no,3) = func_data.malicious.bad_bad_approved_length;
		func_data.malicious.time(time_step_no,4) = func_data.malicious.other_bad_direct_length;
		func_data.malicious.time(time_step_no,5) = func_data.malicious.other_bad_approved_length;
		func_data.malicious.time(time_step_no,6) = func_data.malicious.other_other_approved_length;
	end

end

