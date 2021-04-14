%Currency converter
%clear (US_Dollar,Yen,Aus_Dollar,Pound,Euro,Nor_Kroner,Dan_Krone,Canadia)
US_Dollar = 'US Dollar';
Yen = 'Japenese Yen';
Aus_Dollar = 'Australian Dollar';
Pound = 'British Pound';
Euro = 'Euros';
Nor_Kroner = 'Norwegian Kroner';
Dan_Krone = 'Danish Krone';
Canadia = 'Canadian Dollar';

[num, txt, raw] = xlsread('filtered_Dataset.xlsx');
numbers = importdata('numbers_Dataset.xlsx');

for i = 2:length(txt)
    loc = strcmpi(US_Dollar, char(txt(i,20)));
    if loc == 1
         numbers(i-1,2) = numbers(i-1,2) * 1;
    end
end

for i = 2:length(txt)
    loc = strcmpi(Yen, char(txt(i,20)));
    if loc == 1
         numbers(i-1,2) = numbers(i-1,2) * .009;
    end
end

for i = 2:length(txt)
    loc = strcmpi(Aus_Dollar, char(txt(i,20)));
    if loc == 1
         numbers(i-1,2) = numbers(i-1,2) * 0.77;
    end
end

for i = 2:length(txt)
    loc = strcmpi(Pound, char(txt(i,20)));
    if loc == 1
         numbers(i-1,2) = numbers(i-1,2) * 1.24;
    end
end

for i = 2:length(txt)
    loc = strcmpi(Euro, char(txt(i,20)));
    if loc == 1
         numbers(i-1,2) = numbers(i-1,2) * 1.08;
    end
end

for i = 2:length(txt)
    loc = strcmpi(Nor_Kroner, char(txt(i,20)));
    if loc == 1
         numbers(i-1,2) = numbers(i-1,2) * 0.12;
    end
end

for i = 2:length(txt)
    loc = strcmpi(Dan_Krone, char(txt(i,20)));
    if loc == 1
         numbers(i-1,2) = numbers(i-1,2) * 0.14;
    end
end

for i = 2:length(txt)
    loc = strcmpi(Canadia, char(txt(i,20)));
    if loc == 1
         numbers(i-1,2) = numbers(i-1,2) * 0.75;
    end
end
