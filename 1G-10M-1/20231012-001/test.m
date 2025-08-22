
deviceCount = 64; % 设备数量
imagesPerDevice = 40; % 每个设备生成的图像数量

counter = 1; % 初始化计数器

for deviceIdx = 1:deviceCount
    for imgIdx = 1:imagesPerDevice
        filename = strcat('20231012-0001_', num2str(deviceIdx), '.txt'); % 批量读取生成
        disp(filename);
        Signal = load(filename); 
        a = Signal(:, 1);
        b = Signal(:, 2);
    
    % 计算信号功率
        signal_power = var(b);
    % 根据信噪比公式计算噪声功率
        noise_power = signal_power / (10^(25 / 10));
    % 生成高斯噪声
        X = randn(size(b)) * sqrt(noise_power);
        b = b + X; % 高斯噪声加入

        HT = hilbert(b); 
        Q = imag(HT); % Quadrature Data
        I = real(HT); % In-phase Data
    
        sz = 5;
        scatter(I, Q, sz, 'filled')
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


