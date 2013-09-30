% func_default_init.m - Default Value Initialisation Sub-Script.
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


%% Default Value Initialisation
% ====================================================================================================
clear all
format long g
rng('shuffle')
constant.movement_mode = 1;
constant.node_no = 100;
constant.workspace_x = 100;
constant.workspace_y = 100;
constant.workspace_total = constant.workspace_x * constant.workspace_y;	% total number of spaces

constant.comms_range = 1;

% Define how long the simulation will run
% ====================================================================================================
constant.time_steps = 10000;	% number of time steps in simulation
constant.time_steps_big = 1;	% how many time steps makes a big time step (for logging purposes)


% Define whether to do dynamic logging during simulation (why not?)
% ====================================================================================================
constant.dynamic_logging = 1;
% 0 for no
% 1 for yes


% Define whether to draw a graph during simulation (this takes longer)
% ====================================================================================================
constant.dynamic_graphs_direct = 0;
constant.dynamic_graphs_approved = 0;
constant.dynamic_graphs_all = 0;
% 0 for no
% 1 for yes


% Define whether to do Sequence of Events during simulation
% ====================================================================================================
constant.history = 1;
% 0 for no
% 1 for yes


% Data Exchange Times and Rates
% ====================================================================================================
constant.data_rate = 723000; % in bits/s (bluetooth 1.2 = 723 kbits/s)
constant.data_length_key = 2048; % in bits (2048bits)
constant.data_length_msg = 100000*8; % in bits (average is 75kb - 7000 plaintext words, 10kb - 80 plaintext words, 30kb is good ballpark)
constant.data_time_key = ceil(constant.data_length_key/constant.data_rate);
constant.data_time_msg = ceil(constant.data_length_msg/constant.data_rate);
constant.delay_extra = 0;
constant.data_time_all = 60;


% Trust Threshold Subsystem Initialisation
% ====================================================================================================
% Assume self-trust, that is that node 1 trusts itself. Otherwise, it might have problems.
% Trust values are not mutual between nodes
% Trust values are assigned randomly between 0 (don't trust) and 0.9 (highly trust). Value of 1 is for self trust.
constant.trust_lower = 0;	% Minimum Trust Value (usually 0)
constant.trust_upper = 1; % Maximum Trust Value (changable)
constant.trust_threshold = 1.1;	% Trust Threshold value

constant.trust_type = 0;
% 0 is to have no trust value, you share everything.
% 1 is randomly assign a trust value between lower and upper bounds (jia_z_2011 scheme).
% 2 is to leverage common social contacts.

% Trust Common Formula (When constant.trust_type = 1)
% T(A) wrt B = [m1 * no.of_contacts(A)] + [(Sum of common contacts between A and B) * m2] + initial constant 
constant.m1 = 0.01;
constant.m2 = 0.025;
constant.m3 = -0.25;
%constant.initial_c = 0.25;
constant.initial_c = 0.5;



% Memory Constraints
% ====================================================================================================
% Nodes have a limited memory space
%constant.memory_toggle = 0;
% 0 for off
% 1 for on

constant.mem_mode = 0; 
% How to dump the keys when you overflow?
% 0. No Memory Management
% 1. First in Based - Don't Discard when you are full
% 2. Time Based - Discard the oldest key
% 3. Popularity Based - Discard the least popular key
% 4. Trust Based - Discard the least trusted key

constant.mem_direct = 10; % Number of direct keys you can store including your own key
constant.mem_approved = 10; % Number of approved keys you can store
constant.mem_revoked = 10; % Number of revoked keys you can store including your own key
constant.mem_untrusted = 10; % Number of untrusted keys you can store.
constant.mem_trust = 10; % Number of node trust levels you can store

% how do you dynamically change what each node does in each time step, or
% how many actions it can undertake in a time step?


%% Revocation Constants
% ====================================================================================================
constant.revocation.toggle = 0;
% 0 for off
% 1 for on

constant.revocation.number = 1; % Number of nodes doing the revocation

% Revocation Trust Threshold Subsystem Initialisation
constant.revocation.trust_threshold = 1;	% Revocation Trust Threshold value (should be lower to facilitate faster spreading of revoked keys)


%% Node Initialisation
% ====================================================================================================
counter = 0;
for counter = 1:constant.node_no,
	node.id = counter;
	% Generate random x and y co ordinates here
%	x_coord = func_gen_random_int(constant.workspace_x); % Not random enough
%	y_coord = func_gen_random_int(constant.workspace_y); % Not random enough
	x_coord = randi(100);
	y_coord = randi(100);
	node.xy_coord = [x_coord,y_coord];
	node.radius = [];
	node.connected = [];
	node.key = [0,counter,func_gen_key(32)];
	node.key_direct = node.key;
	% node.key_direct = [timestamp, node_id, the_key, number_of_times_met, trust_level]
	node.key_approved = [];
	counter2 = 0;
	for counter2 = 1:constant.node_no,
		node2.key_untrusted.received = [];
		node2.key_untrusted.sig = [];
		node.key_untrusted(counter2) = node2.key_untrusted;
	end
	node.key_revoked = [];
	node.trust_accumulate = [zeros(constant.node_no,1)];
	node.trust_relationship = [zeros(constant.node_no,1)];
	node.popularity = [zeros(constant.node_no,1)];

	node.status_master = 1; % 1 is on, 0 is off
	node.status_security = 0; % 0 is good, 1 is bad
	node.status_malicious_ts = 0.1; % Timestamp of when the node went malicious (whole number, therefore 0.1 means it's not malicious)
	node.status_comms = 0; % 0 is listening, 1 is transmitting
	node.status_movement = 1; % 0 is stationary (busy), 1 is moving
	node.status_timer = 0; % Counts down for the total time it is connected to another node
	nodes(counter) = node;
	nodes(counter).trust_accumulate(counter) = 1;	% Make node(counter) trust itself
	nodes(counter).trust_relationship(counter) = 1;	% Make node(counter) trust itself
end


%% Revocation Initialisation
% ====================================================================================================
%if constant.revocation_toggle == 1
%	wot_sim_revocation_init
%end




%% Dynamic Data Initialisation
% ====================================================================================================

% data.all structure columns
% 1. Node ID
% 2. X Coordinate
% 3. Y Coordinate
% 4. Number of Direct Keys
% 5. Number of Approved Keys
% 6. Number of Direct and Approved Keys
data.all = zeros(constant.node_no,6);
data.all(:,1) = 1:constant.node_no;
data.xy_coord = zeros(constant.node_no,2);
data.key_direct = zeros(constant.node_no,1);
data.key_approved = zeros(constant.node_no,1);
data.key_total = zeros(constant.node_no,1);
data.time = [];
data.metrics = [];


%% Malicious Node Initialisation
% ====================================================================================================
constant.malicious.toggle = 0; % 0 for off, 1 for on

if constant.malicious.toggle == 1
	constant.malicious.node = 100;
	constant.malicious.key = 101110101101; % Hexadecimal for BAD
	constant.malicious.sequence = 0; % Counter for the number of malicious events to occur
	constant.malicious.event_driver = 0; % 0 for time, 1 for percentage of keys
	data.malicious.all = zeros(constant.node_no,6);
	data.malicious.all(:,1) = 1:constant.node_no;
	data.malicious.time = [];
	data.malicious.events = []; % column 1 is the time stamp of the event, column 2 is the node that occurred to it.
	data.malicious.bad_bad_direct = [];
	data.malicious.bad_bad_direct_length = 0;
	data.malicious.bad_bad_approved = [];
	data.malicious.bad_bad_approved_length = 0;
	data.malicious.other_bad_direct = [];
	data.malicious.other_bad_direct_length = 0;
	data.malicious.other_bad_approved = [];
	data.malicious.other_bad_approved_length = 0;
	data.malicious.other_other_approved = [];
	data.malicious.other_other_approved_length = 0;
	data.malicious.direct_total = 0;
	data.malicious.approved_total = 0;
	data.malicious.grand_total = 0;

	if constant.malicious.event_driver == 0
		constant.malicious.time = 200;
	else
		constant.malicious.percent = 10; % as a value 20% = 20, 50% = 50
	end
end

counter3 = 0;
initial_xy = zeros(constant.node_no,3);
for counter3 = 1:constant.node_no,
	initial_xy(counter3,1) = nodes(counter3).id;
	initial_xy(counter3,2) = nodes(counter3).xy_coord(1);
	initial_xy(counter3,3) = nodes(counter3).xy_coord(2);
end


% Snapshot data at each big time step
flux_capacitor = struct('nodes', {});


clear counter
clear counter2
clear counter3
clear x_size_plus1
clear y_size_plus1
clear node
clear node2
clear trust_value
clear x_coord
clear y_coord

