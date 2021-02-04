function [root,newtonRaphson_2Sol] = newtonRaphson_2Lau2(f,x1,h)
    clf
    a = x1;
	iter = 1;
	for m = 1:1e15
		sol_iter(m) = iter;
		sol_x1(m) = x1;
		u = f(x1);
		du = (f(x1+h)-f(x1-h))/(2*h);
		ddu = (f(x1+h)-(2*f(x1))+f(x1-h))/(h^2);
		x2 = x1 + ((ddu/(2*du))-(du/u))^-1;
		x1 = x2;
		v = f(x2);
		sol_x2(m) = x2;
		sol_u(m) = u;
		sol_du(m) = du;
		sol_ddu(m) = ddu;
		sol_v(m) = v;
		iter=iter+1;
		if abs(v) >= 0.00005
			continue;
		else
			break;
		end
  end
	root = x2;
	newtonRaphson_2Sol = [sol_iter',sol_x1',sol_x2',sol_u',sol_du',sol_ddu',sol_v'];
    newtonRaphson_2Sol = round(newtonRaphson_2Sol,5);
end