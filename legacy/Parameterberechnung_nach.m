% Berechnung der Übergangswahrscheinlichkeiten


for laufvariable1 = 1:1:10

    % Waschmaschine
if laufvariable1 == 1    
    P_Geraet = Wahrscheinlichkeitsmatrix_Waschmaschine;
    V = Vstart_Waschmaschine;
    P = P_Waschmaschine;
    P_leistung = [0;Lastgang_Waschmaschine];
    geraet = 'Waschmaschine';        
end 

    % Trockner
if laufvariable1 == 2    
    P_Geraet = Wahrscheinlichkeitsmatrix_Trockner;
    V = Vstart_Trockner;
    P = P_Trockner;
    P_leistung = [0;Lastgang_Trockner];
    geraet = 'Trockner';        
end 

    % Spuelmaschine
if laufvariable1 == 3    
    P_Geraet = Wahrscheinlichkeitsmatrix_Spuelmaschine;
    V = Vstart_Spuelmaschine;
    P = P_Spuelmaschine;
    P_leistung = [0;Lastgang_Spuelmaschine];
    geraet = 'Spuelmaschine';        
end 

    % Elektroherd
if laufvariable1 == 4    
    P_Geraet = Wahrscheinlichkeitsmatrix_Elektroherd;
    V = Vstart_Elektroherd;
    P = P_Elektroherd;
    P_leistung = [0;Lastgang_Elektroherd];
    geraet = 'Elektroherd';        
end 

    % Fernseher
if laufvariable1 == 5    
    P_Geraet = Wahrscheinlichkeitsmatrix_Fernseher;
    V = Vstart_Fernseher;
    P = P_Fernseher;
    P_leistung = [0;Lastgang_Fernseher];
    geraet = 'Fernseher';        
end 

    % Videorecorder
if laufvariable1 == 6    
    P_Geraet = Wahrscheinlichkeitsmatrix_Videorecorder;
    V = Vstart_Videorecorder;
    P = P_Videorecorder;
    P_leistung = [0;Lastgang_Videorecorder];
    geraet = 'Videorecorder';        
end 

    % PC
if laufvariable1 == 7    
    P_Geraet = Wahrscheinlichkeitsmatrix_PC;
    V = Vstart_PC;
    P = P_PC;
    P_leistung = [0;Lastgang_PC];
    geraet = 'PC';        
end 

    % Telekommunikation
if laufvariable1 == 8    
    P_Geraet = Wahrscheinlichkeitsmatrix_Telekommunikation;
    V = Vstart_Telekommunikation;
    P = P_Telekommunikation;
    P_leistung = [0;Lastgang_Telekommunikation];
    geraet = 'Telekommunikation';        
end 

    % Beleuchtung
if laufvariable1 == 9    
    P_Geraet = Wahrscheinlichkeitsmatrix_Beleuchtung;
    V = Vstart_Beleuchtung;
    P = P_Beleuchtung;
    P_leistung = [0;Lastgang_Beleuchtung];
    geraet = 'Beleuchtung';        
end

    % Warmwasser
if laufvariable1 == 10    
    P_Geraet = Wahrscheinlichkeitsmatrix_Warmwasser;
    V = Vstart_Warmwasser;
    P = P_Warmwasser;
    P_leistung = [0;Lastgang_Warmwasser];
    geraet = 'Warmwasser';        
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
                    P(2,1) = P_Geraet(Tages_Intervall,1)/V(1);
                    P(1,1) = 1 - P(2,1);
                case 6
                    P(2,1) = P_Geraet(Tages_Intervall,2)/V(1);
                    P(1,1) = 1 - P(2,1);
                case 7
                    P(2,1) = P_Geraet(Tages_Intervall,3)/V(1);
                    P(1,1) = 1 - P(2,1);
            end
            
        end
        
        % Sommer
        if (n >= Sommer_Anfang)&&(n < Herbst_Anfang)
            
            switch WT
                case {1,2,3,4,5}
                    P(2,1) = P_Geraet(Tages_Intervall,4)/V(1);
                    P(1,1) = 1 - P(2,1);
                case 6
                    P(2,1) = P_Geraet(Tages_Intervall,5)/V(1);
                    P(1,1) = 1 - P(2,1);
                case 7
                    P(2,1) = P_Geraet(Tages_Intervall,6)/V(1);
                    P(1,1) = 1 - P(2,1);
            end
           
        end
        
        % Herbst
        if (n >= Herbst_Anfang)&&(n < Winter_Anfang)
            
            switch WT
                case {1,2,3,4,5}
                    P(2,1) = P_Geraet(Tages_Intervall,7)/V(1);
                    P(1,1) = 1 - P(2,1);
                case 6
                    P(2,1) = P_Geraet(Tages_Intervall,8)/V(1);
                    P(1,1) = 1 - P(2,1);
                case 7
                    P(2,1) = P_Geraet(Tages_Intervall,9)/V(1);
                    P(1,1) = 1 - P(2,1);
            end
           
        end
        
        % Winter
        if (n >= Winter_Anfang)||(n < Fruehling_Anfang)
            
            switch WT
                case {1,2,3,4,5}
                    P(2,1) = P_Geraet(Tages_Intervall,10)/V(1);
                    P(1,1) = 1 - P(2,1);
                case 6
                    P(2,1) = P_Geraet(Tages_Intervall,11)/V(1);
                    P(1,1) = 1 - P(2,1);
                case 7
                    P(2,1) = P_Geraet(Tages_Intervall,12)/V(1);
                    P(1,1) = 1 - P(2,1);
            end
           
            
        end


        % Bestimmung des neuen Zusstandsvektors V = P*V
        V = P*V;
        
        P_opt_abspeichern(n,1)=P(2,1);  
        Pzeitreihe_perhand(n,1) = V'*P_leistung; 
       
    end

    
% Die Zahlen in den Klammern stehen für den ersten Samstag in der jeweiligen Jahreszeit
% Ziel abspeichern der Werk, Samst und Sonntage
    
% Frühling    
xlswrite('P_berechnet.xlsx',P_opt_abspeichern(((7873)+4*n_pro_tag):(7873)+(4*n_pro_tag)+n_pro_tag-1),geraet,'B3'); %Werktag abspeichern
xlswrite('P_berechnet.xlsx',P_opt_abspeichern(((7873)+7*n_pro_tag):(7873)+(7*n_pro_tag)+n_pro_tag-1),geraet,'C3');%Samstag abspeichern
xlswrite('P_berechnet.xlsx',P_opt_abspeichern(((7873)+8*n_pro_tag):(7873)+(8*n_pro_tag)+n_pro_tag-1),geraet,'D3');%Sonntag abspeichern

% Sommer
xlswrite('P_berechnet.xlsx',P_opt_abspeichern(((16608)+4*n_pro_tag):(16608)+(4*n_pro_tag)+n_pro_tag-1),geraet,'E3'); %Werktag abspeichern
xlswrite('P_berechnet.xlsx',P_opt_abspeichern(((16608)+7*n_pro_tag):(16608)+(7*n_pro_tag)+n_pro_tag-1),geraet,'F3');%Samstag abspeichern
xlswrite('P_berechnet.xlsx',P_opt_abspeichern(((16608)+8*n_pro_tag):(16608)+(8*n_pro_tag)+n_pro_tag-1),geraet,'G3');%Sonntag abspeichern

% Herbst
xlswrite('P_berechnet.xlsx',P_opt_abspeichern(((26016)+4*n_pro_tag):(26016)+(4*n_pro_tag)+n_pro_tag-1),geraet,'H3'); %Werktag abspeichern
xlswrite('P_berechnet.xlsx',P_opt_abspeichern(((26016)+7*n_pro_tag):(26016)+(7*n_pro_tag)+n_pro_tag-1),geraet,'I3');%Samstag abspeichern
xlswrite('P_berechnet.xlsx',P_opt_abspeichern(((26016)+8*n_pro_tag):(26016)+(8*n_pro_tag)+n_pro_tag-1),geraet,'J3');%Sonntag abspeichern

% Winter
xlswrite('P_berechnet.xlsx',P_opt_abspeichern(((481)+4*n_pro_tag):(481)+(4*n_pro_tag)+n_pro_tag-1),geraet,'K3'); %Werktag abspeichern
xlswrite('P_berechnet.xlsx',P_opt_abspeichern(((481)+7*n_pro_tag):(481)+(7*n_pro_tag)+n_pro_tag-1),geraet,'L3');%Samstag abspeichern
xlswrite('P_berechnet.xlsx',P_opt_abspeichern(((481)+8*n_pro_tag):(481)+(8*n_pro_tag)+n_pro_tag-1),geraet,'M3');%Sonntag abspeichern

end


%%
% neu berechnete Parameter Einlesen
P_berechnet_Waschmaschine = xlsread('P_berechnet.xlsx','Waschmaschine','B3:M98');
P_berechnet_Spuelmaschine = xlsread('P_berechnet.xlsx','Spuelmaschine','B3:M98');
P_berechnet_Trockner = xlsread('P_berechnet.xlsx','Trockner','B3:M98');
P_berechnet_Elektroherd = xlsread('P_berechnet.xlsx','Elektroherd','B3:M98');
P_berechnet_Fernseher = xlsread('P_berechnet.xlsx','Fernseher','B3:M98');
P_berechnet_Videorecorder = xlsread('P_berechnet.xlsx','Videorecorder','B3:M98');
P_berechnet_PC = xlsread('P_berechnet.xlsx','PC','B3:M98');
P_berechnet_Telekommunikation = xlsread('P_berechnet.xlsx','Telekommunikation','B3:M98');
P_berechnet_Beleuchtung = xlsread('P_berechnet.xlsx','Beleuchtung','B3:M98');
P_berechnet_Warmwasser = xlsread('P_berechnet.xlsx','Warmwasser','B3:M98');