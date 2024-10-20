cd C:\Users\haoda\Desktop\learning\研\数学老头
diary practice_exam1.txt
% 定义矩阵 A、L、P、U
A = [1 0 0 0; 0 2 0 0; 2 0 3 0; 0 3 0 1];
L = [1 0 0 0; 0 0 1 0; 0 1 0 0; 0 0 0 1];
P = [1 0 2 0; 0 2 0 3; 0 0 3 0; 0 0 0 1];
U = P*A/L; % 根据 A = LPU 计算 U

% (a) 判断矩阵 L、P、U 是否可逆
isInvertibleL = det(L) ~= 0;
isInvertibleP = det(P) ~= 0;
isInvertibleU = det(U) ~= 0;
disp(['L 可逆：', num2str(isInvertibleL)]);
disp(['P 可逆：', num2str(isInvertibleP)]);
disp(['U 可逆：', num2str(isInvertibleU)]);

% (b) 计算 A 的逆矩阵 A^-1 = U^-1 * P^-1 * L^-1
invL = inv(L);
invP = inv(P);
invU = inv(U);
invA = invU * invP * invL;

% (c) 确定右侧向量 b
b = [1; 0; 0; 0];

% (d) 求解 x，即 A^-1 的第一列
x = invA(:,1);
disp('x：');
disp(x);