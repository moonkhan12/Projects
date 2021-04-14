close, clear, clc

n = arduino('com4', 'uno');

op1 = 'D2';
op2 = 'D4';
a = 'D7';
b = 'D8';
c = 'D12';
d = 'D13';

calc = menu('Function', 'Add', 'Subtract', 'Multiply', 'Divide');
switch calc
    case 1
        writeDigitalPin(n, op1, 0);
        writeDigitalPin(n, op2, 0);
        %Sets multiplexer to add
        
        writeDigitalPin(n, a, 0);
        writeDigitalPin(n, b, 0);
        writeDigitalPin(n, c, 0);
        writeDigitalPin(n, d, 0);
        disp('0000')
        pause(3)
        %abcd = 0000
        writeDigitalPin(n, a, 0);
        writeDigitalPin(n, b, 0);
        writeDigitalPin(n, c, 0);
        writeDigitalPin(n, d, 1);
        disp('0001')
        pause(3)
        %abcd = 0001
        writeDigitalPin(n, a, 0);
        writeDigitalPin(n, b, 0);
        writeDigitalPin(n, c, 1);
        writeDigitalPin(n, d, 0);
        disp('0010')
        pause(3)
        %abcd = 0010
        writeDigitalPin(n, a, 0);
        writeDigitalPin(n, b, 0);
        writeDigitalPin(n, c, 1);
        writeDigitalPin(n, d, 1);
        disp('0011')
        pause(3)
        %abcd = 0011
        
        writeDigitalPin(n, a, 0);
        writeDigitalPin(n, b, 1);
        writeDigitalPin(n, c, 0);
        writeDigitalPin(n, d, 0);
        disp('0100')
        pause(3)
        %abcd = 0100
        writeDigitalPin(n, a, 0);
        writeDigitalPin(n, b, 1);
        writeDigitalPin(n, c, 0);
        writeDigitalPin(n, d, 1);
        disp('0101')
        pause(3)
        %abcd = 0101
        writeDigitalPin(n, a, 0);
        writeDigitalPin(n, b, 1);
        writeDigitalPin(n, c, 1);
        writeDigitalPin(n, d, 0);
        disp('0110')
        pause(3)
        %abcd = 0110
        writeDigitalPin(n, a, 0);
        writeDigitalPin(n, b, 1);
        writeDigitalPin(n, c, 1);
        writeDigitalPin(n, d, 1);
        disp('0111')
        pause(3)
        %abcd = 0111
        
        writeDigitalPin(n, a, 1);
        writeDigitalPin(n, b, 0);
        writeDigitalPin(n, c, 0);
        writeDigitalPin(n, d, 0);
        disp('1000')
        pause(3)
        %abcd = 1000
        writeDigitalPin(n, a, 1);
        writeDigitalPin(n, b, 0);
        writeDigitalPin(n, c, 0);
        writeDigitalPin(n, d, 1);
        disp('1001')
        pause(3)
        %abcd = 1001
        writeDigitalPin(n, a, 1);
        writeDigitalPin(n, b, 0);
        writeDigitalPin(n, c, 1);
        writeDigitalPin(n, d, 0);
        disp('1010')
        pause(3)
        %abcd = 1010
        writeDigitalPin(n, a, 1);
        writeDigitalPin(n, b, 0);
        writeDigitalPin(n, c, 1);
        writeDigitalPin(n, d, 1);
        disp('1011')
        pause(3)
        %abcd = 1011
       
        writeDigitalPin(n, a, 1);
        writeDigitalPin(n, b, 1);
        writeDigitalPin(n, c, 0);
        writeDigitalPin(n, d, 0);
        disp('1100')
        pause(3)
        %abcd = 1100
        writeDigitalPin(n, a, 1);
        writeDigitalPin(n, b, 1);
        writeDigitalPin(n, c, 0);
        writeDigitalPin(n, d, 1);
        disp('1101')
        pause(3)
        %abcd = 1101
        writeDigitalPin(n, a, 1);
        writeDigitalPin(n, b, 1);
        writeDigitalPin(n, c, 1);
        writeDigitalPin(n, d, 0);
        disp('1110')
        pause(3)
        %abcd = 1110
        writeDigitalPin(n, a, 1);
        writeDigitalPin(n, b, 1);
        writeDigitalPin(n, c, 1);
        writeDigitalPin(n, d, 1);
        disp('1111')
        pause(3)
        %abcd = 1111
    case 2
        writeDigitalPin(n, op1, 0);
        writeDigitalPin(n, op2, 1);
        %Sets multiplexer to subtract
        
        writeDigitalPin(n, a, 0);
        writeDigitalPin(n, b, 0);
        writeDigitalPin(n, c, 0);
        writeDigitalPin(n, d, 0);
        disp('0000')
        pause(3)
        %abcd = 0000
        writeDigitalPin(n, a, 0);
        writeDigitalPin(n, b, 0);
        writeDigitalPin(n, c, 0);
        writeDigitalPin(n, d, 1);
        disp('0001')
        pause(3)
        %abcd = 0001
        writeDigitalPin(n, a, 0);
        writeDigitalPin(n, b, 0);
        writeDigitalPin(n, c, 1);
        writeDigitalPin(n, d, 0);
        disp('0010')
        pause(3)
        %abcd = 0010
        writeDigitalPin(n, a, 0);
        writeDigitalPin(n, b, 0);
        writeDigitalPin(n, c, 1);
        writeDigitalPin(n, d, 1);
        disp('0011')
        pause(3)
        %abcd = 0011
        
        writeDigitalPin(n, a, 0);
        writeDigitalPin(n, b, 1);
        writeDigitalPin(n, c, 0);
        writeDigitalPin(n, d, 0);
        disp('0100')
        pause(3)
        %abcd = 0100
        writeDigitalPin(n, a, 0);
        writeDigitalPin(n, b, 1);
        writeDigitalPin(n, c, 0);
        writeDigitalPin(n, d, 1);
        disp('0101')
        pause(3)
        %abcd = 0101
        writeDigitalPin(n, a, 0);
        writeDigitalPin(n, b, 1);
        writeDigitalPin(n, c, 1);
        writeDigitalPin(n, d, 0);
        disp('0110')
        pause(3)
        %abcd = 0110
        writeDigitalPin(n, a, 0);
        writeDigitalPin(n, b, 1);
        writeDigitalPin(n, c, 1);
        writeDigitalPin(n, d, 1);
        disp('0111')
        pause(3)
        %abcd = 0111
        
        writeDigitalPin(n, a, 1);
        writeDigitalPin(n, b, 0);
        writeDigitalPin(n, c, 0);
        writeDigitalPin(n, d, 0);
        disp('1000')
        pause(3)
        %abcd = 1000
        writeDigitalPin(n, a, 1);
        writeDigitalPin(n, b, 0);
        writeDigitalPin(n, c, 0);
        writeDigitalPin(n, d, 1);
        disp('1001')
        pause(3)
        %abcd = 1001
        writeDigitalPin(n, a, 1);
        writeDigitalPin(n, b, 0);
        writeDigitalPin(n, c, 1);
        writeDigitalPin(n, d, 0);
        disp('1010')
        pause(3)
        %abcd = 1010
        writeDigitalPin(n, a, 1);
        writeDigitalPin(n, b, 0);
        writeDigitalPin(n, c, 1);
        writeDigitalPin(n, d, 1);
        disp('1011')
        pause(3)
        %abcd = 1011
       
        writeDigitalPin(n, a, 1);
        writeDigitalPin(n, b, 1);
        writeDigitalPin(n, c, 0);
        writeDigitalPin(n, d, 0);
        disp('1100')
        pause(3)
        %abcd = 1100
        writeDigitalPin(n, a, 1);
        writeDigitalPin(n, b, 1);
        writeDigitalPin(n, c, 0);
        writeDigitalPin(n, d, 1);
        disp('1101')
        pause(3)
        %abcd = 1101
        writeDigitalPin(n, a, 1);
        writeDigitalPin(n, b, 1);
        writeDigitalPin(n, c, 1);
        writeDigitalPin(n, d, 0);
        disp('1110')
        pause(3)
        %abcd = 1110
        writeDigitalPin(n, a, 1);
        writeDigitalPin(n, b, 1);
        writeDigitalPin(n, c, 1);
        writeDigitalPin(n, d, 1);
        disp('1111')
        pause(3)
        %abcd = 1111
    case 3
        writeDigitalPin(n, op1, 1);
        writeDigitalPin(n, op2, 0);
        %Sets multiplexer to multiply
        
        writeDigitalPin(n, a, 0);
        writeDigitalPin(n, b, 0);
        writeDigitalPin(n, c, 0);
        writeDigitalPin(n, d, 0);
        disp('0000')
        pause(3)
        %abcd = 0000
        writeDigitalPin(n, a, 0);
        writeDigitalPin(n, b, 0);
        writeDigitalPin(n, c, 0);
        writeDigitalPin(n, d, 1);
        disp('0001')
        pause(3)
        %abcd = 0001
        writeDigitalPin(n, a, 0);
        writeDigitalPin(n, b, 0);
        writeDigitalPin(n, c, 1);
        writeDigitalPin(n, d, 0);
        disp('0010')
        pause(3)
        %abcd = 0010
        writeDigitalPin(n, a, 0);
        writeDigitalPin(n, b, 0);
        writeDigitalPin(n, c, 1);
        writeDigitalPin(n, d, 1);
        disp('0011')
        pause(3)
        %abcd = 0011
        
        writeDigitalPin(n, a, 0);
        writeDigitalPin(n, b, 1);
        writeDigitalPin(n, c, 0);
        writeDigitalPin(n, d, 0);
        disp('0100')
        pause(3)
        %abcd = 0100
        writeDigitalPin(n, a, 0);
        writeDigitalPin(n, b, 1);
        writeDigitalPin(n, c, 0);
        writeDigitalPin(n, d, 1);
        disp('0101')
        pause(3)
        %abcd = 0101
        writeDigitalPin(n, a, 0);
        writeDigitalPin(n, b, 1);
        writeDigitalPin(n, c, 1);
        writeDigitalPin(n, d, 0);
        disp('0110')
        pause(3)
        %abcd = 0110
        writeDigitalPin(n, a, 0);
        writeDigitalPin(n, b, 1);
        writeDigitalPin(n, c, 1);
        writeDigitalPin(n, d, 1);
        disp('0111')
        pause(3)
        %abcd = 0111
        
        writeDigitalPin(n, a, 1);
        writeDigitalPin(n, b, 0);
        writeDigitalPin(n, c, 0);
        writeDigitalPin(n, d, 0);
        disp('1000')
        pause(3)
        %abcd = 1000
        writeDigitalPin(n, a, 1);
        writeDigitalPin(n, b, 0);
        writeDigitalPin(n, c, 0);
        writeDigitalPin(n, d, 1);
        disp('1001')
        pause(3)
        %abcd = 1001
        writeDigitalPin(n, a, 1);
        writeDigitalPin(n, b, 0);
        writeDigitalPin(n, c, 1);
        writeDigitalPin(n, d, 0);
        disp('1010')
        pause(3)
        %abcd = 1010
        writeDigitalPin(n, a, 1);
        writeDigitalPin(n, b, 0);
        writeDigitalPin(n, c, 1);
        writeDigitalPin(n, d, 1);
        disp('1011')
        pause(3)
        %abcd = 1011
       
        writeDigitalPin(n, a, 1);
        writeDigitalPin(n, b, 1);
        writeDigitalPin(n, c, 0);
        writeDigitalPin(n, d, 0);
        disp('1100')
        pause(3)
        %abcd = 1100
        writeDigitalPin(n, a, 1);
        writeDigitalPin(n, b, 1);
        writeDigitalPin(n, c, 0);
        writeDigitalPin(n, d, 1);
        disp('1101')
        pause(3)
        %abcd = 1101
        writeDigitalPin(n, a, 1);
        writeDigitalPin(n, b, 1);
        writeDigitalPin(n, c, 1);
        writeDigitalPin(n, d, 0);
        disp('1110')
        pause(3)
        %abcd = 1110
        writeDigitalPin(n, a, 1);
        writeDigitalPin(n, b, 1);
        writeDigitalPin(n, c, 1);
        writeDigitalPin(n, d, 1);
        disp('1111')
        pause(3)
        %abcd = 1111
    case 4
        writeDigitalPin(n, op1, 1);
        writeDigitalPin(n, op2, 1);
        %Sets multiplexer to divide
        
        writeDigitalPin(n, a, 0);
        writeDigitalPin(n, b, 0);
        writeDigitalPin(n, c, 0);
        writeDigitalPin(n, d, 0);
        disp('0000')
        pause(3)
        %abcd = 0000
        writeDigitalPin(n, a, 0);
        writeDigitalPin(n, b, 0);
        writeDigitalPin(n, c, 0);
        writeDigitalPin(n, d, 1);
        disp('0001')
        pause(3)
        %abcd = 0001
        writeDigitalPin(n, a, 0);
        writeDigitalPin(n, b, 0);
        writeDigitalPin(n, c, 1);
        writeDigitalPin(n, d, 0);
        disp('0010')
        pause(3)
        %abcd = 0010
        writeDigitalPin(n, a, 0);
        writeDigitalPin(n, b, 0);
        writeDigitalPin(n, c, 1);
        writeDigitalPin(n, d, 1);
        disp('0011')
        pause(3)
        %abcd = 0011
        
        writeDigitalPin(n, a, 0);
        writeDigitalPin(n, b, 1);
        writeDigitalPin(n, c, 0);
        writeDigitalPin(n, d, 0);
        disp('0100')
        pause(3)
        %abcd = 0100
        writeDigitalPin(n, a, 0);
        writeDigitalPin(n, b, 1);
        writeDigitalPin(n, c, 0);
        writeDigitalPin(n, d, 1);
        disp('0101')
        pause(3)
        %abcd = 0101
        writeDigitalPin(n, a, 0);
        writeDigitalPin(n, b, 1);
        writeDigitalPin(n, c, 1);
        writeDigitalPin(n, d, 0);
        disp('0110')
        pause(3)
        %abcd = 0110
        writeDigitalPin(n, a, 0);
        writeDigitalPin(n, b, 1);
        writeDigitalPin(n, c, 1);
        writeDigitalPin(n, d, 1);
        disp('0111')
        pause(3)
        %abcd = 0111
        
        writeDigitalPin(n, a, 1);
        writeDigitalPin(n, b, 0);
        writeDigitalPin(n, c, 0);
        writeDigitalPin(n, d, 0);
        disp('1000')
        pause(3)
        %abcd = 1000
        writeDigitalPin(n, a, 1);
        writeDigitalPin(n, b, 0);
        writeDigitalPin(n, c, 0);
        writeDigitalPin(n, d, 1);
        disp('1001')
        pause(3)
        %abcd = 1001
        writeDigitalPin(n, a, 1);
        writeDigitalPin(n, b, 0);
        writeDigitalPin(n, c, 1);
        writeDigitalPin(n, d, 0);
        disp('1010')
        pause(3)
        %abcd = 1010
        writeDigitalPin(n, a, 1);
        writeDigitalPin(n, b, 0);
        writeDigitalPin(n, c, 1);
        writeDigitalPin(n, d, 1);
        disp('1011')
        pause(3)
        %abcd = 1011
       
        writeDigitalPin(n, a, 1);
        writeDigitalPin(n, b, 1);
        writeDigitalPin(n, c, 0);
        writeDigitalPin(n, d, 0);
        disp('1100')
        pause(3)
        %abcd = 1100
        writeDigitalPin(n, a, 1);
        writeDigitalPin(n, b, 1);
        writeDigitalPin(n, c, 0);
        writeDigitalPin(n, d, 1);
        disp('1101')
        pause(3)
        %abcd = 1101
        writeDigitalPin(n, a, 1);
        writeDigitalPin(n, b, 1);
        writeDigitalPin(n, c, 1);
        writeDigitalPin(n, d, 0);
        disp('1110')
        pause(3)
        %abcd = 1110
        writeDigitalPin(n, a, 1);
        writeDigitalPin(n, b, 1);
        writeDigitalPin(n, c, 1);
        writeDigitalPin(n, d, 1);
        disp('1111')
        pause(3)
        %abcd = 1111
end
