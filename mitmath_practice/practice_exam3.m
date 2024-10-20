diary practice_exam3.txt
% 1(a) Gram-Schmidt 过程求列空间的正交基
A = [2 2 0; 1 3 -2; 0 -3 0; -2 -2 -1];
[m, n] = size(A);
v1 = A(:,1);
v2 = A(:,2);
v3 = A(:,3);

u1 = v1/norm(v1);
u2 = v2 - (v2'*u1)*u1;
u2 = u2/norm(u2);
u3 = v3 - (v3'*u1)*u1 - (v3'*u2)*u2;
u3 = u3/norm(u3);

orthonormal_basis = [u1 u2 u3];

% 1(b) 构建正交矩阵 Q
Q = [1/sqrt(2) 1/sqrt(2) 0 0;
     1/sqrt(6) 1/sqrt(6) -2/sqrt(6) 0;
     -1/sqrt(3) -1/sqrt(3) 1/sqrt(3) 0;
     -1/sqrt(3) -1/sqrt(3) -1/sqrt(3) 1/sqrt(3)];

% 新的第三和第四列在 A 的左零空间中。

% 1(c) 计算上三角矩阵 R
R = Q'*A;
disp(R);


%第二题
% 2(a)
A = 1/2*[1 1 0; 1 0 -1; 0 -1 1];
[eigenvectors,eigenvalues] = eig(A);
lambda1 = eigenvalues(1,1);
lambda2 = eigenvalues(2,2);
lambda3 = eigenvalues(3,3);
fprintf('λ1 = %f\n', lambda1);
fprintf('λ2 = %f\n', lambda2);
fprintf('λ3 = %f\n', lambda3);


