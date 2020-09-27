% Project 2 Part 2b

A = imread("match1.gif");
B = imread("match2.gif");

% Testing the custom operators
imtool(customAND(A,B))
imtool(customOR(A,B))
imtool(customXOR(A,B))
imtool(customNOT(A))
