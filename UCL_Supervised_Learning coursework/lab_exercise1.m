A = [ 5, 3, 1, 0; 2,4,7,2; 6,4,3,1];
B = [1,7;3,4;2,3];
C = [6,6,0,5;9,2,1,8];

AC = [A;C];
AB = [A,B];
AB2 = [A B];


a = [1:6];
b = [2:0.5:5];
c = [3:-0.25:1];

a(7) = a(1) + a(3) + a(6);
b(7) = b(1) + b(3) + b(6);
c(10) = c(1) + c(3) + c(6);

%part B
f = [1:12];
F = [f(1:4); f(5:8); f(9:12)];
F2 = reshape(f,4,3)';

BC = B*C;
AF = A*F';

F(:,1)=F(:,1)*3;
F(:,2)=F(:,2)*2;
F(:,3)=F(:,3)*5;
F(:,4)=F(:,4)*7;

F(1,:)=F(1,:)*3;
F(2,:)=F(2,:)*2;
F(3,:)=F(3,:)*5;

g=[3 2 5 7];
G=repmat(g,3,1);
FG= F.*G;

h=[3;2;5];
H=repmat(h,1,4);
FH= F.*H;

FF = F*[1;1;1;1];
FF2 = [1 1 1]*F;

% part 3
E = [4,6,0;5,1,3];

E = E+1; %or E+ones(2,3) or E+repmat(1,2,3)

Anew = A + 0.1*rand(3,4).*A;
Bnew = B + 0.1*rand(3,2).*B;
Cnew = C + 0.1*rand(2,4).*C;

d=linspace(1,2,6);

d1 = repmat(d,3,1);
d2 = repmat(d',1,4);

[X,Y] = meshgrid(d);

X2 = repmat(d,6,1);
Y2 = repmat(d',1,6);

T = randn(100,5);
newPermutation = randperm(100);
T75 = T(newPermutation(1:75),:);
T25 = T(newPermutation(76:100),:);

%part D
G = [5,0,1,0;2,6,7,2;5,4,3,1];
H = [9,7;2,8;2,3];
e = (1:5);
f = [6,2,1,7,8,2];

uniG = unique(G);
uniH = unique(H);
unie = unique(e);
unif = unique(f);

unionef = union(e,f);
interef = intersect(e,f);

b = ismember(H,G); %b is a matrix contating zeros and ones
positions = H(b); %returns all positions of H for which b is 1

bb = G(ismember(G,e));
bbb = e(ismember(e,f));
diff = setdiff(e,f);

%part e

A1 = [2 3 -1 4;1 1 -3 5; 7 1 3 4; 5 4 3 -11];
b1 = [23;11;12;14];
x1 = inv(A1)*b1;

A2 = [2 3 -1 4 3; 1 1 -3 5 5; 7 1 3 4 7; 5 4 3 -11 11];
b2 = [23; 11; 12; 14];
x2 = A2\b2;

A3 = [ 2 3 -1; 1 1 -3; 7 1 3; 5 4 3];
b3 = b1;
x3 = A3\b3;
x32 = pinv(A3)*b3;

A4 = [2 3 -1; 1 1 -3; 7 1 3];
b4 = [23;11;12];
x4 = A4\b4;

xx4 = A4*x4;
new4 = A3(4,:)*x4;

A5 = [2 3 -1; 1 1 -3;7 1 3; 5 4 3];
b5 = [23;11;12;28.8704];
x5 = A5\b5;
test5 = A5*x5;

%part 7

x = linspace(0,10,30);
y = 2*cos(x)+3*sin(2*x);
%graph = plot(x,y);

x1 = linspace(0,10,100);
x2 = linspace(0,10,1000);
x3 = linspace(0,10,10000);
y1 = 2*cos(x1)+3*sin(2*x1);
y2 = 2*cos(x2)+3*sin(2*x2);
y3 = 2*cos(x3)+3*sin(2*x3);

figure
subplot(3,2,1); plot(x,y); xlabel('30 x values');
subplot(3,2,2); plot(x1,y1); xlabel('100 x values');
subplot(3,2,3); plot(x2,y2); xlabel('1000 x values');
subplot(3,2,4); plot(x3,y3); xlabel('10000 x values');

subplot(3,2,5);
y1 = sin(x3);
y2 = cos(x3);
y3 = 2*cos(x3)+3*sin(2*x3);
plot(x3,y1,'b--');
hold on;
plot(x3,y2,'r:');
plot(x3,y3, 'g-.');
hold off

[X Y] = meshgrid(linspace(-4,4,100),linspace(-4,4,100));
Z = 0.8*exp(-(X.^2+Y.^2))+0.3*exp(-5*((X-3).^2 + (Y+2).^2));

figure; mesh(X,Y,Z);
figure; surf(X,Y,Z);
figure; contour(X,Y,Z,10);

