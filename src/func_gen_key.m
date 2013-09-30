% func_gen_key.m - Generate Key Signature Function.
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

function [key_sig_dec] = func_gen_key(no_of_bits)
	highest_number = (2^no_of_bits)-1;
	key_sig_dec = func_gen_random_double(highest_number, 0, 1);
%	key_sig_bin = dec2bin(key_sig_dec);
%	key_sig_hex = dec2hex(key_sig_dec);
end
