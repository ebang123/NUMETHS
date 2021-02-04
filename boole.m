function [Mt,SumOf_wfxi,Integral] = boole(f,a,b,n)
	h = (b-a)/(n);
	xi = a;
	w = 7;
	fxi = f(xi);
	wfxi = w*f(xi);
	iter = 0;
	for count = 1:n
		iter(1,count+1) = count;
		xi(1,count+1) = xi(1,count) + h;
		if (mod(count,4)==1)||(mod(count,4)==3)
			if (count == n)
				w(1,count+1) = 7;
			else
				w(1,count+1) = 32;
			end
		elseif (mod(count,4)==2)
			if (count == n)
				w(1,count+1) = 7;
			else
				w(1,count+1) = 12;
			end
		elseif (mod(count,4)==0)
			if (count == n)
				w(1,count+1) = 7;
			else
				w(1,count+1) = 14;
			end
		end
		fxi(1,count+1) = f(xi(1,count+1));
		wfxi(1,count+1) = w(1,count+1).*fxi(1,count+1);
	end
	Mt = [iter',xi',w',fxi',wfxi'];
	SumOf_wfxi = sum(wfxi);
	Integral = (2*h/45)*sum(wfxi);
end