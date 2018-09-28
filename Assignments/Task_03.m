f1_E = [1; 0; 1]
f1_T = f1_E'*f1_E

f2_E = [1; 2; 1]
f2_T = f2_E'*f2_E

f3_E = [-2; sqrt(2); 0]
f3_T = f3_E'*f3_E

v_E = [4; 3; -9]

Mat = [f1_T, f2_T, f3_T; f1_T, f2_T, f3_T; f1_T, f2_T, f3_T]
% Creating a matrix 3x3 of the transposes of f1, f2 & f3

A = [v_E*f1_E; v_E*f2_E; v_E*f3_E]

v_F = (Mat') * A