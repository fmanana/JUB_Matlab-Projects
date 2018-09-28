function [axis, angle] = DCM2AA(R)

if(R == eye(3))
    angle = 0;
    disp('angle is 0')
else
    tr = trace(R);
angle = radtodeg(acos((tr-1)/2));
end

X = ((1/(2*sin(angle)))*(R' - R));
axis = [X(3,2); X(1,3); X(2,1)];


end

%P.S.: The equasions don't workas they should in my matlab!
%http://www.egr.msu.edu/~vaibhav/teaching/robotics/lectures/lec13.pdf