function stft(x, wlen, stride, nfft, fs)

hop = wlen - stride; % hop size is window length minus stride (overlap)

xlen = size(x, 1);

win = hamming(wlen, 'periodic');

% initialise stft matrix with zeroes and give proper dimensions
num_rows = ceil((nfft + 1) / 2);
num_cols = 1 + fix((xlen - wlen) / hop);

S = zeros(num_rows, num_cols);

indx = 0;
col = 1;

while indx + wlen <= xlen
    tmp = x(indx+1:indx + wlen);
    tmp = tmp.*win;
    X = fft(tmp, nfft);
    S(:, col) = X(1:num_rows);  
    col = col + 1;
    indx = indx + hop;
end

t = (wlen / 2:hop:wlen/2 + hop*(num_cols - 1));
t = t / fs;
f = (0:num_rows - 1);
f = f * fs / nfft;

% plot spectrogram
figure, surf(t, f, 20*log10(abs(S)), 'EdgeColor', 'none')
axis xy; 
axis tight; 
colormap(jet); 
view(0, 90);
xlabel('Time in seconds');
ylabel('Frequency in Hz');
end
