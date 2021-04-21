# swaroop
# BT18ECE059
# Edge Detection using Sobel

clc; clear all; close all;

I = imread('swaroop.jpg'); #Importing the Image
I = imresize(I, 0.5); #Resizing Image
I = rgb2gray(I); #Converting coloured Image to Gray
figure(1); 
imshow(I); #showing image

# Edges using Sobel

EdgeDetection_Sobel = edge(I,'sobel');
figure(4);
imshow(EdgeDetection_Sobel); #Showing Image
title("Edge Detection using Sobel");