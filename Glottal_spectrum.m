%modelling the glottal spectrum
N1=40;
N2=10;

n= 0:1:99; %100 samples
y=0.5*(1-cos(pi*n(:,1:N1))/N1);
y(:,N1:N1+N2)=cos(pi*(n(:,N1:N1+N2)-N1)/(2*N2));
y(N1+N2+1:100)=0;

figure;
plot(n,y);
xlabel("Time in samples");
ylabel("Glottal amplitude");
title("Time-domain representation of glottal spectrum");