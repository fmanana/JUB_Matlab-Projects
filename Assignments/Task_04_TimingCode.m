N = 3
A = rand(N,N)
b = rand(N,1)
tic
x = inv(A)*b
toc
tic
x = A\b
toc

% the (A\b) version runs faster. The execution time increases with an increase in N.