for i=1:5
filename=strcat('20231012-0001_',num2str(i),'.txt');%批量读取生成
disp(filename)
 X=randn(1)*0.00000005;%高斯噪声生成
 %disp (X) ;
Signal = load(filename); 
a =Signal(:,1);
b=Signal(:,2)+X;%高斯噪声加入
%figure
%plot(a,b);
% 
HT = hilbert(Signal(:,2)); 
Q = imag(HT); % Quadrature Data
I = real(HT); % In-phase Data
plot(Q,I);
sz=5;
scatter(I,Q,sz,'filled')


scrsz = get(0,"ScreenSize");    %获取屏幕尺寸（1920*1080）
%disp(scrsz)
figure1=figure('Position',[0 30 scrsz(3) scrsz(4)-95]);
%figure1=figure('Position',[0 30 2160 3840-95]);
%figure(2)
plot(Q,I);
sz=5;         %点集直径
scatter(I, Q, sz, 'filled') 
print(gcf, '-djpeg', jpgname)
%清晰度不足 saveas(gcf, 'test.jpg');
%imwrite(figure,map,filename) 
end
