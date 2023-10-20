clear all

load('D:\Neurofeedback 2\Results\feature_new\G1_Pre_EO_NR.mat');
load('D:\Neurofeedback 2\Results\feature_new\G2_Pre_EO_NR.mat');
load('D:\Neurofeedback 2\Results\feature_new\G1_Post_EO_NR.mat');
load('D:\Neurofeedback 2\Results\feature_new\G2_Post_EO_NR.mat');
load('locs38.mat');

%PLOT G1_PRE, G2_PRE, G1_POST, G2_POST
std_chantopo({G1_Pre_EO_NR.rp_lower_beta_mean_all_subj G2_Pre_EO_NR.rp_lower_beta_mean_all_subj; G1_Post_EO_NR.rp_lower_beta_mean_all_subj G2_Post_EO_NR.rp_lower_beta_mean_all_subj;}, 'chanlocs', a, 'titles', {'G1 Pre', 'G2 Pre'; 'G1 Post', 'G2 Post'})
