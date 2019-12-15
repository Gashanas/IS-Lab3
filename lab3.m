
x = 0.1:1/22:1;
d = (1 + 0.6*sin(2*pi*x/0.7)) + 0.3*sin(2*pi*x)/2;
% plot();

% plot(x,d, 'kx');
% pause();

%centru reiksmes
c1 = 0.2;
c2 = 0.9;
%spinduliu reiksmes
r1 = 0.1;
r2 = 0.1;
%svoriai
w1 = randn(1);
w2 = randn(1);
w0 = randn(1);

n=0.16; %learning rate

for j=10000
for i=1:length(x)
    %Gauso funkcija
    y1 = exp(-(x(i)-c1)^2/(2*r1^2)); 
    y2 = exp(-(x(i)-c2)^2/(2*r2^2));
    
    rez=w1 * y1 + w2 * y2 + w0;
    
    %Errors calculation between result and expected output
    e = d(i) - rez;
    
    %Wieght update
    w1 = w1 + n * y1 * e;
    w2 = w2 + n * y2 * e;
    w0 = w0 + n * e;
    
end
end
rez = zeros(20,1);
for i = 1:20 
        y1 = exp(-(x(i)-c1)^2/(2*r1^2));
        y2 = exp(-(x(i)-c2)^2/(2*r2^2));
        rez(i)=w1 * y1 + w2 * y2 + w0;
end

% plot(x,d, 'kx');
plot (x,d, 'ko', x, rez, 'r*');
