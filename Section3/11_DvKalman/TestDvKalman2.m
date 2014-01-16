clear all

Nsamples = 500;
dt = 0.2;
t = 0:dt:Nsamples*dt-dt;


Xsaved = zeros(Nsamples, 2);
Zsaved = zeros(Nsamples, 1);

for k=1:Nsamples
	z = GetSonar();
	[pos vel] = DvKalman(z);
	
	Xsaved(k, :) = [pos vel];
	Zsaved(k) = z; 
end

figure
hold on
plot(t, Zsaved, 'r.')
plot(t, Xsaved(:, 1))

figure
plot(t, Xsaved(:, 2))
