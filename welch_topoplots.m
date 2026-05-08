clc;
clear;
close all;

%% ============================
% INPUT FOLDER
%% ============================
inFolder = 'C:\Users\abc\Desktop\Maryam\XLSX FILES\';

%% ============================
% OUTPUT FOLDER
%% ============================
outFolder = 'C:\Users\abc\Desktop\Maryam\Topoplots\new\';

if ~exist(outFolder, 'dir')
    mkdir(outFolder);
end

%% ============================
% CHANNEL LOCATIONS
%% ============================
load('channellocs14.mat');
chanlocs = channellocsdata;

nChans = length(chanlocs);

files = dir(fullfile(inFolder,'*.xlsx'));
fs = 500;

for i = 1:length(files)

    data = xlsread(fullfile(inFolder, files(i).name));

    [b,a] = butter(5,2/225,'high');
    data = filter(b,a,data);

    nDataChans = size(data,2);
    useChans = min(nChans, nDataChans);

    % ============================
    % INIT ALL BANDS
    % ============================
    Delta = zeros(1,nChans);
    Theta = zeros(1,nChans);
    Alpha = zeros(1,nChans);
    Beta  = zeros(1,nChans);
    Gamma = zeros(1,nChans);

    for j = 1:useChans

        sig = data(:,j);

        win = min(512,length(sig));
        noverlap = round(win/2);

        [Pxx,f] = pwelch(sig, hann(win), noverlap, win, fs);

        meanP = mean(Pxx);

        % ============================
        % FREQUENCY BANDS (CORRECT)
        % ============================
        Delta(j) = mean(Pxx(f>=1 & f<4 ))  / meanP;
        Theta(j) = mean(Pxx(f>=4   & f<8 ))  / meanP;
        Alpha(j) = mean(Pxx(f>=8   & f<12)) / meanP;
        Beta(j)  = mean(Pxx(f>=13  & f<30)) / meanP;
        Gamma(j) = mean(Pxx(f>=30  & f<45)) / meanP;

    end

    %% ============================
    % CLEAN DATA
    %% ============================
    Delta(isnan(Delta)) = 0;
    Theta(isnan(Theta)) = 0;
    Alpha(isnan(Alpha)) = 0;
    Beta(isnan(Beta))   = 0;
    Gamma(isnan(Gamma)) = 0;

    %% ============================
    % TOPOPLOT FIGURE (ALL BANDS)
    %% ============================
    fig = figure('Visible','off','Color','w');

    subplot(1,5,1);
    topoplot(Delta, chanlocs,'maplimits','maxmin','electrodes','on');
    title('Delta');

    subplot(1,5,2);
    topoplot(Theta, chanlocs,'maplimits','maxmin','electrodes','on');
    title('Theta');

    subplot(1,5,3);
    topoplot(Alpha, chanlocs,'maplimits','maxmin','electrodes','on');
    title('Alpha');

    subplot(1,5,4);
    topoplot(Beta, chanlocs,'maplimits','maxmin','electrodes','on');
    title('Beta');

    subplot(1,5,5);
    topoplot(Gamma, chanlocs,'maplimits','maxmin','electrodes','on');
    title('Gamma');

    sgtitle(files(i).name,'Interpreter','none');

    %% ============================
    % SAVE IMAGE
    %% ============================
    saveas(fig, fullfile(outFolder, [files(i).name '_ALL_BANDS.png']));

    close(fig);

end

disp('? All band topoplots generated and saved successfully!');