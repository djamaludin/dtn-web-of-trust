% func_data_total.m - Data Total Function.
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


function [func_data] = func_data_total(func_nodes, func_data, func_constant)

	% Data Logging
	func_data.metrics.totals.direct = sum(func_data.all(:,4));
	func_data.metrics.totals.approved = sum(func_data.all(:,5));
	func_data.metrics.totals.all = func_data.metrics.totals.direct + func_data.metrics.totals.approved;
 
	func_data.metrics.totals.malicious_direct = func_data.malicious.direct_total;
	func_data.metrics.totals.malicious_approved = func_data.malicious.approved_total;
	func_data.metrics.totals.malicious_all = func_data.metrics.totals.malicious_direct +  func_data.metrics.totals.malicious_approved;

	func_data.metrics.totals.uncomp_direct = func_data.metrics.totals.direct - func_data.metrics.totals.malicious_direct;
	func_data.metrics.totals.uncomp_approved = func_data.metrics.totals.approved - func_data.metrics.totals.malicious_approved;
	func_data.metrics.totals.uncomp_all = func_data.metrics.totals.uncomp_direct + func_data.metrics.totals.uncomp_approved;

	func_data.metrics.percent.malicious_direct = (func_data.metrics.totals.malicious_direct/func_data.metrics.totals.direct)*100;
	func_data.metrics.percent.malicious_approved = (func_data.metrics.totals.malicious_approved/func_data.metrics.totals.approved)*100;
	func_data.metrics.percent.malicious_all = (func_data.metrics.totals.malicious_all/func_data.metrics.totals.all)*100;

	func_data.metrics.percent.uncomp_direct = (func_data.metrics.totals.uncomp_direct/func_data.metrics.totals.direct)*100;
	func_data.metrics.percent.uncomp_approved = (func_data.metrics.totals.uncomp_approved/func_data.metrics.totals.approved)*100;
	func_data.metrics.percent.uncomp_all = (func_data.metrics.totals.uncomp_all/func_data.metrics.totals.all)*100;

end

