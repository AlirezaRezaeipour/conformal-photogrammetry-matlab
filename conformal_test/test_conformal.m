clc;
clear;
close all;

%% 1. Load data
calib = load('calibrated_points.txt');
comp  = load('comparator_points.txt');
arb   = load('arbitrary_points.txt');

calibratedPts = calib(:,2:3);
comparatorPts = comp(:,2:3);
arbitraryPts  = arb(:,2:3);

%% 2. Estimate conformal parameters
params = estimateConformal(comparatorPts, calibratedPts);

disp('Conformal parameters [a b tx ty]:');
disp(params');

%% 3. Apply transformation
calib_est = applyConformal(comparatorPts, params);
arb_est   = applyConformal(arbitraryPts, params);

%% 4. Compute RMSE
rmse = computeRMSE(calibratedPts, calib_est);
fprintf('RMSE (Conformal): %.6f\n', rmse);

%% 5. Visualization
figure;
plot(calibratedPts(:,1), calibratedPts(:,2), 'ro', 'DisplayName','Calibrated');
hold on;
plot(calib_est(:,1), calib_est(:,2), 'bx', 'DisplayName','Estimated');
plot(arb_est(:,1), arb_est(:,2), 'k.', 'DisplayName','Arbitrary Transformed');
legend;
grid on;
axis equal;
title('Conformal Transformation Test');
