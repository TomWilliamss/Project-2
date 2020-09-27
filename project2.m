% Project 2 Part 2b

A = imread("match1.gif");
B = imread("match2.gif");

% Testing the custom operators
imtool(customAND(A,B)) %intersection of A and B
imtool(customOR(A,B)) %union of A and B
imtool(customXOR(A,B)) %(~AnB)u(An~B)
imtool(customNOT(A)) %Not A (~A)
