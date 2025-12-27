# Conformal Photogrammetry Transformation (MATLAB)

This repository provides a clean and reusable MATLAB implementation of
2D conformal transformation used in photogrammetry and geospatial applications.

## Mathematical Model
X = s R x + t

where scale, rotation, and translation parameters are estimated
using least squares adjustment.

## Features
- Conformal (similarity) transformation
- Least squares estimation
- RMSE computation
- Ready-to-use demo

## Folder Structure
- src/    : core MATLAB functions
- demo/   : example script
- data/   : sample input data

## How to Run
1. Open MATLAB
2. Go to demo folder
3. Run `demo_conformal.m`

## Example Output
- RMSE printed in command window
- Visualization of transformed points

## Applications
- Photogrammetry
- Geodesy
- Image registration
