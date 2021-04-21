# swaroop
# BT18ECE059
# Delta Modulation

function [t m]=Delta_Modulation(w, D)
#D=amplitude of signal
#t=output binary sequence
#w=step size
 
#Defining the Variables
t=0:2*pi/100:2*pi;
z=D*sin(t);
plot(z)
hold on
t=[0];
h=0;

for j=1:length(z)-1
    if h(j)<=z(j)
        d=1;
        h(j+1)=h(j)+w;
    else
        d=0;
        h(j+1)=h(j)-w;
    end
    t=[t d];
end
stairs(h);
hold off;
m=sum((z-h).^2)/length(z); #Delta Modulation
end
    