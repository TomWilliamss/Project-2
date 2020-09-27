%Project 2 Part 2a
%XOR Function

function XORimage = customXOR(A,B)

[M,N] = size(A);
AnB = zeros(size(A)); %create new array for resulting image
for x=1:M %iterate through the inputs and compare coordinate value pairs
    for y=1:N
        if ((A(x,y) == 0 && B(x,y) == 1) || (A(x,y) == 1 && B(x,y) == 0))
            AnB(x,y)= 1;
        else
            AnB(x,y)= 0;
        end
    end
end
XORimage = AnB;
end