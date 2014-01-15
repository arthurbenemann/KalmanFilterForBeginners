function h = GetSonar()
%
%
persistent sonarAlt % SonarAlt.mat
persistent k firstRun

if isempty(firstRun)
	load SonarAlt
	k = 1;
	firstRun =1;
end

h = sonarAlt(k);
k = k + 1;

w = 0 + 4*randn(1,1);
z = 14.4 +w;
