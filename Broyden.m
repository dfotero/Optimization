function sol=Broyden(x)

syms t1 t2

f(t1,t2)=[t1^2-t1*t2-t2^2+t1-5*t2+5, t1^3*t2^2+6*t1+2*t2-9];
jac(t1,t2)=jacobian(f(t1,t2), [t1,t2]);

x=x';

error=double(norm(f(x(1),x(2))));
theJac=jac(x(1),x(2));

iter=0;
while error>=10^(-10)

    xnew=double(x-(theJac^(-1))*f(x(1),x(2))');
    dx=double(xnew-x);
    df=double(f(xnew(1),xnew(2))-f(x(1),x(2)));
    theJac=double(theJac+((df'-(theJac^(-1))*dx)/(norm(xnew)^2))*dx');
    error=double(norm(f(xnew(1),xnew(2))));
    x=xnew;
    iter=iter+1
    error
end
iter
sol=x;
end