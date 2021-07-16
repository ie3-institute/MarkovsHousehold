% Darstellung der Lastverläufe in Matlab und Excel

% Einlesen der gesamten Wertetabelle aus Exceldatei
Standardlastprofil = xlsread('VDEW_-SLP_Profile_Strom_VSG.xls',1,'B4:J99');
Jahresverbrauch_Durchschnittshaushalt = 3381.1881; % Eingabe Jahresverbrauch Durchschnittshaushalt
%SLP Werte in Vektoren für die Jahreszeiten einteilen.
%Winter
SLP_Winter_Samstag = Standardlastprofil(1:96,1)*(Jahresverbrauch_Durchschnittshaushalt/1000)*Anzahl_Haushalte;
SLP_Winter_Sonntag = Standardlastprofil(1:96,2)*(Jahresverbrauch_Durchschnittshaushalt/1000)*Anzahl_Haushalte;
SLP_Winter_Werktag = Standardlastprofil(1:96,3)*(Jahresverbrauch_Durchschnittshaushalt/1000)*Anzahl_Haushalte;
%Sommer
SLP_Sommer_Samstag = Standardlastprofil(1:96,4)*(Jahresverbrauch_Durchschnittshaushalt/1000)*Anzahl_Haushalte;
SLP_Sommer_Sonntag = Standardlastprofil(1:96,5)*(Jahresverbrauch_Durchschnittshaushalt/1000)*Anzahl_Haushalte;
SLP_Sommer_Werktag = Standardlastprofil(1:96,6)*(Jahresverbrauch_Durchschnittshaushalt/1000)*Anzahl_Haushalte;
%Übergang
SLP_Ubergang_Samstag = Standardlastprofil(1:96,7)*(Jahresverbrauch_Durchschnittshaushalt/1000)*Anzahl_Haushalte;
SLP_Ubergang_Sonntag = Standardlastprofil(1:96,8)*(Jahresverbrauch_Durchschnittshaushalt/1000)*Anzahl_Haushalte;
SLP_Ubergang_Werktag = Standardlastprofil(1:96,9)*(Jahresverbrauch_Durchschnittshaushalt/1000)*Anzahl_Haushalte;

%%
%Lastverläufe der Verschiebbaren Lasten aus excel
Last_wasch = xlsread('Lastverlaeufe_Geraete.xlsx','Waschmaschine','B3:M98');
Last_trock = xlsread('Lastverlaeufe_Geraete.xlsx','Trockner','B3:M98');
Last_spuel = xlsread('Lastverlaeufe_Geraete.xlsx','Spuelmaschine','B3:M98');
Last_herd = xlsread('Lastverlaeufe_Geraete.xlsx','Elektroherd','B3:M98');
Last_kuehl = xlsread('Lastverlaeufe_Geraete.xlsx','Kuehlgeraet','B3:M98');
Last_gefrier = xlsread('Lastverlaeufe_Geraete.xlsx','Gefriergeraet','B3:M98');
Last_fernseher = xlsread('Lastverlaeufe_Geraete.xlsx','Fernseher','B3:M98');
Last_video = xlsread('Lastverlaeufe_Geraete.xlsx','Videorecorder','B3:M98');
Last_pc = xlsread('Lastverlaeufe_Geraete.xlsx','PC','B3:M98');
Last_tele = xlsread('Lastverlaeufe_Geraete.xlsx','Telekommunikation','B3:M98');
Last_bel = xlsread('Lastverlaeufe_Geraete.xlsx','Beleuchtung','B3:M98');
Last_warmw = xlsread('Lastverlaeufe_Geraete.xlsx','Warmwasser','B3:M98');
Last_rest = Lastgang_Restlast*Anzahl_Restlast;

%%
%Zuweisen der Lastgänge aus der Matrix in die jeweiligen Vektoren
%I. Waschmaschine
%Winter
W_w_Samstag = 10^-3.* Last_wasch (1:96,11);
W_w_Sonntag = 10^-3.* Last_wasch (1:96,12);
W_w_Werktag = 10^-3.* Last_wasch (1:96,10);
%Sommer
W_s_Samstag = 10^-3.* Last_wasch (1:96,5);
W_s_Sonntag = 10^-3.* Last_wasch (1:96,6);
W_s_Werktag = 10^-3.* Last_wasch (1:96,4);
%Übergang
W_u_Samstag = 10^-3.* Last_wasch (1:96,2);
W_u_Sonntag = 10^-3.* Last_wasch (1:96,3);
W_u_Werktag = 10^-3.* Last_wasch (1:96,1);

%%
%II. Trockner
%Zuweisen der Lastgänge aus der Matrix in die jeweiligen Vektoren
%Winter
T_w_Samstag = 10^-3.* Last_trock (1:96,11);
T_w_Sonntag = 10^-3.* Last_trock (1:96,12);
T_w_Werktag = 10^-3.* Last_trock (1:96,10);
%Sommer
T_s_Samstag = 10^-3.* Last_trock (1:96,5);
T_s_Sonntag = 10^-3.* Last_trock (1:96,6);
T_s_Werktag = 10^-3.* Last_trock (1:96,4);
%Übergeng
T_u_Samstag = 10^-3.* Last_trock (1:96,2);
T_u_Sonntag = 10^-3.* Last_trock (1:96,3);
T_u_Werktag = 10^-3.* Last_trock (1:96,1);

%%
%III. Spülmaschine
%Zuweisen der Lastgänge aus der Matrix in die jeweiligen Vektoren
%Winter
S_w_Samstag = 10^-3.* Last_spuel (1:96,11);
S_w_Sonntag = 10^-3.* Last_spuel (1:96,12);
S_w_Werktag = 10^-3.* Last_spuel (1:96,10);
%Sommer
S_s_Samstag = 10^-3.* Last_spuel (1:96,5);
S_s_Sonntag = 10^-3.* Last_spuel (1:96,6);
S_s_Werktag = 10^-3.* Last_spuel (1:96,4);
%Übergang
S_u_Samstag = 10^-3.* Last_spuel (1:96,2);
S_u_Sonntag = 10^-3.* Last_spuel (1:96,3);
S_u_Werktag = 10^-3.* Last_spuel (1:96,1);

%%
%IV. Elektroherd
%Zuweisen der Lastgänge aus der Matrix in die jeweiligen Vektoren
%Winter
H_w_Samstag = 10^-3.* Last_herd (1:96,11);
H_w_Sonntag = 10^-3.* Last_herd (1:96,12);
H_w_Werktag = 10^-3.* Last_herd (1:96,10);
%Sommer
H_s_Samstag = 10^-3.* Last_herd (1:96,5);
H_s_Sonntag = 10^-3.* Last_herd (1:96,6);
H_s_Werktag = 10^-3.* Last_herd (1:96,4);
%Übergang
H_u_Samstag = 10^-3.* Last_herd (1:96,2);
H_u_Sonntag = 10^-3.* Last_herd (1:96,3);
H_u_Werktag = 10^-3.* Last_herd (1:96,1);

%%
%V. Kuehlgeraet
%Zuweisen der Lastgänge aus der Matrix in die jeweiligen Vektoren
%Winter
K_w_Samstag = 10^-3.* Last_kuehl (1:96,11);
K_w_Sonntag = 10^-3.* Last_kuehl (1:96,12);
K_w_Werktag = 10^-3.* Last_kuehl (1:96,10);
%Sommer
K_s_Samstag = 10^-3.* Last_kuehl (1:96,5);
K_s_Sonntag = 10^-3.* Last_kuehl (1:96,6);
K_s_Werktag = 10^-3.* Last_kuehl (1:96,4);
%Übergang
K_u_Samstag = 10^-3.* Last_kuehl (1:96,2);
K_u_Sonntag = 10^-3.* Last_kuehl (1:96,3);
K_u_Werktag = 10^-3.* Last_kuehl (1:96,1);

%%
%VI. Gefriergeraet
%Zuweisen der Lastgänge aus der Matrix in die jeweiligen Vektoren
%Winter
G_w_Samstag = 10^-3.* Last_gefrier (1:96,11);
G_w_Sonntag = 10^-3.* Last_gefrier (1:96,12);
G_w_Werktag = 10^-3.* Last_gefrier (1:96,10);
%Sommer
G_s_Samstag = 10^-3.* Last_gefrier (1:96,5);
G_s_Sonntag = 10^-3.* Last_gefrier (1:96,6);
G_s_Werktag = 10^-3.* Last_gefrier (1:96,4);
%Übergang
G_u_Samstag = 10^-3.* Last_gefrier (1:96,2);
G_u_Sonntag = 10^-3.* Last_gefrier (1:96,3);
G_u_Werktag = 10^-3.* Last_gefrier (1:96,1);

%%
%VII. Fernseher
%Zuweisen der Lastgänge aus der Matrix in die jeweiligen Vektoren
%Winter
TV_w_Samstag = 10^-3.* Last_fernseher (1:96,11);
TV_w_Sonntag = 10^-3.* Last_fernseher (1:96,12);
TV_w_Werktag = 10^-3.* Last_fernseher (1:96,10);
%Sommer
TV_s_Samstag = 10^-3.* Last_fernseher (1:96,5);
TV_s_Sonntag = 10^-3.* Last_fernseher (1:96,6);
TV_s_Werktag = 10^-3.* Last_fernseher (1:96,4);
%Übergang
TV_u_Samstag = 10^-3.* Last_fernseher (1:96,2);
TV_u_Sonntag = 10^-3.* Last_fernseher (1:96,3);
TV_u_Werktag = 10^-3.* Last_fernseher (1:96,1);

%%
%VIII. Videorecorder
%Zuweisen der Lastgänge aus der Matrix in die jeweiligen Vektoren
%Winter
V_w_Samstag = 10^-3.* Last_video (1:96,11);
V_w_Sonntag = 10^-3.* Last_video (1:96,12);
V_w_Werktag = 10^-3.* Last_video (1:96,10);
%Sommer
V_s_Samstag = 10^-3.* Last_video (1:96,5);
V_s_Sonntag = 10^-3.* Last_video (1:96,6);
V_s_Werktag = 10^-3.* Last_video (1:96,4);
%Übergang
V_u_Samstag = 10^-3.* Last_video (1:96,2);
V_u_Sonntag = 10^-3.* Last_video (1:96,3);
V_u_Werktag = 10^-3.* Last_video (1:96,1);

%%
%IX. PC
%Zuweisen der Lastgänge aus der Matrix in die jeweiligen Vektoren
%Winter
PC_w_Samstag = 10^-3.* Last_pc (1:96,11);
PC_w_Sonntag = 10^-3.* Last_pc (1:96,12);
PC_w_Werktag = 10^-3.* Last_pc (1:96,10);
%Sommer
PC_s_Samstag = 10^-3.* Last_pc (1:96,5);
PC_s_Sonntag = 10^-3.* Last_pc (1:96,6);
PC_s_Werktag = 10^-3.* Last_pc (1:96,4);
%Übergang
PC_u_Samstag = 10^-3.* Last_pc (1:96,2);
PC_u_Sonntag = 10^-3.* Last_pc (1:96,3);
PC_u_Werktag = 10^-3.* Last_pc (1:96,1);

%%
%X. Telekommunikation
%Zuweisen der Lastgänge aus der Matrix in die jeweiligen Vektoren
%Winter
Tel_w_Samstag = 10^-3.* Last_tele (1:96,11);
Tel_w_Sonntag = 10^-3.* Last_tele (1:96,12);
Tel_w_Werktag = 10^-3.* Last_tele (1:96,10);
%Sommer
Tel_s_Samstag = 10^-3.* Last_tele (1:96,5);
Tel_s_Sonntag = 10^-3.* Last_tele (1:96,6);
Tel_s_Werktag = 10^-3.* Last_tele (1:96,4);
%Übergang
Tel_u_Samstag = 10^-3.* Last_tele (1:96,2);
Tel_u_Sonntag = 10^-3.* Last_tele (1:96,3);
Tel_u_Werktag = 10^-3.* Last_tele (1:96,1);

%%
%XI. Beleuchtung
%Zuweisen der Lastgänge aus der Matrix in die jeweiligen Vektoren
%Winter
Bel_w_Samstag = 10^-3.* Last_bel (1:96,11);
Bel_w_Sonntag = 10^-3.* Last_bel (1:96,12);
Bel_w_Werktag = 10^-3.* Last_bel (1:96,10);
%Sommer
Bel_s_Samstag = 10^-3.* Last_bel (1:96,5);
Bel_s_Sonntag = 10^-3.* Last_bel (1:96,6);
Bel_s_Werktag = 10^-3.* Last_bel (1:96,4);
%Übergang
Bel_u_Samstag = 10^-3.* Last_bel (1:96,2);
Bel_u_Sonntag = 10^-3.* Last_bel (1:96,3);
Bel_u_Werktag = 10^-3.* Last_bel (1:96,1);

%%
%XII. Warmwasser
%Zuweisen der Lastgänge aus der Matrix in die jeweiligen Vektoren
%Winter
Warmw_w_Samstag = 10^-3.* Last_warmw (1:96,11);
Warmw_w_Sonntag = 10^-3.* Last_warmw (1:96,12);
Warmw_w_Werktag = 10^-3.* Last_warmw (1:96,10);
%Sommer
Warmw_s_Samstag = 10^-3.* Last_warmw (1:96,5);
Warmw_s_Sonntag = 10^-3.* Last_warmw (1:96,6);
Warmw_s_Werktag = 10^-3.* Last_warmw (1:96,4);
%Übergang
Warmw_u_Samstag = 10^-3.* Last_warmw (1:96,2);
Warmw_u_Sonntag = 10^-3.* Last_warmw (1:96,3);
Warmw_u_Werktag = 10^-3.* Last_warmw (1:96,1);

%%
%XII. Restlast
%Zuweisen der Lastgänge aus der Matrix in die jeweiligen Vektoren
%Winter
Rest_w_Samstag = 10^-3.* Last_rest;
Rest_w_Sonntag = 10^-3.* Last_rest;
Rest_w_Werktag = 10^-3.* Last_rest;
%Sommer
Rest_s_Samstag = 10^-3.* Last_rest;
Rest_s_Sonntag = 10^-3.* Last_rest;
Rest_s_Werktag = 10^-3.* Last_rest;
%Übergang
Rest_u_Samstag = 10^-3.* Last_rest;
Rest_u_Sonntag = 10^-3.* Last_rest;
Rest_u_Werktag = 10^-3.* Last_rest;

%%
%Vektoren erzeugen um Lastverlauf aller Haushaltsgeräte zu plotten

A_w_Samstag = (W_w_Samstag + T_w_Samstag + S_w_Samstag + H_w_Samstag...
               + K_w_Samstag + G_w_Samstag + TV_w_Samstag + V_w_Samstag...
               + PC_w_Samstag + Tel_w_Samstag + Bel_w_Samstag + Warmw_w_Samstag...
               + Rest_w_Samstag);
A_w_Sonntag = (W_w_Sonntag + T_w_Sonntag + S_w_Sonntag + H_w_Sonntag...
               + K_w_Sonntag + G_w_Sonntag + TV_w_Sonntag + V_w_Sonntag...
               + PC_w_Sonntag + Tel_w_Sonntag + Bel_w_Sonntag + Warmw_w_Sonntag...
               + Rest_w_Sonntag);
A_w_Werktag = (W_w_Werktag + T_w_Werktag + S_w_Werktag + H_w_Werktag...
               + K_w_Werktag + G_w_Werktag + TV_w_Werktag + V_w_Werktag...
               + PC_w_Werktag + Tel_w_Werktag + Bel_w_Werktag + Warmw_w_Werktag...
               + Rest_w_Werktag);
A_s_Samstag = (W_s_Samstag + T_s_Samstag + S_s_Samstag + H_s_Samstag...
               + K_s_Samstag + G_s_Samstag + TV_s_Samstag + V_s_Samstag...
               + PC_s_Samstag + Tel_s_Samstag + Bel_s_Samstag + Warmw_s_Samstag...
               + Rest_s_Samstag);
A_s_Sonntag = (W_s_Sonntag + T_s_Sonntag + S_s_Sonntag + H_s_Sonntag...
               + K_s_Sonntag + G_s_Sonntag + TV_s_Sonntag + V_s_Sonntag...
               + PC_s_Sonntag + Tel_s_Sonntag + Bel_s_Sonntag + Warmw_s_Sonntag...
               + Rest_s_Sonntag);
A_s_Werktag = (W_s_Werktag + T_s_Werktag + S_s_Werktag + H_s_Werktag...
               + K_s_Werktag + G_s_Werktag + TV_s_Werktag + V_s_Werktag...
               + PC_s_Werktag + Tel_s_Werktag + Bel_s_Werktag + Warmw_s_Werktag...
               + Rest_s_Werktag);
A_u_Samstag = (W_u_Samstag + T_u_Samstag + S_u_Samstag + H_u_Samstag...
               + K_u_Samstag + G_u_Samstag + TV_u_Samstag + V_u_Samstag...
               + PC_u_Samstag + Tel_u_Samstag + Bel_u_Samstag + Warmw_u_Samstag...
               + Rest_u_Samstag);
A_u_Sonntag = (W_u_Sonntag + T_u_Sonntag + S_u_Sonntag + H_u_Sonntag...
               + K_u_Sonntag + G_u_Sonntag + TV_u_Sonntag + V_u_Sonntag...
               + PC_u_Sonntag + Tel_u_Sonntag + Bel_u_Sonntag + Warmw_u_Sonntag...
               + Rest_u_Sonntag);
A_u_Werktag = (W_u_Werktag + T_u_Werktag + S_u_Werktag + H_u_Werktag...
               + K_u_Werktag + G_u_Werktag + TV_u_Werktag + V_u_Werktag...
               + PC_u_Werktag + Tel_u_Werktag + Bel_u_Werktag + Warmw_u_Werktag...
               + Rest_u_Werktag);



%%
%Simulierte Haushaltslasten vom SLP abziehen

SLP_Winter_Samstag_ohne = SLP_Winter_Samstag - A_w_Samstag;
SLP_Winter_Sonntag_ohne = SLP_Winter_Sonntag - A_w_Sonntag;
SLP_Winter_Werktag_ohne = SLP_Winter_Werktag - A_w_Werktag;
SLP_Sommer_Samstag_ohne = SLP_Sommer_Samstag - A_s_Samstag;
SLP_Sommer_Sonntag_ohne = SLP_Sommer_Sonntag - A_s_Sonntag;
SLP_Sommer_Werktag_ohne = SLP_Sommer_Werktag - A_s_Werktag;
SLP_Ubergang_Samstag_ohne = SLP_Ubergang_Samstag - A_u_Samstag;
SLP_Ubergang_Sonntag_ohne = SLP_Ubergang_Sonntag - A_u_Sonntag;
SLP_Ubergang_Werktag_ohne = SLP_Ubergang_Werktag - A_u_Werktag;

%%
% Lastverläufe der Verschiebbaren Lasten

Ver_w_Samstag = (W_w_Samstag + T_w_Samstag + S_w_Samstag);
Ver_w_Sonntag = (W_w_Sonntag + T_w_Sonntag + S_w_Sonntag);
Ver_w_Werktag = (W_w_Werktag + T_w_Werktag + S_w_Werktag);
Ver_s_Samstag = (W_s_Samstag + T_s_Samstag + S_s_Samstag);
Ver_s_Sonntag = (W_s_Sonntag + T_s_Sonntag + S_s_Sonntag);
Ver_s_Werktag = (W_s_Werktag + T_s_Werktag + S_s_Werktag);
Ver_u_Samstag = (W_u_Samstag + T_u_Samstag + S_u_Samstag);
Ver_u_Sonntag = (W_u_Sonntag + T_u_Sonntag + S_u_Sonntag);
Ver_u_Werktag = (W_u_Werktag + T_u_Werktag + S_u_Werktag);

%%
%Plotten der Ergebnisse

%Zeitreihe aus der Excel lesen (nur einmal; für alle verwenden).
hilf1 = xlsread('Lastverlaeufe_Geraete.xlsx','Waschmaschine','A3:A98');
Zeit = datenum(hilf1(1:96));
%Anzahl der Haushalte und Geräte für die Plotlegende umformen.
AnzH = [int2str(Anzahl_Haushalte) ' Haushalte'];
AnzW = [int2str(Anzahl_Waschmaschinen) ' Waschmaschinen'];
AnzT = [int2str(Anzahl_Trockner) ' Trockner'];
AnzS = [int2str(Anzahl_Spuelmaschine) ' Spülmaschinen'];
AnzEH = [int2str(Anzahl_Elektroherd) ' Elektroherd'];
AnzK = [int2str(Anzahl_Kuehlgeraete) ' Kühlgeräte'];
AnzG = [int2str(Anzahl_Gefriergeraete) ' Gefriergeräte'];
AnzTV = [int2str(Anzahl_Fernseher) ' Fernseher'];
AnzV = [int2str(Anzahl_Videorecorder) ' Videorecorder'];
AnzPC = [int2str(Anzahl_PC) ' PCs'];
AnzTel = [int2str(Anzahl_Telekommunikation) ' Telekommunikation'];
AnzBel = [int2str(Anzahl_Beleuchtung) ' Beleuchtung'];
AnzWarmw = [int2str(Anzahl_Warmwasser) ' Warmwasser'];
AnzRest = [int2str(Anzahl_Restlast) ' Restlast'];
AnzA = [AnzW '   ' AnzT '   ' AnzS '   ' AnzEH '   ' AnzK '   ' AnzG '   ' AnzTV '   ' AnzV '   ' AnzPC '   ' AnzTel '   ' AnzBel '   ' AnzWarmw];
AnzA = regexprep(AnzA, '   ', '\n');

%%
%Lastverläufe in Excel übertragen und darstellen

%Anzahl Haushalte darstellen
xlswrite('Lastverlaeufe_Darstellung.xlsx',Anzahl_Haushalte,'Gesamtdarstellung','B3');
%Anzahl Haushaltsgeräte darstellen
xlswrite('Lastverlaeufe_Darstellung.xlsx',Anzahl_Waschmaschinen,'Gesamtdarstellung','B7');
xlswrite('Lastverlaeufe_Darstellung.xlsx',Anzahl_Trockner,'Gesamtdarstellung','B8');
xlswrite('Lastverlaeufe_Darstellung.xlsx',Anzahl_Spuelmaschine,'Gesamtdarstellung','B9');
xlswrite('Lastverlaeufe_Darstellung.xlsx',Anzahl_Elektroherd,'Gesamtdarstellung','B10');
xlswrite('Lastverlaeufe_Darstellung.xlsx',Anzahl_Kuehlgeraete,'Gesamtdarstellung','B11');
xlswrite('Lastverlaeufe_Darstellung.xlsx',Anzahl_Gefriergeraete,'Gesamtdarstellung','B12');
xlswrite('Lastverlaeufe_Darstellung.xlsx',Anzahl_Fernseher,'Gesamtdarstellung','B13');
xlswrite('Lastverlaeufe_Darstellung.xlsx',Anzahl_Videorecorder,'Gesamtdarstellung','B14');
xlswrite('Lastverlaeufe_Darstellung.xlsx',Anzahl_PC,'Gesamtdarstellung','B15');
xlswrite('Lastverlaeufe_Darstellung.xlsx',Anzahl_Telekommunikation,'Gesamtdarstellung','B16');
xlswrite('Lastverlaeufe_Darstellung.xlsx',Anzahl_Beleuchtung,'Gesamtdarstellung','B17');
xlswrite('Lastverlaeufe_Darstellung.xlsx',Anzahl_Warmwasser,'Gesamtdarstellung','B18');

%Übertragung der Lastverläufe Haushaltsgeräte
xlswrite('Lastverlaeufe_Darstellung.xlsx',A_w_Werktag,'Lastverläufe HH nach Verschieb.','B3'); %Winter Werktag abspeichern
xlswrite('Lastverlaeufe_Darstellung.xlsx',A_w_Samstag,'Lastverläufe HH nach Verschieb.','C3'); %Winter Samstag abspeichern
xlswrite('Lastverlaeufe_Darstellung.xlsx',A_w_Sonntag,'Lastverläufe HH nach Verschieb.','D3'); %Winter Sonntag abspeichern
xlswrite('Lastverlaeufe_Darstellung.xlsx',A_s_Werktag,'Lastverläufe HH nach Verschieb.','E3'); %Sommer Werktag abspeichern
xlswrite('Lastverlaeufe_Darstellung.xlsx',A_s_Samstag,'Lastverläufe HH nach Verschieb.','F3'); %Sommer Samstag abspeichern
xlswrite('Lastverlaeufe_Darstellung.xlsx',A_s_Sonntag,'Lastverläufe HH nach Verschieb.','G3'); %Sommer Sonntag abspeichern
xlswrite('Lastverlaeufe_Darstellung.xlsx',A_u_Werktag,'Lastverläufe HH nach Verschieb.','H3'); %Übergang Werktag abspeichern
xlswrite('Lastverlaeufe_Darstellung.xlsx',A_u_Samstag,'Lastverläufe HH nach Verschieb.','I3'); %Übergang Samstag abspeichern
xlswrite('Lastverlaeufe_Darstellung.xlsx',A_u_Sonntag,'Lastverläufe HH nach Verschieb.','J3'); %Übergang Sonntag abspeichern

%Übertragung der Lastverläufe der Verschiebbaren Lasten
xlswrite('Lastverlaeufe_Darstellung.xlsx',Ver_w_Werktag,'Lastverläufe Verschiebbare nach','B3'); %Winter Werktag abspeichern
xlswrite('Lastverlaeufe_Darstellung.xlsx',Ver_w_Samstag,'Lastverläufe Verschiebbare nach','C3'); %Winter Samstag abspeichern
xlswrite('Lastverlaeufe_Darstellung.xlsx',Ver_w_Sonntag,'Lastverläufe Verschiebbare nach','D3'); %Winter Sonntag abspeichern
xlswrite('Lastverlaeufe_Darstellung.xlsx',Ver_s_Werktag,'Lastverläufe Verschiebbare nach','E3'); %Sommer Werktag abspeichern
xlswrite('Lastverlaeufe_Darstellung.xlsx',Ver_s_Samstag,'Lastverläufe Verschiebbare nach','F3'); %Sommer Samstag abspeichern
xlswrite('Lastverlaeufe_Darstellung.xlsx',Ver_s_Sonntag,'Lastverläufe Verschiebbare nach','G3'); %Sommer Sonntag abspeichern
xlswrite('Lastverlaeufe_Darstellung.xlsx',Ver_u_Werktag,'Lastverläufe Verschiebbare nach','H3'); %Übergang Werktag abspeichern
xlswrite('Lastverlaeufe_Darstellung.xlsx',Ver_u_Samstag,'Lastverläufe Verschiebbare nach','I3'); %Übergang Samstag abspeichern
xlswrite('Lastverlaeufe_Darstellung.xlsx',Ver_u_Sonntag,'Lastverläufe Verschiebbare nach','J3'); %Übergang Sonntag abspeichern

%%
%Auswahl des zu plottenden Lastverlaufs

Menue_Auswahl_Plot_nach(Zeit, Ver_w_Werktag, A_w_Werktag, ...
    Ver_w_Samstag, A_w_Samstag, ...
    Ver_w_Sonntag, A_w_Sonntag, ...
    Ver_s_Werktag, A_s_Werktag, ...
    Ver_s_Samstag, A_s_Samstag, ...
    Ver_s_Sonntag, A_s_Sonntag, ...
    Ver_u_Werktag, A_u_Werktag, ...
    Ver_u_Samstag, A_u_Samstag, ...
    Ver_u_Sonntag, A_u_Sonntag, ...
    AnzH, AnzA);
return;
