function rmse = computeRMSE(observed, computed)
% COMPUTERMSE Computes RMSE for 2D coordinates

residuals = observed - computed;
rmse = sqrt(sum(residuals(:).^2) / (size(observed,1)-1));
end
