# swaroop
# BT18ECE059
# Separating RGB Components

clc;clear all;close all;

I = imread("lena.tif"); #Importing the Image
r = I;
r(:,:,2) = 0;
r(:,:,3) = 0; #Making Zero Blue and Green Component
g = I;
g(:,:,1) = 0;
g(:,:,3) = 0; #Making Zero Red and Blue Component
b = I;
b(:,:,1) = 0;
b(:,:,2) = 0; #Making Zero Red and Green Component

imshow(I);
figure(1);
imshow(r); #Showing Image with only Red Component
figure(2);
imshow(g); #Showing Image with only Green Component
figure(3);
imshow(b); #Showing Image with only Blue Component