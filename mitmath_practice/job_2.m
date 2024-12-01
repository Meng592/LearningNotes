% 随机生成一般的矩阵 A, B, C, D
n = 4; % 设置矩阵维度
A = randn(n); % 随机方阵 A
B = randn(n); % 随机方阵 B
C = randn(n); % 随机方阵 C
D = randn(n); % 随机方阵 D

% 验证命题 1
big_matrix = [A, B; C, D]; % 构造分块矩阵
det_big = det(big_matrix); % 分块矩阵的行列式
det_product = det(A) * det(D) - det(B) * det(C);

disp('命题 1 验证:');
disp(['det([A B; C D]): ', num2str(det_big)]);
disp(['det(A)*det(D) - det(B)*det(C): ', num2str(det_product)]);
disp(['它们是否相等?: ', num2str(abs(det_big - det_product) < 1e-10)]);

% 验证命题 2
A_diag = diag(randn(n, 1)); % 对角矩阵 A
C_diag = diag(randn(n, 1)); % 对角矩阵 C
B = randn(n); % 随机矩阵 B
D = randn(n); % 随机矩阵 D
big_matrix_diag = [A_diag, B; C_diag, D]; % 构造分块矩阵
det_big_diag = det(big_matrix_diag); % 分块矩阵的行列式
AD_minus_CB = A_diag * D - C_diag * B; % 计算 AD - CB
det_AD_minus_CB = det(AD_minus_CB); % 计算其行列式

disp('命题 2 验证:');
disp(['det([A B; C D]): ', num2str(det_big_diag)]);
disp(['det(AD - CB): ', num2str(det_AD_minus_CB)]);
disp(['它们是否相等?: ', num2str(abs(det_big_diag - det_AD_minus_CB) < 1e-10)]);
