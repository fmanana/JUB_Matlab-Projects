%Fezile Manana

% predefining rotation axis as 'a'
a = [0; 0; 1]

% angle defined as pi
alpha = pi
alpha_2 = pi/3

% rotation vector calculated by multiplying angle and rotation axis
v = a * alpha

% use of built in function 'vrrotvec2mat'
DCM = vrrotvec2mat([0 0 1 pi])

% the reason I used this is because the functino in the slides does not work

DCM_2 = vrrotvec2mat([1 2 3 pi/3])
det_DCM_2 = det(DCM_2)

DCM_3 = vrrotvec2mat([-1 -2 -3 -pi/3])

DCM_4 = vrrotvec2mat([1 2 3 -pi/3])

Identity = DCM_2 * DCM_4