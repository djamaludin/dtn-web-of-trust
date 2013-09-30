% simulation_run.m - Simulation Run File.
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


clock = 0;
for clock = 1:constant.time_steps,
	disp(clock)
	counter = 0;


%	% Event Triggers
%	% Malicious Nodes
%	if constant.malicious.toggle == 1
%		if constant.malicious.sequence == 0
%			if constant.malicious.event_driver == 0
%				if constant.malicious.time == clock
%					% Time Based Malicious Event
%					nodes = func_malicious_node(nodes, constant, clock, 100);
%					% Malicious event has occurred, toggle the switch
%					constant.malicious.sequence = 1;
%				end
%			elseif constant.malicious.event_driver == 1
%				% Percentage Based Malicious Event
%				key_percentage = 0;
%				key_percentage = func_calc_key_percent(data, constant);
%				if key_percentage >= constant.malicious.percent
%					nodes = func_malicious_node(nodes, constant, clock, 100);
%					constant.malicious.sequence = 1;
%				end
%				clear key_percentage
%			end
%		end
%	end



	% Move Functions with delays
	% If you are not connected, then move, else if you are connected then decrease your stauts timer by 1 time step.
	for counter = 1:constant.node_no,
		if nodes(counter).status_timer == 0
			nodes(counter).connected = [];
			nodes = func_move_rand_path(nodes,counter);
		elseif nodes(counter).status_timer == 1
			% Right before you start moving, you need to generate a new destination.
			nodes = func_gen_destination(nodes,constant,counter);
			nodes(counter).status_timer = nodes(counter).status_timer - 1;
		elseif nodes(counter).status_timer > 1
			% Decrement the counter by 1
			nodes(counter).status_timer = nodes(counter).status_timer - 1;
		end
	end


	counter = 0;	% The node being analysed
	for counter = 1:constant.node_no,
		if nodes(counter).status_timer == 0
%			nodes = func_check_comms_range(nodes, counter, constant.comms_range, constant.node_no);
			nodes = func_check_comms_range(nodes, constant, counter);
			no_of_radius = length(nodes(counter).radius);
			if no_of_radius > 0
				% If you have a neighbour, select one at random
				random_neighbour = 0;
				random_neighbour = func_gen_random_int(no_of_radius); % Randomly select one out of your radius list.
				counter_radius = random_neighbour;
				clear random_neighbour
				node_neighbour = nodes(counter).radius(counter_radius); % This should just randomly pick a node in the radius list.

				% Create Connection (Generate Trust Values)
				nodes = func_connection(nodes, counter, node_neighbour, constant);

				% Direct Key Exchange
				nodes = func_key_direct_exchange(nodes, counter, node_neighbour, clock);
				nodes(counter).popularity(node_neighbour) = nodes(counter).popularity(node_neighbour) + 1; % Flag that you have met the neighbouring node in the popularity counter
				nodes = func_key_direct_exchange(nodes, node_neighbour, counter, clock);
				nodes(node_neighbour).popularity(counter) = nodes(node_neighbour).popularity(counter) + 1; % Flag that you have met the neighbouring node in the popularity counter

				% Carrier Key Exchange
				node_neighbour = nodes(counter).radius(counter_radius);
				% The actual Carrier Key Exchange functions
				nodes = func_key_carrier_exchange(nodes, counter, node_neighbour, clock, constant);
				nodes = func_key_carrier_exchange(nodes, node_neighbour, counter, clock, constant);

				clear counter_radius
				clear node_neighbour
			end
			clear no_of_radius
		end
	end
	clear counter

	% Data logging
	% Generate Dynamic Malicious Node Key Penetration (if applicable)
%	if constant.malicious.toggle == 1
%		data = func_key_spread_static(nodes,constant,data);
%		data = func_data_malicious(nodes, data, constant, clock);
%	end
	% Data Logging Function
	data = func_data_all(nodes, data, constant, clock);
	% Data Graphs (Dynamic)
	func_data_graphs_dynamic(data, constant.dynamic_graphs_direct, constant.dynamic_graphs_approved, constant.dynamic_graphs_all)
	% Sequencing Function
	if constant.history == 1
		flux_capacitor = func_flux_capacitor(nodes, flux_capacitor, constant, clock);
	end


end
clear clock

% End of simulation, generate reports and results

% Data Graphs XY coord and no. of keys (Static)
%func_data_graphs_static(data,1,1,1)

% Grand Total
%data = func_data_total(nodes, data, constant);

% Data Graphs Key Distribution vs time (Static)
%func_data_graphs_key_dist(data)
