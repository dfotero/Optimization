function sol=NewtonB(x)

syms t1 t2

f(t1,t2)=(t1-2*t2)^4+t1^2;

d1=zeros(1,2);

d1(1)=4*(x(1)-2*x(2))^3+2*x(1);
d1(2)=-8*(x(1)-2*x(2))^3;

d2=zeros(2,2);

d2(1,1)=12*(x(1)-2*x(2))^2+2;
d2(1,2)=-24*(x(1)-2*x(2))^2;
d2(2,1)=-24*(x(1)-2*x(2))^2;
d2(2,2)=48*(x(1)-2*x(2))^2;

epsilon=10^(-10);

iter=0;

while abs(double(f(x(1),x(2))))>epsilon
   
    x=x-(d2^(-1)*(d1'))';

    iter=iter+1;
    
    d1(1)=4*(x(1)-2*x(2))^3+2*x(1);
    d1(2)=-8*(x(1)-2*x(2))^3;
    
    d2(1,1)=12*(x(1)-2*x(2))^2+2;
    d2(1,2)=-24*(x(1)-2*x(2))^2;
    d2(2,1)=-24*(x(1)-2*x(2))^2;
    d2(2,2)=48*(x(1)-2*x(2))^2;
    
end
iter

theE=eig(d2);
SOSC=0;

if (theE(1)>=0) && (theE(2)>=0)
    
    SOSC=1;
    
end

SOSC

sol=x;
end