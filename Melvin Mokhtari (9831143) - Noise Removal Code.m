%% Melvin Mokhtari (9831143)
%% Noise removal algorithm from an audio file in MATLAB

clearvars;
close all;

%% Read the file
[f, Fs] = audioread('test_audio.wav');
T = 1 / Fs;
L = length(f);
t = (0:L-1) * T;

%% Plot audio channels
N = size(f, 1);
figure;  stem(t, f);
title('Original: Time-domain');  xlabel('time(seconds)');

%% Plot the spectrum
df = Fs / N;
w = (-(N/2):(N/2)-1)*df;
y = fft(f) / N;
y2 = fftshift(y);
figure;  plot(w, abs(y2));
title('Original: Amplitude Spectrum');  xlabel('Frequency(Hz)');

%% plot the single-sided amplitude spectrum
figure;
plot(Fs*(0:(L/2))/L, abs(y2(N/2:end)))
title('Original: Single-Sided Amplitude Spectrum')
xlabel('f (Hz)')

%% filtering f1: 1043Hz
n = 2;
beginFreq = 1040 / (Fs/2);
endFreq = 1050 / (Fs/2);
[b,a] = butter(n, [beginFreq, endFreq], 'stop');
fOut = filter(b, a, f);
% extract f1
[b,a] = butter(n, [beginFreq, endFreq], 'bandpass');
f1 = filter(b, a, f);
figure;  plot(w,abs(fftshift(fft(f1)/N)));  title('f1: 1043Hz');

%% filtering f2: 1956Hz
n = 2;
beginFreq = 1950 / (Fs/2);
endFreq = 1960 / (Fs/2);
[b,a] = butter(n, [beginFreq, endFreq], 'stop');
fOut = filter(b, a, fOut);
% extract f2
[b,a] = butter(n, [beginFreq, endFreq], 'bandpass');
f2 = filter(b, a, f);
figure;  plot(w,abs(fftshift(fft(f2)/N)));  title('f2: 1956Hz');

%% For normalizing
Ym = max(max(max(fOut)),max(abs(min(fOut))));
fOut = fOut ./ Ym;

%% After processing
figure;  stem(t, fOut);
title('After processing: Time-domain');  xlabel('time(seconds)');
figure;  plot(w,abs(fftshift(fft(fOut)/N)));
title('After processing: Amplitude Spectrum');  xlabel('Frequency(Hz)');

%% Create object for playing audio
pOrig = audioplayer(f,Fs);
% pOrig.play;
p = audioplayer(fOut, Fs);
% p.play;
pf1 = audioplayer(f1, Fs);
% pf1.play;
pf2 = audioplayer(f2, Fs);
% pf2.play;

%% Write out to audio file
audiowrite('test_audio_processed.wav', fOut, Fs);