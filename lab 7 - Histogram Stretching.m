# swaroop
# BT18ECE059
# Histogram Stretching

clc;clear;close all;

SMin = 10;
SMax = 255;

I = imread("lena.png");
I_gray = rgb2gray(I); #Converting coloured Image to Gray

[r c] = size(I_gray); #Size of above gray image
len = r * c; #Total pixels
I_Vector = I_gray(:); #Convert the matrix into vector
I_sort = sort(I_Vector); #Sort in ascending order

I_uniq = unique(I_sort); #Finding unique values
IMin = min(I_uniq);
IMax = max(I_uniq);

# Finding Slope
Slope = (SMax-SMin)./(IMax-IMin);
S_New = Slope.*(I_uniq-IMin)+SMin;

# Stretching
I_stretch = zeros(r,c);
for jj = 1:length(I_uniq)
I_stretch(I_gray == I_uniq(jj)) = S_New(jj);
end
I_stretch = uint8(I_stretch); #Stretched Image

figure;
subplot(2,2,1);
imshow(I_gray); #showing original image
title("Original Image");
subplot(2,2,2);
imshow(I_stretch); #showing stretched image
title("Stretched Image");
subplot(2,2,3);
histogram(I_gray); #showing Histogram of Original Image
title("Histogram of Original Image");
subplot(2,2,4);
histogram(I_stretch); #showing Histogram after Stretching
title("Histogram on Stretching");