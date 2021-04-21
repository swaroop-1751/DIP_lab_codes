# swaroop
# BT18ECE059
# Toboggan Contrast Enhancement

clc; close all; clear all;

G = [12 14 23 13; 14 11 21 18; 21 24 23 13; 12 21 20 10]; # Image input and G operator
I = [4 4 3 2; 3 7 6 1; 2 7 6 2; 0 1 0 2];
M1 = zeros(4,4);

# Algorithm of Toboggan Contrast Enhancement 
for m = 1:4
    for n = 1:4
        min = G(m,n);  
        i = m;
        j = n;
        if(m+1 <= 4 && G(m+1,n) < min)
            min = G(m+1,n);
            i = m+1;
            j = n;
        end
        if(m-1 >= 1 && G(m-1,n) < min)
            min = G(m-1,n);
            i = m-1;
            j = n;
        end
        if(n-1 >= 1 && G(m,n-1) < min)
            min = G(m,n-1);
            j = n - 1;
            i = m;
        end
        if(n+1 <= 4 && G(m,n+1) < min)
            min = G(m,n+1);
            j = n + 1;
            i = m;
        end
        if(n+1 <= 4 && m+1 <= 4 && G(m+1,n+1) < min)
            min = G(m+1,n+1);
            j = n+1;
            i = m+1;
        end
        if(n-1>= 1 && m+1 <= 4 && G(m+1,n-1) <min)
            min = G(m+1,n-1);
            j = n-1;
            i = m+1;
        end
        if(n + 1 <= 4 && m - 1 >= 1 && G(m-1,n+1) < min)
            min = G(m-1,n+1);
            j = n + 1;
            i = m - 1;
        end

        M1(m,n) = I(i,j);
    end
end