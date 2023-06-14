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

%25 ms frame length and 25 ms frame shift (to make sure that frames
% don't overlap)
frame_length=250;
frame_shift=250;

% 25 ms frame length


%need to be generalized for all frames (it's done for a specific frame now)
prod=zeros(1,frame_length);

for k=0:1:frame_length-1
    for i=1:1:frame_length
        prod(k+1)= prod(k+1) + y(i+frame_shift)*y(i+frame_shift+k);
    end
end

figure;
plot(linspace(frame_shift,frame_shift+frame_length-1,frame_length),prod);
xlabel("Number of frames");
ylabel("Autocorrelation");
title("Autocorrelation vs Delay (number of frames)");

