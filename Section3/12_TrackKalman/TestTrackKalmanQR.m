pkg load general control specfun signal image % Check the README file for how to get this librarys

clear all

NoOfImg = 24;

Xmsaved = zeros(2,NoOfImg);
Xhsaved = zeros(2,NoOfImg);
Xqrsaved = zeros(2,NoOfImg);

figure 					% added to start with a clean figure
for k=1:NoOfImg
  [xm, ym] = GetBallPos(k);
  [xh, yh] = TrackKalman(xm, ym);
  [xqr, yqr] = TrackKalmanQR(xm, ym);
      
  hold on
  plot(xm, ym, 'r*')
  plot(xh, yh, 'bs')
  plot(xqr, yqr, 'bo')
  
  pause(0.5)				% 1s iteration was too slow
  
  Xmsaved(:, k) = [xm ym]';
  Xhsaved(:, k) = [xh yh]';
  Xqrsaved(:, k) = [xqr yqr]';
end

figure
hold on
%plot(Xmsaved(1,:), Xmsaved(2,:), '*')
plot(Xhsaved(1,:), Xhsaved(2,:), 's')
plot(Xqrsaved(1,:), Xqrsaved(2,:), 'o')
axis ij					% makes the plot axis match the image
