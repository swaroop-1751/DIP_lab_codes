# swaroop
# BT18ECE059
# Watermarking

clc; clear all; close all;

I = rgb2gray(imread("swaroop.jpg")); #Importing the Image
I = imresize(I, 0.5); #Resizing Image
imshow(I); #Showing Image
WM = imread('WM.png'); #Importing WaterMark Image
WM = padarray(WM, 213, 0,'pre');

# Bit Slicing
I_BitSliced = bitand(I, 248); # Take first 5 MSB bits
WM_BitSliced = bitsrl(WM, 5); # Take first 3 MSB bits
Final_I = bitor(I_BitSliced, WM_BitSliced);

figure(1);
imshow(Final_I); #showing image

# Recovering the Watermark
Recovered_WM = bitsll(Final_I, 5); #Recovering Watermark
figure(2);
imshow(Recovered_WM); #Showing Watermark

# DWT2
[eAI, eHI, eVI, eDI] = dwt2(I, 'haar');
[eAWM, eHWM, eVWM, eDWM] = dwt2(WM, 'haar');

eA = 0.8*eAI + 0.2*eAWM;
Final_WMImage = idwt2(eA, eHI, eVI, eDI, 'haar');
figure(3);
imshow(uint8(Final_WMImage)); #Final Watermark Image

# Recovering the watermark
[eA, eH, eV, eD] = dwt2(Final_WMImage, 'haar');
eA = (eA - 0.8*eAI)/0.2;
Final_RI = idwt2(eA, eHWM, eVWM, cDWM, 'haar'); #Final Recovered Image
figure(4);
imshow(uint8(Final_RI)); #Showing Final Recovered Image