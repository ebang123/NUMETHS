function [root,fixedpointSol] = fixedpointLau(g,x)
	iter = 1;
	u=feval(g,x);
	for m = 1:1e15
		sol_iter(m) = iter;
		sol_x(m) = x;
		sol_u(m) = u;
		x1=u;
		err=abs(x1-x);
		x=x1;
		u=feval(g,x);
		iter=iter+1;
		if err >= 0.000005
			continue;
		else
			break;
		end
	endfor
	root = x;
	fixedpointSol = [sol_iter',sol_x',sol_u'];
    fixedpointSol = round(fixedpointSol,5);
end