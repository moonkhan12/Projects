function [Area] = Integration(x0,x1)

%Create a "function handle", essentially a one line function
fun = @(x) 3*x.^2 + 2*x + 1;
% @(x), lets MATLAB know that x is the input for the function

val = fun(2); %This will return the value of the funtion with 2 used for x

Area = integral(fun,x0,x1);

end
