function params = estimateConformal(sourcePts, targetPts)
% ESTIMATECONFORMAL Estimates 2D conformal transformation parameters
% sourcePts : Nx2 (Comparator)
% targetPts : Nx2 (Calibrated)

n = size(sourcePts,1);

A = zeros(2*n,4);
L = zeros(2*n,1);

for i = 1:n
    X = sourcePts(i,1);
    Y = sourcePts(i,2);

    A(2*i-1,:) = [ X, -Y, 1, 0];
    A(2*i  ,:) = [ Y,  X, 0, 1];

    L(2*i-1) = targetPts(i,1);
    L(2*i  ) = targetPts(i,2);
end

params = A \ L;   % Least Squares (NO inv)
end
