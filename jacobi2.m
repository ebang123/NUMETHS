function [x1,soln] = jacobi2(A,b,x0,tol)
n = length(b)
  for p = 1 : n
     x(p) = ((b(p) - A(p,[1:p-1,p+1:n]) * x0([1:p-1,p+1:n])) / A(p,p))
  end
x1 = x'
k = 1
soln0 = x0'
  while abs(x1-x0) >= tol
    for p = 1 : n
     x_ny(p) = ((b(p) - A(p,[1:p-1,p+1:n]) * x1([1:p-1,p+1:n])) / A(p,p))
    end
    soln(k,:) = x1 
    x0 = x1
    x1 = x_ny'
    k = k + 1
  end
soln = [soln0;soln;x1']
k
x = x1'
%sol
end