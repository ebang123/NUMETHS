function [Mt,SumOf_wfxi,Integral] = trapez(f,a,b,n)
	h = (b-a)/(n);
	xi = a;
	w = 1;
	fxi = f(xi);
	wfxi = w*f(xi);
	iter = 0;
	for count = 1:n
		iter(1,count+1) = count;
		xi(1,count+1) = xi(1,count) + h;
		if (mod(count,2)==1)
			if (count == n)
				w(1,count+1) = 1;
			else
				w(1,count+1) = 2;
			end
		elseif (mod(count,2)==0)
			if (count == n)
				w(1,count+1) = 1;
			else
				w(1,count+1) = 2;
			end
		end
		fxi(1,count+1) = f(xi(1,count+1));
		wfxi(1,count+1) = w(1,count+1).*fxi(1,count+1);
	end
	Mt = [iter',xi',w',fxi',wfxi'];
	SumOf_wfxi = sum(wfxi);
	Integral = (h/2)*sum(wfxi);
    
    Mt = round(Mt,5);
	SumOf_wfxi = round(SumOf_wfxi,5);
	Integral = round(Integral,5);
end
