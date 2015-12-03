%% Parameter Sweep of ODEs
% This is a parameter sweep study of a 2nd order ODE system.
%
% $m\ddot{x} + b\dot{x} + kx = 0$
%
% We solve the ODE for a time span of 0 to 25 seconds, with initial
% conditions $x(0) = 0$ and $\dot{x}(0) = 1$. We sweep the parameters $b$
% and $k$ and record the peak values of $x$ for each condition. At the end,
% we plot a surface of the results.
%
% Copyright 2009-2011 The MathWorks, Inc.
% Modified by Dan Mazur, 2013

function main()
%% Initialize Problem
m     =                    5;  % mass
bVals = linspace(0.1, 5, 50);  % damping values
kVals = linspace(1.5, 5, 70);  % stiffness values
[kGrid, bGrid] = meshgrid(bVals, kVals);
peakVals = nan(size(kGrid));

%% Parameter Sweep 

disp('Computing...');drawnow;

tic;
parfor idx = 1:numel(kGrid)
  % Solve ODE
  [T,Y] = ode45(@(t,y) odesystem(t, y, m, bGrid(idx), kGrid(idx)), ...
    [0, 25], ...  % simulate for 25 seconds
    [0, 1]) ;      % initial conditions
 
  % Determine peak value
  peakVals(idx) = max(Y(:,1));
end
t1 = toc;
fprintf('Elapsed time is %0.2f seconds.\n', t1);

%% Visualize

h = figure;
surf(bVals, kVals, peakVals);
xlabel('Damping (b)');
ylabel('Stiffness (k)');
zlabel('Peak Response');
view(50, 30)
print(h, '~/paramsweep.png', '-dpng')

end

function dy = odesystem(t, y, m, b, k)
% 2nd-order ODE
%
%   m*X'' + b*X' + k*X = 0
%
% --> system of 1st-order ODEs
%
%   y  = X'
%   y' = -1/m * (k*y + b*y')

% Copyright 2009-2011 The MathWorks, Inc.

dy(1) = y(2);
dy(2) = -1/m * (k * y(1) + b * y(2));

dy = dy(:); % convert to column vector
end


