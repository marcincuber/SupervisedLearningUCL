function rtn = funky(x,y)
%FUNKY Summary of this function goes here
%   Detailed explanation goes here
% rtn = funky(x,y)
rtn = sin(sqrt(x.^2 +y.^2))./(x.^2 + y.^2 + 0.0001)+ 4*sin(x);
end

