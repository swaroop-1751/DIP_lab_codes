# swaroop
# BT18ECE059
# Edge Detection using DWT2

clc; clear all; close all;

I = imread('swaroop.jpg'); #Importing the Image
I = imresize(I, 0.5); #Resizing Image
I = rgb2gray(I); #Converting coloured Image to Gray
figure(1); 
imshow(I); #showing image

# Edges using DWT2

[eA, eH, eV, eD] = dwt2(I,'haar');

figure(2);
subplot(221); 
imshow(uint8(eA)); #showing image
subplot(222); 
imshow(uint8(eH)); #showing image
subplot(223); 
imshow(uint8(eV)); #showing image
subplot(224); 
imshow(uint8(eD)); #showing image

