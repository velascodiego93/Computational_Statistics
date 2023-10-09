# EJERCICIO 3
clc
close all
clear all
pkg load statistics

# Data definition
datos = [60 61 65 67 70 70 74 76 76 77 78 78 79 80 81 81 83 83 84 84 85 86 86 86 87 87 87 88 88 88 89 89 90 90 90 91 91 91 92 92 92 93 93 93 93 93 93 94 94 94];
datos = [datos, 95 96 96 97 99 99 99 99 100 100 100 101 101 102 102 102 103 103 103 103 104 105 106 106 106 107 107 108 108 108 109];
datos = [datos, 110 110 110 110 110 110 111 111 111 112 112 112 112 113 113 113 115 115 115 116 116 116 117 117 117 117 117 118 118 119];
datos = [datos, 121 121 122 122 123 124 124 125 126 126 127 128 129 130 130 133 133 135 136 136 138 140 141];

# Frequencies table
freq = [];
for i = 1:length(unique(datos))
    freq(i) = size(find(datos == (unique(datos))(i)))(2);
end

freq_table = horzcat(unique(datos)', freq')

# Frequencies
#[counts, edges] = hist (datos, nbins = 40); # histogram
#rel_freqs = counts/sum(counts)

# Histogram
#subplot(1,2,1)
#bar(edges, rel_freqs)
#title('Histogram (relative frequencies)', 'fontsize', 35) # plot title
#ylim([0, 0.08]) # set limit for y axis
#set(gca, 'fontsize', 35) # set axis fontsize
#ylabel('Relative frequencies', 'fontsize', 35, 'fontweight', 'bold') # set ylabel
#xlabel('Data', 'fontsize', 35, 'fontweight', 'bold') # set xlabel
#grid

# Histogram
#subplot(1,2,2)
hist (datos, nbins = 40)
title('Histogram (counts)', 'fontsize', 35) # plot title
ylim([0, 10]) # set limit for y axis
set(gca, 'fontsize', 35) # set axis fontsize
ylabel('Count', 'fontsize', 35, 'fontweight', 'bold') # set ylabel
xlabel('Data', 'fontsize', 35, 'fontweight', 'bold') # set xlabel
grid


    