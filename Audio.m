[y,fs]=audioread("audio_samples\ah.wav");
sound(y,fs);

%time domain plotting
N=size(y,1);
t=linspace(0,N/fs,N);


figure;
plot(t,y);
xlabel("Time");
ylabel("Amplitude");
title("Time-domain graph");

%frequency domain plotting

nfft = 1024; %number of points in fft
f=linspace(0,fs,nfft);
Y=abs(fft(y,nfft));

figure;
plot(f(1:nfft/2), Y(1:nfft/2));
xlabel("Frequency");
ylabel("abs(fft)");
title("Frequency spectrum");