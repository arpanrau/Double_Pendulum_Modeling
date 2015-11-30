function animationscript(L1,L2,T,Y)

%Animates ode45 double pendulum implementation
%Accepts Length of first leg, length of 2nd leg,
%ode45 time output, ode45 position outputs

%Calculates X and Y position vectors based on ode45 output

x1 = L1*sin(Y(:,1));
x2 = L1*sin(Y(:,1))+L2*sin(Y(:,2));
y1 = -L1*cos(Y(:,1));
y2 = -L1*cos(Y(:,1))-L2*cos(Y(:,2));

for i = length(T)
    clf;
    axis([-(L1 + L2), L1+L2, -(L1+L2),L1+L2])
    hold on;
    plot(x1, y1, 'r.', 'MarkerSize', 50);
    plot(x2, y2, 'b.', 'MarkerSize', 20);
    drawnow
end
end
    
