%{
Simulate the MCML lookup table (for using different mua and mus to forward the phantom spectrum)
please compile a 'mus_to_sim.txt' in the output dir

Chien-Jung Chiu edited Benjamin Kao's code
Last update: 2025/09/25
%}

clc;clear;close all;

%% param
OP_dir='phantom1-6OPs';
mua_file='mua_in_mm-phantom1-6.csv';
musp_file='musp_in_mm-phantom1-6.csv';
num_phantom=6;
phantom_order = [1 6 5 2 3 4];

fontSize=18;
lineWidth=2;

%% preprocess param
mua_mm = table2array(readtable(fullfile(OP_dir,mua_file)));
musp_mm = table2array(readtable(fullfile(OP_dir,musp_file)));


%% main
legend_arr={};
for i=1:num_phantom
    legend_arr{i}=['phantom ' num2str(phantom_order(i))];
end

figure('Units','pixels','position',[0 0 1000 500]);
ti=tiledlayout('flow','TileSpacing','compact','Padding','none'); 

% mua
nexttile();
%temp_param=load(fullfile(OP_dir,mua_file));
plot(mua_mm(:,1),10*mua_mm(:,2:end),'LineWidth',lineWidth);
legend(legend_arr,'Location','northwest');
% title('\mu_a (1/cm)');
grid on;
xlabel('wavelength(nm)');
ylabel('\mu_a (1/cm)');
set(gca,'fontsize',fontSize, 'FontName', 'Times New Roman');

% musp
nexttile();
%temp_param=load(fullfile(OP_dir,mus_file));
plot(musp_mm(:,1),10*musp_mm(:,2:end),'LineWidth',lineWidth);
legend(legend_arr,'Location','northeast');
grid on;
xlabel('wavelength(nm)');
ylabel('\mu_s''(1/cm)');
set(gca,'fontsize',fontSize, 'FontName', 'Times New Roman');

print(fullfile(OP_dir,'plot_phantom_OP.png'),'-dpng','-r200');