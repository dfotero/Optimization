function sol=NewtonA(x)

f=x^4-exp(-x)+1/((x-2)^2);

d1=4*x+exp(-x)-2/((x-2)^3);

d2=4-exp(-x)+6/((x-2)^4);


epsilon=10^(-10);


iter=0;

while abs(d)>epsilon
   
    x=x-(d1^(-1))*;

d1=4*x+exp(-x)-2/((x-2)^3);

d2=4-exp(-x)+6/((x-2)^4);

d=-d2^(-1)*d1;

if d1*(d) >0
   
    d=-d;
    
end

x1(t)=x+t*d;

iter=iter+1;

end
iter

d2=4-exp(-x)+6/((x-2)^4);

SOSC=0;

if d2>=0
    
    SOSC=1;
    
end

SOSC

sol=x;
end