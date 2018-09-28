%Group submission for Fezile Manana and Harit Krishan
%Code for all components of question 3

yaw = 13*pi/18;
pitch = pi/9;
roll = pi/4;

dcm = [cos(yaw)*cos(roll), (cos(yaw)*sin(pitch)*sin(roll)) - (sin(yaw)*cos(roll)), (cos(yaw)*sin(pitch)*cos(roll)) + (sin(yaw)*sin(roll));
	sin(yaw)*cos(pitch), (sin(yaw)*sin(pitch)*sin(roll)) + (cos(yaw)*cos(roll)), (sin(yaw)*sin(pitch)*cos(roll)) - (cos(yaw)*sin(roll));
	-sin(pitch), cos(pitch)*sin(roll), cos(pitch)*cos(roll)]

%formula taken from slides and angles were substituted

%Finding angle from DCM
angle = acos((trace(dcm) - 1)/2)

%Finding axis from DCM
skew_DCM = (0.5*(dcm-dcm')/sin(angle))
axis = [skew_DCM(3,2); skew_DCM(1,3); skew_DCM(2,1)]

%Unit quaternion
w = (sqrt(trace(dcm) + 1 ))/2;
%check if w is real. Else zero
if (imag(w) > 0)
	w = 0;
end

x = sqrt(1 + dcm(1,1) - dcm(2,2) - dcm(3,3) ) / 2;
y = sqrt(1 + dcm(2,2) - dcm(1,1) - dcm(3,3) ) / 2;
z = sqrt(1 + dcm(3,3) - dcm(2,2) - dcm(1,1) ) / 2;

[element, i ] = max( [w,x,y,z] );

if( i == 1 )
    x = (dcm(3,2) - dcm(2,3) ) / (4*w);
    y = (dcm(1,3) - dcm(3,1) ) / (4*w);
    z = (dcm(2,1) - dcm(1,2) ) / (4*w);
end

if( i == 2 )
    w = (dcm(3,2) - dcm(2,3) ) / (4*x);
    y = (dcm(1,2) + dcm(2,1) ) / (4*x);
    z = (dcm(3,1) + dcm(1,3) ) / (4*x);
end

if( i == 3 )
    w = ( Dcm(1,3) - Dcm(3,1) ) / (4*y);
    x = ( Dcm(1,2) + Dcm(2,1) ) / (4*y);
    z = ( Dcm(2,3) + Dcm(3,2) ) / (4*y);
end

if( i == 4 )
    w = (dcm(2,1) - dcm(1,2) ) / (4*z);
    x = (dcm(3,1) + dcm(1,3) ) / (4*z);
    y = (dcm(2,3) + dcm(3,2) ) / (4*z);
end

Quaternion = [ w; x; y; z ]
