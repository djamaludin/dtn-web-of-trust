% func_calc_key_percent.m - Calculate Key Distribution Percentage Function.
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



function [func_key_percentage] = func_calc_key_percent(func_data, func_constant)

		data_pointer = 0;
		data_pointer = length(func_data.time(:,4));
		func_key_percentage = 0;
		func_key_percentage = (func_data.time(data_pointer,4)/func_constant.node_no)*100;

end

