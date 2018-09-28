function [ myhandles ] = make_spaceship(trf_root, transparency)
% Makes a space-ship with the root transform as the given transform.
% The surfaces are drawn with the given transparency in [0,1]
% A vector of handles to all the surfaces is returned.

ship_dish_profile= 2*sin(linspace(0, pi, 15));
[Xc, Yc, Zc]= cylinder(ship_dish_profile);

% Top dish
trf_top_root= hgtransform('Parent', trf_root);
set(trf_top_root, 'Matrix', makehgtform('translate', [-0.2, 0, 0]));
color_top= [0.6 0.2 1];
myhandles(1)= surface(Xc, Yc, Zc, 'Parent', trf_top_root, 'FaceColor', color_top, 'FaceAlpha', 1, 'EdgeColor', 0.5*color_top, 'EdgeAlpha', transparency);

% Unit cylinder with a given profile (tapering at the ends).
% This is reused twice to create the two tails of the ship.
[Xt, Yt, Zt]= cylinder([0, 0.5, 0.45, 0.4, 0.35, 0.3, 0.25, 0.2, 0.15, 0.1, 0.05, 0]);

% Left tail
trf_tailleft_root= hgtransform('Parent', trf_root);
trf_scale= makehgtform('scale', [1,1,5]);
trf_Ry= makehgtform('yrotate', -pi/2); 
trf_T= makehgtform('translate', [1, 3.5, 0.5]);
% Interpret the order as BFT (left to right)
set(trf_tailleft_root, 'Matrix', trf_T*trf_Ry*trf_scale);
color_tail_left= [0.05882352941 0.8549019608 0.7725490196];
myhandles(3)= surface(Xt, Yt, Zt, 'Parent', trf_tailleft_root, 'FaceColor', color_tail_left, 'FaceAlpha', 1, 'EdgeColor', 0.5*color_tail_left, 'EdgeAlpha', transparency);

% Right tail
trf_tailright_root= hgtransform('Parent', trf_root);
trf_scale= makehgtform('scale', [1,1,5]);
trf_Ry= makehgtform('yrotate', -pi/2);
trf_T= makehgtform('translate', [1, -3.5, 0.5]);
set(trf_tailright_root, 'Matrix', trf_T*trf_Ry*trf_scale);
color_tail_right= [0.05882352941 0.8549019608 0.7725490196];
myhandles(4)= surface(Xt, Yt, Zt, 'Parent', trf_tailright_root, 'FaceColor', color_tail_right, 'FaceAlpha', 1, 'EdgeColor', 0.5*color_tail_right, 'EdgeAlpha', transparency);


% Bridge
[Xb, Yb, Zb] = cylinder(0.075, 120);

trf_bridge_root = hgtransform('Parent', trf_root);
trf_scale_b= makehgtform('scale', [1,1,7]);
trf_R_by= makehgtform('yrotate', -pi/2);
trf_R_bx = makehgtform('xrotate', pi/2);
trf_R_bz = makehgtform('zrotate', pi);
trf_B= makehgtform('translate', [-0.25, -3.5, 0.5]);
set(trf_bridge_root, 'Matrix', trf_B*trf_R_by*trf_R_bz*trf_R_bx*trf_scale_b);
color_bridge= [1 0 0];
myhandles(5)= surface(Xb, Yb, Zb, 'Parent', trf_bridge_root, 'FaceColor', color_bridge, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_bridge, 'EdgeAlpha', transparency);

% Bridge 2
[Xd, Yd, Zd] = cylinder(0.1, 120);

trf_bridge2_root = hgtransform('Parent', trf_root);
trf_scale_b2= makehgtform('scale', [1,1,4]);
trf_R_b2y= makehgtform('yrotate', -pi/4);
trf_R_b2x = makehgtform('xrotate', pi/2);
trf_R_b2z = makehgtform('zrotate', pi/2);
trf_B2= makehgtform('translate', [-3, 0, -2.5]);
set(trf_bridge2_root, 'Matrix', trf_B2*trf_R_b2y*trf_R_b2z*trf_R_b2x*trf_scale_b2);
color_bridge2= [1 0 0];
myhandles(6)= surface(Xd, Yd, Zd, 'Parent', trf_bridge2_root, 'FaceColor', color_bridge2, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_bridge2, 'EdgeAlpha', transparency);

% Living Quaters
[Xe, Ye, Ze]= cylinder([0, 0.5, 0.45, 0.4, 0.35, 0.3, 0.25, 0.2, 0.15, 0.1, 0.05, 0]);

trf_tailright_root= hgtransform('Parent', trf_root);
trf_scale_l= makehgtform('scale', [1,1,5]);
trf_R_ly= makehgtform('yrotate', -pi/2);
trf_L= makehgtform('translate', [-01, 0, -2.5]);
set(trf_tailright_root, 'Matrix', trf_L*trf_R_ly*trf_scale_l);
color_living= [0.09803921569 0.8823529412 0.2549019608];
myhandles(7)= surface(Xe, Ye, Ze, 'Parent', trf_tailright_root, 'FaceColor', color_living, 'FaceAlpha', 1, 'EdgeColor', 0.5*color_living, 'EdgeAlpha', transparency);

% Cockpit
[Xf, Yf, Zf]= sphere(75, 5);

trf_cockpit= hgtransform('Parent', trf_root);
trf_scale_c= makehgtform('scale', [0.5,1,1]);
trf_Rc= makehgtform('yrotate', -pi/2);
trf_C= makehgtform('translate', [-0.2, 0, 0.75]);
set(trf_cockpit, 'Matrix', trf_C*trf_Rc*trf_scale_c);
color_cockpit= [0 0.368627451 0.92156886275];
myhandles(8)= surface(Xf, Yf, Zf, 'Parent', trf_cockpit, 'FaceColor', color_cockpit, 'FaceAlpha', 1, 'EdgeColor', 0.5*color_cockpit, 'EdgeAlpha', 0);

end

