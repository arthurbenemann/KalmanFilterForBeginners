function [xh yh] = TrackKalman(xm,ym)
%
%
persistent A H Q R
persistent x P
persistent firstRun

%--- Initial Conditions
if isempty(firstRun)
	firstRun = 1;

	dt = 1;

	A = [1  dt 0  0 	% System Model
	     0  1  0  0
             0  0  1  dt
             0  0  0  1 ];	
	H = [1 0 0 0		% Measurament Model
	     0 0 1 0 ];

	Q = 1.0*eye(4);		% Covariance matrix of state transition noise 
	R = 0.01*[50 0		% Covariance matrix of measurament noise
                  0  50];

	x = [0, 0, 0, 0]';	% Guess of the initial state of the system
	P = 100*eye(4);		% Covariance of the estimative above
end

%--- Prediction
xp = A*x;			% State prediction
Pp = A*P*A'+ Q;			% Error covariance prediction

%--- Estimation
K = Pp*H'*inv(H*Pp*H' + R); 	% Kalman gain

z = [xm ym]';
x = xp + K*(z - H*xp);		% State estimation
P = Pp - K*H*Pp;		% Error covariance estimation

xh = x(1);
yh = x(3);
