name = 'marcin';
age = 22;
%disp(['my name is ' name ' and I am ' num2str(age) ' years old']);

e = [-5,0.2,5];
[X,Y] = meshgrid(e);
Z = funky(X,Y);
%plot3(X,Y,Z);
mesh(X,Y,Z);

x = [0:0.1:2*pi];
y = my_cos_sin(x); 
%plot(x,y);

% part c
A = [3,4,5,2,3,6;12,95,23,0,29,39;57,64,72,41,8,91;47,28,31,82,84,37;28,40,39,45,64,69];
a = A(find(A>20));
ma = mean(A);
m = mean(ma);

% as 38.2667-50 <0 and all entries in A are >0 we are only looking for
% entries > 50+38.266
m2=m+50;
a2=A(find(A>m2));

% part d
a3 = A(find(A>20 & A<90));
ma2 = mean(A);
m3 = mean(ma2);
a4 = A(find((A>20 & A<90) | A > m3-35 & A<m3+35 ));

% part e
x_values = [0:0.1:2*pi - 0.1];
y_values = sin(x_values);

for i=1:length(a)
    disp(['The ', num2str(i), '-th element of a is: ', num2str(a(i))])
end

[r,c]=size(A);
for i=1:r
       for j=1:c
         disp(['Row: ', num2str(i), ' Column: ', num2str(j), ' Value: ', num2str(A(i,j)) ])
       end
end
A = zeros(10,1);
A(5) = 1;
m = A(find(A==1))

%input any number example
n = input('Type a positive number: ')
while (n<=0)
    n=input('I said positive. ');
end

while(n>1)
   n=n/2;
   disp(num2str(n));
end

n= input('Type a number between 200 and 300: ')
while (n<200 | n>300 )
      n=input('I said between 200 and 300. ');
end

while(n>1)
      n=n/2;
      disp(num2str(n));
end

