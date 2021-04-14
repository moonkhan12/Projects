function [range_V2Min, range_V2Max] = RangeminMax(V1,V2,R1,R2)

range_V2Min = zeros(1,100);
range_V2Max = zeros(1,100);

for R = 15:115
    range_V2Max(R-14) = findmax(V1,V2,R1,R2,R);
    range_V2Min(R-14) = findmin(V1,V2,R1,R2,R);
end

end
