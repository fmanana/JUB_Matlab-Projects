u = [1; 2; 1]
v = [1; 1; 1]

% 1) Finding the lengths of u and v, and normalising them.

length_u = norm(u)
length_v = norm(v)

norm_u = u / length_u
norm_v = v / length_v

% 2) What is the angle between them?

angle_uv = acos(dot(u,v) / (norm(u)*norm(v))) * 180/pi

% 3) Write u as a sum of two vectors, one collinear to v.

unit_v = v / norm(v)
u_sum = (dot(unit_v, u)) + (u - (dot(unit_v, u)*unit_v))

% 4) Find a unit-vector orthogonal to the plane of u and v.

a = cross(u,v)
unit_a = a / norm(a)

% 5) Find a vector in the plane of u and v which is orthogonal to v.

b = cross(v,(cross(v,u)))

% 6) Find a vector in the plane of u and v which is orthogonal to u.

c = cross(u,(cross(u,v)))