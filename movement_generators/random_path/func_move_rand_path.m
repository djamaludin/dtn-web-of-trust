% func_move_rand_path.m - Random Move Path Function.
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


function [func_nodes] = func_move_rand_path(func_nodes, node_a)

	% Check are you there yet?
	if func_nodes(node_a).xy_coord == func_nodes(node_a).xy_dest
		% Make your status timer equal to the delay you randomly generated.
		func_nodes(node_a).status_timer = func_nodes(node_a).delay;
	else % No, you're not there yet
		% Do the move
		func_nodes(node_a).xy_coord = func_nodes(node_a).xy_coord + func_nodes(node_a).xy_component;

		% Do a check so you don't overshoot the target.
		diff_check = func_nodes(node_a).xy_dest - func_nodes(node_a).xy_coord;
		diff_check_abs = abs(diff_check);

		% X Check
		diff_check_xa = abs(func_nodes(node_a).xy_component(1));
		diff_check_xb = diff_check_abs(1);

		% Y Check
		diff_check_ya = abs(func_nodes(node_a).xy_component(2));
		diff_check_yb = diff_check_abs(2);

		if diff_check_xb < diff_check_xa % that is the next step will overshoot your target destination
			if diff_check_yb < diff_check_ya % same as above, but for the y component
				func_nodes(node_a).xy_component = diff_check;
			end
		end

end


