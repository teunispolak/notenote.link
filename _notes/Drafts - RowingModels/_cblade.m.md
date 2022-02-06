% cblade.m
% Stephen Young
% Effects of Various Inefficiencies in Rowing on Shell Speed
% Adapted from Marinus van Holst's Simulation of Rowing
% Determines the lift and drag coefficients on the blade for all angles of attack

function yc = cblade(alpha) 		% alpha is angle of attack of blade
global Cmax
if abs(alpha) <= eps % eps = very small value slightly greater than 0
	Cd = 0;
	C1 = 0;
	% The following relations are from research done by
	% Nicholas Caplan & Trevor N. Gardner
else
	Cd = 2 * C_max * sin(alpha).*sin(alpha);
	Cl = C_max * sin(2*alpha);
end
yc = [Cd Cl]; 								% stores the lift and drag coefficients to be used in other files