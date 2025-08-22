filename = strcat('20231012-0001_01.txt'); % 读取对应设备的文件
disp(filename)
fileID = fopen(filename, 'r'); % 读取.txt文件
data = fscanf(fileID, '%f'); % 生成时间序列向量，浮点型
fclose(fileID); % 关闭文件

fs = 2500e6; % 采样频率
data = data - mean(data); % 去直流分量
N = length(data); % 信号样本数量
Duration = N / fs; % 信号持续时间 
time = linspace(0, Duration, N); % 时间序列
TIME = time';
Signal = horzcat(data, TIME); % 2列N行向量：幅值+时间

% 计算信号功率
signalPower = mean(data.^2); 

% 生成高斯噪声并计算噪声功率
noiseStd = 0.00000005; % 噪声标准差
noisePower = noiseStd^2; % 噪声功率

% 计算信噪比（SNR）
SNR = 10 * log10(signalPower / noisePower);

disp(['信号功率: ', num2str(signalPower)]);
disp(['噪声功率: ', num2str(noisePower)]);
disp(['信噪比 (dB): ', num2str(SNR)]);
