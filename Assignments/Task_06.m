R_eb = (1/25)*[9 12 -20; 12 16 15; 20 -15 0]
B_u = [1; 2; -1]
E_u = R_eb*B_u

plot3([0, B_u(1)], [0, B_u(2)], [0, B_u(3)], 'g');
hold on;
% Hold on used to remember plot
B_v = [1; 3; 2];
x = cross(B_u, B_v);

plot3([0, B_v(1)], [0, B_v(2)], [0, B_v(3)], 'r');
hold on;

plot3([0, x(1)], [0, x(2)], [0, x(3)], 'b');
grid on;