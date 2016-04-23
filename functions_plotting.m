n = 11;
u = linspace(0,2*pi,n);
v = cos(u); % all function evaluations done at once!
plot(u,v)
xlabel('u'); 
ylabel('v'); 
title('v = cos(u)');