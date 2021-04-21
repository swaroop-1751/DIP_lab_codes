# swaroop
# BT18ECE059
# Histogram Equalization.

clc;
clear;
close all;

# Representing Image with pixel values.
Mat = [52	55	61	59	79	61	76	61;
    62	59	55	104	94	85	59	71;
    63	65	66	113	144	104	63	72;
    64	70	70	126	154	109	71	69;
    67	73	68	106	122	88	68	68;
    68	79	60	70	77	66	58	75;
    69	85	64	58	55	61	65	83;
    70	87	69	68	65	73	78	90];

Mat = double(Mat);
s = size(Mat);

# For Getting the Histogram of the original image
histogram = zeros(1,256);
for i = 1:s(1)
    for j = 1:s(2)
        for k = 0:255
            if Mat(i,j) == k
                (k+1) = (k+1)+1;
            end
        end
    end
end



# Generating frequency out of histogram by dividing by total no. of pixels
freq = (1/(s(1)*s(2)))*histogram;

# Generating CDF out of freq.
cdf = zeros(1,256);
cdf(1) = freq(1);#First value of cdf is same as pdf.
for i = 2:256
    cdf(i) = cdf(i-1)+(i);
end


hist_eq = zeros(s);
for i = 1:s(1)#for tracing the rows of our image
    for j = 1:s(2)#for tracing the columns of our image
        a = (Mat(i,j)+1);#pixel values in our image
        hist_eq(i,j) = cdf(a);#Making the output image using cdf as the transformation function
    end                                             
end

# For Getting the Histogram of the image
histogram = zeros(1,256);
for i = 1:s(1)
    for j = 1:s(2)
        for k = 0:255
            if hist_eq(i,j) == k
                histogram(k+1) = histogram(k+1)+1;
            end
        end
    end
end

# Plotting Figures.
subplot(2,2,1);
stem();
subplot(2,2,3);
stem(histogram);

subplot(2,2,2);
imshow(uint8(hist_eq));
subplot(2,2,4);
imshow(uint8(Mat));
