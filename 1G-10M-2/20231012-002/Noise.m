deviceCount = 150; % 设备数量
imagesPerDevice = 40; % 每个设备生成的图像数量

counter = 1; % 初始化计数器

for deviceIdx = 1:deviceCount
    for imgIdx = 1:imagesPerDevice
        filename = strcat('huawei_gr5_record  (', num2str(deviceIdx),')', '.txt'); % 读取对应设备的文件
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

        % 计算噪声标准差
        signalPower = mean(data.^2); % 计算信号功率
        noisePower = signalPower / (10^(90/10)); % 根据信噪比计算噪声功率
        noiseStdDev = sqrt(noisePower); % 噪声的标准差

        % 生成均匀噪声并添加到信号中
        noise = noiseStdDev * (rand(N, 1) - 0.5); % 生成均匀噪声
        noisyData = data + noise; % 添加噪声

        % 进行希尔伯特变换
        HT = hilbert(noisyData); % 使用噪声信号
        Q = imag(HT); % 矩形数据
        I = real(HT); % 同相数据

        % 绘图
        scrsz = get(0, 'ScreenSize'); % 获取屏幕尺寸
        figure1 = figure('Position', [0 30 scrsz(3) scrsz(4) - 95]);
        scatter(I, Q, 3, 'filled'); % 绘制散点图
        jpgname = strcat(num2str(counter), '.jpg'); % 图像命名
        print(gcf, '-djpeg', jpgname); % 保存图像
        close(figure1);
        counter = counter + 1; % 更新计数器
    end
end
