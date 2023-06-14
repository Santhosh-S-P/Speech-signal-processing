[y,fs]=audioread("audio_samples\should.wav");
sound(y,fs);

%time domain plotting
N=size(y,1);
t=linspace(0,N/fs,N);


figure;
plot(t,y);
xlabel("Time");
ylabel("Amplitude");
title("Time-domain graph");


%25 ms frame length and 10ms frame shift
frame_length=250;
frame_shift=100;


energy=zeros(1,length(1:frame_shift:N-frame_length));

length_e=length(1:frame_shift:N-frame_length);

for index=1:frame_shift:N-frame_length
    energy(1+(index-1)/(frame_shift))=sum(y(index:index+frame_length).^2);
end

figure;
plot(linspace(0,length_e-1,length_e),energy);
xlabel("Number of samples");
ylabel("STE")
title("STE (frame length 25 ms, shift 10 ms)");



%12.5 ms frame length and 12.5 ms frame shift
ste_2 = sum(buffer(y.^2, 125));
figure;
plot(linspace(0,length(ste_2)-1,length(ste_2)),ste_2);
xlabel("Number of samples");
ylabel("STE")
title("STE (frame length 12.5 ms, shift 12.5 ms)");

