function sol=NewtonA(x)

syms t

f(t)=t^4-exp(-t)+1/((t-2)^2);

df(t)=diff(f);

epsilon=10^(-10);

iter=0;

while abs(double(f(x)))>epsilon
   
    x=double(x-f(x)/df(x));

    iter=iter+1;
    
end
iter

d2(t)=diff(df);

SOSC=0;

if d2(x)>=0
    
    SOSC=1;
    
end

SOSC

sol=x;
end