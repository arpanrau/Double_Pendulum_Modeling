function  double_pendulum()
L1 = 10;
L2 = 10;
M1 = 5;
M2 = 0.1;
g = 9.8;

end_time = 100;
step = 0.1;
initial = [0.52;0.52;0;0];

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
animationscript(L1,L2,T,U)
end

