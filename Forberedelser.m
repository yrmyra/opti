%% stream of concioussness
clc;clear;
a=0;
b=20;
e=10^-10;
tol=10^-6;
F = @(x) 1-3*x*exp(-x);



[X,N]=Dichotomous(F,a,b,tol)              %x är just nu bara a och bs medelpunkt

[X,N]=Bisection(F,a,b,tol)

[X,N]=Golden(F,a,b,tol)

%% 3.6
clc;clear;
F = @(x) 2*exp(-x)+x;
a=0;
b=2;
tol=0.001;

[X,N]=Dichotomous(F,a,b,tol);              %x är just nu bara a och bs medelpunkt

[X,N]=Bisection(F,a,b,tol)

[X,N]=Golden(F,a,b,tol)

%% 3.8 
clc;clear;
F = @(x) 2*exp(-x)+x;
f = @(x) -2*exp(-x)+1;
df= @(x) 2*exp(-x);
tol = 10^-4;
l=2;

[l,N]=Newton(f,df,l,tol)










%%
function [l,N] = Newton(f,df,l,tol)
N=0;

while abs(f(l))>tol
    l=l-f(l)/df(l);
    N=N+1;
end

end


function[X,N]=Dichotomous(F,a,b,tol)

e=10^-10;
N=0;
while abs(a-b)>tol
    ml=(a+b)/2-e;
    mr=(a+b)/2+e;
    if F(ml)<F(mr)
        b=mr;
    elseif F(mr)<F(ml) 
        a=ml;
    else 
        b=mr;                       %hade först att den drog sig åt b vilket blev problem när de fick samma värde
    
    end
    N=N+1;
end
X=[a b];
%X=b-a;                          %liksom va det är bara toleransen ju


end

function [X,N] = Bisection(F,a,b,tol)
N=0;

while abs(b-a)>tol

    m=(a+b)/2;
    h=tol*0.1;
    f=(F(m+h)-F(m-h))/(2*h);             % vi kommer bara till 0+0/h och det är mindre. Fanns +tecken i boken..
    
    if f<0
        a=m;
    elseif f>0
        b=m;
    end
    N=N+1;
end
X=[a b];
end

function [X,N] = Golden(F,a,b,tol)
tau=(sqrt(5)-1)/2;
N=0;
while b-a>tol
                                            
    ml=a+abs(a-b)*(1-tau);                  % fastnade mellan 17 och 18 pga glömde a+ ... 

    mr=a+abs(a-b)*tau;

    if F(ml)>F(mr)
        a=ml;
    elseif F(ml)<F(mr)
        b=mr;
    end
    N=N+1;
end
X=[a b];
end









% function [X,N]=goldensection(F,a,b,tol)
% % For example F = @(x) 1-x*exp(-x)
% % [a,b] interval
% % tol = max ratio of final to initial interval lengths
% % X output matrix containing final a, b and b-a from every iteration
% % N = number of function evaluations

