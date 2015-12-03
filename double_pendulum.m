function  double_pendulum()
L1 = .5;
L2 = .5;
M1 = 3;
M2 = 1;
g = 9.8;

end_time = 10;
step = 0.05;
initial = [0.2;3;0;0];

[T,U] = ode45(@netFlow,0:step:end_time,initial);

    function res = netFlow (~,params)
        theta1 = params(1);
        theta2 = params(2);
        theta1V = params(3);
        theta2V = params(4);
        theta1A = (-g*((2*M1)+M2)*sin(theta1)-M2*g*sin(theta1-(2*theta2))-2*sin(theta1-theta2)*M2*((theta2V^2)*L2+(theta1V^2)*L1*cos(theta1-theta2)))/(L1*(2*M1+M2-M2*cos(2*theta1-2*theta2)));
        theta2A = (2*sin(theta1-theta2)*((theta1V^2)*L1*(M1+M2)+g*(M1+M2)*cos(theta1)+(theta2V^2)*L2*M2*cos(theta1-theta2)))/(L2*(2*M1+M2-M2*cos(2*theta1-2*theta2)));
        res = [theta1V; theta2V; theta1A; theta2A];
    end
animationscript(L1,L2,T,U,M1,M2,step)
y1 = -L1*cos(U(:,1));
y2 = -L1*cos(U(:,1))-L2*cos(U(:,2));

v1 = U(:,3)*L1;
v2 =sqrt((U(:,4).*L2.*sin(U(:,2)))+(U(:,3).*L1.*sin(U(:,1))).^2 + ((U(:,4).*L2.*cos(U(:,2)))+(U(:,3).*L1.*cos(U(:,1))).^2)) ;

PE1 = g*M1*(y1)*-1;
PE2 = g*M2*(y2)*-1;
KE1 = .5*M1*v1.^2;
KE2 = .5*M2*v2.^2;

E = PE1 + PE2 + KE1 + KE2;

figure
plot(T,E);
hold on
plot(T,PE1);
plot(T,PE2);
plot(T,KE1);
plot(T,KE2);

legend('E','PE1','PE2','KE1','KE2')



end

