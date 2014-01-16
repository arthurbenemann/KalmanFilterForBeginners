function volt = SimpleKalman(z)
%
%
persistent A H Q R
persistent x P
persistent firstRun

%--- Initial Conditions
if isempty(firstRun)
	A = 1;		% System Model
	H = 1;		% Measurament Model

	Q = 0;		% Covariance matrix of state transition noise 
	R = 4;		% Covariance matrix of measurament noise

	x = 14;		% Guess of the initial state of the system
	P = 6;		% Covariance of the estimative above

	firstRun = 1;
end

%--- Prediction
xp = A*x;		% State prediction
Pp = A*P*A'+ Q;		% Error covariance prediction

%--- Estimation
K = Pp*H'*inv(H*Pp*H' + R); % Kalman gain

x = xp + K*(z - H*xp);	% State estimation
P = Pp - K*H*Pp;	% Error covariance estimation

volt = x;
