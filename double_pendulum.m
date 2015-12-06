function  double_pendulum()

L1 = 1;
L2 = 1;
M1 = 5;
M2 = 10;
g = 9.8;

end_time = 30;
step = 0.1;
initial = [pi/2 pi/2 0 0];



[T,U] = ode23tb(@netFlow,0:step:end_time,initial);

KE1 = (.5*M1*(L1^2).*(U(:,3).^2));
KE2 = (.5*M2*((L1^2).*(U(:,3).^2)+(L2^2).*(U(:,4).^2)+(2.*U(:,3).*U(:,4).*L1*L2.*cos(U(:,1)-U(:,2)))));
PE1 = -M1*g*L1.*cos(U(:,1));
PE2 = M2*g*(-L1.*cos(U(:,1))-L2.*cos(U(:,2)));
        
    function res = netFlow (~,params)
        theta1 = params(1);
        theta2 = params(2);
        theta1V = params(3);
        theta2V = params(4);      
        theta1A = (-g*((2*M1)+M2)*sin(theta1)-M2*g*sin(theta1-(2*theta2))-2*sin(theta1-theta2)*M2*((theta2V^2)*L2+(theta1V^2)*L1*cos(theta1-theta2)))/(L1*(2*M1+M2-M2*cos(2*theta1-2*theta2)));
        theta2A = (2*sin(theta1-theta2)*((theta1V^2)*L1*(M1+M2)+g*(M1+M2)*cos(theta1)+(theta2V^2)*L2*M2*cos(theta1-theta2)))/(L2*(2*M1+M2-M2*cos(2*theta1-2*theta2)));
        res = [theta1V; theta2V; theta1A; theta2A];
    end


%figure

%animationscript(L1,L2,T,U,M1,M2,step)

figure
title('Energy Vs Time - Double Pendulum')
hold on
plot(T,KE1,'r-.');
plot(T,KE2,'b-.');
plot(T,PE1,'r');
plot(T,PE2,'b');
plot(T,KE1+KE2+PE1+PE2,'k') 
xlabel('Time(Seconds)')
ylabel('Energy(Joules)')
legend('KE1','KE2','PE1','PE2','E')


end



