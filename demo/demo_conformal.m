clc; clear; close all;

addpath('../src');

clib = load('../data/calibrated_points.txt');
comp = load('../data/comparator_points.txt');
arb  = load('../data/arbitrary_points.txt');

calibratedPts = clib(:,2:3);
comparatorPts = comp(:,2:3);
arbitraryPts  = arb(:,2:3);

% Estimate conformal parameters
params = estimateConformal(comparatorPts, calibratedPts);

% Transform arbitrary points
arb_tf = applyConformal(arbitraryPts, params);

% RMSE on calibration points
calib_tf = applyConformal(comparatorPts, params);
rmse = computeRMSE(calibratedPts, calib_tf);

fprintf('RMSE (Conformal): %.6f\n', rmse);

% Plot
figure;
plot(calibratedPts(:,1), calibratedPts(:,2),'ro','MarkerSize',8,'DisplayName','Calibrated');
hold on;
plot(arb_tf(:,1), arb_tf(:,2),'b.','DisplayName','Transformed Arbitrary');
legend;
grid on;
axis equal;
title('2D Conformal Photogrammetric Transformation');
