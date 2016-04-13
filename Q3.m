load('train');

wlen = 1000;
stride = 750;               % 75 percent overlap for instance
nfft = 1024;

stft(y, wlen, stride, nfft, Fs);
figure, spectrogram(y, wlen, stride, nfft, Fs, 'yaxis'); 

load('laughter');

wlen = 1000;
stride = 750;
nfft = 1024;

stft(y, wlen, stride, nfft, Fs);
figure, spectrogram(y, wlen, stride, nfft, Fs, 'yaxis'); 

% Figure 1 shows own implementation of spectrogram for train
% Figure 2 shows in built implementation of spectrofram for train 
% Figure 3 shows own implementation of spectrogram for laughter
% Figure 4 shows in built implementation of spectrogram for laughter