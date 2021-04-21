# swaroop
# BT18ECE059
# Histogram Specification

clc; clear all; close all;

image = [1 3 5; 4 4 3; 5 2 2]; #defining image pixels
level = [0 1 2 3 4 5 6 7]; #defining levels
pixels = zeros(1,9);

for i = 1:7
    for j = 1:9
        if image(j) == level(i)
            pixels(i) = pixels(i) + 1; #calculating pixels 
        end
    end
end
pixels = pixels(1:8);

cdf = zeros(1,8);
cdf(1) = pixels(1);
for i = 2:8
    cdf(i) = cdf(i-1) + pixels(i); #cumulative distribution function
end

input_equ = round(cdf*7./9); #rounding off the values

target = [0 0 0 0 2 2 4 1]; #defining target

cdf_t = zeros(1,8);
cdf_t(1) = target(1);
for i = 2:8
    cdf_t(i) = cdf_t(i-1) + target(i);
end

target_equ = round(cdf_t*7./9); #rounding off the values

map = zeros(1,8);
j = 1;
for i = 1:8
    for j = 1:8
        if input_equ(i) <= target_equ(j)
            map(i) = level(j); #mapping with targets
            break;
        end
	end
end