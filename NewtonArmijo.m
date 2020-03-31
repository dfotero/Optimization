function sol=NewtonArmijo(x)

d1=zeros(1,2);
d1(1)=3+20*(x(1)^3)-8*x(1)*x(2)+24*x(1)*x(2)^2;
d1(2)=-18+24*(x(1)^2)*x(2)-4*x(1)^2+4*x(2)+108*x(2)^3;

d2=zeros(2,2);

d2(1,1)=60*x(1)^2-8*x(2)+24*x(2)^2;
d2(1,2)=-8*x(1)+48*x(1)*x(2);
d2(2,1)=48*x(1)*x(2)-8*x(1);
d2(2,2)=24*x(1)^2+4+324*x(2)^2;


d=-d2^(-1)*(d1');

if d1*(d) >0
   
    d=-d;
    
end

syms t

x1(t)=x(1)+t*d(1);
x2(t)=x(2)+t*d(2);

a(t)=3*x1(t)-18*x2(t)-6*x1(t)^2*x2(t)^2+2*(x1(t)^2-x2(t))^2+3*(x1(t)^2+3*x2(t)^2)^2;
da(t)=diff(a);

epsilon=10^(-3);

theta=0;
iter=0;

while d1(1)^2+d1(2)^2>epsilon
   
condition=0;
alpha=0;
beta=1;
rho=1/4;
sigma=3/4;



while condition==0
   
    if a(0)+rho*da(0)*beta<a(beta)
        
        condition=1;
    
    elseif da(beta)<sigma*da(0)
        
        beta=2*beta;
        
    else
        theta=beta;
        condition=2;
    end           
    
end

while condition==1
   
    theta=(alpha+beta)/2;
    
    if a(0)+rho*theta*da(0)<a(theta)
        
        beta=theta;
        
    elseif da(theta)<sigma*da(0)
        
        alpha=theta;
    
    else
        
        condition=2;
    
    end
end


x(1)=x(1)+theta*d(1);
x(2)=x(2)+theta*d(2);

d1(1)=3+20*(x(1)^3)-8*x(1)*x(2)+24*x(1)*x(2)^2;
d1(2)=-18+24*(x(1)^2)*x(2)-4*x(1)^2+4*x(2)+108*x(2)^3;

d2(1,1)=60*x(1)^2-8*x(2)+24*x(2)^2;
d2(1,2)=-8*x(1)+48*x(1)*x(2);
d2(2,1)=48*x(1)*x(2)-8*x(1);
d2(2,2)=24*x(1)^2+4+324*x(2)^2;

d=-d2^(-1)*(d1');

if d1*(d) >0
   
    d=-d;
    
end

x1(t)=x(1)+t*d(1);
x2(t)=x(2)+t*d(2);

a(t)=3*x1(t)-18*x2(t)-6*x1(t)^2*x2(t)^2+2*(x1(t)^2-x2(t))^2+3*(x1(t)^2+3*x2(t)^2)^2;
da(t)=diff(a);

iter=iter+1;
end
iter

d2(1,1)=60*x(1)^2-8*x(2)+24*x(2)^2;
d2(1,2)=-8*x(1)+48*x(1)*x(2);
d2(2,1)=48*x(1)*x(2)-8*x(1);
d2(2,2)=24*x(1)^2+4+324*x(2)^2;
theE=eig(d2);
SOSC=0;

if (theE(1)>=0) && (theE(2)>=0)
    
    SOSC=1;
    
end

SOSC

sol=x;
end