function theta=bisection(xbar,dbar)

syms t %define variable t that represents theta

x1=xbar(1)+t*dbar(1);
x2=xbar(2)+t*dbar(2);

a(t)=(x1^2-x2)^2+2*(x2^2-x1-4)^4; %Evaluate the function in terms of theta.

divA(t)=diff(a); %Finds the derivative of a in terms of theta.


%initialize the parameters
iter=0;
alpha=0;
beta=1;
error=10^(-10);
gamma=(alpha+beta)/2;

%prints first iteration
strcat("Iteration: ",num2str(iter),", Alpha=",num2str(alpha),", Beta=",num2str(beta),", Gamma=",num2str(gamma),", a'(gamma)=")
divA(gamma)

%bisection until meets error
while (beta-alpha)>error
    
    if divA(gamma)>=0
       
        beta=gamma;
            
    else
        
        alpha=gamma;
        
    end
     
     iter=iter+1;
     gamma=(alpha+beta)/2;
     
     strcat("Iteration: ",num2str(iter),", Alpha=",num2str(alpha),", Beta=",num2str(beta),", Gamma=",num2str(gamma),", a'(gamma)=")
     divA(gamma)
end

%Saves theta to be returned
theta=gamma;


end

