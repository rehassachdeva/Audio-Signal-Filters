load('train');

% sound(y, Fs);

% for a=0.001
Y = fft(y);
a = 0.001;
T = a*max(abs(Y));
Z = Y;
Y(Y<T) = 0;
recy = ifft(Y);

% sound(recy, Fs);   
%%%%%%% Uncomment the above line to listen to sound after thresholding

num_uniq = size(unique(Z),1);
num_non_zero = size(Y(Y~=0),1);
compression_ratio = num_non_zero/num_uniq
diff = y-recy;
norm_diff = norm(diff);
norm_y = norm(y);
distortion = 100*(norm_diff*norm_diff)/(norm_y*norm_y)

% for a=0.01
Y = fft(y);
a = 0.01;
T = a*max(abs(Y));
Z = Y;
Y(Y<T) = 0;
recy = ifft(Y);

% sound(recy, Fs);
%%%%%%% Uncomment the above line to listen to sound after thresholding

num_uniq = size(unique(Z),1);
num_non_zero = size(Y(Y~=0),1);
compression_ratio = num_non_zero/num_uniq
diff = y-recy;
norm_diff = norm(diff);
norm_y = norm(y);
distortion = 100*(norm_diff*norm_diff)/(norm_y*norm_y)

% for a=0.1
Y = fft(y);
a = 0.1;
T = a*max(abs(Y));
Z = Y;
Y(Y<T) = 0;
recy = ifft(Y);

% sound(recy, Fs);
%%%%%%% Uncomment the above line to listen to sound after thresholding

num_uniq = size(unique(Z),1);
num_non_zero = size(Y(Y~=0),1);
compression_ratio = num_non_zero/num_uniq
diff = y-recy;
norm_diff = norm(diff);
norm_y = norm(y);
distortion = 100*(norm_diff*norm_diff)/(norm_y*norm_y)

% for a=0.5
Y = fft(y);
a = 0.5;
T = a*max(abs(Y));
Z = Y;
Y(Y<T) = 0;
recy = ifft(Y);

% sound(recy, Fs);
%%%%%%% Uncomment the above line to listen to sound after thresholding

num_uniq = size(unique(Z),1);
num_non_zero = size(Y(Y~=0),1);
compression_ratio = num_non_zero/num_uniq
diff = y-recy;
norm_diff = norm(diff);
norm_y = norm(y);
distortion = 100*(norm_diff*norm_diff)/(norm_y*norm_y)

% Conclusions: Fine tuning effect is evident with increase in the value of
% a. amount of distortion increases with increase in value of a, which is
% also evident from the quality (in terms of deviation from original
% signal) of reconstructed signal (when listened to) which decreases with
% increase in value of a. Compression ratio also becomes more and more
% closer to zero as value of a increases. Basically thresholding is done to
% fine tune a signal. If low frequencies mostly correspond to noise then by
% thresholding we can remove noise from the signal. In this case,
% compression is happening at the cost of distortion. The first three cases
% are valid for thresholding but last case(a=0.5) produces only a blip as
% almost all values are zeroed out.
