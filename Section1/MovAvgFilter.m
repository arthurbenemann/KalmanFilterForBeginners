function avg = MovAvgFilter(x)
%%
persistent prevAvg n xBuf
persistent firstRun

if isempty(firstRun)
	n = 10;
	xBuf = x*ones(n+1,1);
	prevAvg = x;
	firstRun =1;
end

for m=1:n
	xBuf(m) = xBuf(m+1);
end;
xBuf(n+1) = x;

avg = prevAvg + (x- xBuf(1))/n;

prevAvg = avg;

