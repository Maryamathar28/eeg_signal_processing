clear all
clc

load('D:\Neurofeedback 2\Group_01_AudioVisual\G1_QEEG_NR\NOISE REMOVAL_G1\EO_FEATURE\feature_without_S9\f.mat');
load('D:\Neurofeedback 2\Group_01_AudioVisual\G1_QEEG_NR\NOISE REMOVAL_G1\EO_FEATURE\feature_without_S9\G1_pre_EO_power.mat');
load('D:\Neurofeedback 2\Group_01_AudioVisual\G1_QEEG_NR\NOISE REMOVAL_G1\EO_FEATURE\feature_without_S9\G1_post_EO_power.mat');

frequencies = f;
EO_pre_power_data = G1_pre_EO_power;
EO_post_power_data = G1_post_EO_power;

figure;

%channel Fc3
subplot(3,3,1)
channel_index = 10;
EO_pre_power_spectrum = EO_pre_power_data(channel_index, :);
EO_post_power_spectrum = EO_post_power_data(channel_index, :);

plot(frequencies(1:1001,1), 10*log10(EO_pre_power_spectrum), 'b', 'LineWidth', 2);
hold on;
plot(frequencies(1:1001,1), 10*log10(EO_post_power_spectrum), 'r', 'LineWidth', 2);

title(['Power vs. Frequency Spectrum for Channel (Fc3)', num2str(channel_index)]);
xlabel('Frequency');
ylabel('Power');
xlim([0 40]);
legend ('PRE', 'POST')

%channel Fcz
subplot(3,3,2)
channel_index = 11;
EO_pre_power_spectrum = EO_pre_power_data(channel_index, :);
EO_post_power_spectrum = EO_post_power_data(channel_index, :);

plot(frequencies(1:1001,1), 10*log10(EO_pre_power_spectrum), 'b', 'LineWidth', 2);
hold on;
plot(frequencies(1:1001,1), 10*log10(EO_post_power_spectrum), 'r', 'LineWidth', 2);

title(['Power vs. Frequency Spectrum for Channel (Fcz)', num2str(channel_index)]);
xlabel('Frequency');
ylabel('Power');
xlim([0 40]);
legend ('PRE', 'POST')

%channel Fc4
subplot(3,3,3)
channel_index = 12;
EO_pre_power_spectrum = EO_pre_power_data(channel_index, :);
EO_post_power_spectrum = EO_post_power_data(channel_index, :);

plot(frequencies(1:1001,1), 10*log10(EO_pre_power_spectrum), 'b', 'LineWidth', 2);
hold on;
plot(frequencies(1:1001,1), 10*log10(EO_post_power_spectrum), 'r', 'LineWidth', 2);

title(['Power vs. Frequency Spectrum for Channel (Fc4)', num2str(channel_index)]);
xlabel('Frequency');
ylabel('Power');
xlim([0 40]);
legend ('PRE', 'POST')

%channel C3
subplot(3,3,4)
channel_index = 15;
EO_pre_power_spectrum = EO_pre_power_data(channel_index, :);
EO_post_power_spectrum = EO_post_power_data(channel_index, :);

plot(frequencies(1:1001,1), 10*log10(EO_pre_power_spectrum), 'b', 'LineWidth', 2);
hold on;
plot(frequencies(1:1001,1), 10*log10(EO_post_power_spectrum), 'r', 'LineWidth', 2);

title(['Power vs. Frequency Spectrum for Channel (C3)', num2str(channel_index)]);
xlabel('Frequency');
ylabel('Power');
xlim([0 40]);
legend ('PRE', 'POST')

%channel Cz
subplot(3,3,5)
channel_index = 16;
EO_pre_power_spectrum = EO_pre_power_data(channel_index, :);
EO_post_power_spectrum = EO_post_power_data(channel_index, :);

plot(frequencies(1:1001,1), 10*log10(EO_pre_power_spectrum), 'b', 'LineWidth', 2);
hold on;
plot(frequencies(1:1001,1), 10*log10(EO_post_power_spectrum), 'r', 'LineWidth', 2);

title(['Power vs. Frequency Spectrum for Channel (Cz)', num2str(channel_index)]);
xlabel('Frequency');
ylabel('Power');
xlim([0 40]);
legend ('PRE', 'POST')

%channel C4
subplot(3,3,6)
channel_index = 17;
EO_pre_power_spectrum = EO_pre_power_data(channel_index, :);
EO_post_power_spectrum = EO_post_power_data(channel_index, :);

plot(frequencies(1:1001,1), 10*log10(EO_pre_power_spectrum), 'b', 'LineWidth', 2);
hold on;
plot(frequencies(1:1001,1), 10*log10(EO_post_power_spectrum), 'r', 'LineWidth', 2);

title(['Power vs. Frequency Spectrum for Channel (C4)', num2str(channel_index)]);
xlabel('Frequency');
ylabel('Power');
xlim([0 40]);
legend ('PRE', 'POST')

%channel P3
subplot(3,3,7)
channel_index = 26;
EO_pre_power_spectrum = EO_pre_power_data(channel_index, :);
EO_post_power_spectrum = EO_post_power_data(channel_index, :);

plot(frequencies(1:1001,1), 10*log10(EO_pre_power_spectrum), 'b', 'LineWidth', 2);
hold on;
plot(frequencies(1:1001,1), 10*log10(EO_post_power_spectrum), 'r', 'LineWidth', 2);

title(['Power vs. Frequency Spectrum for Channel (P3)', num2str(channel_index)]);
xlabel('Frequency');
ylabel('Power');
xlim([0 40]);
legend ('PRE', 'POST')

%channel Pz
subplot(3,3,8)
channel_index = 27;
EO_pre_power_spectrum = EO_pre_power_data(channel_index, :);
EO_post_power_spectrum = EO_post_power_data(channel_index, :);

plot(frequencies(1:1001,1), 10*log10(EO_pre_power_spectrum), 'b', 'LineWidth', 2);
hold on;
plot(frequencies(1:1001,1), 10*log10(EO_post_power_spectrum), 'r', 'LineWidth', 2);

title(['Power vs. Frequency Spectrum for Channel (Pz)', num2str(channel_index)]);
xlabel('Frequency');
ylabel('Power');
xlim([0 40]);
legend ('PRE', 'POST')

%channel P4
subplot(3,3,9)
channel_index = 28;
EO_pre_power_spectrum = EO_pre_power_data(channel_index, :);
EO_post_power_spectrum = EO_post_power_data(channel_index, :);

plot(frequencies(1:1001,1), 10*log10(EO_pre_power_spectrum), 'b', 'LineWidth', 2);
hold on;
plot(frequencies(1:1001,1), 10*log10(EO_post_power_spectrum), 'r', 'LineWidth', 2);

title(['Power vs. Frequency Spectrum for Channel (P4)', num2str(channel_index)]);
xlabel('Frequency');
ylabel('Power');
xlim([0 40]);
legend ('PRE', 'POST')

sgtitle('G1 EO')

