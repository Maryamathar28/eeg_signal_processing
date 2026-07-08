clc
clear all
close all

% Load EEG data for the pre and post conditions 
load('C:\Users\abc\Desktop\Maryam\qEEG Conducted\POST\SET FILES\SET FILES.mat');
load('C:\Users\abc\Desktop\Maryam\qEEG Conducted\POST\SET FILES\SET FILES.mat');

%load channel location file
load('channellocs14.mat');

%PLOT PRE, POST
std_chantopo({POST.rp_alpha_mean_all_subj;}, 'chanlocs', channellocsdata, 'titles', {'ALPHA'})
std_chantopo({POST.rp_beta_mean_all_subj;}, 'chanlocs', channellocsdata, 'titles', {'BETA'})
std_chantopo({POST.rp_gamma_mean_all_subj;}, 'chanlocs', channellocsdata, 'titles', {'GAMMA'})
std_chantopo({POST.rp_theta_mean_all_subj;}, 'chanlocs', channellocsdata, 'titles', {'THETA'})
std_chantopo({POST.rp_delta_mean_all_subj;}, 'chanlocs', channellocsdata, 'titles', {'DELTA'})

%PRE_ttest(unpaired)

for ch = 1:14;
    [h,p,ci,tstat] = ttest2(POST.rp_lower_beta_mean(:, ch), POST.rp_lower_beta_mean(:,ch), 'Alpha', 0.05);
    P_val_PRE{ch} = p;
    h_val_PRE{ch} = h;
    t_stat_PRE{ch} = tstat;
end

%POST_ttest(unpaired)
for ch = 1:14;
    [h,p,ci,tstat] = ttest2(POST.rp_lower_beta_mean(:, ch), POST.rp_lower_beta_mean(:,ch), 'Alpha', 0.05);
    P_val_POST{ch} = p;
    h_val_POST{ch} = h;
    t_stat_POST{ch} = tstat;
end

%PRE_ttest(paired)
for ch = 1:14;
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

std_chantopo({cell2mat(h_val_POST(:,:))},'chanlocs', channellocsdata, 'titles', {'G1 Pre v/s G2 Pre'})
std_chantopo({cell2mat(h_val_PRE(:,:))},'chanlocs', channellocsdata, 'titles', {'G1 Post v/s G2 Post'})
% std_chantopo({cell2mat(h_val_G1_Pre_Post(:,:))},'chanlocs', a, 'titles', {'G1 Pre v/s G1 Post'})
% std_chantopo({cell2mat(h_val_G2_Pre_Post(:,:))},'chanlocs', a, 'titles', {'G2 Pre v/s G2 Post'})
% 
