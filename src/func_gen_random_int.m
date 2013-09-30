% func_gen_random_int.m - Generate Random Integer Function.
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

function random_int = func_gen_random_int(highest_number)
	highest_number_plus1 = highest_number+1;
	random_int = int32(rand(1)*highest_number_plus1);
	while random_int == 0 || random_int == highest_number_plus1
		random_int = int32(rand(1)*highest_number_plus1);
	end
end

