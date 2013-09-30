% func_move_random.m - Random Move Function.
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


function [latlon_coord] = func_move_random(xy_coord, x_limit, y_limit)

% ====================================================================================================
% Top Left Corner Move (4 Possible States)
%+---+---+
%| S | 1 |
%+---+---+
%| 3 | 2 |
%+---+---+
% ====================================================================================================
if xy_coord==[1,y_limit]
%	dice_4_sided=int32(rand(1)*5);
%	while dice_4_sided == 0 || dice_4_sided == 5
%		dice_4_sided=int32(rand(1)*5);
%	end
	dice_4_sided=randi(4);
	if dice_4_sided==1
		% Don't move anywhere, stay in position S
		latlon_coord = [xy_coord(1)+0, xy_coord(2)+0];
	elseif dice_4_sided==2
		% Move to position 1
		latlon_coord = [xy_coord(1)+1, xy_coord(2)+0];
	elseif dice_4_sided==3
		% Move to position 2
		latlon_coord = [xy_coord(1)+1, xy_coord(2)-1];
	elseif dice_4_sided==4
		% Move to position 3
		latlon_coord = [xy_coord(1)+0, xy_coord(2)-1];
	end
% ====================================================================================================		
% Top Right Corner Move (4 Possible States)
%+---+---+
%| 3 | S |
%+---+---+
%| 2 | 1 |
%+---+---+
% ====================================================================================================
elseif xy_coord==[x_limit,y_limit]
%	dice_4_sided=int32(rand(1)*5);
%	while dice_4_sided == 0 || dice_4_sided == 5
%		dice_4_sided=int32(rand(1)*5);
%	end
	dice_4_sided=randi(4);
	if dice_4_sided==1
		% Don't move anywhere, stay in position S
		latlon_coord = [xy_coord(1)+0, xy_coord(2)+0];
	elseif dice_4_sided==2
		% Move to position 1
		latlon_coord = [xy_coord(1)+0, xy_coord(2)-1];
	elseif dice_4_sided==3
		% Move to position 2
		latlon_coord = [xy_coord(1)-1, xy_coord(2)-1];
	elseif dice_4_sided==4
		% Move to position 3
		latlon_coord = [xy_coord(1)-1, xy_coord(2)+0];
	end
% ====================================================================================================
% Bottom Right Corner Move (4 Possible States)
%+---+---+
%| 2 | 3 |
%+---+---+
%| 1 | S |
%+---+---+
% ====================================================================================================
elseif xy_coord==[x_limit,1]
%	dice_4_sided=int32(rand(1)*5);
%	while dice_4_sided == 0 || dice_4_sided == 5
%		dice_4_sided=int32(rand(1)*5);
%	end
	dice_4_sided=randi(4);
	if dice_4_sided==1
		% Don't move anywhere, stay in position S
		latlon_coord = [xy_coord(1)+0, xy_coord(2)+0];
	elseif dice_4_sided==2
		% Move to position 1
		latlon_coord = [xy_coord(1)-1, xy_coord(2)+0];
	elseif dice_4_sided==3
		% Move to position 2
		latlon_coord = [xy_coord(1)-1, xy_coord(2)+1];
	elseif dice_4_sided==4
		% Move to position 3
		latlon_coord = [xy_coord(1)+0, xy_coord(2)+1];
	end
% ====================================================================================================
% Bottom Left Corner Move (4 Possible States)
%+---+---+
%| 1 | 2 |
%+---+---+
%| S | 3 |
%+---+---+
% ====================================================================================================
elseif xy_coord==[1,1]
%	dice_4_sided=int32(rand(1)*5);
%	while dice_4_sided == 0 || dice_4_sided == 5
%		dice_4_sided=int32(rand(1)*5);
%	end
	dice_4_sided=randi(4);
	if dice_4_sided==1
		% Don't move anywhere, stay in position S
		latlon_coord = [xy_coord(1)+0, xy_coord(2)+0];
	elseif dice_4_sided==2
		% Move to position 1
		latlon_coord = [xy_coord(1)+0, xy_coord(2)+1];
	elseif dice_4_sided==3
		% Move to position 2
		latlon_coord = [xy_coord(1)+1, xy_coord(2)+1]; 
	elseif dice_4_sided==4
		% Move to position 3
		latlon_coord = [xy_coord(1)+1, xy_coord(2)+0];
	end
% ====================================================================================================
% Left Edge Move (6 Possible States)
%+---+---+
%| 1 | 2 |
%+---+---+
%| S | 3 |
%+---+---+
%| 5 | 4 |
%+---+---+
% ====================================================================================================
elseif xy_coord(1)==1
%	dice_6_sided=int32(rand(1)*7);
%	while dice_6_sided == 0 || dice_6_sided == 7
%		dice_6_sided=int32(rand(1)*7);
%	end
	dice_6_sided=randi(6);
	if dice_6_sided==1
		% Don't move anywhere, stay in position S
		latlon_coord = [xy_coord(1)+0, xy_coord(2)+0];
	elseif dice_6_sided==2
		% Move to position 1
		latlon_coord = [xy_coord(1)+0, xy_coord(2)+1];
	elseif dice_6_sided==3
		% Move to position 2
		latlon_coord = [xy_coord(1)+1, xy_coord(2)+1];
	elseif dice_6_sided==4
		% Move to position 3
		latlon_coord = [xy_coord(1)+1, xy_coord(2)+0];
	elseif dice_6_sided==5
		% Move to position 4
		latlon_coord = [xy_coord(1)+1, xy_coord(2)-1];
	elseif dice_6_sided==6
		% Move to position 5
		latlon_coord = [xy_coord(1)+0, xy_coord(2)-1];
	end
% ====================================================================================================
% Top Edge Move (6 Possible States)
%+---+---+---+
%| 5 | S | 1 |
%+---+---+---+
%| 4 | 3 | 2 |
%+---+---+---+
% ====================================================================================================
elseif xy_coord(2)==y_limit
%	dice_6_sided=int32(rand(1)*7);
%	while dice_6_sided == 0 || dice_6_sided == 7
%		dice_6_sided=int32(rand(1)*7);
%	end
	dice_6_sided=randi(6);
	if dice_6_sided==1
		% Don't move anywhere, stay in position S
		latlon_coord = [xy_coord(1)+0, xy_coord(2)+0];
	elseif dice_6_sided==2
		% Move to position 1
		latlon_coord = [xy_coord(1)+1, xy_coord(2)+0];
	elseif dice_6_sided==3
		% Move to position 2
		latlon_coord = [xy_coord(1)+1, xy_coord(2)-1];
	elseif dice_6_sided==4
		% Move to position 3
		latlon_coord = [xy_coord(1)+0, xy_coord(2)-1];
	elseif dice_6_sided==5
		% Move to position 4
		latlon_coord = [xy_coord(1)-1, xy_coord(2)-1];
	elseif dice_6_sided==6
		% Move to position 5
		latlon_coord = [xy_coord(1)-1, xy_coord(2)+0];
	end
% ====================================================================================================
% Right Edge Move (6 Possible States)
%+---+---+
%| 4 | 5 |
%+---+---+
%| 3 | S |
%+---+---+
%| 2 | 1 |
%+---+---+
% ====================================================================================================
elseif xy_coord(1)==x_limit
%	dice_6_sided=int32(rand(1)*7);
%	while dice_6_sided == 0 || dice_6_sided == 7
%		dice_6_sided=int32(rand(1)*7);
%	end
	dice_6_sided=randi(6);
	if dice_6_sided==1
		% Don't move anywhere, stay in position S
		latlon_coord = [xy_coord(1)+0, xy_coord(2)+0];
	elseif dice_6_sided==2
		% Move to position 1
		latlon_coord = [xy_coord(1)+0, xy_coord(2)-1];
	elseif dice_6_sided==3
		% Move to position 2
		latlon_coord = [xy_coord(1)-1, xy_coord(2)-1];
	elseif dice_6_sided==4
		% Move to position 3
		latlon_coord = [xy_coord(1)-1, xy_coord(2)+0];
	elseif dice_6_sided==5
		% Move to position 4
		latlon_coord = [xy_coord(1)-1, xy_coord(2)+1];
	elseif dice_6_sided==6
		% Move to position 5
		latlon_coord = [xy_coord(1)+0, xy_coord(2)+1];
	end
% ====================================================================================================
% Bottom Edge Move (6 Possible States)
%+---+---+---+
%| 2 | 3 | 4 |
%+---+---+---+
%| 1 | S | 5 |
%+---+---+---+
% ====================================================================================================
elseif xy_coord(2)==1
%	dice_6_sided=int32(rand(1)*7);
%	while dice_6_sided == 0 || dice_6_sided == 7
%		dice_6_sided=int32(rand(1)*7);
%	end
	dice_6_sided=randi(6);
	if dice_6_sided==1
		% Don't move anywhere, stay in position S
		latlon_coord = [xy_coord(1)+0, xy_coord(2)+0];
	elseif dice_6_sided==2
		% Move to position 1
		latlon_coord = [xy_coord(1)-1, xy_coord(2)+0];
	elseif dice_6_sided==3
		% Move to position 2
		latlon_coord = [xy_coord(1)-1, xy_coord(2)+1];
	elseif dice_6_sided==4
		% Move to position 3
		latlon_coord = [xy_coord(1)+0, xy_coord(2)+1];
	elseif dice_6_sided==5
		% Move to position 4
		latlon_coord = [xy_coord(1)+1, xy_coord(2)+1];
	elseif dice_6_sided==6
		% Move to position 5
		latlon_coord = [xy_coord(1)+1, xy_coord(2)+0];
	end
% ====================================================================================================
% Normal Move (9 Possible States)
%+---+---+---+
%| 1 | 2 | 3 |
%+---+---+---+
%| 8 | S | 4 |
%+---+---+---+
%| 7 | 6 | 5 |
%+---+---+---+
% ====================================================================================================
else
%	dice_9_sided=int32(rand(1)*10);
%	while dice_9_sided == 0 || dice_9_sided == 10
%		dice_9_sided=int32(rand(1)*10);
%	end
	dice_9_sided=randi(9);
	if dice_9_sided==1
		% Don't move anywhere, stay in position S
		latlon_coord = [xy_coord(1)+0, xy_coord(2)+0];
	elseif dice_9_sided==2
		% Move to position 1
		latlon_coord = [xy_coord(1)-1, xy_coord(2)+1];
	elseif dice_9_sided==3
		% Move to position 2
		latlon_coord = [xy_coord(1)+0, xy_coord(2)+1];
	elseif dice_9_sided==4
		% Move to position 3
		latlon_coord = [xy_coord(1)+1, xy_coord(2)+1];
	elseif dice_9_sided==5
		% Move to position 4
		latlon_coord = [xy_coord(1)+1, xy_coord(2)+0];
	elseif dice_9_sided==6
		% Move to position 5
		latlon_coord = [xy_coord(1)+1, xy_coord(2)-1];
	elseif dice_9_sided==7
		% Move to position 6
		latlon_coord = [xy_coord(1)+0, xy_coord(2)-1];
	elseif dice_9_sided==8
		% Move to position 7
		latlon_coord = [xy_coord(1)-1, xy_coord(2)-1];
	elseif dice_9_sided==9
		% Move to position 8
		latlon_coord = [xy_coord(1)-1, xy_coord(2)+0];
	end
end
