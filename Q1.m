[x, fs] = audioread('/home/rehas/signal_6.wav');

% sound(x, fs);
figure, plot(x);

%  wlen = 10;
%  indx = 0;
%  xlen = size(x,1);
%  y = zeros(xlen,1);
%  while indx + wlen <= xlen
%      y(indx+1) = mean(x(indx+1:indx+wlen));
%      indx = indx+1;
%  end

%%%% Tried to also use mean filter as above, but didn't seem to improve the
%%%% final quality of the signal

% sound(y, fs); plot(y);

%%%% sticking with median+low pass filter as final design

x = x(:, 1); % Extract first channel
x = x';      % take transpose

x = medfilt1(x, 10); % median filter with window 10

Yfft = fft(x);
Yfft = fftshift(Yfft);

% plot(Y)

range = 38000; 
% range of frequencies we want to preserve obtained by hit and trial

rect = zeros(1, size(x, 2));
rect(size(Yfft,2)/2-range/2:size(Yfft,2)/2+range/2) = 1; 
% preserve low frequencies (rect function)

Yfilter = Yfft.*rect; 
% Multiplying with rect in transformed domain

output = ifft(ifftshift(Yfilter));   
% Low-pass filtered signal ()

sound(real(output'), fs);
figure, plot(real(output'));