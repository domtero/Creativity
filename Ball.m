function [next_state] = Ball(curr_state, curr_time, curr_ball_pos, curr_att_pos,...
                                                    curr_def_pos, thresholds)
%%%% Input: 
%%%%% curr_state: 1 by 7 boolean (current player holding the ball + shooting)
%%%%% curr_ball_pos: 1 by 2 array of current ball position (2D)
%%%%% curr_att_pos: 6 by 2 array of current attack player position
%%%%% curr_def_pos: 6 by 2 array of current defensive player position
%%%%% curr_time : current shooting clock, <= 25 seconds
%%%%% threshold: 1 by 3 costant, [distance to goal, distance to def player,
%%%%%                                         time]
%%%% Output:
%%%%% next_state: 1 by 7 boolean (next player holding the ball + shooting)
%%%%% next_ball_pos 1 by 2 array of next ball position (2D)


next_state = zeros(1,7);
%% Shooting or not
ind  = find(curr_state(1:6)==1); % current ball holder index
dist = norm(curr_att_pos(ind,:) - curr_def_pos(ind,:)); % current ball holder
                                                        % distance to
                                                        % defender
if norm(curr_ball_pos)< thresholds(1) || dist > thresholds(2) || curr_time < thresholds(3)
    next_state(end) = 1;   
else 
%% Next position and possession 
m = size(curr_att_pos,1);
D = zeros(m); % matrix storing distance between each attack player with defensive player
for i = 1:m
    for j = 1:m
      D(i,j) = norm(curr_att_pos(i,:) - curr_def_pos(j,:));
    end
end
[~,M] =  max(D,[],2); % find the defender that is closes to attacker
                  % M is the min distances
                  % to each of the defender (6 by 1 array)
[opt_attacker, ~] = max(M);% opt_attacker is a value from 1 to 6 indicating optimal
                           % player to pass to
next_state(opt_attacker) = 1;
next_state(end) = 0;

end
