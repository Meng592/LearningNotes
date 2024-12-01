%% 1. 随机生成 5 阶方阵 A 和 5 维列向量 b，求解 Ax = b
A = randn(5, 5); % 生成随机 5x5 矩阵 A
b = randn(5, 1); % 生成随机 5 维列向量 b

% 求解线性方程组 Ax = b
x = A \ b; % 使用矩阵左除求解 Ax = b
disp('矩阵 A:');
disp(A);
disp('向量 b:');
disp(b);
disp('线性方程 Ax = b 的解 x:');
disp(x);

%% 2. 随机生成 3x2 矩阵 A，求 A*A' 和 A'*A 的秩
A = randn(3, 2); % 生成随机 3x2 矩阵 A

% 计算 A*A' 和 A'*A
AtA = A' * A; % 2x2 矩阵
AAt = A * A'; % 3x3 矩阵

% 计算 A*A' 和 A'*A 的秩
rank_AtA = rank(AtA);
rank_AAt = rank(AAt);

disp('矩阵 A:');
disp(A);
disp('矩阵 A*A'':');
disp(AAt);
disp(['矩阵 A*A'' 的秩: ', num2str(rank_AAt)]);
disp('矩阵 A''*A:');
disp(AtA);
disp(['矩阵 A''*A 的秩: ', num2str(rank_AtA)]);
