%% Monte Carlo Simulation

% Start der Zeitmessung
tic;
Geraetnummer = 0;

% Cell Array für die Überschrift der einzelnen Zeitreihen
ueberschrift_zeitreihe = cell(1,Anzahl_Monte_Durchlaufe);


for laufvariable1 = 1:1:10

    % Waschmaschine
if laufvariable1 == 1
    P_Geraet = P_berechnet_Waschmaschine_Jahr;
    V = Vstart_Waschmaschine;
    P = P_Waschmaschine;
    P_leistung = [0;Lastgang_Waschmaschine];
    geraet = 'Waschmaschine';
    Anzahl_gereate = Vektor_Anzahl_Geraete(1,1);
    Pzeitreihe_Monte_Matrix_Waschmaschine = zeros(anzahl_Intervalle_Simulation,Anzahl_Monte_Durchlaufe+3);
    Pzeitreihe_perhand_Waschmaschine = zeros(anzahl_Intervalle_Simulation,1);
end

    % Trockner
if laufvariable1 == 2
    P_Geraet = P_berechnet_Trockner_Jahr;
    V = Vstart_Trockner;
    P = P_Trockner;
    P_leistung = [0;Lastgang_Trockner];
    geraet = 'Trockner';
    Anzahl_gereate = Vektor_Anzahl_Geraete(2,1);
    Pzeitreihe_Monte_Matrix_Trockner = zeros(anzahl_Intervalle_Simulation,Anzahl_Monte_Durchlaufe+3);
    Pzeitreihe_perhand_Trockner = zeros(anzahl_Intervalle_Simulation,1);
end

    % Spuelmaschine
if laufvariable1 == 3
    P_Geraet = P_berechnet_Spuelmaschine_Jahr;
    V = Vstart_Spuelmaschine;
    P = P_Spuelmaschine;
    P_leistung = [0;Lastgang_Spuelmaschine];
    geraet = 'Spuelmaschine';
    Anzahl_gereate = Vektor_Anzahl_Geraete(3,1);
    Pzeitreihe_Monte_Matrix_Spuelmaschine = zeros(anzahl_Intervalle_Simulation,Anzahl_Monte_Durchlaufe+3);
    Pzeitreihe_perhand_Spuelmaschine = zeros(anzahl_Intervalle_Simulation,1);
end

    % Elektroherd
if laufvariable1 == 4
    P_Geraet = P_berechnet_Elektroherd;
    V = Vstart_Elektroherd;
    P = P_Elektroherd;
    P_leistung = [0;Lastgang_Elektroherd];
    geraet = 'Elektroherd';
    Anzahl_gereate = Vektor_Anzahl_Geraete(4,1);
    Pzeitreihe_Monte_Matrix_Elektroherd = zeros(anzahl_Intervalle_Simulation,Anzahl_Monte_Durchlaufe+3);
    Pzeitreihe_perhand_Elektroherd = zeros(anzahl_Intervalle_Simulation,1);
end

    % Fernseher
if laufvariable1 == 5
    P_Geraet = P_berechnet_Fernseher;
    V = Vstart_Fernseher;
    P = P_Fernseher;
    P_leistung = [0;Lastgang_Fernseher];
    geraet = 'Fernseher';
    Anzahl_gereate = Vektor_Anzahl_Geraete(7,1);
    Pzeitreihe_Monte_Matrix_Fernseher = zeros(anzahl_Intervalle_Simulation,Anzahl_Monte_Durchlaufe+3);
    Pzeitreihe_perhand_Fernseher = zeros(anzahl_Intervalle_Simulation,1);
end

    % Videorecorder
if laufvariable1 == 6
    P_Geraet = P_berechnet_Videorecorder;
    V = Vstart_Videorecorder;
    P = P_Videorecorder;
    P_leistung = [0;Lastgang_Videorecorder];
    geraet = 'Videorecorder';
    Anzahl_gereate = Vektor_Anzahl_Geraete(8,1);
    Pzeitreihe_Monte_Matrix_Videorecorder = zeros(anzahl_Intervalle_Simulation,Anzahl_Monte_Durchlaufe+3);
    Pzeitreihe_perhand_Videorecorder = zeros(anzahl_Intervalle_Simulation,1);
end

    % PC
if laufvariable1 == 7
    P_Geraet = P_berechnet_PC;
    V = Vstart_PC;
    P = P_PC;
    P_leistung = [0;Lastgang_PC];
    geraet = 'PC';
    Anzahl_gereate = Vektor_Anzahl_Geraete(9,1);
    Pzeitreihe_Monte_Matrix_PC = zeros(anzahl_Intervalle_Simulation,Anzahl_Monte_Durchlaufe+3);
    Pzeitreihe_perhand_PC = zeros(anzahl_Intervalle_Simulation,1);
end

    % Telekommunikation
if laufvariable1 == 8
    P_Geraet = P_berechnet_Telekommunikation;
    V = Vstart_Telekommunikation;
    P = P_Telekommunikation;
    P_leistung = [0;Lastgang_Telekommunikation];
    geraet = 'Telekommunikation';
    Anzahl_gereate = Vektor_Anzahl_Geraete(10,1);
    Pzeitreihe_Monte_Matrix_Telekommunikation = zeros(anzahl_Intervalle_Simulation,Anzahl_Monte_Durchlaufe+3);
    Pzeitreihe_perhand_Telekommunikation = zeros(anzahl_Intervalle_Simulation,1);
end

    % Beleuchtung
if laufvariable1 == 9
    P_Geraet = P_berechnet_Beleuchtung;
    V = Vstart_Beleuchtung;
    P = P_Beleuchtung;
    P_leistung = [0;Lastgang_Beleuchtung];
    geraet = 'Beleuchtung';
    Anzahl_gereate = Vektor_Anzahl_Geraete(11,1);
    Pzeitreihe_Monte_Matrix_Beleuchtung = zeros(anzahl_Intervalle_Simulation,Anzahl_Monte_Durchlaufe+3);
    Pzeitreihe_perhand_Beleuchtung = zeros(anzahl_Intervalle_Simulation,1);
end

    % Warmwasser
if laufvariable1 == 10
    P_Geraet = P_berechnet_Warmwasser;
    V = Vstart_Warmwasser;
    P = P_Warmwasser;
    P_leistung = [0;Lastgang_Warmwasser];
    geraet = 'Warmwasser';
    Anzahl_gereate = Vektor_Anzahl_Geraete(12,1);
    Pzeitreihe_Monte_Matrix_Warmwasser = zeros(anzahl_Intervalle_Simulation,Anzahl_Monte_Durchlaufe+3);
    Pzeitreihe_perhand_Warmwasser = zeros(anzahl_Intervalle_Simulation,1);
end


VorbereitungMonteCarlo;

if laufvariable1 <= 3
    for xyz = 1:1:Anzahl_Monte_Durchlaufe
    
        P_opt_abspeichern = zeros(35040,1);
        Pzeitreihe_perhand = zeros(35040,1); 
        Pzeitreihe_Monte = zeros(35040,1);
        
        for n = 1:1:einschwingtage*96
            P(2,1) = P_Geraet(n,1);
            P(1,1) = 1 - P(2,1);
            V = P*V;
        end
            
        for n = (starttag*96-95):((starttag+anzahl_simulierter_tage)*96-96)
            P(2,1) = P_Geraet(n,1);
            P(1,1) = 1 - P(2,1);
            
            V = P*V;
            Pzeitreihe_perhand(n,1) = V'*P_leistung; 
            MonteCarlo;
            Pzeitreihe_Monte(n,1) = V_Monte'*P_leistung;
        end
        
        switch laufvariable1
        
        case 1
            Pzeitreihe_Monte_Matrix_Waschmaschine(577:end,xyz+3) = Pzeitreihe_Monte;
            Pzeitreihe_perhand_Waschmaschine = Pzeitreihe_perhand * Anzahl_gereate;
            Pzeitreihe_Monte_Matrix_Waschmaschine(577:end,1) = Pzeitreihe_perhand_Waschmaschine;
        
        case 2
            Pzeitreihe_Monte_Matrix_Trockner(577:end,xyz+3) = Pzeitreihe_Monte;
            Pzeitreihe_perhand_Trockner = Pzeitreihe_perhand * Anzahl_gereate;
            Pzeitreihe_Monte_Matrix_Trockner(577:end,1) = Pzeitreihe_perhand_Trockner;
            
        case 3
            Pzeitreihe_Monte_Matrix_Spuelmaschine(577:end,xyz+3) = Pzeitreihe_Monte;
            Pzeitreihe_perhand_Spuelmaschine = Pzeitreihe_perhand * Anzahl_gereate;
            Pzeitreihe_Monte_Matrix_Spuelmaschine(577:end,1) = Pzeitreihe_perhand_Spuelmaschine;
            
        end
        
    end
end

if laufvariable1 > 3
for xyz = 1:1:Anzahl_Monte_Durchlaufe
    
    P_opt_abspeichern = zeros(end_Intervall,1);
    Pzeitreihe_perhand = zeros(end_Intervall,1); 
    Pzeitreihe_Monte = zeros(end_Intervall,1);

    for n = start_Intervall:1:end_Intervall
    
        % Ermittlung des Tages im Jahr
        Jahrestag = floor((n/(365*n_pro_tag) - floor((n/(365*n_pro_tag))))*365);
        
        % Ermittlung des Tages-Intervalls
        Tages_Intervall = floor((n/n_pro_tag - floor((n/n_pro_tag)))*n_pro_tag);
    
        if Tages_Intervall == 0
            Tages_Intervall = 96;      %Notwendig, da z.B bei n = 96 null rauskommt
        end
        
        % Ermittlung des Wochentages
        WT = ceil((n/(7*n_pro_tag) - floor(n/(7*n_pro_tag + 10e-9)))*7);

        % Frühling
        if (n >= Fruehling_Anfang)&&(n < Sommer_Anfang)
           
            switch WT
                case {1,2,3,4,5}
                    P(2,1) = P_Geraet(Tages_Intervall,1);
                    P(1,1) = 1 - P_Geraet(Tages_Intervall,1);
                case 6
                    P(2,1) = P_Geraet(Tages_Intervall,2);
                    P(1,1) = 1 - P_Geraet(Tages_Intervall,2);
                case 7
                    P(2,1) = P_Geraet(Tages_Intervall,3);
                    P(1,1) = 1 - P_Geraet(Tages_Intervall,3);
            end
            
        end
        
        % Sommer
        if (n >= Sommer_Anfang)&&(n < Herbst_Anfang)
            
            switch WT
                case {1,2,3,4,5}
                    P(2,1) = P_Geraet(Tages_Intervall,4);
                    P(1,1) = 1 - P_Geraet(Tages_Intervall,4);
                case 6
                    P(2,1) = P_Geraet(Tages_Intervall,5);
                    P(1,1) = 1 - P_Geraet(Tages_Intervall,5);
                case 7
                    P(2,1) = P_Geraet(Tages_Intervall,6);
                    P(1,1) = 1 - P_Geraet(Tages_Intervall,6);
            end
           
        end
        
        % Herbst
        if (n >= Herbst_Anfang)&&(n < Winter_Anfang)
            
            switch WT
                case {1,2,3,4,5}
                    P(2,1) = P_Geraet(Tages_Intervall,7);
                    P(1,1) = 1 - P_Geraet(Tages_Intervall,7);
                case 6
                    P(2,1) = P_Geraet(Tages_Intervall,8);
                    P(1,1) = 1 - P_Geraet(Tages_Intervall,8);
                case 7
                    P(2,1) = P_Geraet(Tages_Intervall,9);
                    P(1,1) = 1 - P_Geraet(Tages_Intervall,9);
            end
           
        end
        
        % Winter
        if (n >= Winter_Anfang)||(n < Fruehling_Anfang)
            
            switch WT
                case {1,2,3,4,5}
                    P(2,1) = P_Geraet(Tages_Intervall,10);
                    P(1,1) = 1 - P_Geraet(Tages_Intervall,10);
                case 6
                    P(2,1) = P_Geraet(Tages_Intervall,11);
                    P(1,1) = 1 - P_Geraet(Tages_Intervall,11);
                case 7
                    P(2,1) = P_Geraet(Tages_Intervall,12);
                    P(1,1) = 1 - P_Geraet(Tages_Intervall,12);
            end
           
            
        end


        % Bestimmung des neuen Zustandsvektors V = P*V
        V = P*V;
        Pzeitreihe_perhand(n,1) = V'*P_leistung; 
        MonteCarlo;
        Pzeitreihe_Monte(n,1) = V_Monte'*P_leistung;
       
    end
    
    % Erstellen der einzelnen Matrizen pro Monte Carlo Durchlauf
    switch laufvariable1
            
        case 4
            Pzeitreihe_Monte_Matrix_Elektroherd(:,xyz+3) = Pzeitreihe_Monte(start_Intervall_Simulation:end,:);
            Pzeitreihe_perhand_Elektroherd = Pzeitreihe_perhand(start_Intervall_Simulation:end,:) * Anzahl_gereate;
            Pzeitreihe_Monte_Matrix_Elektroherd(:,1) = Pzeitreihe_perhand_Elektroherd;
            
        case 5
            Pzeitreihe_Monte_Matrix_Fernseher(:,xyz+3) = Pzeitreihe_Monte(start_Intervall_Simulation:end,:);
            Pzeitreihe_perhand_Fernseher = Pzeitreihe_perhand(start_Intervall_Simulation:end,:) * Anzahl_gereate;
            Pzeitreihe_Monte_Matrix_Fernseher(:,1) = Pzeitreihe_perhand_Fernseher;
            
        case 6
            Pzeitreihe_Monte_Matrix_Videorecorder(:,xyz+3) = Pzeitreihe_Monte(start_Intervall_Simulation:end,:);
            Pzeitreihe_perhand_Videorecorder = Pzeitreihe_perhand(start_Intervall_Simulation:end,:) * Anzahl_gereate;
            Pzeitreihe_Monte_Matrix_Videorecorder(:,1) = Pzeitreihe_perhand_Videorecorder;
            
        case 7
            Pzeitreihe_Monte_Matrix_PC(:,xyz+3) = Pzeitreihe_Monte(start_Intervall_Simulation:end,:);
            Pzeitreihe_perhand_PC = Pzeitreihe_perhand(start_Intervall_Simulation:end,:) * Anzahl_gereate;
            Pzeitreihe_Monte_Matrix_PC(:,1) = Pzeitreihe_perhand_PC;
            
        case 8
            Pzeitreihe_Monte_Matrix_Telekommunikation(:,xyz+3) = Pzeitreihe_Monte(start_Intervall_Simulation:end,:);
            Pzeitreihe_perhand_Telekommunikation = Pzeitreihe_perhand(start_Intervall_Simulation:end,:) * Anzahl_gereate;
            Pzeitreihe_Monte_Matrix_Telekommunikation(:,1) = Pzeitreihe_perhand_Telekommunikation;
            
        case 9
            Pzeitreihe_Monte_Matrix_Beleuchtung(:,xyz+3) = Pzeitreihe_Monte(start_Intervall_Simulation:end,:);
            Pzeitreihe_perhand_Beleuchtung = Pzeitreihe_perhand(start_Intervall_Simulation:end,:) * Anzahl_gereate;
            Pzeitreihe_Monte_Matrix_Beleuchtung(:,1) = Pzeitreihe_perhand_Beleuchtung;
            
        case 10
            Pzeitreihe_Monte_Matrix_Warmwasser(:,xyz+3) = Pzeitreihe_Monte(start_Intervall_Simulation:end,:);
            Pzeitreihe_perhand_Warmwasser = Pzeitreihe_perhand(start_Intervall_Simulation:end,:) * Anzahl_gereate;
            Pzeitreihe_Monte_Matrix_Warmwasser(:,1) = Pzeitreihe_perhand_Warmwasser;
            
    end
    
    % Erstellen der Überschriften der einzelnen Zeitreihen (nur 1 mal notwendig)
    if laufvariable1 == 4
    ueberschrift_zeitreihe(1,xyz) = {['Zeitreihe ' num2str(xyz) ' [W]']};
    end
    
end
end

    % Zeitmessung pro Gerät
    Geraetnummer = Geraetnummer + 1
    Zeitmessung_in_Minuten_pro_Geraet = toc/60

end




% Erstellen der Lastgänge Kühlgerät und Gefriergerät (Grundlast)
% Kuehlgeraet
P_leistung = Lastgang_Kuehlgeraet';
Anzahl_Geraete = Vektor_Anzahl_Geraete(5,1);
Pzeitreihe_Monte_Matrix_Kuehlgeraet = zeros(anzahl_Intervalle_Simulation,1);
Rest_Laenge = length(Pzeitreihe_Monte_Matrix_Kuehlgeraet);
    
for n = 1:1:anzahl_Intervalle_Simulation
        
    if Pzeitreihe_Monte_Matrix_Kuehlgeraet(n) == 0
    
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
            Pzeitreihe_Monte_Matrix_Kuehlgeraet(n:n+laenge-1) = P_leistung_neu;
            Rest_Laenge = Rest_Laenge - laenge;
        else
            Pzeitreihe_Monte_Matrix_Kuehlgeraet(n:end) = P_leistung_neu(1:Rest_Laenge);
        end
    end
end
    
Pzeitreihe_Monte_Matrix_Kuehlgeraet = Pzeitreihe_Monte_Matrix_Kuehlgeraet*Anzahl_Geraete;

% Gefriergeraet
P_leistung = Lastgang_Gefriergeraet';
Anzahl_Geraete = Vektor_Anzahl_Geraete(6,1);
Pzeitreihe_Monte_Matrix_Gefriergeraet = zeros(anzahl_Intervalle_Simulation,1);
Rest_Laenge = length(Pzeitreihe_Monte_Matrix_Gefriergeraet);
    
for n = 1:1:anzahl_Intervalle_Simulation
        
    if Pzeitreihe_Monte_Matrix_Gefriergeraet(n) == 0
    
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
            Pzeitreihe_Monte_Matrix_Gefriergeraet(n:n+laenge-1) = P_leistung_neu;
            Rest_Laenge = Rest_Laenge - laenge;
        else
            Pzeitreihe_Monte_Matrix_Gefriergeraet(n:end) = P_leistung_neu(1:Rest_Laenge);
        end
    end
end
    
Pzeitreihe_Monte_Matrix_Gefriergeraet = Pzeitreihe_Monte_Matrix_Gefriergeraet*Anzahl_Geraete;


% Berechnung Mittelwert und Standardabweichung der einzelnen Matrizen
Pzeitreihe_Monte_Matrix_Waschmaschine(:,2) = mean(Pzeitreihe_Monte_Matrix_Waschmaschine(:,4:end),2);
Pzeitreihe_Monte_Matrix_Waschmaschine(:,3) = std(Pzeitreihe_Monte_Matrix_Waschmaschine(:,4:end),0,2);
Pzeitreihe_Monte_Matrix_Trockner(:,2) = mean(Pzeitreihe_Monte_Matrix_Trockner(:,4:end),2);
Pzeitreihe_Monte_Matrix_Trockner(:,3) = std(Pzeitreihe_Monte_Matrix_Trockner(:,4:end),0,2);
Pzeitreihe_Monte_Matrix_Spuelmaschine(:,2) = mean(Pzeitreihe_Monte_Matrix_Spuelmaschine(:,4:end),2);
Pzeitreihe_Monte_Matrix_Spuelmaschine(:,3) = std(Pzeitreihe_Monte_Matrix_Spuelmaschine(:,4:end),0,2);
Pzeitreihe_Monte_Matrix_Elektroherd(:,2) = mean(Pzeitreihe_Monte_Matrix_Elektroherd(:,4:end),2);
Pzeitreihe_Monte_Matrix_Elektroherd(:,3) = std(Pzeitreihe_Monte_Matrix_Elektroherd(:,4:end),0,2);
Pzeitreihe_Monte_Matrix_Fernseher(:,2) = mean(Pzeitreihe_Monte_Matrix_Fernseher(:,4:end),2);
Pzeitreihe_Monte_Matrix_Fernseher(:,3) = std(Pzeitreihe_Monte_Matrix_Fernseher(:,4:end),0,2);
Pzeitreihe_Monte_Matrix_Videorecorder(:,2) = mean(Pzeitreihe_Monte_Matrix_Videorecorder(:,4:end),2);
Pzeitreihe_Monte_Matrix_Videorecorder(:,3) = std(Pzeitreihe_Monte_Matrix_Videorecorder(:,4:end),0,2);
Pzeitreihe_Monte_Matrix_PC(:,2) = mean(Pzeitreihe_Monte_Matrix_PC(:,4:end),2);
Pzeitreihe_Monte_Matrix_PC(:,3) = std(Pzeitreihe_Monte_Matrix_PC(:,4:end),0,2);
Pzeitreihe_Monte_Matrix_Telekommunikation(:,2) = mean(Pzeitreihe_Monte_Matrix_Telekommunikation(:,4:end),2);
Pzeitreihe_Monte_Matrix_Telekommunikation(:,3) = std(Pzeitreihe_Monte_Matrix_Telekommunikation(:,4:end),0,2);
Pzeitreihe_Monte_Matrix_Beleuchtung(:,2) = mean(Pzeitreihe_Monte_Matrix_Beleuchtung(:,4:end),2);
Pzeitreihe_Monte_Matrix_Beleuchtung(:,3) = std(Pzeitreihe_Monte_Matrix_Beleuchtung(:,4:end),0,2);
Pzeitreihe_Monte_Matrix_Warmwasser(:,2) = mean(Pzeitreihe_Monte_Matrix_Warmwasser(:,4:end),2);
Pzeitreihe_Monte_Matrix_Warmwasser(:,3) = std(Pzeitreihe_Monte_Matrix_Warmwasser(:,4:end),0,2);

% Erstellen der Summe aus den einzelnen Matrizen
Pzeitreihe_Monte_Matrix_Summe = Pzeitreihe_Monte_Matrix_Waschmaschine + Pzeitreihe_Monte_Matrix_Trockner ...
                                + Pzeitreihe_Monte_Matrix_Spuelmaschine + Pzeitreihe_Monte_Matrix_Elektroherd ...
                                + Pzeitreihe_Monte_Matrix_Fernseher + Pzeitreihe_Monte_Matrix_Videorecorder ...
                                + Pzeitreihe_Monte_Matrix_PC + Pzeitreihe_Monte_Matrix_Telekommunikation ...
                                + Pzeitreihe_Monte_Matrix_Beleuchtung + Pzeitreihe_Monte_Matrix_Warmwasser ...
                                + (Lastgang_Restlast*Anzahl_Restlast);

for uebertragen = 1:1:Anzahl_Monte_Durchlaufe
    Pzeitreihe_Monte_Matrix_Summe(:,uebertragen+3) = Pzeitreihe_Monte_Matrix_Summe(:,uebertragen+3) + Pzeitreihe_Monte_Matrix_Kuehlgeraet + Pzeitreihe_Monte_Matrix_Gefriergeraet;
end

% Berechnung Mittelwert und Standardabweichung der Summenmatrix
Pzeitreihe_Monte_Matrix_Summe(:,1) = Pzeitreihe_Monte_Matrix_Summe(:,1) + Pzeitreihe_Monte_Matrix_Kuehlgeraet + Pzeitreihe_Monte_Matrix_Gefriergeraet;
Pzeitreihe_perhand_Summe = Pzeitreihe_Monte_Matrix_Summe(:,1);
Pzeitreihe_Monte_Matrix_Summe(:,2) = mean(Pzeitreihe_Monte_Matrix_Summe(:,4:end),2);
Pzeitreihe_Monte_Matrix_Summe(:,3) = std(Pzeitreihe_Monte_Matrix_Summe(:,4:end),0,2);

% Erstellen der Matrix Verschiebbare Lasten
Pzeitreihe_Monte_Matrix_Versch = Pzeitreihe_Monte_Matrix_Waschmaschine + Pzeitreihe_Monte_Matrix_Trockner + Pzeitreihe_Monte_Matrix_Spuelmaschine;

% Berechnung Mittelwert und Standardabweichung der Matrix Verschiebbare Lasten
Pzeitreihe_Monte_Matrix_Versch(:,2) = mean(Pzeitreihe_Monte_Matrix_Versch(:,4:end),2);
Pzeitreihe_Monte_Matrix_Versch(:,3) = std(Pzeitreihe_Monte_Matrix_Versch(:,4:end),0,2);

% Ende der Zeitmessung und Ausgabe der Gesamtzeit
Zeitmessung_in_Sekunden = toc
Zeitmessung_in_Minuten = Zeitmessung_in_Sekunden/60

