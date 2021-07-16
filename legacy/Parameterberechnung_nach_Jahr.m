% Berechnung der Übergangswahrscheinlichkeiten


for laufvariable1 = 1:1:3

    % Waschmaschine
if laufvariable1 == 1    
    P_Geraet = Wahrscheinlichkeitsvektor_Waschmaschine;
    V = Vstart_Waschmaschine;
    P = P_Waschmaschine;
    P_leistung = [0;Lastgang_Waschmaschine];
    geraet = 'Waschmaschine';        
end 

    % Trockner
if laufvariable1 == 2    
    P_Geraet = Wahrscheinlichkeitsvektor_Trockner;
    V = Vstart_Trockner;
    P = P_Trockner;
    P_leistung = [0;Lastgang_Trockner];
    geraet = 'Trockner';        
end 

    % Spuelmaschine
if laufvariable1 == 3    
    P_Geraet = Wahrscheinlichkeitsvektor_Spuelmaschine;
    V = Vstart_Spuelmaschine;
    P = P_Spuelmaschine;
    P_leistung = [0;Lastgang_Spuelmaschine];
    geraet = 'Spuelmaschine';        
end 


     %%%%for n = start_Intervall:1:end_Intervall
    for n = 1:1:einschwingtage*96
    
        P(2,1) = P_Geraet(n,1)/V(1);
        P(1,1) = 1 - P(2,1);
        
        % Bestimmung des neuen Zusstandsvektors V = P*V
        V = P*V;
       
    end
    
    for n = (starttag*96-95):1:((starttag+anzahl_simulierter_tage)*96-96)
    
        P(2,1) = P_Geraet(n,1)/V(1);
        P(1,1) = 1 - P(2,1);
        
        % Bestimmung des neuen Zusstandsvektors V = P*V
        V = P*V;
        
        P_opt_abspeichern(n,1)=P(2,1);  
        Pzeitreihe_perhand(n,1) = V'*P_leistung; 
       
    end


xlswrite('P_berechnet_Jahr.xlsx',P_opt_abspeichern,geraet,'G2');

end


%%
% neu berechnete Parameter Einlesen
P_berechnet_Waschmaschine_Jahr = xlsread('P_berechnet_Jahr.xlsx','Waschmaschine','G2:G35041');
P_berechnet_Spuelmaschine_Jahr = xlsread('P_berechnet_Jahr.xlsx','Spuelmaschine','G2:G35041');
P_berechnet_Trockner_Jahr = xlsread('P_berechnet_Jahr.xlsx','Trockner','G2:G35041');