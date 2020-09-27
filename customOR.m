%Project 2 Part 2a
%OR Function

function ORimage = customOR(A,B)

[M,N] = size(A);
AuB = zeros(size(A)); %create new array for resulting image
for x=1:M %iterate through the inputs and compare coordinate value pairs
    for y=1:N
        if (A(x,y) == 1 || B(x,y) == 1)
            AuB(x,y)= 1;
        else
            AuB(x,y)= 0;
        end
    end
end
ORimage = AuB;
end