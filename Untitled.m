clc
clear all
m = 1;                   %massa constante
k= 0.09;
h = 0.01;               %passo
t = 0:h:100;             %tempo
tf = 100;
A=2.07;
w=sqrt(k/m);
n=(tf/h);                  %numero de loops
x(1) = 0;                  
v(1) = 1;                  
t(1) = 0;
Ec = (1/2)*k*(A^2)*sin(w*t).^2;
Ep = (1/2)*k*(A^2)*cos(w*t).^2;
Em = Ec + Ep;
for i = 1: n
      tn = t(i);            %autalizando os valores para o loop
      xn = x(i);            %autalizando os valores para o loop
      vn = v(i);            %autalizando os valores para o loop
    k1 = h*funcinf(tn,xn,vn);
    l1 = h*funcing(tn,xn,vn);
    k2 = h*funcinf(tn + h/2, xn + k1/2 , vn + l1/2);
    l2 = h*funcing(tn + h/2, xn + k1/2 , vn + l1/2);
    k3 = h*funcinf(tn + h/2, xn + k2/2 , vn + l2/2);
    l3 = h*funcing(tn + h/2, xn + k2/2, vn + l2/2);
    k4 = h*funcinf(tn+h,xn + k3, vn + l3);
    l4 = h*funcing(tn+h,xn + k3, vn + l3);
    
    k  = (k1 + 2*k2 + 2*k3 + k4)/6;
    l  = (l1 + 2*l2 + 2*l3 + l4)/6;
   
    v(i+1) = v(i) + k;
    x(i+1) = x(i) + l;
    t(i+1) = t(i) + h;
    
end
   %plot(t,x)
    hold on
   %plot(t,v)
    hold on
   % plot(v,x)
   hold on
   plot(t,Ec)
   hold on
   plot(t,Ep)
   hold on
   plot(t,Em)