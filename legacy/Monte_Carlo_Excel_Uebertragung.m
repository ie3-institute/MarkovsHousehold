% Übertragung der Ergebnisse in Excel

% Start der Zeitmessung
tic;
Geraetnummer = 0;

% Erstellen der Überschriften für die einzelnen Sheets
ueberschrift =  [{'Jahrestag [d]'},...
                {'von [std:min]'},...
                {'bis [std:min]'},...
                {'Erwartungswert [W]'},...
                {'Mittelwert [W]'},...
                {'Standardabweichung [W]'}];

ueberschrift2 = [{'Jahrestag [d]'},...
                {'von [std:min]'},...
                {'bis [std:min]'},...
                {'Leistung [W]'}];
            
% Definition der Variablen
laufvar2 = 0;
Zeitstring = cell(end_Intervall - start_Intervall - n_pro_tag*einschwingtage + 1,3);

% Erstellen des Zeitstrings (Jahrestag, Zeitintervall von ... bis)
for laufvar1 = start_Intervall + n_pro_tag*einschwingtage:1:end_Intervall
    
    laufvar2 = laufvar2 + 1;
    min_von = laufvar1*15 - 15;
    min_bis = laufvar1*15;
    Zeit_von = [floor(min_von/1440),floor(rem(min_von,1440)/60),floor(rem(rem(min_von,1440),60))];
    Zeit_bis = [floor(min_bis/1440),floor(rem(min_bis,1440)/60),floor(rem(rem(min_bis,1440),60))];
    
        if Zeit_bis(2) == 0 && Zeit_bis(3) == 0
            Zeit_bis(2) = 24;
        end
    
    Zeitstring(laufvar2,1) = {num2str(Zeit_von(1),'%04d')};
    Zeitstring(laufvar2,2) = {[num2str(Zeit_von(2),'%02d') ':' num2str(Zeit_von(3),'%02d')]};
    Zeitstring(laufvar2,3) = {[num2str(Zeit_bis(2),'%02d') ':' num2str(Zeit_bis(3),'%02d')]};
    
end

% Übertragung der einzelnen Matrizen in das entsprechende Excel-Sheet
for laufvar3 = 1:1:14
    
    switch laufvar3
        
        case 1
            % Erstellen des Cell Arrays für die Übertragung Waschmaschine
            Uebertragung_Waschmaschine = cell(anzahl_Intervalle_Simulation+1,Anzahl_Monte_Durchlaufe+6);
            Uebertragung_Waschmaschine(1,1:6) = ueberschrift;
            Uebertragung_Waschmaschine(1,7:end) = ueberschrift_zeitreihe;
            Uebertragung_Waschmaschine(2:end,1:3) = Zeitstring;
            Uebertragung_Waschmaschine(2:end,4:end) = num2cell(Pzeitreihe_Monte_Matrix_Waschmaschine);
            % Übertragung in Excel in das entsprechende Sheet
            xlswrite('Lastverlaeufe_Geraete_Monte.xlsm',Uebertragung_Waschmaschine,'Waschmaschine');
        
        case 2
            % Erstellen des Cell Arrays für die Übertragung Trockner
            Uebertragung_Trockner = cell(anzahl_Intervalle_Simulation+1,Anzahl_Monte_Durchlaufe+6);
            Uebertragung_Trockner(1,1:6) = ueberschrift;
            Uebertragung_Trockner(1,7:end) = ueberschrift_zeitreihe;
            Uebertragung_Trockner(2:end,1:3) = Zeitstring;
            Uebertragung_Trockner(2:end,4:end) = num2cell(Pzeitreihe_Monte_Matrix_Trockner);
            % Übertragung in Excel in das entsprechende Sheet
            xlswrite('Lastverlaeufe_Geraete_Monte.xlsm',Uebertragung_Trockner,'Trockner');
            
        case 3
            % Erstellen des Cell Arrays für die Übertragung Spülmaschine
            Uebertragung_Spuelmaschine = cell(anzahl_Intervalle_Simulation+1,Anzahl_Monte_Durchlaufe+6);
            Uebertragung_Spuelmaschine(1,1:6) = ueberschrift;
            Uebertragung_Spuelmaschine(1,7:end) = ueberschrift_zeitreihe;
            Uebertragung_Spuelmaschine(2:end,1:3) = Zeitstring;
            Uebertragung_Spuelmaschine(2:end,4:end) = num2cell(Pzeitreihe_Monte_Matrix_Spuelmaschine);
            % Übertragung in Excel in das entsprechende Sheet
            xlswrite('Lastverlaeufe_Geraete_Monte.xlsm',Uebertragung_Spuelmaschine,'Spuelmaschine');
            
        case 4
            % Erstellen des Cell Arrays für die Übertragung Elektroherd
            Uebertragung_Elektroherd = cell(anzahl_Intervalle_Simulation+1,Anzahl_Monte_Durchlaufe+6);
            Uebertragung_Elektroherd(1,1:6) = ueberschrift;
            Uebertragung_Elektroherd(1,7:end) = ueberschrift_zeitreihe;
            Uebertragung_Elektroherd(2:end,1:3) = Zeitstring;
            Uebertragung_Elektroherd(2:end,4:end) = num2cell(Pzeitreihe_Monte_Matrix_Elektroherd);
            % Übertragung in Excel in das entsprechende Sheet
            xlswrite('Lastverlaeufe_Geraete_Monte.xlsm',Uebertragung_Elektroherd,'Elektroherd');
            
        case 5
            % Erstellen des Cell Arrays für die Übertragung Kühlgerät
            Uebertragung_Kuehlgeraet = cell(anzahl_Intervalle_Simulation+1,4);
            Uebertragung_Kuehlgeraet(1,1:4) = ueberschrift2;
            Uebertragung_Kuehlgeraet(2:end,1:3) = Zeitstring;
            Uebertragung_Kuehlgeraet(2:end,4) = num2cell(Pzeitreihe_Monte_Matrix_Kuehlgeraet);
            % Übertragung in Excel in das entsprechende Sheet
            xlswrite('Lastverlaeufe_Geraete_Monte.xlsm',Uebertragung_Kuehlgeraet,'Kuehlgeraet');
            
        case 6
            % Erstellen des Cell Arrays für die Übertragung Gefriergerät
            Uebertragung_Gefriergeraet = cell(anzahl_Intervalle_Simulation+1,4);
            Uebertragung_Gefriergeraet(1,1:4) = ueberschrift2;
            Uebertragung_Gefriergeraet(2:end,1:3) = Zeitstring;
            Uebertragung_Gefriergeraet(2:end,4) = num2cell(Pzeitreihe_Monte_Matrix_Gefriergeraet);
            % Übertragung in Excel in das entsprechende Sheet
            xlswrite('Lastverlaeufe_Geraete_Monte.xlsm',Uebertragung_Gefriergeraet,'Gefriergeraet');
            
        case 7
            % Erstellen des Cell Arrays für die Übertragung Fernseher
            Uebertragung_Fernseher = cell(anzahl_Intervalle_Simulation+1,Anzahl_Monte_Durchlaufe+6);
            Uebertragung_Fernseher(1,1:6) = ueberschrift;
            Uebertragung_Fernseher(1,7:end) = ueberschrift_zeitreihe;
            Uebertragung_Fernseher(2:end,1:3) = Zeitstring;
            Uebertragung_Fernseher(2:end,4:end) = num2cell(Pzeitreihe_Monte_Matrix_Fernseher);
            % Übertragung in Excel in das entsprechende Sheet
            xlswrite('Lastverlaeufe_Geraete_Monte.xlsm',Uebertragung_Fernseher,'Fernseher');
            
        case 8
            % Erstellen des Cell Arrays für die Übertragung Videorecorder
            Uebertragung_Videorecorder = cell(anzahl_Intervalle_Simulation+1,Anzahl_Monte_Durchlaufe+6);
            Uebertragung_Videorecorder(1,1:6) = ueberschrift;
            Uebertragung_Videorecorder(1,7:end) = ueberschrift_zeitreihe;
            Uebertragung_Videorecorder(2:end,1:3) = Zeitstring;
            Uebertragung_Videorecorder(2:end,4:end) = num2cell(Pzeitreihe_Monte_Matrix_Videorecorder);
            % Übertragung in Excel in das entsprechende Sheet
            xlswrite('Lastverlaeufe_Geraete_Monte.xlsm',Uebertragung_Videorecorder,'Videorecorder');
            
        case 9
            % Erstellen des Cell Arrays für die Übertragung PC
            Uebertragung_PC = cell(anzahl_Intervalle_Simulation+1,Anzahl_Monte_Durchlaufe+6);
            Uebertragung_PC(1,1:6) = ueberschrift;
            Uebertragung_PC(1,7:end) = ueberschrift_zeitreihe;
            Uebertragung_PC(2:end,1:3) = Zeitstring;
            Uebertragung_PC(2:end,4:end) = num2cell(Pzeitreihe_Monte_Matrix_PC);
            % Übertragung in Excel in das entsprechende Sheet
            xlswrite('Lastverlaeufe_Geraete_Monte.xlsm',Uebertragung_PC,'PC');
            
        case 10
            % Erstellen des Cell Arrays für die Übertragung Telekommunikation
            Uebertragung_Telekommunikation = cell(anzahl_Intervalle_Simulation+1,Anzahl_Monte_Durchlaufe+6);
            Uebertragung_Telekommunikation(1,1:6) = ueberschrift;
            Uebertragung_Telekommunikation(1,7:end) = ueberschrift_zeitreihe;
            Uebertragung_Telekommunikation(2:end,1:3) = Zeitstring;
            Uebertragung_Telekommunikation(2:end,4:end) = num2cell(Pzeitreihe_Monte_Matrix_Telekommunikation);
            % Übertragung in Excel in das entsprechende Sheet
            xlswrite('Lastverlaeufe_Geraete_Monte.xlsm',Uebertragung_Telekommunikation,'Telekommunikation');
            
        case 11
            % Erstellen des Cell Arrays für die Übertragung Beleuchtung
            Uebertragung_Beleuchtung = cell(anzahl_Intervalle_Simulation+1,Anzahl_Monte_Durchlaufe+6);
            Uebertragung_Beleuchtung(1,1:6) = ueberschrift;
            Uebertragung_Beleuchtung(1,7:end) = ueberschrift_zeitreihe;
            Uebertragung_Beleuchtung(2:end,1:3) = Zeitstring;
            Uebertragung_Beleuchtung(2:end,4:end) = num2cell(Pzeitreihe_Monte_Matrix_Beleuchtung);
            % Übertragung in Excel in das entsprechende Sheet
            xlswrite('Lastverlaeufe_Geraete_Monte.xlsm',Uebertragung_Beleuchtung,'Beleuchtung');
            
        case 12
            % Erstellen des Cell Arrays für die Übertragung Warmwasser
            Uebertragung_Warmwasser = cell(anzahl_Intervalle_Simulation+1,Anzahl_Monte_Durchlaufe+6);
            Uebertragung_Warmwasser(1,1:6) = ueberschrift;
            Uebertragung_Warmwasser(1,7:end) = ueberschrift_zeitreihe;
            Uebertragung_Warmwasser(2:end,1:3) = Zeitstring;
            Uebertragung_Warmwasser(2:end,4:end) = num2cell(Pzeitreihe_Monte_Matrix_Warmwasser);
            % Übertragung in Excel in das entsprechende Sheet
            xlswrite('Lastverlaeufe_Geraete_Monte.xlsm',Uebertragung_Warmwasser,'Warmwasser');
            
        case 13
            % Erstellen des Cell Arrays für die Übertragung Summe
            Uebertragung_Summe = cell(anzahl_Intervalle_Simulation+1,Anzahl_Monte_Durchlaufe+6);
            Uebertragung_Summe(1,1:6) = ueberschrift;
            Uebertragung_Summe(1,7:end) = ueberschrift_zeitreihe;
            Uebertragung_Summe(2:end,1:3) = Zeitstring;
            Uebertragung_Summe(2:end,4:end) = num2cell(Pzeitreihe_Monte_Matrix_Summe);
            % Übertragung in Excel in das entsprechende Sheet
            xlswrite('Lastverlaeufe_Geraete_Monte.xlsm',Uebertragung_Summe,'Summe');
            
        case 14
            % Erstellen des Cell Arrays für die Übertragung Verschiebbare Lasten
            Uebertragung_Versch = cell(anzahl_Intervalle_Simulation+1,Anzahl_Monte_Durchlaufe+6);
            Uebertragung_Versch(1,1:6) = ueberschrift;
            Uebertragung_Versch(1,7:end) = ueberschrift_zeitreihe;
            Uebertragung_Versch(2:end,1:3) = Zeitstring;
            Uebertragung_Versch(2:end,4:end) = num2cell(Pzeitreihe_Monte_Matrix_Versch);
            % Übertragung in Excel in das entsprechende Sheet
            xlswrite('Lastverlaeufe_Geraete_Monte.xlsm',Uebertragung_Versch,'Verschiebbare Lasten');
            
    end
    
    % Zeitmessung pro Gerät
    Geraetnummer = Geraetnummer + 1
    Zeitmessung_in_Minuten_pro_Geraet = toc/60

end

% Ende der Zeitmessung und Ausgabe der Gesamtzeit
Zeitmessung_in_Sekunden = toc
Zeitmessung_in_Minuten = Zeitmessung_in_Sekunden/60

