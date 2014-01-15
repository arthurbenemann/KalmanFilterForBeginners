function avg = MovAvgFilter2(x)
%%
persistent prevAvg n xBuf
persistent firstRun

if isempty(firstRun)
	n = 10;
	xBuf = x*ones(n,1);
	firstRun =1;
end

for m=1:n-1
	xBuf(m) = xBuf(m+1);
end;

xBuf(n) = x;

avg = sum(xBuf)/n;

