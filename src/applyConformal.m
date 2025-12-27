function transformedPts = applyConformal(points, params)
% APPLYCONFORMAL Applies conformal transformation to 2D points

n = size(points,1);
A = zeros(2*n,4);

for i = 1:n
    X = points(i,1);
    Y = points(i,2);

    A(2*i-1,:) = [ X, -Y, 1, 0];
    A(2*i  ,:) = [ Y,  X, 0, 1];
end

result = A * params;
transformedPts = reshape(result,2,[])';
end
