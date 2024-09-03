% Intelligent Traffic Control System
% MATLAB Code for Traffic Light Duration Adjustment

% Clear workspace and command window
clear;
clc;

% Load sample traffic images
% Replace with your own images or video feed
imageFiles = {'traffic1.jpg', 'traffic2.jpg', 'traffic3.jpg'};

% Initialize variables
trafficDensity = zeros(1, length(imageFiles));  % To store vehicle counts

% Loop through each image
for i = 1:length(imageFiles)
    % Read the image
    trafficImage = imread(imageFiles{i});

    % Convert the image to grayscale
    grayImage = rgb2gray(trafficImage);

    % Apply edge detection (e.g., Canny)
    edges = edge(grayImage, 'Canny');

    % Find contours of the vehicles
    contours = bwconncomp(edges);

    % Count the number of vehicles (based on contours)
    numVehicles = contours.NumObjects;
    trafficDensity(i) = numVehicles;

    % Display the processed image with the number of vehicles
    figure, imshow(trafficImage);
    title(['Vehicles Detected: ', num2str(numVehicles)]);
end

% Determine the average traffic density
avgTrafficDensity = mean(trafficDensity);

% Traffic light timing logic (simple example)
% Adjust green light duration based on traffic density
baseGreenTime = 30;  % Base green light duration in seconds
adjustedGreenTime = baseGreenTime + avgTrafficDensity * 5;  % Adjust by 5 seconds per vehicle

% Display the adjusted green light duration
disp(['Adjusted Green Light Duration: ', num2str(adjustedGreenTime), ' seconds']);
