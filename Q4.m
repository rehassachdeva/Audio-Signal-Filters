[y1, fs] = audioread('/home/rehas/1.wav');
[y2, fs] = audioread('/home/rehas/2.wav');
[y3, fs] = audioread('/home/rehas/3.wav');
[y4, fs] = audioread('/home/rehas/4.wav');
[y5, fs] = audioread('/home/rehas/5.wav');

y1=y1(:,1);
y2=y2(:,1);
y3=y3(:,1);
y4=y4(:,1);
y5=y5(:,1);

len1=size(y1,1);
len2=size(y2,1);
len3=size(y3,1);
len4=size(y4,1);
len5=size(y5,1);

y1=medfilt1(y1,10);
y2=medfilt1(y2,10);
y3=medfilt1(y3,10);
y4=medfilt1(y4,10);
y5=medfilt1(y5,10);

n=7;
beginFreq = 400/(fs/2);
endFreq = 2800/(fs/2);
[b,a]=butter(n,[beginFreq, endFreq], 'bandpass');
y11 = filter(b, a, y1);
y22 = filter(b, a, y2);
y33 = filter(b, a, y3);
y44 = filter(b, a, y4);
y55 = filter(b, a, y5);

res = y33;
% cor = xcorr(res(end-fs*3:end), y55);
% figure, plot(cor);
% cor = xcorr(res(end-fs*3:end), y11);
% figure, plot(cor);
% cor = xcorr(res(end-fs*3:end), y22);
% figure, plot(cor);
% cor = xcorr(res(end-fs*3:end), y44);
% figure, plot(cor);

%%%% Maximum correlation was obtained with y55 so 5 follows 3.

res = res(1:end-fs*4.5);
res = vertcat(res,y55);

% cor = xcorr(res(end-fs*3:end), y11);
% figure, plot(cor);
% cor = xcorr(res(end-fs*3:end), y22);
% figure, plot(cor);
% cor = xcorr(res(end-fs*3:end), y44);
% figure, plot(cor);

%%%% Maximum correlation was obtained with y11 so 1 follows 5.

res = res(1:end-fs*4);
res = vertcat(res,y11);

% cor = xcorr(res(end-fs*3:end), y22);
% figure, plot(cor);
% cor = xcorr(res(end-fs*3:end), y44);
% figure, plot(cor);

%%%% Maximum correlation was obtained with y22 so 2 follows 1.

res = res(1:end-fs*4);
res = vertcat(res,y22);

%%%% and 4 follows 2.

res = res(1:end-fs*4);
res = vertcat(res,y44);

sound(res, fs);
audiowrite('/home/rehas/Q4_combined_output.wav', res, fs);
% plot(res);