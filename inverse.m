function [B, err] = inverse(A)
[n, nc] = size(A)
if (n~=nc)
    error('square matrices only!');
end
id = eye(n);
C = [A, id];

B = C(:,(n+1):2n);

if (nagrout > 1)
    err = max(max(abs(A*B-I)));
end
end
