# swaroop
# BT18ECE059
# Zig_Zag_DCT

clc; clear all; close all;

# Initialise the variables
I = rgb2gray(imread('swaroop.jpg'));
VMax = size(I, 1);
HMax = size(I, 2);
VMin = 1;
HMin = 1;
m = VMin;
n = HMin;
O = zeros(1, VMax*HMax);

# Algorithm for Zig-Zag pattern
k = 1;
while ((m <= VMax) && (n <= HMax))
    
    if (mod(n + m, 2) == 0)  #going up
        if (m == VMin)       
            O(k) = I(m, n); #if encountered the 1st line
            if (n == HMax)
                m = m + 1;
            else
              n = n + 1;
            end
            k = k + 1;
        elseif ((n == HMax) && (m < VMax)) #if encountered the last column
            O(k) = I(m, n);
            m = m + 1;
            k = k + 1;
        elseif ((m > VMin) && (n < HMax)) #rest of the cases
            O(k) = I(m, n);
            m = m - 1;
            n = n + 1;
            k = k + 1;
        end
        
    else                                    #going down
       if ((m == VMax) && (n <= HMax)) #if encountered the last line
            O(k) = I(m, n);
            n = n + 1;
            k = k + 1;
        
       elseif (n == HMin)           #if encountered the first column
            O(k) = I(m, n);
            if (m == VMax)
	      n = n + 1;
	    else
              m = m + 1;
            end
            k = k + 1;
       elseif ((m < VMax) && (n > HMin))  #rest of the cases
            O(k) = I(m, n);
            m = m + 1;
            n = n - 1;
            k = k + 1;
       end
    end
    if ((m == VMax) && (n == HMax)) #if encountered bottom right element
        O(k) = I(m, n);
        break
    end
end
