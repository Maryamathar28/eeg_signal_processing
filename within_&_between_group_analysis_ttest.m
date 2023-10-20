clear all


% Load EEG data for the pre and post conditions for S1
load('D:\Neurofeedback 2\Results\feature_new\G1_Pre_EO_NR.mat');
load('D:\Neurofeedback 2\Results\feature_new\G2_Pre_EO_NR.mat');
load('D:\Neurofeedback 2\Results\feature_new\G1_Post_EO_NR.mat');
load('D:\Neurofeedback 2\Results\feature_new\G2_Post_EO_NR.mat');
load('locs38.mat');

%concatenate 
% c1= G2_Pre_EO_NR.rp_lower_beta_mean(1:2,:);
% c2= G2_Pre_EO_NR.rp_lower_beta_mean(4:7,:);
% c3= G2_Pre_EO_NR.rp_lower_beta_mean(9:14,:);
% c=cat(1,c1,c2,c3);
% d=mean(c);

%PLOT G1_PRE, G2_PRE, G1_POST, G2_POST
std_chantopo({G1_Pre_EO_NR.rp_lower_beta_mean_all_subj G2_Pre_EO_NR.rp_lower_beta_mean_all_subj; G1_Post_EO_NR.rp_lower_beta_mean_all_subj G2_Post_EO_NR.rp_lower_beta_mean_all_subj;}, 'chanlocs', a, 'titles', {'G1 Pre', 'G2 Pre'; 'G1 Post', 'G2 Post'})

%G1_G2_PRE_ttest(unpaired)
for ch = 1:38;
    [h,p,ci,tstat] = ttest2(G1_Pre_EO_NR.rp_lower_beta_mean(:, ch), G2_Pre_EO_NR.rp_lower_beta_mean(:,ch), 'Alpha', 0.05);
    P_val_G1_G2_Pre{ch} = p;
    h_val_G1_G2_Pre{ch} = h;
    t_stat_G1_G2_Pre{ch} = tstat;
end

%G1_G2_POST_ttest(unpaired)
for ch = 1:38;
    [h,p,ci,tstat] = ttest2(G1_Post_EO_NR.rp_lower_beta_mean(:, ch), G2_Post_EO_NR.rp_lower_beta_mean(:,ch), 'Alpha', 0.05);
    P_val_G1_G2_Post{ch} = p;
    h_val_G1_G2_Post{ch} = h;
    t_stat_G1_G2_Post{ch} = tstat;
end

%G1_PRE_POST_ttest(paired)
for ch = 1:38;
    [h,p,ci,tstat] = ttest2(G1_Pre_EO_NR.rp_lower_beta_mean(:, ch), G1_Post_EO_NR.rp_lower_beta_mean(:,ch), 'Alpha', 0.05);
    P_val_G1_Pre_Post{ch} = p;
    h_val_G1_Pre_Post{ch} = h;
    t_stat_G1_Pre_Post{ch} = tstat;
end

%G2_PRE_POST_ttest(paired)
for ch = 1:38;
    [h,p,ci,tstat] = ttest(G2_Pre_EO_NR.rp_lower_beta_mean(:, ch), G2_Post_EO_NR.rp_lower_beta_mean(:,ch), 'Alpha', 0.05);
    P_val_G2_Pre_Post{ch} = p;
    h_val_G2_Pre_Post{ch} = h;
    t_stat_G2_Pre_Post{ch} = tstat;
end

std_chantopo({cell2mat(h_val_G1_G2_Pre(:,:))},'chanlocs', a, 'titles', {'G1 Pre v/s G2 Pre'})
std_chantopo({cell2mat(h_val_G1_G2_Post(:,:))},'chanlocs', a, 'titles', {'G1 Post v/s G2 Post'})
std_chantopo({cell2mat(h_val_G1_Pre_Post(:,:))},'chanlocs', a, 'titles', {'G1 Pre v/s G1 Post'})
std_chantopo({cell2mat(h_val_G2_Pre_Post(:,:))},'chanlocs', a, 'titles', {'G2 Pre v/s G2 Post'})

%INDIVIDUAL SUBJECTS OF G1 PRE
std_chantopo({G1_Pre_EO_NR.rp_lower_beta_mean(1,:) G1_Pre_EO_NR.rp_lower_beta_mean(2,:) G1_Pre_EO_NR.rp_lower_beta_mean(3,:) G1_Pre_EO_NR.rp_lower_beta_mean(4,:); G1_Pre_EO_NR.rp_lower_beta_mean(5,:) G1_Pre_EO_NR.rp_lower_beta_mean(6,:) G1_Pre_EO_NR.rp_lower_beta_mean(7,:) G1_Pre_EO_NR.rp_lower_beta_mean(8,:); G1_Pre_EO_NR.rp_lower_beta_mean(9,:) G1_Pre_EO_NR.rp_lower_beta_mean(10,:) G1_Pre_EO_NR.rp_lower_beta_mean(11,:) G1_Pre_EO_NR.rp_lower_beta_mean(11,:);}, 'chanlocs', a, 'titles', {'S1', 'S2', 'S3', 'S4'; 'S5', 'S6', 'S7', 'S8'; 'S9', 'S10', 'S11', 'S11'})

%INDIVIDUAL SUBJECTS OF G1 POST
std_chantopo({G1_Post_EO_NR.rp_lower_beta_mean(1,:) G1_Post_EO_NR.rp_lower_beta_mean(2,:) G1_Post_EO_NR.rp_lower_beta_mean(3,:) G1_Post_EO_NR.rp_lower_beta_mean(4,:) G1_Post_EO_NR.rp_lower_beta_mean(5,:); G1_Post_EO_NR.rp_lower_beta_mean(6,:) G1_Post_EO_NR.rp_lower_beta_mean(7,:) G1_Post_EO_NR.rp_lower_beta_mean(8,:) G1_Post_EO_NR.rp_lower_beta_mean(9,:) G1_Post_EO_NR.rp_lower_beta_mean(10,:); G1_Post_EO_NR.rp_lower_beta_mean(11,:) G1_Post_EO_NR.rp_lower_beta_mean(12,:) G1_Post_EO_NR.rp_lower_beta_mean(13,:) G1_Post_EO_NR.rp_lower_beta_mean(14,:) G2_Post_EO_NR.rp_lower_beta_mean(15,:);}, 'chanlocs', a, 'titles', {'S1', 'S2', 'S3', 'S4', 'S5'; 'S6', 'S7', 'S8', 'S9', 'S10'; 'S11', 'S12', 'S13', 'S14', 'S15'})

%INDIVIDUAL SUBJECTS OF G2 PRE
std_chantopo({G2_Pre_EO_after_remove_S17.rp_lower_beta_mean(1,:) G2_Pre_EO_after_remove_S17.rp_lower_beta_mean(2,:) G2_Pre_EO_after_remove_S17.rp_lower_beta_mean(3,:) G2_Pre_EO_after_remove_S17.rp_lower_beta_mean(4,:) G2_Pre_EO_after_remove_S17.rp_lower_beta_mean(5,:) G2_Pre_EO_after_remove_S17.rp_lower_beta_mean(6,:); G2_Pre_EO_after_remove_S17.rp_lower_beta_mean(7,:) G2_Pre_EO_after_remove_S17.rp_lower_beta_mean(8,:) G2_Pre_EO_after_remove_S17.rp_lower_beta_mean(9,:) G2_Pre_EO_after_remove_S17.rp_lower_beta_mean(10,:) G2_Pre_EO_after_remove_S17.rp_lower_beta_mean(11,:) G2_Pre_EO_after_remove_S17.rp_lower_beta_mean(12,:);}, 'chanlocs', a, 'titles', {'S18', 'S19', 'S21', 'S22', 'S24', 'S27'; 'S28', 'S29', 'S30', 'S31', 'S33', 'S35'})

%INDIVIDUAL SUBJECTS OF G2 POST
std_chantopo({G2_Post_EO_NR.rp_lower_beta_mean(1,:) G2_Post_EO_NR.rp_lower_beta_mean(2,:) G2_Post_EO_NR.rp_lower_beta_mean(3,:) G2_Post_EO_NR.rp_lower_beta_mean(4,:) G2_Post_EO_NR.rp_lower_beta_mean(5,:) G2_Post_EO_NR.rp_lower_beta_mean(6,:) G2_Post_EO_NR.rp_lower_beta_mean(7,:) G2_Post_EO_NR.rp_lower_beta_mean(8,:) G2_Post_EO_NR.rp_lower_beta_mean(9,:) G2_Post_EO_NR.rp_lower_beta_mean(10,:) G2_Post_EO_NR.rp_lower_beta_mean(11,:) G2_Post_EO_NR.rp_lower_beta_mean(12,:) G2_Post_EO_NR.rp_lower_beta_mean(13,:) G2_Post_EO_NR.rp_lower_beta_mean(14,:)}, 'chanlocs', a, 'titles', {'S17', 'S18', 'S19', 'S21', 'S22', 'S24', 'S27', 'S28', 'S29', 'S30', 'S31', 'S33', 'S35', 'S36'})

