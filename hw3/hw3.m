clc
clear
close all

dataFile = load('data.mat');

figure(1);
G = graph(dataFile.adjacency);
p = plot(G,'Layout','subspace');
p.NodeColor = 'green';
p.EdgeColor = 'black';
title('graph 1');

figure(2);
G = graph(dataFile.gpa);
p = plot(G,'Layout','subspace');
p.EdgeColor = 'black';
if (node.value == 1)
    p.NodeColor = 'green';
else
    if(node.value == 2)
        p.NodeColor = 'red';
    end
end
title('gprah 2');
