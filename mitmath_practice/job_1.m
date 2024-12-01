% 随机生成 5 阶方阵 A, B, C 和 5 维列向量 b
A = randi(10, 5, 5);
B = randi(10, 5, 5);
C = randi(10, 5, 5);
b = randi(10, 5, 1);

% 1. A + B 和 A - B
disp('矩阵 A + B:');
disp(A + B);

disp('矩阵 A - B:');
disp(A - B);

% 2. A * B + B * A
disp('矩阵 A * B + B * A:');
disp(A * B + B * A);

% 3. Ax = b 的解，并验证克莱姆法则
disp('求解线性方程组 Ax = b:');
x = A \ b; % 解方程 Ax = b
disp('解 x:');
disp(x);

% 验证克莱姆法则
detA = det(A);
detA_nonzero = detA ~= 0; % 检查 det(A) 是否为零
x_cramer = zeros(size(b));
for i = 1:5
    Ai = A;
    Ai(:, i) = b; % 替换第 i 列为向量 b
    x_cramer(i) = det(Ai) / (detA + ~detA_nonzero); % 若 det(A) = 0，结果不非法
end
disp('克莱姆法则求解的结果:');
disp(x_cramer); % 结果乘以 detA 是否非零的逻辑值

% 4. A, B 的行列式，逆，秩
disp('矩阵 A 的性质:');
disp(['A 的行列式: ', num2str(detA)]);

A_inv = inv(A .* detA_nonzero + eye(size(A)) .* ~detA_nonzero); % 若 det(A) = 0，则显示单位矩阵
disp('A 的逆矩阵:');
disp(A_inv);

disp(['A 的秩: ', num2str(rank(A))]);

disp('矩阵 B 的性质:');
detB = det(B);
disp(['B 的行列式: ', num2str(detB)]);

B_inv = inv(B .* (detB ~= 0) + eye(size(B)) .* (detB == 0)); % 同样处理 det(B)
disp('B 的逆矩阵:');
disp(B_inv);

disp(['B 的秩: ', num2str(rank(B))]);

% 5. A * B 的行列式，逆，秩，并验证 det(A * B) = det(A) * det(B)
AB = A * B;
disp('矩阵 A * B 的性质:');
detAB = det(AB);
disp(['A * B 的行列式: ', num2str(detAB)]);

AB_inv = inv(AB .* (detAB ~= 0) + eye(size(AB)) .* (detAB == 0)); % 处理 det(AB)
disp('A * B 的逆矩阵:');
disp(AB_inv);

disp(['A * B 的秩: ', num2str(rank(AB))]);

% 验证 det(A * B) = det(A) * det(B)
disp('验证 det(A * B) = det(A) * det(B):');
disp(['det(A) * det(B): ', num2str(detA * detB)]);
disp(['det(A * B): ', num2str(detAB)]);
verification = abs(detA * detB - detAB) < 1e-7; % 验证近似相等
disp('验证结果 (1=正确, 0=错误):');
disp(verification);

% 6. 验证 (AB)^T = B^T * A^T
disp('验证 (AB)^T = B^T * A^T:');
AB_T = (A * B)';
BT_AT = B' * A';
verification_T = norm(AB_T - BT_AT) < 1e-10; % 验证近似相等
disp(['验证结果 (1=正确, 0=错误): ', num2str(verification_T)]);

disp('验证 (BA)^{-1} = A^{-1}B^{-1}:');
% 计算 (BA)^{-1}
BA_inv = inv(B * A);
% 计算 A^{-1}B^{-1}
A_inv = inv(A);
B_inv = inv(B);
A_invB_inv = A_inv * B_inv;
% 验证 (BA)^{-1} 是否等于 A^{-1}B^{-1}
verification_BA_inv = norm(BA_inv - A_invB_inv) < 1e-10; % 检查两者是否近似相等
disp(['验证结果 (1=正确, 0=错误): ', num2str(verification_BA_inv)]);

disp('验证 AB 不等于 BA:');
AB = A * B;             % AB
BA = B * A;             % BA
verification_commute = norm(AB - BA) < 1e-10; % 近似相等
disp(['验证结果 (1=正确, 0=错误): ', num2str(verification_commute)]);

% 7. 求矩阵 X 使得 AXB = C
C = randi([-10, 10], 5, 5); % 矩阵 C 和 A, B 的维度一致

% 求解 X
A_inv = inv(A); % A 的逆
B_inv = inv(B); % B 的逆
X = A_inv * C * B_inv;

disp('矩阵 X:');
disp(X);

% 验证 AXB = C
AXB = A * X * B;
verification_AXB = norm(AXB - C) < 1e-10; % 检查是否满足 AXB = C
disp('验证 AXB = C (1=正确, 0=错误):');
disp(verification_AXB);
