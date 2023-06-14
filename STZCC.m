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

%subtract the DC offset
y_corr=y-mean(y);

%initializing
ZCC=zeros(1,length(1:frame_shift:N-frame_length));

length_ZCC=length(1:frame_shift:N-frame_length);


for index=1:frame_shift:N-frame_length
    zcc_count=zeros(1,frame_length-1);
    for i=1:1:frame_length
        zcc_count(i)=0.5*abs(sign(y_corr(i+index))-sign(y_corr(i+index-1)));
    end
        %to exclude the points where the graph just touches zero
        ZCC(1+(index-1)/(frame_shift))=sum(zcc_count)-nnz(zcc_count==0.5)/2;

end

figure;
plot(linspace(0,length_ZCC,length_ZCC),ZCC);
xlabel("Number of samples");
ylabel("STZCC");
title("STZCC (frame length 25 ms, shift 10 ms)");
