% Einlesen der gesamten Wertetabelle aus Exeldatei

Eingabe = xlsread('Eingabeoberflaeche_Haushalte.xlsm','Eingabeoberfläche','D15:D53');
Anzahl_Werte = xlsread('Eingabeoberflaeche_Haushalte.xlsm','Anzahl nach Kriterien','D3:P18');


%Zuweisen der Eingabedaten aus den Matrizen in die jeweiligen Vektoren

Auswahl = Eingabe(1,1); 
%Auswahl des Kriteriums
% 1	Durchschnittshaushalte
% 2	Nach Personenanzahl
% 3	Nach Einkommen
% 4	Nach Wohntyp

%%-------------------------------

%Kriterium 1

Anzahl_Haushalte_Kriterium1 = Eingabe(6,1);



%%-------------------------------

%Kriterium 2

Anzahl_Haushalte_Kriterium2 = Eingabe(11,1);
Anzahl_1Person_inProzent = Eingabe(13,1);
Anzahl_2Person_inProzent = Eingabe(14,1);
Anzahl_3Person_inProzent = Eingabe(15,1);
Anzahl_4Person_inProzent = Eingabe(16,1);
Anzahl_5Person_inProzent = Eingabe(17,1);


%%-------------------------------

%Kriterium 3
Anzahl_Haushalte_Kriterium3 = Eingabe(22,1);

% 1 = unter 900
% 2 = 900-1300
% 3 = 1300-1500
% 4 = 1500-2000
% 5 = 2000-2600
% 6 = 2600-3600
% 7 = 3600-5000
% 8 = 5000-18000

Anzahl_1_inProzent = Eingabe(24,1);
Anzahl_2_inProzent = Eingabe(25,1);
Anzahl_3_inProzent = Eingabe(26,1);
Anzahl_4_inProzent = Eingabe(27,1);
Anzahl_5_inProzent = Eingabe(28,1);
Anzahl_6_inProzent = Eingabe(29,1);
Anzahl_7_inProzent = Eingabe(30,1);
Anzahl_8_inProzent = Eingabe(31,1);



%%-------------------------------

%Kriterium 4

Anzahl_Haushalte_Kriterium4 = Eingabe(36,1);

Anzahl_Mietwohnungen = Eingabe(38,1) * (Anzahl_Haushalte_Kriterium4 / 100);
Anzahl_Wohneigentum = Eingabe(39,1) * (Anzahl_Haushalte_Kriterium4 / 100);



%% Einlesen Anzahl_Werte

Werte_Kriterium1 = Anzahl_Werte(1,1:13);
Werte_Kriterium2 = Anzahl_Werte(2:6,1:13);
Werte_Kriterium3 = Anzahl_Werte(7:14,1:13);
Werte_Kriterium4 = Anzahl_Werte(15:16,1:13);


%% Berechnungen

if Auswahl == 1
    
    Anzahl_Waschmaschinen = Anzahl_Haushalte_Kriterium1 * Werte_Kriterium1(1,1);
    Anzahl_Trockner = Anzahl_Haushalte_Kriterium1 * Werte_Kriterium1(1,2);
    Anzahl_Spuelmaschine = Anzahl_Haushalte_Kriterium1 * Werte_Kriterium1(1,3);
    Anzahl_Elektroherd = Anzahl_Haushalte_Kriterium1 * Werte_Kriterium1(1,4);
    Anzahl_Kuehlgeraete = Anzahl_Haushalte_Kriterium1 * Werte_Kriterium1(1,5);
    Anzahl_Gefriergeraete = Anzahl_Haushalte_Kriterium1 * Werte_Kriterium1(1,6);
    Anzahl_Fernseher = Anzahl_Haushalte_Kriterium1 * Werte_Kriterium1(1,7);
    Anzahl_Videorecorder = Anzahl_Haushalte_Kriterium1 * Werte_Kriterium1(1,8);
    Anzahl_PC = Anzahl_Haushalte_Kriterium1 * Werte_Kriterium1(1,9);
    Anzahl_Telekommunikation = Anzahl_Haushalte_Kriterium1 * Werte_Kriterium1(1,10);
    Anzahl_Beleuchtung = Anzahl_Haushalte_Kriterium1 * Werte_Kriterium1(1,11);
    Anzahl_Warmwasser = Anzahl_Haushalte_Kriterium1 * Werte_Kriterium1(1,12);
    Anzahl_Restlast = Anzahl_Haushalte_Kriterium1 * Werte_Kriterium1(1,13);
    
    Anzahl_Haushalte = Anzahl_Haushalte_Kriterium1;
    
    
    else if Auswahl == 2
        
             Anzahl_1Person = Anzahl_Haushalte_Kriterium2 / 100 * Anzahl_1Person_inProzent;
             Anzahl_2Person = Anzahl_Haushalte_Kriterium2 / 100 * Anzahl_2Person_inProzent;
             Anzahl_3Person = Anzahl_Haushalte_Kriterium2 / 100 * Anzahl_3Person_inProzent;
             Anzahl_4Person = Anzahl_Haushalte_Kriterium2 / 100 * Anzahl_4Person_inProzent;
             Anzahl_5Person = Anzahl_Haushalte_Kriterium2 / 100 * Anzahl_5Person_inProzent;
            
             Anzahl_Waschmaschinen = Anzahl_1Person * Werte_Kriterium2(1,1)...
                                    + Anzahl_2Person * Werte_Kriterium2(2,1)...
                                    + Anzahl_3Person * Werte_Kriterium2(3,1)... 
                                    + Anzahl_4Person * Werte_Kriterium2(4,1)... 
                                    + Anzahl_5Person * Werte_Kriterium2(5,1);
                                
             Anzahl_Trockner = Anzahl_1Person * Werte_Kriterium2(1,2)... 
                              + Anzahl_2Person * Werte_Kriterium2(2,2)... 
                              + Anzahl_3Person * Werte_Kriterium2(3,2)... 
                              + Anzahl_4Person * Werte_Kriterium2(4,2)... 
                              + Anzahl_5Person * Werte_Kriterium2(5,2);                                       
           
             Anzahl_Spuelmaschine = Anzahl_1Person * Werte_Kriterium2(1,3)... 
                                   + Anzahl_2Person * Werte_Kriterium2(2,3)... 
                                   + Anzahl_3Person * Werte_Kriterium2(3,3)... 
                                   + Anzahl_4Person * Werte_Kriterium2(4,3)... 
                                   + Anzahl_5Person * Werte_Kriterium2(5,3);
                                
             Anzahl_Elektroherd = Anzahl_1Person * Werte_Kriterium2(1,4)...
                                 + Anzahl_2Person * Werte_Kriterium2(2,4)...
                                 + Anzahl_3Person * Werte_Kriterium2(3,4)... 
                                 + Anzahl_4Person * Werte_Kriterium2(4,4)... 
                                 + Anzahl_5Person * Werte_Kriterium2(5,4);
            
             Anzahl_Kuehlgeraete = Anzahl_1Person * Werte_Kriterium2(1,5)...
                                  + Anzahl_2Person * Werte_Kriterium2(2,5)...
                                  + Anzahl_3Person * Werte_Kriterium2(3,5)... 
                                  + Anzahl_4Person * Werte_Kriterium2(4,5)... 
                                  + Anzahl_5Person * Werte_Kriterium2(5,5);
            
             Anzahl_Gefriergeraete = Anzahl_1Person * Werte_Kriterium2(1,6)...
                                    + Anzahl_2Person * Werte_Kriterium2(2,6)...
                                    + Anzahl_3Person * Werte_Kriterium2(3,6)... 
                                    + Anzahl_4Person * Werte_Kriterium2(4,6)... 
                                    + Anzahl_5Person * Werte_Kriterium2(5,6);
            
             Anzahl_Fernseher = Anzahl_1Person * Werte_Kriterium2(1,7)...
                               + Anzahl_2Person * Werte_Kriterium2(2,7)...
                               + Anzahl_3Person * Werte_Kriterium2(3,7)... 
                               + Anzahl_4Person * Werte_Kriterium2(4,7)... 
                               + Anzahl_5Person * Werte_Kriterium2(5,7);
            
             Anzahl_Videorecorder = Anzahl_1Person * Werte_Kriterium2(1,8)...
                                   + Anzahl_2Person * Werte_Kriterium2(2,8)...
                                   + Anzahl_3Person * Werte_Kriterium2(3,8)... 
                                   + Anzahl_4Person * Werte_Kriterium2(4,8)... 
                                   + Anzahl_5Person * Werte_Kriterium2(5,8);
            
             Anzahl_PC = Anzahl_1Person * Werte_Kriterium2(1,9)...
                        + Anzahl_2Person * Werte_Kriterium2(2,9)...
                        + Anzahl_3Person * Werte_Kriterium2(3,9)... 
                        + Anzahl_4Person * Werte_Kriterium2(4,9)... 
                        + Anzahl_5Person * Werte_Kriterium2(5,9);
            
             Anzahl_Telekommunikation = Anzahl_1Person * Werte_Kriterium2(1,10)...
                                       + Anzahl_2Person * Werte_Kriterium2(2,10)...
                                       + Anzahl_3Person * Werte_Kriterium2(3,10)... 
                                       + Anzahl_4Person * Werte_Kriterium2(4,10)... 
                                       + Anzahl_5Person * Werte_Kriterium2(5,10);
                                   
             Anzahl_Beleuchtung = Anzahl_1Person * Werte_Kriterium2(1,11)...
                                 + Anzahl_2Person * Werte_Kriterium2(2,11)...
                                 + Anzahl_3Person * Werte_Kriterium2(3,11)... 
                                 + Anzahl_4Person * Werte_Kriterium2(4,11)... 
                                 + Anzahl_5Person * Werte_Kriterium2(5,11);
                             
             Anzahl_Warmwasser = Anzahl_1Person * Werte_Kriterium2(1,12)...
                                 + Anzahl_2Person * Werte_Kriterium2(2,12)...
                                 + Anzahl_3Person * Werte_Kriterium2(3,12)... 
                                 + Anzahl_4Person * Werte_Kriterium2(4,12)... 
                                 + Anzahl_5Person * Werte_Kriterium2(5,12);
                             
             Anzahl_Restlast = Anzahl_1Person * Werte_Kriterium2(1,13)...
                                 + Anzahl_2Person * Werte_Kriterium2(2,13)...
                                 + Anzahl_3Person * Werte_Kriterium2(3,13)... 
                                 + Anzahl_4Person * Werte_Kriterium2(4,13)... 
                                 + Anzahl_5Person * Werte_Kriterium2(5,13);
                                
             Anzahl_Haushalte = Anzahl_Haushalte_Kriterium2;
            
            
        else if Auswahl == 3
                      
                 Anzahl_1 = Anzahl_Haushalte_Kriterium3 / 100 * Anzahl_1_inProzent;
                 Anzahl_2 = Anzahl_Haushalte_Kriterium3 / 100 * Anzahl_2_inProzent;
                 Anzahl_3 = Anzahl_Haushalte_Kriterium3 / 100 * Anzahl_3_inProzent;
                 Anzahl_4 = Anzahl_Haushalte_Kriterium3 / 100 * Anzahl_4_inProzent;
                 Anzahl_5 = Anzahl_Haushalte_Kriterium3 / 100 * Anzahl_5_inProzent;
                 Anzahl_6 = Anzahl_Haushalte_Kriterium3 / 100 * Anzahl_6_inProzent;
                 Anzahl_7 = Anzahl_Haushalte_Kriterium3 / 100 * Anzahl_7_inProzent;
                 Anzahl_8 = Anzahl_Haushalte_Kriterium3 / 100 * Anzahl_8_inProzent;
       
                 Anzahl_Waschmaschinen = Anzahl_1 * Werte_Kriterium3(1,1)...
                                        + Anzahl_2 * Werte_Kriterium3(2,1)...
                                        + Anzahl_3 * Werte_Kriterium3(3,1)...
                                        + Anzahl_4 * Werte_Kriterium3(4,1)...
                                        + Anzahl_5 * Werte_Kriterium3(5,1)...
                                        + Anzahl_6 * Werte_Kriterium3(6,1)...
                                        + Anzahl_7 * Werte_Kriterium3(7,1)...
                                        + Anzahl_8 * Werte_Kriterium3(8,1);
                
                 Anzahl_Trockner = Anzahl_1 * Werte_Kriterium3(1,2)...
                                  + Anzahl_2 * Werte_Kriterium3(2,2)...
                                  + Anzahl_3 * Werte_Kriterium3(3,2)...
                                  + Anzahl_4 * Werte_Kriterium3(4,2)...
                                  + Anzahl_5 * Werte_Kriterium3(5,2)...
                                  + Anzahl_6 * Werte_Kriterium3(6,2)...
                                  + Anzahl_7 * Werte_Kriterium3(7,2)...
                                  + Anzahl_8 * Werte_Kriterium3(8,2);
                                   
                 Anzahl_Spuelmaschine = Anzahl_1 * Werte_Kriterium3(1,3)...
                                          + Anzahl_2 * Werte_Kriterium3(2,3)...
                                          + Anzahl_3 * Werte_Kriterium3(3,3)...
                                          + Anzahl_4 * Werte_Kriterium3(4,3)...
                                          + Anzahl_5 * Werte_Kriterium3(5,3)...
                                          + Anzahl_6 * Werte_Kriterium3(6,3)...
                                          + Anzahl_7 * Werte_Kriterium3(7,3)...
                                          + Anzahl_8 * Werte_Kriterium3(8,3);
                                      
                 Anzahl_Elektroherd = Anzahl_1 * Werte_Kriterium3(1,4)...
                                     + Anzahl_2 * Werte_Kriterium3(2,4)...
                                     + Anzahl_3 * Werte_Kriterium3(3,4)...
                                     + Anzahl_4 * Werte_Kriterium3(4,4)...
                                     + Anzahl_5 * Werte_Kriterium3(5,4)...
                                     + Anzahl_6 * Werte_Kriterium3(6,4)...
                                     + Anzahl_7 * Werte_Kriterium3(7,4)...
                                     + Anzahl_8 * Werte_Kriterium3(8,4);
            
                 Anzahl_Kuehlgeraete = Anzahl_1 * Werte_Kriterium3(1,5)...
                                      + Anzahl_2 * Werte_Kriterium3(2,5)...
                                      + Anzahl_3 * Werte_Kriterium3(3,5)...
                                      + Anzahl_4 * Werte_Kriterium3(4,5)...
                                      + Anzahl_5 * Werte_Kriterium3(5,5)...
                                      + Anzahl_6 * Werte_Kriterium3(6,5)...
                                      + Anzahl_7 * Werte_Kriterium3(7,5)...
                                      + Anzahl_8 * Werte_Kriterium3(8,5);
            
                 Anzahl_Gefriergeraete = Anzahl_1 * Werte_Kriterium3(1,6)...
                                        + Anzahl_2 * Werte_Kriterium3(2,6)...
                                        + Anzahl_3 * Werte_Kriterium3(3,6)...
                                        + Anzahl_4 * Werte_Kriterium3(4,6)...
                                        + Anzahl_5 * Werte_Kriterium3(5,6)...
                                        + Anzahl_6 * Werte_Kriterium3(6,6)...
                                        + Anzahl_7 * Werte_Kriterium3(7,6)...
                                        + Anzahl_8 * Werte_Kriterium3(8,6);
            
                 Anzahl_Fernseher = Anzahl_1 * Werte_Kriterium3(1,7)...
                                   + Anzahl_2 * Werte_Kriterium3(2,7)...
                                   + Anzahl_3 * Werte_Kriterium3(3,7)...
                                   + Anzahl_4 * Werte_Kriterium3(4,7)...
                                   + Anzahl_5 * Werte_Kriterium3(5,7)...
                                   + Anzahl_6 * Werte_Kriterium3(6,7)...
                                   + Anzahl_7 * Werte_Kriterium3(7,7)...
                                   + Anzahl_8 * Werte_Kriterium3(8,7);
            
                 Anzahl_Videorecorder = Anzahl_1 * Werte_Kriterium3(1,8)...
                                       + Anzahl_2 * Werte_Kriterium3(2,8)...
                                       + Anzahl_3 * Werte_Kriterium3(3,8)...
                                       + Anzahl_4 * Werte_Kriterium3(4,8)...
                                       + Anzahl_5 * Werte_Kriterium3(5,8)...
                                       + Anzahl_6 * Werte_Kriterium3(6,8)...
                                       + Anzahl_7 * Werte_Kriterium3(7,8)...
                                       + Anzahl_8 * Werte_Kriterium3(8,8);
            
                 Anzahl_PC = Anzahl_1 * Werte_Kriterium3(1,9)...
                            + Anzahl_2 * Werte_Kriterium3(2,9)...
                            + Anzahl_3 * Werte_Kriterium3(3,9)...
                            + Anzahl_4 * Werte_Kriterium3(4,9)...
                            + Anzahl_5 * Werte_Kriterium3(5,9)...
                            + Anzahl_6 * Werte_Kriterium3(6,9)...
                            + Anzahl_7 * Werte_Kriterium3(7,9)...
                            + Anzahl_8 * Werte_Kriterium3(8,9);
            
                 Anzahl_Telekommunikation = Anzahl_1 * Werte_Kriterium3(1,10)...
                                           + Anzahl_2 * Werte_Kriterium3(2,10)...
                                           + Anzahl_3 * Werte_Kriterium3(3,10)...
                                           + Anzahl_4 * Werte_Kriterium3(4,10)...
                                           + Anzahl_5 * Werte_Kriterium3(5,10)...
                                           + Anzahl_6 * Werte_Kriterium3(6,10)...
                                           + Anzahl_7 * Werte_Kriterium3(7,10)...
                                           + Anzahl_8 * Werte_Kriterium3(8,10);
                                       
                 Anzahl_Beleuchtung = Anzahl_1 * Werte_Kriterium3(1,11)...
                                     + Anzahl_2 * Werte_Kriterium3(2,11)...
                                     + Anzahl_3 * Werte_Kriterium3(3,11)...
                                     + Anzahl_4 * Werte_Kriterium3(4,11)...
                                     + Anzahl_5 * Werte_Kriterium3(5,11)...
                                     + Anzahl_6 * Werte_Kriterium3(6,11)...
                                     + Anzahl_7 * Werte_Kriterium3(7,11)...
                                     + Anzahl_8 * Werte_Kriterium3(8,11);
                                 
                 Anzahl_Warmwasser = Anzahl_1 * Werte_Kriterium3(1,12)...
                                    + Anzahl_2 * Werte_Kriterium3(2,12)...
                                    + Anzahl_3 * Werte_Kriterium3(3,12)...
                                    + Anzahl_4 * Werte_Kriterium3(4,12)...
                                    + Anzahl_5 * Werte_Kriterium3(5,12)...
                                    + Anzahl_6 * Werte_Kriterium3(6,12)...
                                    + Anzahl_7 * Werte_Kriterium3(7,12)...
                                    + Anzahl_8 * Werte_Kriterium3(8,12);
                                 
                 Anzahl_Restlast = Anzahl_1 * Werte_Kriterium3(1,13)...
                                  + Anzahl_2 * Werte_Kriterium3(2,13)...
                                  + Anzahl_3 * Werte_Kriterium3(3,13)...
                                  + Anzahl_4 * Werte_Kriterium3(4,13)...
                                  + Anzahl_5 * Werte_Kriterium3(5,13)...
                                  + Anzahl_6 * Werte_Kriterium3(6,13)...
                                  + Anzahl_7 * Werte_Kriterium3(7,13)...
                                  + Anzahl_8 * Werte_Kriterium3(8,13);
                                      
                 Anzahl_Haushalte = Anzahl_Haushalte_Kriterium3;
                
                                          
            else if Auswahl == 4
                        
                     Anzahl_Waschmaschinen = Anzahl_Mietwohnungen * Werte_Kriterium4(1,1)...
                                            + Anzahl_Wohneigentum * Werte_Kriterium4(2,1);
                                         
                     Anzahl_Trockner = Anzahl_Mietwohnungen * Werte_Kriterium4(1,2)...
                                      + Anzahl_Wohneigentum * Werte_Kriterium4(2,2);
                        
                     Anzahl_Spuelmaschine = Anzahl_Mietwohnungen * Werte_Kriterium4(1,3)...
                                           + Anzahl_Wohneigentum * Werte_Kriterium4(2,3);
                                        
                     Anzahl_Elektroherd = Anzahl_Mietwohnungen * Werte_Kriterium4(1,4)...
                                         + Anzahl_Wohneigentum * Werte_Kriterium4(2,4);
                     
                     Anzahl_Kuehlgeraete = Anzahl_Mietwohnungen * Werte_Kriterium4(1,5)...
                                          + Anzahl_Wohneigentum * Werte_Kriterium4(2,5);
    
                     Anzahl_Gefriergeraete = Anzahl_Mietwohnungen * Werte_Kriterium4(1,6)...
                                            + Anzahl_Wohneigentum * Werte_Kriterium4(2,6);
                     
                     Anzahl_Fernseher = Anzahl_Mietwohnungen * Werte_Kriterium4(1,7)...
                                       + Anzahl_Wohneigentum * Werte_Kriterium4(2,7);
                     
                     Anzahl_Videorecorder = Anzahl_Mietwohnungen * Werte_Kriterium4(1,8)...
                                           + Anzahl_Wohneigentum * Werte_Kriterium4(2,8);
                     
                     Anzahl_PC = Anzahl_Mietwohnungen * Werte_Kriterium4(1,9)...
                                + Anzahl_Wohneigentum * Werte_Kriterium4(2,9);
                     
                     Anzahl_Telekommunikation = Anzahl_Mietwohnungen * Werte_Kriterium4(1,10)...
                                               + Anzahl_Wohneigentum * Werte_Kriterium4(2,10);
                                           
                     Anzahl_Beleuchtung = Anzahl_Mietwohnungen * Werte_Kriterium4(1,11)...
                                         + Anzahl_Wohneigentum * Werte_Kriterium4(2,11);
                                     
                     Anzahl_Warmwasser = Anzahl_Mietwohnungen * Werte_Kriterium4(1,12)...
                                        + Anzahl_Wohneigentum * Werte_Kriterium4(2,12);
                                     
                     Anzahl_Restlast = Anzahl_Mietwohnungen * Werte_Kriterium4(1,13)...
                                      + Anzahl_Wohneigentum * Werte_Kriterium4(2,13);
                        
                     Anzahl_Haushalte =  Anzahl_Haushalte_Kriterium4;
                    
    
                     end
                 end
             end
    end

Anzahl_Waschmaschinen = round(Anzahl_Waschmaschinen);
Anzahl_Trockner = round(Anzahl_Trockner);
Anzahl_Spuelmaschine = round(Anzahl_Spuelmaschine);
Anzahl_Elektroherd = round(Anzahl_Elektroherd);
Anzahl_Kuehlgeraete = round(Anzahl_Kuehlgeraete);
Anzahl_Gefriergeraete = round(Anzahl_Gefriergeraete);
Anzahl_Fernseher = round(Anzahl_Fernseher);
Anzahl_Videorecorder = round(Anzahl_Videorecorder);
Anzahl_PC = round(Anzahl_PC);
Anzahl_Telekommunikation = round(Anzahl_Telekommunikation);
Anzahl_Beleuchtung = round(Anzahl_Beleuchtung);
Anzahl_Warmwasser = round(Anzahl_Warmwasser);
Anzahl_Restlast = round(Anzahl_Restlast);

Vektor_Anzahl_Geraete(1,1) = Anzahl_Waschmaschinen;
Vektor_Anzahl_Geraete(2,1) = Anzahl_Trockner;
Vektor_Anzahl_Geraete(3,1) = Anzahl_Spuelmaschine;
Vektor_Anzahl_Geraete(4,1) = Anzahl_Elektroherd;
Vektor_Anzahl_Geraete(5,1) = Anzahl_Kuehlgeraete;
Vektor_Anzahl_Geraete(6,1) = Anzahl_Gefriergeraete;
Vektor_Anzahl_Geraete(7,1) = Anzahl_Fernseher;
Vektor_Anzahl_Geraete(8,1) = Anzahl_Videorecorder;
Vektor_Anzahl_Geraete(9,1) = Anzahl_PC;
Vektor_Anzahl_Geraete(10,1) = Anzahl_Telekommunikation;
Vektor_Anzahl_Geraete(11,1) = Anzahl_Beleuchtung;
Vektor_Anzahl_Geraete(12,1) = Anzahl_Warmwasser;
Vektor_Anzahl_Geraete(13,1) = Anzahl_Restlast;


