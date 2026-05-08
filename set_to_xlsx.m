clc;
clear;
close all;

%% ============================
% INPUT & OUTPUT FOLDERS
%% ============================
inFolder = 'C:\Users\abc\Desktop\Maryam\SET FILES\';
outFolder = 'C:\Users\abc\Desktop\Maryam\XLSX FILES\';

if ~exist(outFolder, 'dir')
    mkdir(outFolder);
end

%% ============================
% GET ALL .SET FILES
%% ============================
files = dir(fullfile(inFolder, '*.set'));

if isempty(files)
    error('No .set files found in input folder!');
end

%% ============================
% PROCESS ALL FILES
%% ============================
for i = 1:length(files)

    %% Load EEG
    EEG = pop_loadset('filename', files(i).name, 'filepath', inFolder);

    %% Extract data (channels × time)
    data = EEG.data;

    %% Convert to (time × channels)
    data_out = data';

    %% ============================
    % FIX CHANNEL NAMES (NO ERRORS)
    %% ============================
    chanNamesRaw = {EEG.chanlocs.labels};

    % Step 1: clean invalid characters
    chanNamesClean = matlab.lang.makeValidName(chanNamesRaw);

    % Step 2: fix duplicates
    chanNames = matlab.lang.makeUniqueStrings(chanNamesClean);

    %% ============================
    % CREATE TABLE
    %% ============================
    T = array2table(data_out);
    T.Properties.VariableNames = chanNames;

    %% ============================
    % SAVE XLSX FILE
    %% ============================
    outFile = fullfile(outFolder, [files(i).name(1:end-4) '_converted.xlsx']);
    writetable(T, outFile);

    fprintf('Saved: %s\n', outFile);

end

disp('? All .set files successfully converted to XLSX!');