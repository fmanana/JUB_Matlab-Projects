%Corbeanu Dan-Andrei
%Fezile Manana

axis = [1;1;1];
angle = pi;

X = Rodrigues(axis, angle);

[axis1, angle1] = DCM2AA(X);

err = 0.00000000001;
errM = [err; err; err];

k = 0;
if(axis - axis1 < errM)
    k = 1;
end

if(axis1 - axis < errM)
    k = 1;
end

q = 0;
if(angle - angle1 < err)
    q = 1;
end

if(k == 1)&&(q == 1)
    disp('DCM2AA is the reverse of the Rodrigues function');
end
