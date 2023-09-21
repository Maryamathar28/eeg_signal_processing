clear all
close all
clc

% Load the .set file
EEG = pop_loadset('S13.set');

% Extract the EEG data as a numeric array
eegData = EEG.data;

% Define the duration and overlap of each epoch (in seconds)
epochDuration = 2;   % Duration of each epoch
epochOverlap = 0.5;  % Overlap between consecutive epochs

% Calculate the number of samples per epoch
samplingRate = 500;  % Sampling rate of the EEG data (in Hz)
samplesPerEpoch = epochDuration * samplingRate;

% Calculate the number of samples to overlap between epochs
overlapSamples = epochOverlap * samplingRate;

% Calculate the number of epochs
numEpochs = floor((length(eegData) - samplesPerEpoch) / (samplesPerEpoch - overlapSamples)) + 1;

% Initialize an empty matrix to store the segmented epochs
segmentedData = zeros(samplesPerEpoch, numEpochs);

% Segment the EEG data into epochs
for i = 1:numEpochs
    startIndex = (i - 1) * (samplesPerEpoch - overlapSamples) + 1;
    endIndex = startIndex + samplesPerEpoch - 1;
    segmentedData(:, i) = eegData(startIndex:endIndex);
end

% The segmentedData matrix now contains each epoch as a column vector
% You can further process or analyze each epoch as needed


