# swaroop
# BT18ECE059
# Basic image operations
clc;
clear;
close all;

i = imread ("swaroop.jpg"); #reading image

[x1,y1,z1] = size(i); #size of image

[i,cmap] = imread("swaroop.jpg"); 
gray_map = rgb2gray(i);#RGB to GraySCALE Image.
imshow(gray_map); #showing image.

j = [0:10]; #creating a matrix of 1*11 with values 0 to 10
R = ones(1,11);
im = j'*R; #multipling transpose of j with row matrix 
#having 11 times 1.
imshow(im,[]); #intensity.

I1 = gray_map'; #rotating image.
figure;
imshow(I1); #rotated image.

imf=imfinfo('swaroop.jpg'); #To determine the details of image.

pixelValue = i(3,3); #getting pixel value.
sprintf('the value of the pixel is %d',pixelValue);

rgb = i(4,18,:); #this commond will return rgb color value of the pixel 4,16
R = rgb(:,:,1); #to see the value of red color.
G = rgb(:,:,2); #to see the value of green color.
B = rgb(:,:,3); #to see the value of blue color.



