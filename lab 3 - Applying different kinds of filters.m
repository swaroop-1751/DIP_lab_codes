# swaroop
# BT18ECE059
# Applying different kinds of Filters.

clc; clear all; close all;

I = imread('swaroop.jpg'); #Importing the Image
I = imresize(I, 0.5); #Resizing Image
I = rgb2gray(I); #Converting coloured image to gray
figure(1); 
imshow(I); #showing image

# Filter Designing

HPF = [-1,-1,-1;-1,8,-1;-1,-1,-1];
#This is a simple Laplacian Mask 

LPF = [1,1,1;1,1,1;1,1,1] .* (1/9);
#This is a averaging filter mask 

# Applying the Filters

I_HPF = conv2(I,HPF);
I_LPF = conv2(I,LPF);
figure(2);
subplot(121); 
imshow(uint8(I_HPF)); #plotting after applying Laplacian Mask
subplot(122); 
imshow(uint8(I_LPF)); #plotting after applying Average Filtering Mask