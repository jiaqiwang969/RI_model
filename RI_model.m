clc
clear
close all
%失稳涡团的理论分析！
%参数1
%失速团的移动速度v1

%参数2
%失速团的振动频率f0

%参数1和参数2的关系
%根据涡声理论，涡越大，频率越小。
%根据大量的测试观察和仿真，涡越大，移动速度也越慢
%那么，也就有：f0与v1成正相关，即频率越小，移动越慢。
%我们，假设，f0=v1，a>0 (equ-0)
%还要考虑幅值A
A=1

%再来，根据多谱勒关系，这里要建立声传播模型
% f_low=f0*29/(29+v1);  (equ-1)
% f_high=f0*29/(29-v1); (equ-2)




%对均值 mu 和标准差 sigma赋予物理含义
%mu=（f_low+f_high）/2, (equ-3)
%mu=(f0*29/(29+v1)+f0*29/(29-v1))/2;
%mu=f0*a1/(29^2-v1^2)
%带入(equ-0)
%mu=(v1*a0+b)*a1/(a2-v1^2);
%mu=a5*(v1+b1)/(1-a4*v1^2);
%随着压气机失稳的增加，失稳涡团的传播速度v1逐渐减小
figure;
subplot(3,1,1)
v1=flip(linspace(1,10,30));
mu=(v1)./(100-v1.^2);
plot(v1,mu)
xlabel("v1")
ylabel("mu")
set(gca,'XDir','reverse');  

%sigma与（f_high-f_low）有关
%sigma=(f0*29/(29-v1)-f0*29/(29+v1));
%mu=a5*(v1+b1)*v1/(1-v1^2);
subplot(3,1,2)
v1=flip( linspace(1,7,30));
sigma=(v1.^2)./(100-v1.^2);
plot(v1,sigma)
xlabel("v1")
ylabel("sigma")
set(gca,'XDir','reverse');  



x = linspace(-0.1,0.1,1000);
% mu = 0;
% sigma = linspace(1,3,50);
A=1./((sigma));
subplot(3,1,3)

jet_color=colormap(jet(30));
for k=1:length(sigma)
    y = A(k)*normpdf(x,mu(k),sigma(k));
    plot(x,y,'Color',jet_color(k,:))
    hold on
end




















