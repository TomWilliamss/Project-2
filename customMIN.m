%Project 2 Part 2c
%min operator

function E = customMIN(C,D)

[M,N] = size(C);
res = zeros(size(C)); %Array to store resultes
for x=1:M
    for y=1:N
        if(C(x,y) < D(x,y))
            res(x,y) = C(x,y);
        else
            res(x,y) = D(x,y);
        end
    end
end
E = res;
end