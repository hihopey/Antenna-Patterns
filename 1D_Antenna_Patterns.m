% N is the number of discrete pieces
% n is the number of the loop we are on?
P = zeros (theta);
sum = 0;
c = 3e8; % the speed of light
f = 60; % in Hertz
L = (0.5 * c) / f; % length of wire
N = 10; % arbitrary value we came up with
deltaz = L / N; % length of pieces 
for theta=0 : pi
    for n=1 : N
        Zn = -0.5 * l + (((n-1)*l)/(N-1));
        Izn = 1; 
        Pn = Izn * exp(j*2*pi*f*Zn*cos(theta)/ c) * deltaz;
        sum = Pn + sum;
        n = n + 1;
    end
    P(theta) = abs(sin(theta) * sum);
    theta = theta + (pi/10);
end

fntsz = 14;
figure(1)
clf
hold on
mag2db(theta, P);
hold off
xlabel('Angle of Arrival (theta)')
ylabel('Power Pattern (Watts)')
title('1-D Antenna Patterns')

    