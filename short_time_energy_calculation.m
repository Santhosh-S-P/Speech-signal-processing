[y,fs]=audioread("audio_samples\digits_train\six_endpt_1.wav");
sound(y,fs);

%time domain plotting
N=size(y,1);
t=linspace(0,N/fs,N);


figure;
plot(t,y);
xlabel("Time");
ylabel("Amplitude");
title("Time-domain graph");


%12.5 ms frame length
w(:,1:125)=1;
w(126:N-1)=0;

result=conv(y,w);

figure;
plot(t,result(1:N));
xlabel("Time (sec)");
ylabel("Short-time energy");
title("Short-time energy versus time (12.5 ms frame length)");

%25 ms frame length
w1(:,1:250)=1;
w1(251:N-1)=0;

result=conv(y,w1);

figure;
plot(t,result(1:N));
xlabel("Time (sec)");
ylabel("Short-time energy");
title("Short-time energy versus time (25 ms frame length)");


ste = sum(buffer(y.^2, 125));

figure;
plot(linspace(0,length(ste)-1,length(ste)),ste);
