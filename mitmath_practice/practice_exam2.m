diary practice_exam2.txt
% 定义矩阵 A
A = [1 1 2 3 5; 1 2 3 5 8; 0 1 1 2 3];

% (a) 求行最简形
R = rref(A);

% (b) 列空间和行空间的基
colSpaceBasis = A(:,1:2); % 列空间基为 A 的前两列
rowSpaceBasis = R(~any(R == 0, 2), :); % 行空间基为 R 的非零行

% (c) 零空间的基
n = null(A);

% (d) 求解 Ax = b，b = [2; 3; 1]
b = [2; 3; 1];
particularSolution = A(:,1:2)\b;
% 假设 particularSolution 是列向量，将其他部分也转换为列向量
generalSolution = particularSolution + (n(1,:)'*sym('c1'))'; + (n(2,:)'*sym('c2'))'; + (n(3,:)'*sym('c3'))';

disp('一般解：');
disp(generalSolution);

%问题二
% 2(a)
t = [-1; 0; 1; 2];
b = [0; -1; 0; 3];
A = [ones(4,1), t, t.^2];

% 2(b)
M = A'*A;
c = A'*b;

% 2(c)
x = M\c;
C = x(1);
D = x(2);
E = x(3);

% 输出抛物线方程
fprintf('抛物线方程为：b = %f + %ft + %ft^2\n', C, D, E);


%问题三

% 定义向量 x 和 y
x = [1; 1; 0];
y = [0; 1; 1];

% 计算投影矩阵 N 和 M
N = x*y'/(y'*x);
M = eye(3) - x*y'/(y'*x);

% 3(a) 求 N 的四个基本子空间的维度和非零向量
% 列空间
col_N = null(N')';
col_dim_N = size(col_N, 2);
fprintf('N 的列空间维度为 %d，一个非零向量为：\n', col_dim_N);
disp(col_N(:, 1));

% 零空间
null_N = null(N);
null_dim_N = size(null_N, 2);
fprintf('N 的零空间维度为 %d，一个非零向量为：\n', null_dim_N);
disp(null_N(:, 1));

% 行空间
row_N = null(N')';
row_dim_N = size(row_N, 2);
fprintf('N 的行空间维度为 %d，一个非零向量为：\n', row_dim_N);
disp(row_N(1, :));

% 左零空间
left_null_N = null(N');
left_null_dim_N = size(left_null_N, 2);
fprintf('N 的左零空间维度为 %d，一个非零向量为：\n', left_null_dim_N);
disp(left_null_N(:, 1));

% 3(b) 求 M 的四个基本子空间的维度和非零向量
% 列空间
col_M = null(M')';
col_dim_M = size(col_M, 2);
fprintf('M 的列空间维度为 %d，一个非零向量为：\n', col_dim_M);
disp(col_M(:, 1));

% 零空间
null_M = null(M);
null_dim_M = size(null_M, 2);
fprintf('M 的零空间维度为 %d，一个非零向量为：\n', null_dim_M);
disp(null_M(:, 1));

% 行空间
row_M = null(M')';
row_dim_M = size(row_M, 2);
fprintf('M 的行空间维度为 %d，一个非零向量为：\n', row_dim_M);
disp(row_M(1, :));

% 左零空间
left_null_M = null(M');
left_null_dim_M = size(left_null_M, 2);
fprintf('M 的左零空间维度为 %d，一个非零向量为：\n', left_null_dim_M);
disp(left_null_M(:, 1));

% 3(c) 解释为什么 NM 和 MN 是零矩阵
NM = N*M;
MN = M*N;
fprintf('NM 是零矩阵的原因：N 的列空间中的向量与 M 的左零空间中的向量正交，M 的列空间中的向量与 N 的左零空间中的向量正交。\n');
fprintf('MN 是零矩阵的原因：同理，N 的列空间中的向量与 M 的左零空间中的向量正交，M 的列空间中的向量与 N 的左零空间中的向量正交。\n');