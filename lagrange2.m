function [] = lagrange2 ()
%x = input("Enter values for time: ");
%x=[0 0.026408 0.093272 0.321416 0.445704 0.485976];
%y = input("Enter values for displacement: ");
%y=[0 .155 .310 .310 .155 0];
%x=[0 .015792 .016256 ];
%y=[0 .155 .155 0];

x=[0 0.7 1.03 1.12 1.13]
y=[0 .115 .310 .465 .310]

hold on 
scatter(x,y)
[nr,nc] = size(x);
ncx = nc;

f = 0:0.01:x(ncx);
[nr,nc] = size(f);
ncf = nc;
Lnx = ones(1,ncx);
Lny = ones(1,ncx);

##disp('Lnx');
##disp(Lnx);
##printf("\n");
##disp('Lny');
##disp(Lny);
##printf("\n");

tempx = Lnx;
tempy = Lny;

for h=1:ncf
  Lnx = ones(1,ncx);
  Lny = ones(1,ncx);
  for i=1:ncx
    for j=1:ncx
      if i==j
        Lnx(1,i) = 1*Lnx(1,i);
        Lny(1,i) = 1*Lny(1,i);
      else
        Lnx(1,i) = Lnx(1,i)*(f(1,h)-x(1,j));
        Lny(1,i) = Lny(1,i)*(x(1,i)-x(1,j));    
      endif
    endfor
    Ln(1,i) = (Lnx(1,i)./Lny(1,i)).*y(1,i);
  endfor  
  sumLn(1,h) = sum(Ln);
endfor

plot(f,sumLn);
hold off