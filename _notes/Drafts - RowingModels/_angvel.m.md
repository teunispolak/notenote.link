% angvel.m
% Stephen Young
% Effects of Various Inefficiencies in Rowing on Shell Speed
% Adapted from Marinus van Holst's Simulation of Rowing
% Determines angular velocity of oar throughout the drive
function yphidot = angvel(vfi)
global L_o FB max % variables assigned in shell.m used in angvel.m
v_shell = vfi(1); % determine values of v_shell and phi
phi = vfi(2);
phi_dot = v_shell*cos(phi)/(Lo);
dphi_dot = 0.1;
F_bladeR = forcerf(phi)*FBmax;
angle
if F_bladeR < eps
F_bladeR = 0.1;
% determines current angular velocity
% angular acceleration of oar
% determines blade force for a given
end;
F_blade = 0; % initial value for blade force
count = 0;
while (F_blade/F_bladeR <1) && (count < 100)
count = count + 1;
foud = F_blade;
phi_dot = phi_dot+dphi_dot;
vec = vblade(vshell, phi, phi_dot); % determines u and angle of
attack from vblade.m
F blade = fblade(vec(2), vec(l)); % determines F blade from
fblade.m
if F_blade/F_ bladeR > 1.001 % determines blade force after FBmax is
reached
F_blade = foud;
phidot = phi_dot-dphidot;
dphi_dot = dphidot/2;
end
end;
yphi_dot = [phidot FbladeR];