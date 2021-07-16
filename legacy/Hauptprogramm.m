% Auswahl des gewünschten Programmpunktes

reply3 = 0;

versch = input('\n Simulation mit Lastverschiebung? \n\n [1] Ja \n\n [2] Nein \n\n >> ','s');
versch = sscanf(versch,'%f');

switch versch
    
    % Mit Lastverschiebung
    case 1
        
    auswahl_typtage = input('\n\n Simulation nach Typtagen? \n\n [1] Ja \n\n [2] Nein \n\n >> ','s');
    auswahl_typtage = sscanf(auswahl_typtage,'%f');
        
    switch auswahl_typtage
        
        % Simulation Lastverschiebung nach Typtagen
        case 1
        
        Wahrscheinlichkeiten_Lastverschiebung;
        
        while reply3 ~= 9

            reply3 = input('\n\n Berechnung der Übergangswahrscheinlichkeiten\n [1] "Berechnung Übergangswahrscheinlichkeiten"\n\n\n Analytische Simulation\n [2] "Analytische Simulation der Lastverläufe"\n\n [3] "Plotten der analytischen Lastverläufe"\n\n\n Monte Carlo Simulation\n [4] "Monte Carlo Simulation"\n\n [5] "Monte Carlo Ergebnisse in Excel übertragen"\n\n\n Quit\n [9] Quit Main Menu\n\n >> ','s');
            reply3 = sscanf(reply3,'%f');

                switch reply3

                    % Berechnung der Übergangswahrscheinlichkeiten
                    case 1
                    Parameterberechnung_nach;

                    % Analytische Simulation
                    case 2
                    Simulation_nach;

                    case 3
                    Plotten_nach;
                    return;

                    % Monte Carlo Simulation
                    case 4
                    Anzahl_Monte_Durchlaufe = str2double(input('\n Anzahl Monte Carlo Simulationen: ','s'));
                    Simulation_Monte_Carlo_nach;

                    case 5
                    Monte_Carlo_Excel_Uebertragung;

                end
                
        end
        
        % Simulation Lastverschiebung ohne Typtage
        case 2
        
        Wahrscheinlichkeiten_Lastverschiebung_Jahr;
        
        while reply3 ~= 9
            
            reply3 = input('\n\n Berechnung der Übergangswahrscheinlichkeiten\n [1] "Berechnung Übergangswahrscheinlichkeiten"\n\n\n Analytische Simulation\n [2] "Analytische Simulation der Lastverläufe"\n\n [3] "Plotten der analytischen Lastverläufe"\n\n\n Monte Carlo Simulation\n [4] "Monte Carlo Simulation"\n\n [5] "Monte Carlo Ergebnisse in Excel übertragen"\n\n\n Quit\n [9] Quit Main Menu\n\n >> ','s');
            reply3 = sscanf(reply3,'%f');
                
                switch reply3

                    % Berechnung der Übergangswahrscheinlichkeiten
                    case 1
                    Parameterberechnung_nach;
                    Parameterberechnung_nach_Jahr;

                    % Analytische Simulation
                    case 2
                    Simulation_nach;

                    case 3
                    Plotten_nach;
                    return;

                    % Monte Carlo Simulation
                    case 4
                    Anzahl_Monte_Durchlaufe = str2double(input('\n Anzahl Monte Carlo Simulationen: ','s'));
                    Simulation_Monte_Carlo_nach_Jahr;

                    case 5
                    Monte_Carlo_Excel_Uebertragung;

                end
                
        end
        
    end
    
    % Ohne Lastverschiebung
    case 2
        
    while reply3 ~= 9
            
        reply3 = input('\n\n Berechnung der Übergangswahrscheinlichkeiten\n [1] "Berechnung Übergangswahrscheinlichkeiten"\n\n\n Analytische Simulation\n [2] "Analytische Simulation der Lastverläufe"\n\n [3] "Plotten der analytischen Lastverläufe"\n\n\n Monte Carlo Simulation\n [4] "Monte Carlo Simulation"\n\n [5] "Monte Carlo Ergebnisse in Excel übertragen"\n\n\n Quit\n [9] Quit Main Menu\n\n >> ','s');
        reply3 = sscanf(reply3,'%f');

        switch reply3
            
            % Berechnung der Übergangswahrscheinlichkeiten
            case 1
            Parameterberechnung;
        
            % Analytische Simulation
            case 2
            Simulation;
        
            case 3
            Plotten;
            return;
        
            % Monte Carlo Simulation
            case 4
            Anzahl_Monte_Durchlaufe = str2double(input('\n Anzahl Monte Carlo Simulationen: ','s'));
            Simulation_Monte_Carlo;
            
            case 5
            Monte_Carlo_Excel_Uebertragung;
            
        end
            
    end

end
disp(' ');