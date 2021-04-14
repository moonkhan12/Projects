function [area1,area2,area3,Left_sum1,Right_sum1,Midpoint1,Left_sum2,Right_sum2,Midpoint2,Left_sum3,Right_sum3,Midpoint3] = Compute_area(t0,t1,A,B,C,M,N,Z,W,num_Rect,x) %t0 and t1 are bounds for the integral
%I was having a lot of issues with calling other functions inside of this
%function so I decided to just recreate all the functions in this one to
%make things easier
    fn1 = @(t) A*t.^2 + B*t + C;
    fn2 = @(t) M*t + N;
    fn3 = @(t) Z*t + W;
    area1 = integral(fn1,t0,x);
    area2 = integral(fn2,t0,t1);
    area3 = integral(fn3,t0,t1);
    
    
    
    %fn1
    %Left Riemann Sum
    x1 = 0;
    x2 = 2.6;
    delta_x = (x2-x1) / num_Rect;
    Left_sum1 = 0;
    for n = 1:num_Rect
        Left_sum1 = Left_sum1 + fn1(x1+delta_x*(n-1));
    end
    Left_sum1 = Left_sum1 *delta_x;
    %Right Riemann Sum
    x1 = 0;
    x2 = x;
    delta_x = (x2-x1) / num_Rect;
    Right_sum1 = 0;
    for k = 1:num_Rect-1
        Right_sum1 = Right_sum1 + fn1(x1 + delta_x * (k+1));
    end
    Right_sum1 = Right_sum1 * delta_x;    
    %Midpoint = average of left and right
    Midpoint1 = (Left_sum1 + Right_sum1) / 2 ;
    
    
    
    %fn2
    %Left Riemann Sum
    x1 = 0;
    x2 = 2.6;
    delta_x = (x2-x1) / num_Rect;
    Left_sum2 = 0;
    for n = 1:num_Rect
        Left_sum2 = Left_sum2 + fn2(x1+delta_x*(n-1));
    end
    Left_sum2 = Left_sum2 *delta_x;
    %Right Riemann Sum
    x1 = 0;
    x2 = x;
    delta_x = (x2-x1) / num_Rect;
    Right_sum2 = 0;
    for k = 1:num_Rect-1
        Right_sum2 = Right_sum2 + fn2(x1 + delta_x * (k+1));
    end
    Right_sum2 = Right_sum2 * delta_x;    
    %Midpoint = average of left and right
    Midpoint2 = (Left_sum2 + Right_sum2) / 2 ;
    
    
    
    %fn3
    %Left Riemann Sum
    x1 = 0;
    x2 = 2.6;
    delta_x = (x2-x1) / num_Rect;
    Left_sum3 = 0;
    for n = 1:num_Rect
        Left_sum3 = Left_sum3 + fn1(x1+delta_x*(n-1));
    end
    Left_sum3 = Left_sum3 *delta_x;
    %Right Riemann Sum
    x1 = 0;
    x2 = x;
    delta_x = (x2-x1) / num_Rect;
    Right_sum3 = 0;
    for k = 1:num_Rect-1
        Right_sum3 = Right_sum3 + fn3(x1 + delta_x * (k+1));
    end
    Right_sum3 = Right_sum3 * delta_x;    
    %Midpoint = average of left and right
    Midpoint3 = (Left_sum3 + Right_sum3) / 2 ;
    
    
    
end
