clear all
close all
clc

% Load the .set file
EEG = pop_loadset('S13.set');

% Extract the EEG data as a numeric array
eegData = EEG.data;

% Define the parameters for feature extraction
epochLength = size(eegData, 1);  % Length of each epoch
numEpochs = size(eegData, 2);    % Number of epochs

% Initialize matrices to store the extracted features
meanPower = zeros(numEpochs, 1);    % Mean power of the epoch
maxPower = zeros(numEpochs, 1);     % Maximum power of the epoch
bandPower = zeros(numEpochs, 3);    % Power in specific frequency bands (e.g., delta, theta, alpha)

samplingRate = 500;
% Loop over each epoch and calculate the features
for i = 1:numEpochs
    epoch = eegData(:, i);
    
    % Calculate the power spectral density (PSD) using Welch's method
    [psd, freq] = pwelch(epoch, [], [], [], samplingRate);  % Adjust parameters as needed
    
    % Calculate mean and maximum power
    meanPower(i) = mean(psd);
    maxPower(i) = max(psd);
    
    % Calculate band power in specific frequency ranges
    deltaIdx = freq >= 1 & freq <= 4;
    thetaIdx = freq >= 4 & freq <= 8;
    alphaIdx = freq >= 8 & freq <= 12;
    
    bandPower(i, 1) = sum(psd(deltaIdx));
    bandPower(i, 2) = sum(psd(thetaIdx));
    bandPower(i, 3) = sum(psd(alphaIdx));
end

% The extracted features are now stored in the respective matrices
% You can further analyze or visualize the extracted features as needed
