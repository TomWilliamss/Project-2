%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Project 2 Part1
%
%Purpose: isolate 4 largest components and color codes them
%
%input: f      original image
%
%outputs: figure1      thresholded image
%         figure2      color coded different components of the thresholded
%                      image
%         figure3      4 largest components of the image
%
%Author: Ruike Tang
%        09/27/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f = imread('lenna.gif'); %import image
[M,N] = size(f); %get size
for x = 1:M
    for y = 1:N  %loop through the image
        if f(x,y) >= 128 %thresholding to 128
            fthresh(x,y) = f(x,y);
        else
            fthresh(x,y) = 0;
        end
    end
end

figure(1);imshow(fthresh) %show thresholded image
imwrite(fthresh,'thresholded.tif');

flabel = bwlabel(fthresh, 8);
fRGB = label2rgb(flabel); %provided codes to color code the image
figure(2);imshow(fRGB)    %show color coded image
imwrite(fRGB,'color coded.tif');

I = max(max(flabel));     %get the max label number in flabel

Cmap = containers.Map(0,0); %make a container map with key and value type 'double'

for i = 1:I %loop through the label indexes
    C = sum(sum(flabel == i)); %count how many of the index appears
    Cmap(i) = C; %write into the container
end

Maxkey1 = 0;
Maxvalue1 = 0;                         %%find the first largest component

for i = 1:I
    if Cmap(i) > Maxvalue1
        Maxvalue1 = Cmap(i);
        Maxkey1 = i;
    end
end

Cmap(Maxkey1) = 0;

Maxkey2 = 0;
Maxvalue2 = 0;

for i = 1:I
    if Cmap(i) > Maxvalue2            %%find the second largest component
        Maxvalue2 = Cmap(i);
        Maxkey2 = i;
    end
end

Cmap(Maxkey2) = 0;

Maxkey3 = 0;
Maxvalue3 = 0;

for i = 1:I
    if Cmap(i) > Maxvalue3          %%find the third largest component
        Maxvalue3 = Cmap(i);
        Maxkey3 = i;
    end
end

Cmap(Maxkey3) = 0;

Maxkey4 = 0;
Maxvalue4 = 0;

for i = 1:I
    if Cmap(i) > Maxvalue4           %%find the fourth largest omponent
        Maxvalue4 = Cmap(i);
        Maxkey4 = i;
    end
end

flabel4 = flabel; %copy flabel

for x = 1:M      %loop through the image
    for y = 1:N
        if flabel(x,y) ~= Maxkey1
            if flabel(x,y) ~= Maxkey2
                if flabel(x,y) ~= Maxkey3
                    if flabel(x,y) ~= Maxkey4
                        flabel4(x,y) = 0;    %set anything other than the four largest components to 0
                    end
                end
            end
        end
    end
end

fRGB4 = label2rgb(flabel4);
figure(3);imshow(fRGB4)  % show result
imwrite(fRGB4,'largest 4 components.tif');

% Project 2 Part 2b

A = imread("match1.gif");
B = imread("match2.gif");

% Testing the custom operators
imtool(customAND(A,B)) %intersection of A and B
imtool(customOR(A,B)) %union of A and B
imtool(customXOR(A,B)) %(~AnB)u(An~B)
imtool(customNOT(A)) %Not A (~A)
