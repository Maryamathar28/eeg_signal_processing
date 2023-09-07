clear all
clc

% Load the .set file
EEG= pop_loadset('S28_EO_POST_NR.set');

% Extract the EEG data as a numeric array for .set file
eeg_data = {};
eeg_data= EEG.data;

% Welch, Topoplots and Relative Spectrum of all
fs = 500;
windowLength = fs*4; % for 4 sec window
noverlap = windowLength/2; % for 50% overlap
nfft = windowLength;


    for j=1:38;
   
        [S27_EO_post_power(j,:),f] = pwelch(eeg_data(j,:),windowLength,noverlap,nfft,fs);
        p(j,:) = S27_EO_post_power(j,:);
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
        meanallchan(j,:) = mean(p(j,:));
        relativepower(j,:) = p(j,:)/meanallchan(j);
               
        %Relative EEG Bands
        rp_delta (j,:) = relativepower (j,delta(1:end,1));
        
        rp_theta (j,:) = relativepower (j,theta(:,:));
        rp_alpha (j,:) = relativepower (j,alpha(:,:));
        rp_lower_alpha (j,:) = relativepower (j,lower_alpha(:,:));
        rp_upper_alpha (j,:) = relativepower (j,upper_alpha(:,:));
        rp_beta (j,:) = relativepower (j,beta(:,:));
        rp_lower_beta (j,:) = relativepower (j,lower_beta(:,:));
        rp_mid_beta (j,:) = relativepower (j,mid_beta(:,:));
        rp_upper_beta (j,:) = relativepower (j,upper_beta(:,:));
        rp_gamma (j,:) = relativepower (j,gamma(:,:));
        
        %Relative EEG Bands mean (subject wise)
        rp_delta_mean(j,:) = mean(relativepower (j,delta(:,:)));
        rp_theta_mean(j,:) = mean(relativepower (j,theta(:,:)));
        rp_alpha_mean(j,:) = mean(relativepower (j,alpha(:,:)));
        rp_lower_alpha_mean(j,:) = mean(relativepower (j,lower_alpha(:,:)));
        rp_upper_alpha_mean(j,:) = mean(relativepower (j,upper_alpha(:,:)));
        rp_beta_mean(j,:) = mean(relativepower (j,beta(:,:)));
        rp_lower_beta_mean(j,:) = mean(relativepower (j,lower_beta(:,:)));
        rp_mid_beta_mean(j,:) = mean(relativepower (j,mid_beta(:,:)));
        rp_upper_beta_mean(j,:) = mean(relativepower (j,upper_beta(:,:)));
        rp_gamma_mean(j,:) = mean(relativepower (j,gamma(:,:)));
        
%         %Relative EEG Bands mean (all subject)
%         rp_delta_mean_all_subj = mean(rp_delta_mean);
%         rp_theta_mean_all_subj = mean(rp_theta_mean);
%         rp_alpha_mean_all_subj = mean(rp_alpha_mean);
%         rp_lower_alpha_mean_all_subj = mean(rp_lower_alpha_mean);
%         rp_upper_alpha_mean_all_subj = mean(rp_upper_alpha_mean);
%         rp_beta_mean_all_subj = mean(rp_beta_mean);
%         rp_lower_beta_mean_all_subj = mean(rp_lower_beta_mean);
%         rp_mid_beta_mean_all_subj = mean(rp_mid_beta_mean);
%         rp_upper_beta_mean_all_subj = mean(rp_upper_beta_mean);
%         rp_gamma_mean_all_subj = mean(rp_gamma_mean);
    end



%S15.name = sub_name; 
S27_EO_post.power = p;
%S15.p = p_new;
S27_EO_post.freq = f;
S27_EO_post.meanallchan = meanallchan;
S27_EO_post.relativepower = relativepower;
S27_EO_post.rp_delta = rp_delta;
S27_EO_post.rp_theta = rp_theta;
S27_EO_post.rp_alpha = rp_alpha;
S27_EO_post.rp_lower_alpha = rp_lower_alpha;
S27_EO_post.rp_upper_alpha = rp_upper_alpha;
S27_EO_post.rp_beta = rp_beta;
S27_EO_post.rp_lower_beta = rp_lower_beta;
S27_EO_post.rp_mid_beta = rp_mid_beta;
S27_EO_post.rp_upper_beta = rp_upper_beta;
S27_EO_post.rp_gamma = rp_gamma;
S27_EO_post.rp_delta_mean = rp_delta_mean;
S27_EO_post.rp_theta_mean = rp_theta_mean;
S27_EO_post.rp_alpha_mean = rp_alpha_mean;
S27_EO_post.rp_lower_alpha_mean = rp_lower_alpha_mean;
S27_EO_post.rp_upper_alpha_mean = rp_upper_alpha_mean;
S27_EO_post.rp_beta_mean = rp_beta_mean;
S27_EO_post.rp_lower_beta_mean = rp_lower_beta_mean;
S27_EO_post.rp_mid_beta_mean = rp_mid_beta_mean;
S27_EO_post.rp_upper_beta_mean = rp_upper_beta_mean;
S27_EO_post.rp_gamma_mean = rp_gamma_mean;
% S15.rp_delta_mean_all_subj = rp_delta_mean_all_subj;
% S15.rp_theta_mean_all_subj = rp_theta_mean_all_subj;
% S15.rp_alpha_mean_all_subj = rp_alpha_mean_all_subj;
% S15.rp_lower_alpha_mean_all_subj = rp_lower_alpha_mean_all_subj;
% S15.rp_upper_alpha_mean_all_subj = rp_upper_alpha_mean_all_subj;
% S15.rp_beta_mean_all_subj = rp_beta_mean_all_subj;
% S15.rp_lower_beta_mean_all_subj = rp_lower_beta_mean_all_subj;
% S15.rp_mid_beta_mean_all_subj = rp_mid_beta_mean_all_subj;
% S15.rp_upper_beta_mean_all_subj = rp_upper_beta_mean_all_subj;
% S15.rp_gamma_mean_all_subj = rp_gamma_mean_all_subj;

save('D:\Neurofeedback 2\Group_02_Visual\QEEG Data_G2\G2_power_vs_freq\S27_EO_post_power.mat', 'S27_EO_post_power');  % Save the PSD data
 save('D:\Neurofeedback 2\Group_02_Visual\QEEG Data_G2\G2_power_vs_freq\f.mat', 'f');  % Save the frequency data
% save('D:\Neurofeedback 2\Group_01_AudioVisual\G1_QEEG_NR\POST_QEEG\EO\noise removal\wrong_Subj_welch\wrong_post_eo\feature_wrong\wrong_post_EO', 'wrong_post_EO')
save('D:\Neurofeedback 2\Group_02_Visual\QEEG Data_G2\G2_power_vs_freq\S27_EO_post', 'S27_EO_post')

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

        
