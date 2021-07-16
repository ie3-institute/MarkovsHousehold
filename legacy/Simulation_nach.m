% Analytische Simulation


for laufvariable1 = 1:1:10

    % Waschmaschine
if laufvariable1 == 1    
    P_Geraet = P_berechnet_Waschmaschine;
    V = Vstart_Waschmaschine;
    P = P_Waschmaschine;
    P_leistung = [0;Lastgang_Waschmaschine];
    geraet = 'Waschmaschine';
    Anzahl_gereate = Vektor_Anzahl_Geraete(1,1);
end 

    % Trockner
if laufvariable1 == 2    
    P_Geraet = P_berechnet_Trockner;
    V = Vstart_Trockner;
    P = P_Trockner;
    P_leistung = [0;Lastgang_Trockner];
    geraet = 'Trockner';
    Anzahl_gereate = Vektor_Anzahl_Geraete(2,1);
end 

    % Spuelmaschine
if laufvariable1 == 3    
    P_Geraet = P_berechnet_Spuelmaschine;
    V = Vstart_Spuelmaschine;
    P = P_Spuelmaschine;
    P_leistung = [0;Lastgang_Spuelmaschine];
    geraet = 'Spuelmaschine';
    Anzahl_gereate = Vektor_Anzahl_Geraete(3,1);
end 

    % Elektroherd
if laufvariable1 == 4    
    P_Geraet = P_berechnet_Elektroherd;
    V = Vstart_Elektroherd;
    P = P_Elektroherd;
    P_leistung = [0;Lastgang_Elektroherd];
    geraet = 'Elektroherd';
    Anzahl_gereate = Vektor_Anzahl_Geraete(4,1);
end 

    % Fernseher
if laufvariable1 == 5    
    P_Geraet = P_berechnet_Fernseher;
    V = Vstart_Fernseher;
    P = P_Fernseher;
    P_leistung = [0;Lastgang_Fernseher];
    geraet = 'Fernseher';
    Anzahl_gereate = Vektor_Anzahl_Geraete(7,1);
end 

    % Videorecorder
if laufvariable1 == 6    
    P_Geraet = P_berechnet_Videorecorder;
    V = Vstart_Videorecorder;
    P = P_Videorecorder;
    P_leistung = [0;Lastgang_Videorecorder];
    geraet = 'Videorecorder';
    Anzahl_gereate = Vektor_Anzahl_Geraete(8,1);
end 

    % PC
if laufvariable1 == 7    
    P_Geraet = P_berechnet_PC;
    V = Vstart_PC;
    P = P_PC;
    P_leistung = [0;Lastgang_PC];
    geraet = 'PC';
    Anzahl_gereate = Vektor_Anzahl_Geraete(9,1);
end 

    % Telekommunikation
if laufvariable1 == 8    
    P_Geraet = P_berechnet_Telekommunikation;
    V = Vstart_Telekommunikation;
    P = P_Telekommunikation;
    P_leistung = [0;Lastgang_Telekommunikation];
    geraet = 'Telekommunikation';
    Anzahl_gereate = Vektor_Anzahl_Geraete(10,1);
end 

    % Beleuchtung
if laufvariable1 == 9    
    P_Geraet = P_berechnet_Beleuchtung;
    V = Vstart_Beleuchtung;
    P = P_Beleuchtung;
    P_leistung = [0;Lastgang_Beleuchtung];
    geraet = 'Beleuchtung';
    Anzahl_gereate = Vektor_Anzahl_Geraete(11,1);
end

    % Warmwasser
if laufvariable1 == 10    
    P_Geraet = P_berechnet_Warmwasser;
    V = Vstart_Warmwasser;
    P = P_Warmwasser;
    P_leistung = [0;Lastgang_Warmwasser];
    geraet = 'Warmwasser';
    Anzahl_gereate = Vektor_Anzahl_Geraete(12,1);
end


     %%%%for n = start_Intervall:1:end_Intervall
    for n = 1:1:35040
    
        % Ermittlung des Tages im Jahr
        Jahrestag = floor((n/(365*n_pro_tag) - floor((n/(365*n_pro_tag))))*365);
        % Ermittlung des Tages-Intervalls
        Tages_Intervall = floor((n/n_pro_tag - floor((n/n_pro_tag)))*n_pro_tag);
    
        if Tages_Intervall == 0
            Tages_Intervall = 96;      % Notwendig, da z.B bei n = 96 null rauskommt
        end
        
        % Ermittlung des Wochentages
        WT = ceil((n/(7*n_pro_tag) - floor(n/(7*n_pro_tag + 10e-9)))*7);

        % Frühling
        if (n >= Fruehling_Anfang)&&(n < Sommer_Anfang)
           
            switch WT
                case {1,2,3,4,5}
                    P(2,1) = P_Geraet(Tages_Intervall,1);
                    P(1,1) = 1 - P(2,1);
                case 6
                    P(2,1) = P_Geraet(Tages_Intervall,2);
                    P(1,1) = 1 - P(2,1);
                case 7
                    P(2,1) = P_Geraet(Tages_Intervall,3);
                    P(1,1) = 1 - P(2,1);
            end
            
        end
        
        % Sommer
        if (n >= Sommer_Anfang)&&(n < Herbst_Anfang)
            
            switch WT
                case {1,2,3,4,5}
                    P(2,1) = P_Geraet(Tages_Intervall,4);
                    P(1,1) = 1 - P(2,1);
                case 6
                    P(2,1) = P_Geraet(Tages_Intervall,5);
                    P(1,1) = 1 - P(2,1);
                case 7
                    P(2,1) = P_Geraet(Tages_Intervall,6);
                    P(1,1) = 1 - P(2,1);
            end
           
        end
        
        % Herbst
        if (n >= Herbst_Anfang)&&(n < Winter_Anfang)
            
            switch WT
                case {1,2,3,4,5}
                    P(2,1) = P_Geraet(Tages_Intervall,7);
                    P(1,1) = 1 - P(2,1);
                case 6
                    P(2,1) = P_Geraet(Tages_Intervall,8);
                    P(1,1) = 1 - P(2,1);
                case 7
                    P(2,1) = P_Geraet(Tages_Intervall,9);
                    P(1,1) = 1 - P(2,1);
            end
           
        end
        
        % Winter
        if (n >= Winter_Anfang)||(n < Fruehling_Anfang)
            
            switch WT
                case {1,2,3,4,5}
                    P(2,1) = P_Geraet(Tages_Intervall,10);
                    P(1,1) = 1 - P(2,1);
                case 6
                    P(2,1) = P_Geraet(Tages_Intervall,11);
                    P(1,1) = 1 - P(2,1);
                case 7
                    P(2,1) = P_Geraet(Tages_Intervall,12);
                    P(1,1) = 1 - P(2,1);
            end
           
            
        end


        % Bestimmung des neuen Zusstandsvektors V = P*V
        V = P*V;
        
        P_opt_abspeichern(n,1)=P(2,1);  
        Pzeitreihe_perhand(n,1) = V'*P_leistung; 
       
    end
    
    % Anzahl der Geräte berücksichtigen
    Pzeitreihe_perhand=Pzeitreihe_perhand.*Anzahl_gereate;

    
% Die Zahlen in den Klammern stehen für den ersten Samstag in der jeweiligen Jahreszeit
% Ziel abspeichern der Werk, Samst und Sonntage
    
% Frühling    
xlswrite('Lastverlaeufe_Geraete.xlsx',Pzeitreihe_perhand(((7873)+4*n_pro_tag):(7873)+(4*n_pro_tag)+n_pro_tag-1),geraet,'B3'); %Werktag abspeichern
xlswrite('Lastverlaeufe_Geraete.xlsx',Pzeitreihe_perhand(((7873)+7*n_pro_tag):(7873)+(7*n_pro_tag)+n_pro_tag-1),geraet,'C3');%Samstag abspeichern
xlswrite('Lastverlaeufe_Geraete.xlsx',Pzeitreihe_perhand(((7873)+8*n_pro_tag):(7873)+(8*n_pro_tag)+n_pro_tag-1),geraet,'D3');%Sonntag abspeichern

% Sommer
xlswrite('Lastverlaeufe_Geraete.xlsx',Pzeitreihe_perhand(((16608)+4*n_pro_tag):(16608)+(4*n_pro_tag)+n_pro_tag-1),geraet,'E3'); %Werktag abspeichern
xlswrite('Lastverlaeufe_Geraete.xlsx',Pzeitreihe_perhand(((16608)+7*n_pro_tag):(16608)+(7*n_pro_tag)+n_pro_tag-1),geraet,'F3');%Samstag abspeichern
xlswrite('Lastverlaeufe_Geraete.xlsx',Pzeitreihe_perhand(((16608)+8*n_pro_tag):(16608)+(8*n_pro_tag)+n_pro_tag-1),geraet,'G3');%Sonntag abspeichern

% Herbst
xlswrite('Lastverlaeufe_Geraete.xlsx',Pzeitreihe_perhand(((26016)+4*n_pro_tag):(26016)+(4*n_pro_tag)+n_pro_tag-1),geraet,'H3'); %Werktag abspeichern
xlswrite('Lastverlaeufe_Geraete.xlsx',Pzeitreihe_perhand(((26016)+7*n_pro_tag):(26016)+(7*n_pro_tag)+n_pro_tag-1),geraet,'I3');%Samstag abspeichern
xlswrite('Lastverlaeufe_Geraete.xlsx',Pzeitreihe_perhand(((26016)+8*n_pro_tag):(26016)+(8*n_pro_tag)+n_pro_tag-1),geraet,'J3');%Sonntag abspeichern

% Winter
xlswrite('Lastverlaeufe_Geraete.xlsx',Pzeitreihe_perhand(((481)+4*n_pro_tag):(481)+(4*n_pro_tag)+n_pro_tag-1),geraet,'K3'); %Werktag abspeichern
xlswrite('Lastverlaeufe_Geraete.xlsx',Pzeitreihe_perhand(((481)+7*n_pro_tag):(481)+(7*n_pro_tag)+n_pro_tag-1),geraet,'L3');%Samstag abspeichern
xlswrite('Lastverlaeufe_Geraete.xlsx',Pzeitreihe_perhand(((481)+8*n_pro_tag):(481)+(8*n_pro_tag)+n_pro_tag-1),geraet,'M3');%Sonntag abspeichern

end

% Erstellen der Lastgänge Kühlgerät und Gefriergerät (Grundlast)
% Kuehlgeraet
P_leistung = Lastgang_Kuehlgeraet';
Anzahl_Geraete = Vektor_Anzahl_Geraete(5,1);
Pzeitreihe_Kuehlgeraet = zeros(96,1);
Rest_Laenge = length(Pzeitreihe_Kuehlgeraet);
    
for n = 1:1:96
        
    if Pzeitreihe_Kuehlgeraet(n) == 0
    
        Zufallstart = randi(3);
    
        switch Zufallstart
            case 1
                P_leistung_neu = P_leistung;
                laenge = length(P_leistung_neu);
        
            case 2
                P_leistung_neu = P_leistung(2:end);
                laenge = length(P_leistung_neu);
        
            case 3
                P_leistung_neu = P_leistung(3:end);
                laenge = length(P_leistung_neu);
        end
        if Rest_Laenge > length(P_leistung_neu)
            Pzeitreihe_Kuehlgeraet(n:n+laenge-1) = P_leistung_neu;
            Rest_Laenge = Rest_Laenge - laenge;
        else
            Pzeitreihe_Kuehlgeraet(n:end) = P_leistung_neu(1:Rest_Laenge);
        end
    end
end
    
Pzeitreihe_Kuehlgeraet = Pzeitreihe_Kuehlgeraet*Anzahl_Geraete;
Pzeitreihe_Kuehlgeraet_Uebertrag = zeros(96,12);

for hilf_uebertrag = 1:1:12
    Pzeitreihe_Kuehlgeraet_Uebertrag(:,hilf_uebertrag) = Pzeitreihe_Kuehlgeraet;
end

xlswrite('Lastverlaeufe_Geraete.xlsx',Pzeitreihe_Kuehlgeraet_Uebertrag,'Kuehlgeraet','B3');

% Gefriergeraet
P_leistung = Lastgang_Gefriergeraet';
Anzahl_Geraete = Vektor_Anzahl_Geraete(6,1);
Pzeitreihe_Gefriergeraet = zeros(96,1);
Rest_Laenge = length(Pzeitreihe_Gefriergeraet);
    
for n = 1:1:96
        
    if Pzeitreihe_Gefriergeraet(n) == 0
    
        Zufallstart = randi(3);
    
        switch Zufallstart
            case 1
                P_leistung_neu = P_leistung;
                laenge = length(P_leistung_neu);
        
            case 2
                P_leistung_neu = P_leistung(2:end);
                laenge = length(P_leistung_neu);
        
            case 3
                P_leistung_neu = P_leistung(3:end);
                laenge = length(P_leistung_neu);
        end
        if Rest_Laenge > length(P_leistung_neu)
            Pzeitreihe_Gefriergeraet(n:n+laenge-1) = P_leistung_neu;
            Rest_Laenge = Rest_Laenge - laenge;
        else
            Pzeitreihe_Gefriergeraet(n:end) = P_leistung_neu(1:Rest_Laenge);
        end
    end
end
    
Pzeitreihe_Gefriergeraet = Pzeitreihe_Gefriergeraet*Anzahl_Geraete;
Pzeitreihe_Gefriergeraet_Uebertrag = zeros(96,12);

for hilf_uebertrag = 1:1:12
    Pzeitreihe_Gefriergeraet_Uebertrag(:,hilf_uebertrag) = Pzeitreihe_Gefriergeraet;
end

xlswrite('Lastverlaeufe_Geraete.xlsx',Pzeitreihe_Gefriergeraet_Uebertrag,'Gefriergeraet','B3');