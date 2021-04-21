# swaroop
# BT18ECE059
#Run Length Encoding 

clc;clear all;close all;
# Generation of 100 random bits

Bits = round(rand(100,1));

# Finding the count of repeated bits
# Initialisation of Variables

PreBit = Bits(1); 
CurBit = PreBit; 
C = 0;

Sym = []; #Notes the Symbol that is repeated
C = []; #Notes the corresponding count

for i = 1:1:numel(Bits)
    CurBit = Bits(i); #Get the current Bit
    if(PreBit == CurBit) #Check if it same as previous bit
        C = C + 1;
    else
        Sym = [Sym,PreBit]; #If not matching, then save last counted bit count
        C = [C,C];
        C = 1; #Reinitialise the Counter
    end
    PreBit = CurBit;
end
Sym = [Sym,PreBit]; #Saving the details of last bit
C = [C,C];

# Finding the Run Length Code

Bi_C = dec2bin(C); #Getting the binary equivalent 
RLE_Code = '';
for i = 1:1:numel(Sym)
    RLE_Code = strcat(RLE_Code,num2str(Sym(i)),Bi_C(i,:));
    # RLE_Code = Sym + C in Binary
end

# Finding if the Encoding is +ve or -ve and find Compresion Ratio

if(length(Bits) > length(RLE_Code))
    disp("Positive RLE");
    CR = (length(RLE_Code)/length(Bits)); #Compression Ratio
    disp(CR);
else
    disp("Negative RLE");
end