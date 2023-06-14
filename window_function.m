%window function
N=100;
n=0:1:399;
w(:,1:N-1)=1;
w(N-1:400)=0;

plot(n,w);
xlabel("Time in samples");
ylabel("w[n]");
title("Time-domain representation of window function");



%frequency spectrum of window function

z = tf('z');
X = (z^N-1)/(z^N-z^(N-1));
bode(X)

%window function is definitely a low pass filters