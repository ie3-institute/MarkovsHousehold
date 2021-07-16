% Vorbereitung der Monte Carlo Simulation

% Verteilung der Maschinenzustände anhand der Anfangswahrscheinlichkeiten!
% und der Anzahl an Maschinen

fkWm = V*Anzahl_gereate;
V_Monte = floor(fkWm);
r = Anzahl_gereate - sum(V_Monte);

for l=1:1:r
    [C,I] = max(fkWm - floor(fkWm));
    V_Monte(I) = V_Monte(I) + 1;
    fkWm(I) = 0;
end