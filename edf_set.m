clear all;
myFolder = 'C:\Users\Neurocomputation Lab\Desktop\wrong_data\wrong_data\';
Files_dir =dir(myFolder);
EEG.etc.eeglabvers = '2020.0'; % this tracks which version of EEGLAB is being used, you may ignore it
save_location = 'C:\Users\Neurocomputation Lab\Desktop\wrong_data\New folder';

matdata = {};
for k = 1:(length(Files_dir)-2)
    name = strcat(myFolder, Files_dir(k+2).name);
    EEG = pop_biosig(name,'channels',[1:38]);
    EEG.setname = Files_dir(k+2).name;
    EEG = pop_chanedit(EEG , 'lookup' , 'D:\MATLAB 2020\eeglab_current\eeglab_current\eeglab2020_0\plugins\dipfit\standard_BESA\standard-10-5-cap385.elp' , 'load',{'D:\MATLAB 2020\eeglab_current\eeglab_current\eeglab2020_0\sample_locs\Standard-10-10-Cap38.ced' , 'filetype' , 'autodetect'});
    %EEG_Data{k} = EEG;
    new_name = Files_dir(k+2).name;    
    pop_saveset(EEG, new_name(1: length(new_name)-4), save_location);
end
