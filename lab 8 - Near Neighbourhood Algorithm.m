# swaroop
# BT18ECE059
# Near Neighbourhood Algorithm

clc;clear all;close all;

Image = imread("lena.tif"); #Importing the Image
Image = rgb2gray(Image); #Converting coloured Image to Gray
imshow(Image); #Displaying Original Image
title("Original_Image");

# Padding zeros 
Hori = size(Image,1); 
Wide = size(Image,2); 

padded_i = [zeros(Hori,1),Image,zeros(Hori,1)];
padded_i = [zeros(1,Wide+2);padded_i;
zeros(1,Wide+2)];

# Near Neighbourhood Algorithm

Image_New = zeros(Hori,Wide);
for r = 1:Hori
    for c = 1:Wide
        r_init = r+1; 
        c_init = c+1;
        
        cur_pixel = padded_i(r_init,c_init);
                
        N_Pixel = 1*(cur_pixel<padded_i(r_init,c_init+1))+...
            2*(cur_pixel<padded_i(r_init-1,c_init+1))+...
            4*(cur_pixel<padded_i(r_init-1,c_init))+...
            8*(cur_pixel<padded_i(r_init-1,c_init-1))+...
            16*(cur_pixel<padded_i(r_init,c_init-1))+...
            32*(cur_pixel<padded_i(r_init+1,c_init-1))+...
            64*(cur_pixel<padded_i(r_init+1,c_init))+...
            128*(cur_pixel<padded_i(r_init+1,c_init+1)); 
        
        Image_New(r,c) = N_Pixel; #New Image
    end
end
Image_New = uint8(Image_New); #Converting into uint
# Plotting Image

figure(2);
imshow(Image_New); #showing image after Applying Algorithm
title("Image on Applying Algorithm");