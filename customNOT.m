%Project 2 Part 2A
%NOT Function

function NOTimage = customNOT(A)

[M,N] = size(A);
notA = zeros(size(A)); %create new array for resulting image
for x=1:M %iterate through the input and invert the coordinate value
    for y=1:N
        if (A(x,y) == 1)
            notA(x,y)= 0;
        else
            notA(x,y)= 1;
        end
    end
end
NOTimage = notA;
end