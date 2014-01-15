clear all

Nsamples = 500;
dt = 0.02;
t = 0:dt:Nsamples*dt-dt;

Xsaved = zeros(Nsamples, 1);
Xmsaved = zeros(Nsamples, 1);

for k=1:Nsamples
	xm = GetSonar();
	x = LPF(xm);
	
	Xsaved(k) = x; 
	Xmsaved(k) = xm;
end

figure
hold on
plot(t, Xmsaved, 'r.');
plot(t, Xsaved, 'b');
legend('Measured','LPF')
