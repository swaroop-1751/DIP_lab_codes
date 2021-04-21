# swaroop
# BT18ECE059
# DCT based Compression

clc; clear all; close all;

I=double((imread('swaroop.jpg'))); #Importing the Image

[x1,y1,d]=size(I); #Finding the size of an Image
a=min(x1,y1);

if(d>2)
    display("Image is coloured ")
else
    display("Image is grayscale ");
end

# First I select the threshold value for DCT coefficients
# For coloured Image I used threshold values of 4,40 and 400 
# Then For grayscale Images I used Threshold value of 20,70 and 90 

p = "Give the threshold value? ";
Threshold = input(p);

# For coloured images 

if(d==3)  
    
# Resizing the Image to make it square

I_sqr=(imresize(I,[a a]));

# Calculating the size of a square Image

[m2,n2]=size(I_sqr);

# Calculation of the DCT basis matrix

for m=1:m2
    for n=1:m2
        if(m==1)
          a(m,n)=sqrt(1/n2)*cos(((2*n-1)*(m-1)*pi)/(2*n2));
        else
          a(m,n)=sqrt(2/n2)*cos(((2*n-1)*(m-1)*pi)/(2*n2)); 
        end
    end
end

# Calculating the DCT coefficents 
DCT_R = a*I_sqr(:,:,1)*a';
DCT_G = a*I_sqr(:,:,2)*a';
DCT_B = a*I_sqr(:,:,3)*a';


# Truncating the DCT coefficients 

DCT_R(abs(DCT_R)<Threshold)=0;
DCT_G(abs(DCT_G)<Threshold)=0;
DCT_B(abs(DCT_B)<Threshold)=0;

DCT(:,:,1)=DCT_R;
DCT(:,:,2)=DCT_G;
DCT(:,:,3)=DCT_B;

# Reconstruction of the compressed Image 

I_Compress(:,:,1)=a'*DCT_R*a;
I_Compress(:,:,2)=a'*DCT_G*a;
I_Compress(:,:,3)=a'*DCT_B*a;

imwrite(uint8(I_Compress),"Compressed_I_Coloured.jpeg");

# Compression ratio

d_origin=imfinfo('tulip.jpeg');
size=d_origin.FileSize;
d_comp=imfinfo('Compressed_I_Coloured.jpeg');
size1=d_comp.FileSize;
Compression_ratio=floor(size/size1);

# Plotting 

imshow(uint8(I_sqr)),title("Original Image"); #showing Original Image
figure;
imshow(uint8(I_Compress)),title("Compressed Image"); #showing Compressed Image

# Putting the images 
imwrite(uint8(I_sqr),"original_image_colored.jpeg");
imwrite(uint8(I_Compress),"Compressed_I_Coloured.jpeg");

else
    
# Computing the size 

[x1,y1]=size(I);
a=min(x1,y1);

# Resizing the Image to make it square

I_sqr=(imresize(I,[a a]));

# Calculating the size of a square Image

[m2,n2]=size(I_sqr);

# Calculation of the DCT basis matrix

for m=1:m2
    for n=1:n2
        if(m==1)
          a(m,n)=sqrt(1/n2)*cos(((2*n-1)*(m-1)*pi)/(2*n2));
        else
          a(m,n)=sqrt(2/n2)*cos(((2*n-1)*(m-1)*pi)/(2*n2)); 
        end
    end
end

# Calculate the DCT coefficents for the Image

DCT=a*I_sqr*a';

# Truncating the DCT coefficients to achieve compression

DCT(abs(DCT)<Threshold)=0;

# Reconstruction of the compressed Image

Compressed_image=a'*DCT*a;

# Creating a compressed Image
imwrite(uint8(Compressed_image),'Compressed_image_grayscale.jpeg')

# Compression ratio

d_origin=imfinfo('cameraman.bmp');
size=d_origin.FileSize;
d_comp=imfinfo('Compressed_image_grayscale.jpeg');
size1=d_comp.FileSize;
Compression_ratio=floor(size/size1);


# Plotting

colormap(gray);imagesc(I_sqr),title('Original I');
figure;
colormap(gray);imagesc(Compressed_image),title('Compressed I');

# Putting the images 
imwrite(uint8(I_sqr),'original_image_grayscale.jpeg');
imwrite(uint8(Compressed_image),'Compressed_image_grayscale.jpeg');

end
