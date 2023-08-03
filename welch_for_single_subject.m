clear all
% Load the .set file
EEG= pop_loadset('S15_EO_POST_NR.set');

% Extract the EEG data as a numeric array for .set file
eeg_data = {};
eeg_data= EEG.data;

% Welch, Topoplots and Relative Spectrum of all
fs = 500;
windowLength = fs*4; % for 4 sec window
noverlap = windowLength/2; % for 50% overlap
nfft = windowLength;

for i = 1:size(eeg_data, 1)  
end
    for j=1:38;
   
        [S15_EO_power(j,:),f] = pwelch(eeg_data(j,:),windowLength,noverlap,nfft,fs);
        p(i,j,:) = S15_EO_power(j,:);
        delta = find(f>=0 & f<4);
        theta = find(f>=4 & f<8);
        alpha = find(f>=8 & f<12);
        lower_alpha = find(f>=8 & f<10);
        upper_alpha = find(f>=10 & f<12);
        beta = find(f>=12 & f<30);
        lower_beta = find(f>=12 & f<18);
        mid_beta = find(f>=18 & f<21);
        upper_beta = find(f>=21 & f<30);
        gamma = find(f>=30 & f<200);
        meanallchan(i,j,:) = mean(p(i,j,:));
        relativepower(i,j,:) = p(i,j,:)/meanallchan(i,j,:);
               
        %Relative EEG Bands
        rp_delta (i,j,:) = relativepower (i,j,delta(:,:));
        rp_theta (i,j,:) = relativepower (i,j,theta(:,:));
        rp_alpha (i,j,:) = relativepower (i,j,alpha(:,:));
        rp_lower_alpha (i,j,:) = relativepower (i,j,lower_alpha(:,:));
        rp_upper_alpha (i,j,:) = relativepower (i,j,upper_alpha(:,:));
        rp_beta (i,j,:) = relativepower (i,j,beta(:,:));
        rp_lower_beta (i,j,:) = relativepower (i,j,lower_beta(:,:));
        rp_mid_beta (i,j,:) = relativepower (i,j,mid_beta(:,:));
        rp_upper_beta (i,j,:) = relativepower (i,j,upper_beta(:,:));
        rp_gamma (i,j,:) = relativepower (i,j,gamma(:,:));
        
        %Relative EEG Bands mean (subject wise)
        rp_delta_mean(i,j,:) = mean(relativepower (i,j,delta(:,:)));
        rp_theta_mean(i,j,:) = mean(relativepower (i,j,theta(:,:)));
        rp_alpha_mean(i,j,:) = mean(relativepower (i,j,alpha(:,:)));
        rp_lower_alpha_mean(i,j,:) = mean(relativepower (i,j,lower_alpha(:,:)));
        rp_upper_alpha_mean(i,j,:) = mean(relativepower (i,j,upper_alpha(:,:)));
        rp_beta_mean(i,j,:) = mean(relativepower (i,j,beta(:,:)));
        rp_lower_beta_mean(i,j,:) = mean(relativepower (i,j,lower_beta(:,:)));
        rp_mid_beta_mean(i,j,:) = mean(relativepower (i,j,mid_beta(:,:)));
        rp_upper_beta_mean(i,j,:) = mean(relativepower (i,j,upper_beta(:,:)));
        rp_gamma_mean(i,j,:) = mean(relativepower (i,j,gamma(:,:)));
        
        %Relative EEG Bands mean (all subject)
        rp_delta_mean_all_subj = mean(rp_delta_mean);
        rp_theta_mean_all_subj = mean(rp_theta_mean);
        rp_alpha_mean_all_subj = mean(rp_alpha_mean);
        rp_lower_alpha_mean_all_subj = mean(rp_lower_alpha_mean);
        rp_upper_alpha_mean_all_subj = mean(rp_upper_alpha_mean);
        rp_beta_mean_all_subj = mean(rp_beta_mean);
        rp_lower_beta_mean_all_subj = mean(rp_lower_beta_mean);
        rp_mid_beta_mean_all_subj = mean(rp_mid_beta_mean);
        rp_upper_beta_mean_all_subj = mean(rp_upper_beta_mean);
        rp_gamma_mean_all_subj = mean(rp_gamma_mean);
    end



p_new = permute(p,[2, 3, 1]);

% S1.name = sub_S1; 
S15.power = p;
S15.p = p_new;
S15.freq = f;
S15.meanallchan = meanallchan;
S15.relativepower = relativepower;
S15.rp_delta = rp_delta;
S15.rp_theta = rp_theta;
S15.rp_alpha = rp_alpha;
S15.rp_lower_alpha = rp_lower_alpha;
S15.rp_upper_alpha = rp_upper_alpha;
S15.rp_beta = rp_beta;
S15.rp_lower_beta = rp_lower_beta;
S15.rp_mid_beta = rp_mid_beta;
S15.rp_upper_beta = rp_upper_beta;
S15.rp_gamma = rp_gamma;
S15.rp_delta_mean = rp_delta_mean;
S15.rp_theta_mean = rp_theta_mean;
S15.rp_alpha_mean = rp_alpha_mean;
S15.rp_lower_alpha_mean = rp_lower_alpha_mean;
S15.rp_upper_alpha_mean = rp_upper_alpha_mean;
S15.rp_beta_mean = rp_beta_mean;
S15.rp_lower_beta_mean = rp_lower_beta_mean;
S15.rp_mid_beta_mean = rp_mid_beta_mean;
S15.rp_upper_beta_mean = rp_upper_beta_mean;
S15.rp_gamma_mean = rp_gamma_mean;
S15.rp_delta_mean_all_subj = rp_delta_mean_all_subj;
S15.rp_theta_mean_all_subj = rp_theta_mean_all_subj;
S15.rp_alpha_mean_all_subj = rp_alpha_mean_all_subj;
S15.rp_lower_alpha_mean_all_subj = rp_lower_alpha_mean_all_subj;
S15.rp_upper_alpha_mean_all_subj = rp_upper_alpha_mean_all_subj;
S15.rp_beta_mean_all_subj = rp_beta_mean_all_subj;
S15.rp_lower_beta_mean_all_subj = rp_lower_beta_mean_all_subj;
S15.rp_mid_beta_mean_all_subj = rp_mid_beta_mean_all_subj;
S15.rp_upper_beta_mean_all_subj = rp_upper_beta_mean_all_subj;
S15.rp_gamma_mean_all_subj = rp_gamma_mean_all_subj;

save('D:\Neurofeedback 2\Group_01_AudioVisual\G1_QEEG_NR\POST_QEEG\EO\noise removal\New folder\S15_EO_power.mat', 'S15_EO_power');  % Save the PSD data
%save('D:\Neurofeedback 2\Group_01_AudioVisual\G1_QEEG_NR\POST_QEEG\EO\noise removal\New folder\f.mat', 'f');  % Save the frequency data
%save('D:\Neurofeedback 2\Group_01_AudioVisual\G1_QEEG_NR\POST_QEEG\EO\noise removal\New folder\S1_EO_NR', 'S1_EO_NR')

% plot(f(1:1001,1), (power(1:38,1:1001)))
% xlabel frequency
% ylabel power
% title 'G1 PRE EO'

% figure;
% plot(f(1:1001), 10*log10(post_power(1:38,1:1001)));
% xlabel('Frequency');
% ylabel('Power');
% title('Power Spectrum for G1 POST EO NR');
% 
% % Add a legend for each channel
% channel_names = cell(1, 38);
% for i = 1:38
%     channel_names{i} = sprintf('Channel %d', i);  % Replace with actual channel names if available
% end
% legend(channel_names);
