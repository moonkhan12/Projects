function [V2Min] = findmin(V1,V2,R1,R2,R3)
[I1,I2,I3] = CircuitSolver(V1,V2,R1,R2,R3);

while (I3 > I2) && (I1 < 1) && (I1 > 0) && (I2 < 1) ...
      && (I2 > 0) && (I3 < 1) && (I3 > 0)
  V2 = V2 - 0.001;
  [I1,I2,I3] = CircuitSolver(V1,V2,R1,R2,R3);
end
V2Min = V2 + 0.001;
end
