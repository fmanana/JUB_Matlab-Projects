function R_B_E= Rodrigues(axis, alpha)
axis = axis / norm(axis);
alpha = radtodeg(alpha);
A= [ 0, -axis(3), axis(2); axis(3), 0,-axis(1); -axis(2) , axis(1), 0];
R_B_E= eye(3) + sin(alpha)*A + (1-cos(alpha))*(A^2);