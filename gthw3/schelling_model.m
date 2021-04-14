%% simple segregation simulation
sch = Schelling(50, 50, 0.1, 0.4, 1000, 'schelling_simulation');
sch = sch.populate();
sch.update();