theta = linspace(0, pi, 100); % sets up a 10 element array of theta values from 0 - pi
lt = length (theta); % length of theta
P = zeros (1, lt); % sets up a 1D array P of the same length as theta and fills it with zeros
c = 3e8; % the speed of light
f = 60; % frequency in Hertz
L = (0.5 * c) / f; % length of wire, defined by the problem
N = 100; % number of peices of L
deltaz = L / N; % length of pieces 
for t=1 : 100 % loop to go through all indicies of theta and P
    sum = 0; 
    for n=1 : N % loop to go from n = 1 to n = N
        Zn = -0.5 * L + (((n-1)*L)/(N-1)); % calculates Zn point at a given n
        Izn = cos((pi*Zn)/L); %calculates I for Zn, also defined by the problem
        Pn = Izn * exp(1i*2*pi*f*Zn*cos(theta(t))/ c) * deltaz; % calculates power for given Zn and theta
        sum = Pn + sum; % so that this loop is a sum; adds Pns from all iterations
        n = n + 1; % to keep the loop going
    end
    P(t) = abs(sin(theta(t)) * sum); % calculates power pattern for given theta
    t = t + 1; % to iterate loop
end

%plot P vs. theta
fntsz = 14;
figure(1)
clf
hold on
loglog (theta, P, 'b')
hold off
xlabel('Angle of Arrival (theta)')
ylabel('Power Pattern (dB)')
title('1-D Antenna Patterns')