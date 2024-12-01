% 定义输入
N = 200865083; % 共9位
N_str = num2str(N); % 转换为字符串

% 提取所需的值
a = str2double(N_str(end-1:end)); % 后两位
b = str2double(N_str(4:5));       % 第4-5位
c = str2double(N_str(6:7));       % 第6-7位
d = str2double(N_str([4 8]));     % 第4,8位组合
e = str2double(N_str([1 8]));     % 第1,8位组合
f = str2double(N_str([5 9]));     % 第5,9位组合
g = str2double(N_str([4 9]));     % 第4,9位组合
h = str2double(N_str([5 7]));     % 第5,7位组合

% 构造矩阵 A
A = [a, b, c, d, 3, 4;
    1, 2, 3, 4, 4, 3; 
    12, 15, 22, 17, 5, 7;
    e, f, g, h, 8, 0];
disp('矩阵 A:');
disp(A);

% 定义列向量
a1 = A(:, 1);
a2 = A(:, 2);
a3 = A(:, 3);
a4 = A(:, 4);
a5 = A(:, 5);
a6 = A(:, 6);

% 矩阵A的秩，寻找极大无关组
rank_A = rank(A); % 秩
disp(['矩阵 A 的秩: ', num2str(rank_A)]);

% 极大无关组
[R, j] = rref(A);
disp('极大无关组:');
A1 = A(:, j);

% 获取依赖向量的列索引
dependent_columns = setdiff(1:size(A, 2), j); % 依赖列索引

disp('依赖列及其线性表示:');
for i = dependent_columns
    % 当前依赖向量
    dependent_vector = A(:, i);

    % 求解线性表示的系数
    coefficients = A1 \ dependent_vector;

    % 显示线性组合表示
    disp(['a', num2str(i), ' = ']);
    for k = 1:length(j)
        disp(['(', num2str(coefficients(k)), ') * a', num2str(j(k)), ' + ']);
    end
    disp('0'); % 结束
end
