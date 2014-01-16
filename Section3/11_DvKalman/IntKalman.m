function [pos vel] = DvKalman(z)
%
%
persistent A H Q R
persistent x P
persistent firstRun

%--- Initial Conditions
if isempty(firstRun)
	firstRun = 1;

	dt = 0.1;

	A = [1 dt; 0 1];	% System Model
	H = [0 1];		% Measurament Model

	Q = [1 0; 0 3];		% Covariance matrix of state transition noise 
	R = 10;			% Covariance matrix of measurament noise

	x = [0 20]';		% Guess of the initial state of the system
	P = 5*eye(2);		% Covariance of the estimative above
end

%--- Prediction
xp = A*x;			% State prediction
Pp = A*P*A'+ Q;			% Error covariance prediction

%--- Estimation
K = Pp*H'*inv(H*Pp*H' + R); 	% Kalman gain

x = xp + K*(z - H*xp);		% State estimation
P = Pp - K*H*Pp;		% Error covariance estimation

pos = x(1);
vel = x(2);
