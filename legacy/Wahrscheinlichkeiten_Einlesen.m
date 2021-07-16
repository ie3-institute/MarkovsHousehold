% Einlesen der Lastgänge und Wahrscheinlichkeiten


%Einlesen der Lastgänge
Lastgangmatrix = xlsread('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung.xlsm','Lastgänge','B17:N40');
Lastgang_Waschmaschine = Lastgangmatrix(1:7,1);
Lastgang_Spuelmaschine = Lastgangmatrix(1:8,2);
Lastgang_Trockner = Lastgangmatrix(1:6,3);
Lastgang_Elektroherd = Lastgangmatrix(1:4,4);
Lastgang_Kuehlgeraet = Lastgangmatrix(1:24,5);
Lastgang_Gefriergeraet = Lastgangmatrix(1:24,6);
Lastgang_Fernseher = Lastgangmatrix(1:6,7);
Lastgang_Videorecorder = Lastgangmatrix(1:8,8);
Lastgang_PC = Lastgangmatrix(1:8,9);
Lastgang_Telekommunikation = Lastgangmatrix(1:24,10);
Lastgang_Beleuchtung = Lastgangmatrix(1:4,11);
Lastgang_Warmwasser = Lastgangmatrix(1:1,12);
Lastgang_Restlast = Lastgangmatrix(1:1,13);


% Einlesen der Wahrscheinlichkeitsmatrizen

% Inhalt der Spalten
% 1  Frühling Werktag
% 2  Frühling Samstag
% 3  Frühling Sonntag
% 4  Sommer Werktag
% 5  Sommer Samstag
% 6  Sommer Sonntag
% 7  Herbst Werktag
% 8  Herbst Samstag
% 9  Herbst Sonntag
% 10 Winter Werktag
% 11 Winter Samstag
% 12 Winter Sonntag

Wahrscheinlichkeitsmatrix_Spuelmaschine = xlsread('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung.xlsm','Spülmaschine','B18:M113');
Wahrscheinlichkeitsmatrix_Waschmaschine = xlsread('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung.xlsm','Waschmaschine','B18:M113');
Wahrscheinlichkeitsmatrix_Trockner = xlsread('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung.xlsm','Trockner','B18:M113');
Wahrscheinlichkeitsmatrix_Elektroherd = xlsread('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung.xlsm','Elektroherd','B18:M113');
Wahrscheinlichkeitsmatrix_Kuehlgeraet = xlsread('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung.xlsm','Kühlgerät','B18:M113');
Wahrscheinlichkeitsmatrix_Gefriergeraet = xlsread('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung.xlsm','Gefriergerät','B18:M113');
Wahrscheinlichkeitsmatrix_Fernseher = xlsread('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung.xlsm','Fernseher','B18:M113');
Wahrscheinlichkeitsmatrix_Videorecorder = xlsread('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung.xlsm','Videorecorder','B18:M113');
Wahrscheinlichkeitsmatrix_PC = xlsread('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung.xlsm','PC','B18:M113');
Wahrscheinlichkeitsmatrix_Telekommunikation = xlsread('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung.xlsm','Telekommunikation','B18:M113');
Wahrscheinlichkeitsmatrix_Beleuchtung = xlsread('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung.xlsm','Beleuchtung','B18:M113');
Wahrscheinlichkeitsmatrix_Warmwasser = xlsread('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung.xlsm','Warmwasser','B18:M113');



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Berechnete Parameter Einlesen
P_berechnet_Waschmaschine = xlsread('P_berechnet.xlsx','Waschmaschine','B3:M98');
P_berechnet_Waschmaschine_Jahr = xlsread('P_berechnet_Jahr.xlsx','Waschmaschine','G2:G35041');
P_berechnet_Spuelmaschine = xlsread('P_berechnet.xlsx','Spuelmaschine','B3:M98');
P_berechnet_Spuelmaschine_Jahr = xlsread('P_berechnet_Jahr.xlsx','Spuelmaschine','G2:G35041');
P_berechnet_Trockner = xlsread('P_berechnet.xlsx','Trockner','B3:M98');
P_berechnet_Trockner_Jahr = xlsread('P_berechnet_Jahr.xlsx','Trockner','G2:G35041');
P_berechnet_Elektroherd = xlsread('P_berechnet.xlsx','Elektroherd','B3:M98');
P_berechnet_Kuehlgeraet = xlsread('P_berechnet.xlsx','Kuehlgeraet','B3:M98');
P_berechnet_Gefriergeraet = xlsread('P_berechnet.xlsx','Gefriergeraet','B3:M98');
P_berechnet_Fernseher = xlsread('P_berechnet.xlsx','Fernseher','B3:M98');
P_berechnet_Videorecorder = xlsread('P_berechnet.xlsx','Videorecorder','B3:M98');
P_berechnet_PC = xlsread('P_berechnet.xlsx','PC','B3:M98');
P_berechnet_Telekommunikation = xlsread('P_berechnet.xlsx','Telekommunikation','B3:M98');
P_berechnet_Beleuchtung = xlsread('P_berechnet.xlsx','Beleuchtung','B3:M98');
P_berechnet_Warmwasser = xlsread('P_berechnet.xlsx','Warmwasser','B3:M98');

