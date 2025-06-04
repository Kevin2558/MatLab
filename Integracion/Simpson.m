%Simpson
syms x
func=exp(-x^2);
a=1;
b=3;
n=5;

X=a; h = (b - a)/n; s=0;
for i = 1 : n
Xold=X;
X = X + h;
s = s+(h/6)*((subs(func,x,Xold))+4*(subs(func,x,(Xold+X)/2))+(subs(func,x,X))) ;
end
I = vpa(s,10)

