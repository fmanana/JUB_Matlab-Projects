clear all
close all
clf
handle_axes= axes('XLim', [-0.4,0.4], 'YLim', [-0.2,0.4], 'ZLim', [0,0.4]);

xlabel('e_1'); 
ylabel('e_2');
zlabel('e_3');

view(-130, 26);
grid on;
axis equal
camlight
axis_length= 0.05;

%% Root frame E
trf_E_axes= hgtransform('Parent', handle_axes); 
% The root-link transform should be created as a child of the axes from the
% beginning to avoid the error "Cannot set property to a deleted object".
% E is synonymous with the axes, so there is no need for plot_axes(trf_E_axes, 'E');

%% Link-0: Base-link

trf_link0_E= make_transform([0, 0, 0], 0, 0, pi/2, trf_E_axes);
plot_axes(trf_link0_E, 'L_0', false, axis_length); 

trf_viz_link0= make_transform([0, 0, 0.0425], 0, 0, 0, trf_link0_E);
h(1)= link_box([0.32, 0.26, 0.085], trf_viz_link0, [0.823529 0.411765 0.117647]); 
plot_axes(trf_viz_link0, ' ', true, axis_length); % V_0

%% Link-1 / base_laser
trf_viz_link1= make_transform([0, 0, 0], 0, 0, 0); % Do not specify parent yet: It will be done in the joint
length1= 0.07; radius1= 0.025;
h(2)= link_cylinder(radius1, length1, trf_viz_link1, [0, 0, 1]); 
% V_1 and L_1 are the same.

%% Link-1_2 / cpu_link
trf_viz_linkCPU= make_transform([0, 0, 0.035], 0, 0, 0); % Do not specify parent yet: It will be done in the joint
h(3)= link_box([0.19, 0.19, 0.07], trf_viz_linkCPU, [0, 0, 1]); 
plot_axes(trf_viz_linkCPU, ' ', true, axis_length); % V_{1-2}

%% Link-1_3 / upper_base_link
trf_viz_linkUB= make_transform([0, 0, 0.05], 0, 0, 0); % Do not specify parent yet: It will be done in the joint
h(4)= link_cylinder(0.085, 0.10, trf_viz_linkUB, [0, 0, 1]); 
%plot_axes(trf_viz_link1p3, ' ', true, axis_length); % V_{1-3}

%% Link-2 / torso_link
trf_viz_linkTL= make_transform([0, 0, 0.12], 0, 0, 0); % Do not specify parent yet: It will be done in the joint
h(5)= link_cylinder(0.05, 0.24, trf_viz_linkTL, [1, 0.54902, 0]); 
% V_2 and L_2 are the same.

%% Link 2-2 / head_pan_link
trf_viz_linkHP= make_transform([0, 0, 0.0225], 0, 0, 0); % Do not specify parent yet: It will be done in the joint
h(6)= link_box([0.05, 0.045, 0.045], trf_viz_linkHP, [1, 0.54902, 0]); 
% plot_axes(trf_viz_link2p2, ' ', true, axis_length); % V_{2-2}

%% Link-3 / head_tilt_link
trf_viz_linkHT= make_transform([0, 0, 0.02], 0, 0, 0); % Do not specify parent yet: It will be done in the joint
h(7)= link_box([0.03, 0.038, 0.04], trf_viz_linkHT, [0.196078, 0.803922, 0.196078]); 
% plot_axes(trf_viz_link3, ' ', true, axis_length); % V_3

%% Link-3-2 / neck_link
trf_viz_link3p2= make_transform([0, 0, 0.021], pi/2, 0, 0); % Do not specify parent yet: It will be done in the joint
h(8)= link_box([0.03, 0.05, 0.042], trf_viz_link3p2, [0.196078, 0.803922, 0.196078]); 
% plot_axes(trf_viz_link3p2, ' ', true, axis_length); % V_{3-2}

%% Link-4 / head_link
trf_viz_link4= make_transform([0, 0, 0.025], 0, 0, 0); % Do not specify parent yet: It will be done in the joint
h(9)= link_box([0.03, 0.07, 0.11], trf_viz_link4, [0.482353 0.407843 0.933333]); 
% plot_axes(trf_viz_link4, ' ', true, axis_length); % V_{4}

%% Link-End-Effector / eyes_link
trf_viz_linkEE= make_transform([0, 0, 0.035], 0, 0, 0); % Do not specify parent yet: It will be done in the joint
h(10)= link_box([0.01, 0.04, 0.01], trf_viz_linkEE, [1, 0, 0]); 
% plot_axes(trf_viz_linkEE, ' ', true, axis_length); % V_{EE}

%% antenna_link
trf_viz_link_ant = make_transform([0, 0, 0.035], 0, 0, 0);
h(11) = link_cylinder(0.002, 0.05, trf_viz_link_ant, [0, 0, 1]);

%% left_shoulder_link
trf_viz_link_LS = make_transform([0, 0, 0], 0, 0, 0);
h(12) = link_box([0.025, 0.015, 0.05], trf_viz_link_LS, [1, 0, 1]);

%% right_shoulder_link
trf_viz_link_RS = make_transform([0, 0, 0], 0, 0, 0);
h(13) = link_box([0.025, 0.015, 0.05], trf_viz_link_RS, [1, 0, 1]);

%% left_shoulder_forward_link
trf_viz_link_LSF = make_transform([0, 0, 0], 0, 0, 0);
h(14) = link_box([0.03, 0.05, 0.03], trf_viz_link_LSF, [1, 0, 0]);

%% right_shoulder_forward_link
trf_viz_link_RSF = make_transform([0, 0, 0], 0, 0, 0);
h(15) = link_box([0.03, 0.05, 0.03], trf_viz_link_RSF, [1, 0, 0]);

%% left_shoulder_up_link
trf_viz_link_LSU = make_transform([0, 0, 0], pi/2, 0, 0);
h(16) = link_box([0.03, 0.05, 0.03], trf_viz_link_LSU, [1, 0, 0]);

%% right_shoulder_up_link
trf_viz_link_RSU = make_transform([0, 0, 0], pi/2, 0, 0);
h(17) = link_box([0.03, 0.05, 0.03], trf_viz_link_RSU, [1, 0, 0]);

%% left_upper_arm_link
trf_viz_link_LUA = make_transform([0, 0, 0], 0, 0, 0);
h(18) = link_cylinder(0.0075, 0.05, trf_viz_link_LUA, [0, 1, 0]);

%% right_upper_arm_link
trf_viz_link_RUA = make_transform([0, 0, 0], 0, 0, 0);
h(19) = link_cylinder(0.0075, 0.05, trf_viz_link_RUA, [0, 1, 0]);

%% left_elbow_link
trf_viz_link_LE = make_transform([0, 0, 0], 0, 0, pi/2);
h(20) = link_box([0.035, 0.035, 0.05,], trf_viz_link_LE, [0, 1, 0]);

%% right_elbow_link
trf_viz_link_RE = make_transform([0, 0, 0], 0, 0, pi/2);
h(21) = link_box([0.035, 0.035, 0.05,], trf_viz_link_RE, [0, 1, 0]);

%% left_lower_arm_link
trf_viz_link_LLA = make_transform([0, 0, 0], 0, 0, 0);
h(22) = link_cylinder(0.0075, 0.11, trf_viz_link_LLA, [0, 0, 1]);

%% right_lower_arm_link
trf_viz_link_RLA = make_transform([0, 0, 0], 0, 0, 0);
h(23) = link_cylinder(0.0075, 0.11, trf_viz_link_RLA, [0, 0, 1]);

%% left_wrist_link
trf_viz_link_LW = make_transform([0, 0, 0], pi/2, 0, 0);
h(24) = link_box([0.03, 0.05, 0.03], trf_viz_link_LW, [0, 0, 1]);

%% right_wrist_link
trf_viz_link_RW = make_transform([0, 0, 0], pi/2, 0, 0);
h(25) = link_box([0.03, 0.05, 0.03], trf_viz_link_RW, [0, 0, 1]);

%% left_hand_link
trf_viz_link_LH = make_transform([0, 0, 0], 0, 0, 0);
h(26) = link_box([0.03, 0.01, 0.06], trf_viz_link_LH, [0, 0, 1]);

%% right_hand_link
trf_viz_link_RH = make_transform([0, 0, 0], 0, 0, 0);
h(27) = link_box([0.03, 0.01, 0.06], trf_viz_link_RH, [0, 0, 1]);
%% Now define all the joints

%% Joint 1 : Links: base_link, cpu_link : Fixed
j1_rot_axis_j1= [0,0,1]';
j1_rot_angle= 0; % [-pi/2, pi/2]

trf_joint1_link0= make_transform([0.025, 0, 0.085], 0, 0, 0, trf_link0_E); 
make_child(trf_joint1_link0, trf_viz_link0);

%% Joint: Links: base_link, base_laser: Fixed
trf_link1p2_link1= make_transform([0.18, 0, 0.07], 0, 0, 0, trf_link0_E); 
make_child(trf_link1p2_link1, trf_viz_link0);

%% Joint: Links cpu_link, upper_base_link: Fixed
trf_link1p3_link1= make_transform([0, 0, 0.07], 0, 0, 0, trf_joint1_link0); 
make_child(trf_link1p3_link1, trf_viz_linkCPU);

%% Joint 2: Links upper_base_link, torso_link: Revoulute
j2_rot_axis_j2= [0,0,1]';
j2_rot_angle= 0; % [-pi/2, pi/2]

trf_joint2_link1= make_transform([0, 0, 0.10], 0, 0, pi/2, trf_link1p3_link1); 
trf_link2_joint2= make_transform_revolute([0, 0, 1], 2*pi, trf_joint2_link1); 
plot_axes(trf_link2_joint2, 'L_1', false, axis_length); 
make_child(trf_link2_joint2, trf_viz_linkUB);

%% Joint: Links torso_link, head_pan_link: Fixed
trf_link2p2_link2= make_transform([0, 0, 0225], 0, 0, 0, trf_joint2_link1); 
make_child(trf_link2p2_link2, trf_viz_linkTL);

%% Joint 3: Links head_pan_link, head_tilt_link: Revoulute
j3_rot_axis_j3= [0,0,1]';
j3_rot_angle= 2*pi; % []

trf_joint3_link2= make_transform([0, 0, 0.045], 0, 0, 0, trf_link2p2_link2);
trf_link3_joint3= make_transform_revolute(j3_rot_axis_j3, j3_rot_angle, trf_joint3_link2); 
plot_axes(trf_link3_joint3, 'L_2', false, axis_length); 
make_child(trf_link3_joint3, trf_viz_linkHP);

%% Joint: Links head_tilt_link, neck_link: Revolute
trf_link3p2_link3= make_transform([0, 0, 0.04], 0, 0, 0, trf_link3_joint3); 
trf_link_HT_joint = make_transform_revolute([0, 1, 0], 0, trf_link3p2_link3);
plot_axes(trf_link_HT_joint, 'L_3', false, axis_length);
make_child(trf_link_HT_joint, trf_viz_linkHT);

%% Joint: Links neck_link, head_link: Fixed
trf_linkHL_jointNH = make_transform([0.05, 0, 0.015], 0, 0, 0, trf_link_HT_joint);
make_child(trf_linkHL_jointNH, trf_viz_link3p2);

%% Joint: Links head_link, eyes_link: Fixed
trf_linkEL_jointEL = make_transform([0.02, 0, 0.03], 0, 0, 0, trf_linkHL_jointNH);
make_child(trf_linkEL_jointEL, trf_viz_link4);

%% Joint: Links head_link, antenna_link: Fixed
trf_linkAL_jointAL = make_transform([0.0, -0.025, 0.065], 0, 0, 0, trf_linkHL_jointNH);
make_child(trf_linkAL_jointAL, trf_viz_link4);

%% Joint: Links torso_link, left_shoulder_link: Fixed
trf_linkLS_jointT_LS = make_transform([0, 0.055, 0.165], 0, 0, 0, trf_link2_joint2);
make_child(trf_linkLS_jointT_LS, trf_viz_linkTL);

%% Joint: Links torso_link, right_shoulder_link: Fixed
trf_linkRS_jointT_RS = make_transform([0, -0.055, 0.165], 0, 0, 0, trf_link2_joint2);
make_child(trf_linkRS_jointT_RS, trf_viz_linkTL);

%% Joint: Links left_shoulder_link, left_shoulder_forward_link: Revolute
trf_linkLSF_link = make_transform([0, 0.025, 0], 0, 0, 0, trf_linkLS_jointT_LS);
trf_linkLSF_joint = make_transform_revolute([0, 0, 1], 0, trf_linkLSF_link);
plot_axes(trf_linkLSF_joint, 'L_4', false, axis_length);
make_child(trf_linkLSF_joint, trf_viz_link_LS);

%% Joint: Links right_shoulder_link, right_shoulder_forward_link: Revolute
trf_linkRSF_link = make_transform([0, -0.025, 0], 0, 0, 0, trf_linkRS_jointT_RS);
trf_linkRSF_joint = make_transform_revolute([0, 0, 1], 0, trf_linkRSF_link);
plot_axes(trf_linkRSF_joint, 'L_5', false, axis_length);
make_child(trf_linkRSF_joint, trf_viz_link_RS);

%% Joint: Links left_shoulder_forward_link, left_shoulder_up_link: Revolute
trf_linkLSU_link = make_transform([0, 0.04, -0.01], 0, -0.707, 0, trf_linkLSF_link);
trf_linkLSU_joint = make_transform_revolute([0, 1, 0], 0, trf_linkLSU_link);
plot_axes(trf_linkLSU_joint, 'L_6', false, axis_length);
make_child(trf_linkLSU_joint, trf_viz_link_LSF);

%% Joint: Links right_shoulder_forward_link, right_shoulder_up_link: Revolute
trf_linkRSU_link = make_transform([0, 0.04, -0.01], 0, -0.707, 0, trf_linkLSF_link);
trf_linkRSU_joint = make_transform_revolute([0, 1, 0], 0, trf_linkRSU_link);
plot_axes(trf_linkRSU_joint, 'L_7', false, axis_length);
make_child(trf_linkRSU_joint, trf_viz_link_RSF);

%% Joint: Links left_shoulder_up_link, left_upper_arm_link: Fixed
trf_linkLUA_link = make_transform([0, 0, -0.05], 0, 0, 0, trf_linkLSU_link);
make_child(trf_linkLUA_link, trf_viz_link_LSU);

%% Joint: Links right_shoulder_up_link, right_upper_arm_link: Fixed
trf_linkRUA_link = make_transform([0, 0, -0.05], 0, 0, 0, trf_linkRSU_link);
make_child(trf_linkRUA_link, trf_viz_link_RSU);

%% Joint: Links left_upper_arm_link, left_elbow_link: Revolute
trf_linkLE_link = make_transform([-0.005, 0, -0.05], 0, 0, 0, trf_linkLUA_link);
trf_linkLE_joint = make_transform_revolute([0, 0, 1], 2*pi, trf_linkLE_link);
plot_axes(trf_linkLE_joint, 'L_8', false, axis_length);
make_child(trf_linkLE_joint, trf_viz_link_LUA);

%% Joint: Links right_upper_arm_link, right_elbow_link: Revolute
trf_linkRE_link = make_transform([-0.005, 0, -0.05], 0, 0, 0, trf_linkRUA_link);
trf_linkRE_joint = make_transform_revolute([0, 0, 1], 2*pi, trf_linkRE_link);
plot_axes(trf_linkRE_joint, 'L_9', false, axis_length);
make_child(trf_linkRE_joint, trf_viz_link_RUA);

%% Joint: Links left_elbow_link, left_lower_arm_link: Fixed
trf_linkLLA_link = make_transform([0, 0, -0.08], 0, 0, 0, trf_linkLE_link);
make_child(trf_linkLLA_link, trf_viz_link_LE);

%% Joint: Links right_elbow_link, right_lower_arm_link: Fixed
trf_linkRLA_link = make_transform([0, 0, -0.08], 0, 0, 0, trf_linkRE_link);
make_child(trf_linkRLA_link, trf_viz_link_RE);

%% Joint: Links left_lower_arm_link, left_wrist_link: Revolute
trf_linkLW_link = make_transform([0, 0, -0.05], 0, 0, 0, trf_linkRLA_link);
trf_linkLW_joint = make_transform_revolute([1, 0, 0], pi/2, trf_linkLW_link);
plot_axes(trf_linkLW_joint, 'L_10', false, axis_length);
make_child(trf_linkLW_joint, trf_viz_link_LLA);

%% Joint: Links right_lower_arm_link, right_wrist_link: Revolute
trf_linkRW_link = make_transform([0, 0, -0.05], 0, 0, 0, trf_linkRLA_link);
trf_linkRW_joint = make_transform_revolute([1, 0, 0], pi/2, trf_linkRW_link);
plot_axes(trf_linkRW_joint, 'L_11', false, axis_length);
make_child(trf_linkRW_joint, trf_viz_link_RLA);

%% Joint: Links left_wrist_link, left_hand_link: Fixed
trf_linkLH_link = make_transform([0, 0, -0.055], 0, 0, 0, trf_linkLW_link);
make_child(trf_linkLH_link, trf_viz_link_LW);

%% Joint: Links right_wrist_link, right_hand_link: Fixed
trf_linkRH_link = make_transform([0, 0, -0.055], 0, 0, 0, trf_linkRW_link);
make_child(trf_linkRH_link, trf_viz_link_RW);
%% Joint 4: Links 3,4: Prismatic
%j4_translation_axis_j4= [0,0,1]';
%j4_translation= 0; % [-0.04, 0.04]

%trf_joint4_link3= make_transform([0, -0.07, 0], pi/2, 0, 0, trf_link3_joint3); 
%trf_link4_joint4= make_transform_prismatic(j4_translation_axis_j4, j4_translation, trf_joint4_link3);
%plot_axes(trf_link4_joint4, 'L_13', false, axis_length); 
%make_child(trf_link4_joint4, trf_viz_link4);

%% Joint: Links 4,EE: Fixed
%trf_linkEE_link4= make_transform([0, 0, 0], 0, 0, 0, trf_link4_joint4); 
%make_child(trf_linkEE_link4, trf_viz_linkEE);

%% Animation: One joint at a time
for q1=[linspace(0, -pi/2, 30), linspace(-pi/2, pi/2, 30), linspace(pi/2, 0, 30)]
    set(handle_axes, 'XLim', [-0.4,0.4], 'YLim', [-0.2,0.4], 'ZLim', [0,0.4]);
    trf_q1= makehgtform('axisrotate', [0, 0, 1], q1);
    set(trf_link2_joint2, 'Matrix', trf_q1);
    drawnow;
    pause(0.02);
end

for q2=[linspace(0, -pi/2, 30), linspace(-pi/2, pi/2, 30), linspace(pi/2, 0, 30)]
    set(handle_axes, 'XLim', [-0.4,0.4], 'YLim', [-0.2,0.4], 'ZLim', [0,0.4]);
    trf_q2= makehgtform('axisrotate', [0, 0, 1], q2);
    set(trf_link3_joint3, 'Matrix', trf_q2);
    drawnow;
    pause(0.02);
end

for q3=[linspace(0, -pi/2, 30), linspace(-pi/2, pi/2, 30), linspace(pi/2, 0, 30)]
    set(handle_axes, 'XLim', [-0.4,0.4], 'YLim', [-0.2,0.4], 'ZLim', [0,0.4]);
    trf_q3= makehgtform('axisrotate', [0, 1, 0], q3);
    set(trf_link_HT_joint, 'Matrix', trf_q3);
    drawnow;
    pause(0.02);
end

for q4=[linspace(0, -pi/2, 30), linspace(-pi/2, pi/2, 30), linspace(pi/2, 0, 30)]
    set(handle_axes, 'XLim', [-0.4,0.4], 'YLim', [-0.2,0.4], 'ZLim', [0,0.4]);
    trf_q4= makehgtform('axisrotate', [0, 1, 0], q4);
    set(trf_linkLSF_joint, 'Matrix', trf_q4);
    drawnow;
    pause(0.02);
end

for a4=[linspace(0, -0.04, 30), linspace(-0.04, 0.04, 30), linspace(0.04, 0, 30)]
    set(handle_axes, 'XLim', [-0.4,0.4], 'YLim', [-0.2,0.4], 'ZLim', [0,0.4]);
    trf_a4= makehgtform('translate', j4_translation_axis_j4*a4);
    set(trf_link4_joint4, 'Matrix', trf_a4);
    drawnow;
    pause(0.02);
end

%% Animation: All joints together.
q_init= 0.5*ones(4,1); % This leads to all joints being at 0.

for i= 1:20
    q_next= rand(4,1); 
    % rand() gives uniformly distributed random numbers in the interval [0,1]
    
    for t=0:0.02:1
        q= q_init + t*(q_next - q_init);
        q1= (pi/2)*(2*q(1) - 1);
        q2= (pi/2)*(2*q(2) - 1);
        q3= (pi/2)*(2*q(3) - 1);
        a4= (0.04)*(2*q(4) - 1);
        
        set(handle_axes, 'XLim', [-0.4,0.4], 'YLim', [-0.2,0.4], 'ZLim', [0,0.4]);
        trf_q1= makehgtform('axisrotate', j1_rot_axis_j1, q1);
        set(trf_link1_joint1, 'Matrix', trf_q1);
        
        set(handle_axes, 'XLim', [-0.4,0.4], 'YLim', [-0.2,0.4], 'ZLim', [0,0.4]);
        trf_q2= makehgtform('axisrotate', j2_rot_axis_j2, q2);
        set(trf_link2_joint2, 'Matrix', trf_q2);
        
        set(handle_axes, 'XLim', [-0.4,0.4], 'YLim', [-0.2,0.4], 'ZLim', [0,0.4]);
        trf_q3= makehgtform('axisrotate', j3_rot_axis_j3, q3);
        set(trf_link3_joint3, 'Matrix', trf_q3);
        
        set(handle_axes, 'XLim', [-0.4,0.4], 'YLim', [-0.2,0.4], 'ZLim', [0,0.4]);
        trf_a4= makehgtform('translate', j4_translation_axis_j4*a4);
        set(trf_link4_joint4, 'Matrix', trf_a4);
        drawnow;
        pause(0.005);
        
    end
    
    q_init= q_next;
    
end


