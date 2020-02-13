function theta=goldensection(xbar,dbar)

syms t %define variable t that represents theta

x1=xbar(1)+t*dbar(1);
x2=xbar(2)+t*dbar(2);

a(t)=(x1^2-x2)^2+2*(x2^2-x1-4)^4; %Evaluate the function in terms of theta.

F1=(3-sqrt(5))/2;
F2=(sqrt(5)-1)/2;
iter=0;
alpha=0;
beta=1;
error=10^-10;
gamma1=F2*alpha+F1*beta;
gamma2=F1*alpha+F2*beta;

%prints first iteration
strcat("Iteration: ",num2str(iter),", Alpha=",num2str(alpha),", Beta=",num2str(beta),", Gamma1=",num2str(gamma1),", Gamma2=",num2str(gamma2)," a(gamma1)=")
a(gamma1)
strcat("a(gamma2)=")
a(gamma2)

%goldensection until meets error
while (beta-alpha)>error
    
    if a(gamma1)>=a(gamma2)
       
        alpha=gamma1;
            
    else
        
        beta=gamma2;
        
    end
     
     iter=iter+1;
     gamma1=F2*alpha+F1*beta;
     gamma2=F1*alpha+F2*beta;
     
     strcat("Iteration: ",num2str(iter),", Alpha=",num2str(alpha),", Beta=",num2str(beta),", Gamma1=",num2str(gamma1),", Gamma2=",num2str(gamma2)," a(gamma1)=")
     a(gamma1)
     strcat("a(gamma2)=")
     a(gamma2)
end

%Saves theta to be returned
theta=(alpha+beta)/2;

end