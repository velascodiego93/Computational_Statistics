# EJERCICIO 1
clc
close all
clear all

pkg load statistics

# Data definition
left = [60 61 64 65 65 67 68 68 68 69 69 69 70 70 71 71 71 72 72 72 72 73 73 73 73 74 74 74 75 76 76 77 77 77 77 78 78 78 79 79 79 80 80 81 82 84 86 86];
right = [53 54 56 58 58 58 59 60 61 62 62 62 62 62 63 63 63 64 64 64 65 65 65 66 66 67 67 67 67 68 68 69 70 70 71 71 72 72 72 73 73 75 76 77 78 79 79 79 80 80 83 85 85 86];

# Create figure
figure;

# Left boxplot
subplot(1,2,1); # left plot
boxplot (left); # left boxplot
title('Año anterior', 'fontsize', 35) # plot title
xlim([0,2]) # set limit for x axis
ylim([min(left)-5,max(left)+5]) # set limit for y axis
set(gca, 'fontsize', 35) # set axis fontsize
ylabel('Count', 'fontsize', 35, 'fontweight', 'bold') # set ylabel
grid

# Right boxplot
subplot(1,2,2);
boxplot (right);
title('Año siguiente', 'fontsize', 35)
xlim([0,2])
ylim([min(right)-5,max(right)+5])
set(gca, 'fontsize', 35)
ylabel('Count', 'fontsize', 35, 'fontweight', 'bold')
grid



