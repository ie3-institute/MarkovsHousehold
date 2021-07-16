
% Berechnung der Wahrscheinlichkeiten bei Lastverschiebung

Wahl = xlsread('Eingabeoberflaeche_Lastverschiebung_Funktion.xlsm','Lastverschiebung','G18');

pot_ver = xlsread('Eingabeoberflaeche_Lastverschiebung_Funktion.xlsm','Lastverschiebung','J20') / 100 ;
pot_ein = (xlsread('Eingabeoberflaeche_Lastverschiebung_Funktion.xlsm','Lastverschiebung','J23') / 100) * pot_ver;


%%
% Lastverschiebung über Eingabe der Tagesintervalle

if Wahl == 1

    Lastversch_red_beg = xlsread('Eingabeoberflaeche_Lastverschiebung_Funktion.xlsm','Lastverschiebung','J31');
    Lastversch_red_end = xlsread('Eingabeoberflaeche_Lastverschiebung_Funktion.xlsm','Lastverschiebung','J32');
    Lastversch_red_dauer = Lastversch_red_end - Lastversch_red_beg + 1;
    Lastversch_erh_beg = xlsread('Eingabeoberflaeche_Lastverschiebung_Funktion.xlsm','Lastverschiebung','J42');
    Lastversch_erh_end = xlsread('Eingabeoberflaeche_Lastverschiebung_Funktion.xlsm','Lastverschiebung','J43');
    Lastversch_erh_dauer = Lastversch_erh_end - Lastversch_erh_beg + 1;
    

% Zeitintervall Lastreduktion = Zeitintervall Lasterhöhung
    
    if Lastversch_red_dauer == Lastversch_erh_dauer

    for hilfsvar1 = Lastversch_red_beg:1:Lastversch_red_end
        
        for spalt_lauf1 = 4:1:6
    
        versch_str1 = Wahrscheinlichkeitsmatrix_Waschmaschine(hilfsvar1,spalt_lauf1) * (1 - pot_ein);
        versch_str2 = Wahrscheinlichkeitsmatrix_Waschmaschine(hilfsvar1,spalt_lauf1) - versch_str1;
        Wahrscheinlichkeitsmatrix_Waschmaschine(hilfsvar1,spalt_lauf1) = versch_str1;
        Wahrscheinlichkeitsmatrix_Waschmaschine(Lastversch_erh_beg,spalt_lauf1) = Wahrscheinlichkeitsmatrix_Waschmaschine(Lastversch_erh_beg,spalt_lauf1) + versch_str2;
        versch_str1 = Wahrscheinlichkeitsmatrix_Spuelmaschine(hilfsvar1,spalt_lauf1) * (1 - pot_ein);
        versch_str2 = Wahrscheinlichkeitsmatrix_Spuelmaschine(hilfsvar1,spalt_lauf1) - versch_str1;
        Wahrscheinlichkeitsmatrix_Spuelmaschine(hilfsvar1,spalt_lauf1) = versch_str1;
        Wahrscheinlichkeitsmatrix_Spuelmaschine(Lastversch_erh_beg,spalt_lauf1) = Wahrscheinlichkeitsmatrix_Spuelmaschine(Lastversch_erh_beg,spalt_lauf1) + versch_str2;
        versch_str1 = Wahrscheinlichkeitsmatrix_Trockner(hilfsvar1,spalt_lauf1) * (1 - pot_ein);
        versch_str2 = Wahrscheinlichkeitsmatrix_Trockner(hilfsvar1,spalt_lauf1) - versch_str1;
        Wahrscheinlichkeitsmatrix_Trockner(hilfsvar1,spalt_lauf1) = versch_str1;
        Wahrscheinlichkeitsmatrix_Trockner(Lastversch_erh_beg,spalt_lauf1) = Wahrscheinlichkeitsmatrix_Trockner(Lastversch_erh_beg,spalt_lauf1) + versch_str2;
        
        Lastversch_erh_beg = Lastversch_erh_beg + 1;
        
        end
    end

    
    xlswrite('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung_Lastverschiebung.xlsm',Wahrscheinlichkeitsmatrix_Waschmaschine,'Waschmaschine','B18');
    xlswrite('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung_Lastverschiebung.xlsm',Wahrscheinlichkeitsmatrix_Spuelmaschine,'Spülmaschine','B18');
    xlswrite('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung_Lastverschiebung.xlsm',Wahrscheinlichkeitsmatrix_Trockner,'Trockner','B18');

    end
    
    
% Zeitintervall Lastreduktion > Zeitintervall Lasterhöhung

    if Lastversch_red_dauer > Lastversch_erh_dauer
        
    Lastversch_diff = Lastversch_red_dauer - Lastversch_erh_dauer;
    zeil1 = 1;
    zeil2 = 1;
    zeil_lauf = 1;
        
    for hilfsvar1 = Lastversch_red_beg:1:Lastversch_red_end
        
        for spalt_lauf1 = 1:1:12
        
        versch_str1 = Wahrscheinlichkeitsmatrix_Waschmaschine(hilfsvar1,spalt_lauf1) * (1 - pot_ein);
        versch_str2 = Wahrscheinlichkeitsmatrix_Waschmaschine(hilfsvar1,spalt_lauf1) - versch_str1;
        p_matrix_wasch(zeil1,spalt_lauf1) = versch_str2;
        Wahrscheinlichkeitsmatrix_Waschmaschine(hilfsvar1,spalt_lauf1) = versch_str1;
        versch_str1 = Wahrscheinlichkeitsmatrix_Spuelmaschine(hilfsvar1,spalt_lauf1) * (1 - pot_ein);
        versch_str2 = Wahrscheinlichkeitsmatrix_Spuelmaschine(hilfsvar1,spalt_lauf1) - versch_str1;
        p_matrix_spuel(zeil1,spalt_lauf1) = versch_str2;
        Wahrscheinlichkeitsmatrix_Spuelmaschine(hilfsvar1,spalt_lauf1) = versch_str1;
        versch_str1 = Wahrscheinlichkeitsmatrix_Trockner(hilfsvar1,spalt_lauf1) * (1 - pot_ein);
        versch_str2 = Wahrscheinlichkeitsmatrix_Trockner(hilfsvar1,spalt_lauf1) - versch_str1;
        p_matrix_trock(zeil1,spalt_lauf1) = versch_str2;
        Wahrscheinlichkeitsmatrix_Trockner(hilfsvar1,spalt_lauf1) = versch_str1;
        
        end
        
        zeil1 = zeil1 + 1;
        
    end
    
    for hilfsvar2 = Lastversch_erh_dauer + 1:1:Lastversch_erh_dauer + Lastversch_diff
        
        for spalt_lauf3 = 1:1:12
        
        zusatz_wasch(zeil_lauf,spalt_lauf3) = p_matrix_wasch(hilfsvar2,spalt_lauf3);
        zusatz_spuel(zeil_lauf,spalt_lauf3) = p_matrix_spuel(hilfsvar2,spalt_lauf3);
        zusatz_trock(zeil_lauf,spalt_lauf3) = p_matrix_trock(hilfsvar2,spalt_lauf3);
            
        end
        
        zeil_lauf = zeil_lauf + 1;
        
    end
    
    zusatz_wasch = sum(zusatz_wasch,1);
    zusatz_spuel = sum(zusatz_spuel,1);
    zusatz_trock = sum(zusatz_trock,1);
    
    for hilfsvar3 = Lastversch_erh_beg:1:Lastversch_erh_end
        
        for spalt_lauf2 = 1:1:12
            
        Wahrscheinlichkeitsmatrix_Waschmaschine(hilfsvar3,spalt_lauf2) = Wahrscheinlichkeitsmatrix_Waschmaschine(hilfsvar3,spalt_lauf2) + p_matrix_wasch(zeil2,spalt_lauf2) + (zusatz_wasch(1,spalt_lauf2) / Lastversch_erh_dauer);
        Wahrscheinlichkeitsmatrix_Spuelmaschine(hilfsvar3,spalt_lauf2) = Wahrscheinlichkeitsmatrix_Spuelmaschine(hilfsvar3,spalt_lauf2) + p_matrix_spuel(zeil2,spalt_lauf2) + (zusatz_spuel(1,spalt_lauf2) / Lastversch_erh_dauer);
        Wahrscheinlichkeitsmatrix_Trockner(hilfsvar3,spalt_lauf2) = Wahrscheinlichkeitsmatrix_Trockner(hilfsvar3,spalt_lauf2) + p_matrix_trock(zeil2,spalt_lauf2) + (zusatz_trock(1,spalt_lauf2) / Lastversch_erh_dauer);
            
        end
        
        zeil2 = zeil2 + 1;
        
    end
    
    xlswrite('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung_Lastverschiebung.xlsm',Wahrscheinlichkeitsmatrix_Waschmaschine,'Waschmaschine','B18');
    xlswrite('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung_Lastverschiebung.xlsm',Wahrscheinlichkeitsmatrix_Spuelmaschine,'Spülmaschine','B18');
    xlswrite('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung_Lastverschiebung.xlsm',Wahrscheinlichkeitsmatrix_Trockner,'Trockner','B18');
    
    end
    
    
% Zeitintervall Lastreduktion < Zeitintervall Lasterhöhung

    if Lastversch_red_dauer < Lastversch_erh_dauer
        
    Lastversch_diff = Lastversch_erh_dauer - Lastversch_red_dauer;
    p_red = 1 - (Lastversch_diff / Lastversch_erh_dauer);
    zeil1 = 1;
    zeil2 = 1;
    zeil_lauf = 1;
        
    for hilfsvar1 = Lastversch_red_beg:1:Lastversch_red_end
        
        for spalt_lauf1 = 1:1:12
        
        versch_str1 = Wahrscheinlichkeitsmatrix_Waschmaschine(hilfsvar1,spalt_lauf1) * (1 - pot_ein);
        versch_str2 = Wahrscheinlichkeitsmatrix_Waschmaschine(hilfsvar1,spalt_lauf1) - versch_str1;
        p_matrix_wasch(zeil1,spalt_lauf1) = versch_str2;
        p_red_matrix_wasch(zeil1,spalt_lauf1) = p_matrix_wasch(zeil1,spalt_lauf1) * p_red;
        Wahrscheinlichkeitsmatrix_Waschmaschine(hilfsvar1,spalt_lauf1) = versch_str1;
        versch_str1 = Wahrscheinlichkeitsmatrix_Spuelmaschine(hilfsvar1,spalt_lauf1) * (1 - pot_ein);
        versch_str2 = Wahrscheinlichkeitsmatrix_Spuelmaschine(hilfsvar1,spalt_lauf1) - versch_str1;
        p_matrix_spuel(zeil1,spalt_lauf1) = versch_str2;
        p_red_matrix_spuel(zeil1,spalt_lauf1) = p_matrix_spuel(zeil1,spalt_lauf1) * p_red;
        Wahrscheinlichkeitsmatrix_Spuelmaschine(hilfsvar1,spalt_lauf1) = versch_str1;
        versch_str1 = Wahrscheinlichkeitsmatrix_Trockner(hilfsvar1,spalt_lauf1) * (1 - pot_ein);
        versch_str2 = Wahrscheinlichkeitsmatrix_Trockner(hilfsvar1,spalt_lauf1) - versch_str1;
        p_matrix_trock(zeil1,spalt_lauf1) = versch_str2;
        p_red_matrix_trock(zeil1,spalt_lauf1) = p_matrix_trock(zeil1,spalt_lauf1) * p_red;
        Wahrscheinlichkeitsmatrix_Trockner(hilfsvar1,spalt_lauf1) = versch_str1;
        
        end
        
        zeil1 = zeil1 + 1;
        
    end
    
    zusatz_wasch = sum(p_matrix_wasch,1) - sum(p_red_matrix_wasch,1);
    zusatz_spuel = sum(p_matrix_spuel,1) - sum(p_red_matrix_spuel,1);
    zusatz_trock = sum(p_matrix_trock,1) - sum(p_red_matrix_trock,1);
    
    for hilfsvar2 = Lastversch_erh_beg:1:Lastversch_erh_end - Lastversch_diff
        
        for spalt_lauf2 = 1:1:12
            
        Wahrscheinlichkeitsmatrix_Waschmaschine(hilfsvar2,spalt_lauf2) = Wahrscheinlichkeitsmatrix_Waschmaschine(hilfsvar2,spalt_lauf2) + p_red_matrix_wasch(zeil2,spalt_lauf2);
        Wahrscheinlichkeitsmatrix_Spuelmaschine(hilfsvar2,spalt_lauf2) = Wahrscheinlichkeitsmatrix_Spuelmaschine(hilfsvar2,spalt_lauf2) + p_red_matrix_spuel(zeil2,spalt_lauf2);
        Wahrscheinlichkeitsmatrix_Trockner(hilfsvar2,spalt_lauf2) = Wahrscheinlichkeitsmatrix_Trockner(hilfsvar2,spalt_lauf2) + p_red_matrix_trock(zeil2,spalt_lauf2);
            
        end
        
        zeil2 = zeil2 + 1;
        
    end
    
    for hilfsvar3 = Lastversch_erh_end - Lastversch_diff + 1:1:Lastversch_erh_end
        
        for spalt_lauf3 = 1:1:12
            
        Wahrscheinlichkeitsmatrix_Waschmaschine(hilfsvar3,spalt_lauf3) = Wahrscheinlichkeitsmatrix_Waschmaschine(hilfsvar3,spalt_lauf3) + (zusatz_wasch(1,spalt_lauf3) / Lastversch_diff);
        Wahrscheinlichkeitsmatrix_Spuelmaschine(hilfsvar3,spalt_lauf3) = Wahrscheinlichkeitsmatrix_Spuelmaschine(hilfsvar3,spalt_lauf3) + (zusatz_spuel(1,spalt_lauf3) / Lastversch_diff);
        Wahrscheinlichkeitsmatrix_Trockner(hilfsvar3,spalt_lauf3) = Wahrscheinlichkeitsmatrix_Trockner(hilfsvar3,spalt_lauf3) + (zusatz_trock(1,spalt_lauf3) / Lastversch_diff);
            
        end
        
    end
    
    xlswrite('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung_Lastverschiebung.xlsm',Wahrscheinlichkeitsmatrix_Waschmaschine,'Waschmaschine','B18');
    xlswrite('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung_Lastverschiebung.xlsm',Wahrscheinlichkeitsmatrix_Spuelmaschine,'Spülmaschine','B18');
    xlswrite('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung_Lastverschiebung.xlsm',Wahrscheinlichkeitsmatrix_Trockner,'Trockner','B18');
        
    end
    
end

%%
% Lastverschiebung über Preisfunktion

if Wahl == 2
    
    p_func = xlsread('Eingabeoberflaeche_Lastverschiebung_Funktion.xlsm','Lastverschiebung','D8:D103');
    p_min = xlsread('Eingabeoberflaeche_Lastverschiebung_Funktion.xlsm','Lastverschiebung','J50');
    p_max = xlsread('Eingabeoberflaeche_Lastverschiebung_Funktion.xlsm','Lastverschiebung','J53');
    p_unterschr = xlsread('Eingabeoberflaeche_Lastverschiebung_Funktion.xlsm','Lastverschiebung','M54');
    p_ueberschr = xlsread('Eingabeoberflaeche_Lastverschiebung_Funktion.xlsm','Lastverschiebung','M55');
    p_diff = p_ueberschr - p_unterschr;
    
    zeil1 = 1;
    zeil2 = 1;


% Zeitintervall Lastreduktion = Zeitintervall Lasterhöhung
    
    if p_diff == 0
        
    for hilfsvar_p1 = 1:1:96
            
        if p_func(hilfsvar_p1,1) >= p_max
                
            for spalt_lauf1 = 1:1:12
                
                versch_str1 = Wahrscheinlichkeitsmatrix_Waschmaschine(hilfsvar_p1,spalt_lauf1) * (1 - pot_ein);
                versch_str2 = Wahrscheinlichkeitsmatrix_Waschmaschine(hilfsvar_p1,spalt_lauf1) - versch_str1;
                p_matrix_wasch(zeil1,spalt_lauf1) = versch_str2;
                Wahrscheinlichkeitsmatrix_Waschmaschine(hilfsvar_p1,spalt_lauf1) = versch_str1;
                versch_str1 = Wahrscheinlichkeitsmatrix_Spuelmaschine(hilfsvar_p1,spalt_lauf1) * (1 - pot_ein);
                versch_str2 = Wahrscheinlichkeitsmatrix_Spuelmaschine(hilfsvar_p1,spalt_lauf1) - versch_str1;
                p_matrix_spuel(zeil1,spalt_lauf1) = versch_str2;
                Wahrscheinlichkeitsmatrix_Spuelmaschine(hilfsvar_p1,spalt_lauf1) = versch_str1;
                versch_str1 = Wahrscheinlichkeitsmatrix_Trockner(hilfsvar_p1,spalt_lauf1) * (1 - pot_ein);
                versch_str2 = Wahrscheinlichkeitsmatrix_Trockner(hilfsvar_p1,spalt_lauf1) - versch_str1;
                p_matrix_trock(zeil1,spalt_lauf1) = versch_str2;
                Wahrscheinlichkeitsmatrix_Trockner(hilfsvar_p1,spalt_lauf1) = versch_str1;
                
            end
                
                zeil1 = zeil1 + 1;
                
        end
            
    end
        
    for hilfsvar_p2 = 1:1:96
            
        if p_func(hilfsvar_p2,1) <= p_min
                
            for spalt_lauf2 = 1:1:12
                
                Wahrscheinlichkeitsmatrix_Waschmaschine(hilfsvar_p2,spalt_lauf2) = Wahrscheinlichkeitsmatrix_Waschmaschine(hilfsvar_p2,spalt_lauf2) + p_matrix_wasch(zeil2,spalt_lauf2);
                Wahrscheinlichkeitsmatrix_Spuelmaschine(hilfsvar_p2,spalt_lauf2) = Wahrscheinlichkeitsmatrix_Spuelmaschine(hilfsvar_p2,spalt_lauf2) + p_matrix_spuel(zeil2,spalt_lauf2);
                Wahrscheinlichkeitsmatrix_Trockner(hilfsvar_p2,spalt_lauf2) = Wahrscheinlichkeitsmatrix_Trockner(hilfsvar_p2,spalt_lauf2) + p_matrix_trock(zeil2,spalt_lauf2);
                
            end
                
                zeil2 = zeil2 + 1;
                
        end
            
    end
            
    xlswrite('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung_Lastverschiebung.xlsm',Wahrscheinlichkeitsmatrix_Waschmaschine,'Waschmaschine','B18');
    xlswrite('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung_Lastverschiebung.xlsm',Wahrscheinlichkeitsmatrix_Spuelmaschine,'Spülmaschine','B18');
    xlswrite('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung_Lastverschiebung.xlsm',Wahrscheinlichkeitsmatrix_Trockner,'Trockner','B18');
        
    end


% Zeitintervall Lastreduktion > Zeitintervall Lasterhöhung

    if p_diff > 0
        
    zeil_lauf = 1;
        
    for hilfsvar_p1 = 1:1:96
            
        if p_func(hilfsvar_p1,1) >= p_max
                
            for spalt_lauf1 = 1:1:12
                
                versch_str1 = Wahrscheinlichkeitsmatrix_Waschmaschine(hilfsvar_p1,spalt_lauf1) * (1 - pot_ein);
                versch_str2 = Wahrscheinlichkeitsmatrix_Waschmaschine(hilfsvar_p1,spalt_lauf1) - versch_str1;
                p_matrix_wasch(zeil1,spalt_lauf1) = versch_str2;
                Wahrscheinlichkeitsmatrix_Waschmaschine(hilfsvar_p1,spalt_lauf1) = versch_str1;
                versch_str1 = Wahrscheinlichkeitsmatrix_Spuelmaschine(hilfsvar_p1,spalt_lauf1) * (1 - pot_ein);
                versch_str2 = Wahrscheinlichkeitsmatrix_Spuelmaschine(hilfsvar_p1,spalt_lauf1) - versch_str1;
                p_matrix_spuel(zeil1,spalt_lauf1) = versch_str2;
                Wahrscheinlichkeitsmatrix_Spuelmaschine(hilfsvar_p1,spalt_lauf1) = versch_str1;
                versch_str1 = Wahrscheinlichkeitsmatrix_Trockner(hilfsvar_p1,spalt_lauf1) * (1 - pot_ein);
                versch_str2 = Wahrscheinlichkeitsmatrix_Trockner(hilfsvar_p1,spalt_lauf1) - versch_str1;
                p_matrix_trock(zeil1,spalt_lauf1) = versch_str2;
                Wahrscheinlichkeitsmatrix_Trockner(hilfsvar_p1,spalt_lauf1) = versch_str1;
                
            end
                
            zeil1 = zeil1 + 1;
                
        end
            
    end
        
    for hilfsvar_p2 = p_unterschr + 1:1:p_unterschr + p_diff
        
        for spalt_lauf2 = 1:1:12
        
            zusatz_wasch(zeil_lauf,spalt_lauf2) = p_matrix_wasch(hilfsvar_p2,spalt_lauf2);
            zusatz_spuel(zeil_lauf,spalt_lauf2) = p_matrix_spuel(hilfsvar_p2,spalt_lauf2);
            zusatz_trock(zeil_lauf,spalt_lauf2) = p_matrix_trock(hilfsvar_p2,spalt_lauf2);
            
        end
        
    zeil_lauf = zeil_lauf + 1;
        
    end
    
    zusatz_wasch = sum(zusatz_wasch,1);
    zusatz_spuel = sum(zusatz_spuel,1);
    zusatz_trock = sum(zusatz_trock,1);
        
    for hilfsvar_p3 = 1:1:96
            
        if p_func(hilfsvar_p3,1) <= p_min
                
            for spalt_lauf3 = 1:1:12
                
                Wahrscheinlichkeitsmatrix_Waschmaschine(hilfsvar_p3,spalt_lauf3) = Wahrscheinlichkeitsmatrix_Waschmaschine(hilfsvar_p3,spalt_lauf3) + p_matrix_wasch(zeil2,spalt_lauf3) + (zusatz_wasch(1,spalt_lauf3) / p_unterschr);
                Wahrscheinlichkeitsmatrix_Spuelmaschine(hilfsvar_p3,spalt_lauf3) = Wahrscheinlichkeitsmatrix_Spuelmaschine(hilfsvar_p3,spalt_lauf3) + p_matrix_spuel(zeil2,spalt_lauf3) + (zusatz_spuel(1,spalt_lauf3) / p_unterschr);
                Wahrscheinlichkeitsmatrix_Trockner(hilfsvar_p3,spalt_lauf3) = Wahrscheinlichkeitsmatrix_Trockner(hilfsvar_p3,spalt_lauf3) + p_matrix_trock(zeil2,spalt_lauf3) + (zusatz_trock(1,spalt_lauf3) / p_unterschr);
                
            end
                
            zeil2 = zeil2 + 1;
                
        end
            
    end
            
    xlswrite('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung_Lastverschiebung.xlsm',Wahrscheinlichkeitsmatrix_Waschmaschine,'Waschmaschine','B18');
    xlswrite('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung_Lastverschiebung.xlsm',Wahrscheinlichkeitsmatrix_Spuelmaschine,'Spülmaschine','B18');
    xlswrite('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung_Lastverschiebung.xlsm',Wahrscheinlichkeitsmatrix_Trockner,'Trockner','B18');
        
    end


    % Zeitintervall Lastreduktion < Zeitintervall Lasterhöhung
    
    if p_diff < 0
        
    Lastversch_diff = p_unterschr - p_ueberschr;
    p_red = 1 - (Lastversch_diff / p_unterschr);
        
    for hilfsvar_p1 = 1:1:96
            
        if p_func(hilfsvar_p1,1) >= p_max
                
            for spalt_lauf1 = 1:1:12
                
                versch_str1 = Wahrscheinlichkeitsmatrix_Waschmaschine(hilfsvar_p1,spalt_lauf1) * (1 - pot_ein);
                versch_str2 = Wahrscheinlichkeitsmatrix_Waschmaschine(hilfsvar_p1,spalt_lauf1) - versch_str1;
                p_matrix_wasch(zeil1,spalt_lauf1) = versch_str2;
                p_red_matrix_wasch(zeil1,spalt_lauf1) = p_matrix_wasch(zeil1,spalt_lauf1) * p_red;
                Wahrscheinlichkeitsmatrix_Waschmaschine(hilfsvar_p1,spalt_lauf1) = versch_str1;
                versch_str1 = Wahrscheinlichkeitsmatrix_Spuelmaschine(hilfsvar_p1,spalt_lauf1) * (1 - pot_ein);
                versch_str2 = Wahrscheinlichkeitsmatrix_Spuelmaschine(hilfsvar_p1,spalt_lauf1) - versch_str1;
                p_matrix_spuel(zeil1,spalt_lauf1) = versch_str2;
                p_red_matrix_spuel(zeil1,spalt_lauf1) = p_matrix_spuel(zeil1,spalt_lauf1) * p_red;
                Wahrscheinlichkeitsmatrix_Spuelmaschine(hilfsvar_p1,spalt_lauf1) = versch_str1;
                versch_str1 = Wahrscheinlichkeitsmatrix_Trockner(hilfsvar_p1,spalt_lauf1) * (1 - pot_ein);
                versch_str2 = Wahrscheinlichkeitsmatrix_Trockner(hilfsvar_p1,spalt_lauf1) - versch_str1;
                p_matrix_trock(zeil1,spalt_lauf1) = versch_str2;
                p_red_matrix_trock(zeil1,spalt_lauf1) = p_matrix_trock(zeil1,spalt_lauf1) * p_red;
                Wahrscheinlichkeitsmatrix_Trockner(hilfsvar_p1,spalt_lauf1) = versch_str1;
                
            end
                
            zeil1 = zeil1 + 1;
                
        end
            
    end
    
    p_matrix_anzahlzeilen = size(p_red_matrix_wasch,1);
    zusatz_wasch = sum(p_matrix_wasch,1) - sum(p_red_matrix_wasch,1);
    zusatz_spuel = sum(p_matrix_spuel,1) - sum(p_red_matrix_spuel,1);
    zusatz_trock = sum(p_matrix_trock,1) - sum(p_red_matrix_trock,1);
        
    for hilfsvar_p2 = 1:1:96
            
        if p_func(hilfsvar_p2,1) <= p_min
            
            if zeil2 <= p_matrix_anzahlzeilen
                
                for spalt_lauf2 = 1:1:12
                
                    Wahrscheinlichkeitsmatrix_Waschmaschine(hilfsvar_p2,spalt_lauf2) = Wahrscheinlichkeitsmatrix_Waschmaschine(hilfsvar_p2,spalt_lauf2) + p_red_matrix_wasch(zeil2,spalt_lauf2);
                    Wahrscheinlichkeitsmatrix_Spuelmaschine(hilfsvar_p2,spalt_lauf2) = Wahrscheinlichkeitsmatrix_Spuelmaschine(hilfsvar_p2,spalt_lauf2) + p_red_matrix_spuel(zeil2,spalt_lauf2);
                    Wahrscheinlichkeitsmatrix_Trockner(hilfsvar_p2,spalt_lauf2) = Wahrscheinlichkeitsmatrix_Trockner(hilfsvar_p2,spalt_lauf2) + p_red_matrix_trock(zeil2,spalt_lauf2);
                
                end
                
            end
            
            if zeil2 > p_matrix_anzahlzeilen
                
                for spalt_lauf3 = 1:1:12
                
                    Wahrscheinlichkeitsmatrix_Waschmaschine(hilfsvar_p2,spalt_lauf3) = Wahrscheinlichkeitsmatrix_Waschmaschine(hilfsvar_p2,spalt_lauf3) + (zusatz_wasch(1,spalt_lauf3) / Lastversch_diff);
                    Wahrscheinlichkeitsmatrix_Spuelmaschine(hilfsvar_p2,spalt_lauf3) = Wahrscheinlichkeitsmatrix_Spuelmaschine(hilfsvar_p2,spalt_lauf3) + (zusatz_spuel(1,spalt_lauf3) / Lastversch_diff);
                    Wahrscheinlichkeitsmatrix_Trockner(hilfsvar_p2,spalt_lauf3) = Wahrscheinlichkeitsmatrix_Trockner(hilfsvar_p2,spalt_lauf3) + (zusatz_trock(1,spalt_lauf3) / Lastversch_diff);
                
                end
            
            end
            
            zeil2 = zeil2 + 1;
                
        end
            
    end
            
    xlswrite('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung_Lastverschiebung.xlsm',Wahrscheinlichkeitsmatrix_Waschmaschine,'Waschmaschine','B18');
    xlswrite('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung_Lastverschiebung.xlsm',Wahrscheinlichkeitsmatrix_Spuelmaschine,'Spülmaschine','B18');
    xlswrite('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung_Lastverschiebung.xlsm',Wahrscheinlichkeitsmatrix_Trockner,'Trockner','B18');
        
    end
    
end

%%
% Lastverschiebung mittels Fuzzy-Logik

if Wahl == 3
    
    Preisfunktion = xlsread('Preisfunktion_2014.xlsm','Preismatrix','C9:N104');
    Durchschnittspreis = xlsread('Preisfunktion_2014.xlsm','Preismatrix','C106:N106');
    Maximalwert = max(Preisfunktion);
    fismat = readfis('Fuzzy_Preisfunktion_variabel');
    Wahrscheinlichkeitsmatrix_Waschmaschine_Ursprung = Wahrscheinlichkeitsmatrix_Waschmaschine;
    Wahrscheinlichkeitsmatrix_Spuelmaschine_Ursprung = Wahrscheinlichkeitsmatrix_Spuelmaschine;
    Wahrscheinlichkeitsmatrix_Trockner_Ursprung = Wahrscheinlichkeitsmatrix_Trockner;
    
    for fuzzy_hilf = 1:1:12
        
        fismat.input(2).mf(1).params = [0 0 Durchschnittspreis(1,fuzzy_hilf)-8 Durchschnittspreis(1,fuzzy_hilf)-4];
        fismat.input(2).mf(2).params = [Durchschnittspreis(1,fuzzy_hilf)-8 Durchschnittspreis(1,fuzzy_hilf)-4 Durchschnittspreis(1,fuzzy_hilf)-3 Durchschnittspreis(1,fuzzy_hilf)+1];
        fismat.input(2).mf(3).params = [Durchschnittspreis(1,fuzzy_hilf)-0.5 Durchschnittspreis(1,fuzzy_hilf)+2 Maximalwert(1,fuzzy_hilf)-1 Maximalwert(1,fuzzy_hilf)];
        fismat.input(2).mf(4).params = [Durchschnittspreis(1,fuzzy_hilf)+2 Maximalwert(1,fuzzy_hilf) Maximalwert(1,fuzzy_hilf)];
        fismat.input(2).range = [0 Maximalwert(1,fuzzy_hilf)];
        
        Wahrscheinlichkeitsmatrix_Waschmaschine_Fuzzy(:,1) = Wahrscheinlichkeitsmatrix_Waschmaschine(:,fuzzy_hilf);
        Wahrscheinlichkeitsmatrix_Waschmaschine_Fuzzy(:,2) = Preisfunktion(:,fuzzy_hilf);
        Wahrscheinlichkeitsmatrix_Spuelmaschine_Fuzzy(:,1) = Wahrscheinlichkeitsmatrix_Spuelmaschine(:,fuzzy_hilf);
        Wahrscheinlichkeitsmatrix_Spuelmaschine_Fuzzy(:,2) = Preisfunktion(:,fuzzy_hilf);
        Wahrscheinlichkeitsmatrix_Trockner_Fuzzy(:,1) = Wahrscheinlichkeitsmatrix_Trockner(:,fuzzy_hilf);
        Wahrscheinlichkeitsmatrix_Trockner_Fuzzy(:,2) = Preisfunktion(:,fuzzy_hilf);
        
        Wahrscheinlichkeitsmatrix_Waschmaschine(:,fuzzy_hilf) = evalfis(Wahrscheinlichkeitsmatrix_Waschmaschine_Fuzzy,fismat);
        Wahrscheinlichkeitsmatrix_Spuelmaschine(:,fuzzy_hilf) = evalfis(Wahrscheinlichkeitsmatrix_Spuelmaschine_Fuzzy,fismat);
        Wahrscheinlichkeitsmatrix_Trockner(:,fuzzy_hilf) = evalfis(Wahrscheinlichkeitsmatrix_Trockner_Fuzzy,fismat);
        
        for hilfvar = 1:1:96
            if Wahrscheinlichkeitsmatrix_Waschmaschine(hilfvar,fuzzy_hilf) < 0
                Wahrscheinlichkeitsmatrix_Waschmaschine(hilfvar,fuzzy_hilf) = 0;
            end
            
            if Wahrscheinlichkeitsmatrix_Spuelmaschine(hilfvar,fuzzy_hilf) < 0
                Wahrscheinlichkeitsmatrix_Spuelmaschine(hilfvar,fuzzy_hilf) = 0;
            end
            
            if Wahrscheinlichkeitsmatrix_Trockner(hilfvar,fuzzy_hilf) < 0
                Wahrscheinlichkeitsmatrix_Trockner(hilfvar,fuzzy_hilf) = 0;
            end
        end
        
    end
    
    for hilfvar = 1:1:12
        Skalierungsfaktor_Wasch = (sum(Wahrscheinlichkeitsmatrix_Waschmaschine_Ursprung(:,hilfvar))) / (sum(Wahrscheinlichkeitsmatrix_Waschmaschine(:,hilfvar)));
        Skalierungsfaktor_Spuel = (sum(Wahrscheinlichkeitsmatrix_Spuelmaschine_Ursprung(:,hilfvar))) / (sum(Wahrscheinlichkeitsmatrix_Spuelmaschine(:,hilfvar)));
        Skalierungsfaktor_Trock = (sum(Wahrscheinlichkeitsmatrix_Trockner_Ursprung(:,hilfvar))) / (sum(Wahrscheinlichkeitsmatrix_Trockner(:,hilfvar)));
        for hilfvar2 = 1:1:96
            Wahrscheinlichkeitsmatrix_Waschmaschine(hilfvar2,hilfvar) = Wahrscheinlichkeitsmatrix_Waschmaschine(hilfvar2,hilfvar) * Skalierungsfaktor_Wasch;
            Wahrscheinlichkeitsmatrix_Spuelmaschine(hilfvar2,hilfvar) = Wahrscheinlichkeitsmatrix_Spuelmaschine(hilfvar2,hilfvar) * Skalierungsfaktor_Spuel;
            Wahrscheinlichkeitsmatrix_Trockner(hilfvar2,hilfvar) = Wahrscheinlichkeitsmatrix_Trockner(hilfvar2,hilfvar) * Skalierungsfaktor_Trock;
        end
    end
    
    xlswrite('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung_Lastverschiebung.xlsm',Wahrscheinlichkeitsmatrix_Waschmaschine,'Waschmaschine','B18');
    xlswrite('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung_Lastverschiebung.xlsm',Wahrscheinlichkeitsmatrix_Spuelmaschine,'Spülmaschine','B18');
    xlswrite('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung_Lastverschiebung.xlsm',Wahrscheinlichkeitsmatrix_Trockner,'Trockner','B18');
    
end

%%
% Starre Lastverschiebung (Durchschnittspreis)

if Wahl == 4
    
    Preisfunktion = xlsread('Preisfunktion_2014.xlsm','Preismatrix','C9:N104');
    Durchschnittspreis = xlsread('Preisfunktion_2014.xlsm','Preismatrix','C106:N106');
    Wahrscheinlichkeitsmatrix_Waschmaschine_Ursprung = Wahrscheinlichkeitsmatrix_Waschmaschine;
    Wahrscheinlichkeitsmatrix_Spuelmaschine_Ursprung = Wahrscheinlichkeitsmatrix_Spuelmaschine;
    Wahrscheinlichkeitsmatrix_Trockner_Ursprung = Wahrscheinlichkeitsmatrix_Trockner;
    Wahrscheinlichkeitsmatrix_Waschmaschine = zeros(96,12);
    Wahrscheinlichkeitsmatrix_Spuelmaschine = zeros(96,12);
    Wahrscheinlichkeitsmatrix_Trockner = zeros(96,12);
    Zeitfenster_Start = 1;
    Zeitfenster_End = 96;
    Lastgangdauer_Waschmaschine = length(Lastgang_Waschmaschine);
    Lastgangdauer_Spuelmaschine = length(Lastgang_Spuelmaschine);
    Lastgangdauer_Trockner = length(Lastgang_Trockner);
%     ueberpruefung = true;
%     ueberpruefung_mind_on = false;
%     ueberpruefung_wasch = true;
%     ueberpruefung_spuel = true;
%     ueberpruefung_trock = true;
    
    
    for spalt_hilf = 1:1:12
        
        ueberpruefung = true;
        ueberpruefung_mind_on = false;
        ueberpruefung_wasch = true;
        ueberpruefung_spuel = true;
        ueberpruefung_trock = true;
        
        for laufvariable1 = 1:1:96

            if laufvariable1 < Zeitfenster_Start
                Zeitfenster = false;
            end
            if laufvariable1 >= Zeitfenster_Start && laufvariable1 <= Zeitfenster_End
                Zeitfenster = true;
            end
            if laufvariable1 > Zeitfenster_End
                Zeitfenster = false;
            end

            if Preisfunktion(laufvariable1,spalt_hilf) > Durchschnittspreis(1,spalt_hilf)
                Wahrscheinlichkeitsmatrix_Waschmaschine(laufvariable1,spalt_hilf) = 0;
                Wahrscheinlichkeitsmatrix_Spuelmaschine(laufvariable1,spalt_hilf) = 0;
                Wahrscheinlichkeitsmatrix_Trockner(laufvariable1,spalt_hilf) = 0;
                ueberpruefung = true;
            end

            if Preisfunktion(laufvariable1,spalt_hilf) <= Durchschnittspreis(1,spalt_hilf) && ueberpruefung && Zeitfenster
                Wahrscheinlichkeitsmatrix_Waschmaschine(laufvariable1,spalt_hilf) = 1;
                Wahrscheinlichkeitsmatrix_Spuelmaschine(laufvariable1,spalt_hilf) = 1;
                Wahrscheinlichkeitsmatrix_Trockner(laufvariable1,spalt_hilf) = 1;
                ueberpruefung = false;
                ueberpruefung_mind_on = true;
            end

            if Preisfunktion(laufvariable1,spalt_hilf) > Durchschnittspreis(1,spalt_hilf) && laufvariable1 == Zeitfenster_End - Lastgangdauer_Waschmaschine && ueberpruefung_wasch && ueberpruefung_mind_on == false
                Wahrscheinlichkeitsmatrix_Waschmaschine(laufvariable1,spalt_hilf) = 1;
                ueberpruefung_wasch = false;
            end

            if Preisfunktion(laufvariable1,spalt_hilf) > Durchschnittspreis(1,spalt_hilf) && laufvariable1 == Zeitfenster_End - Lastgangdauer_Spuelmaschine && ueberpruefung_spuel && ueberpruefung_mind_on == false
                Wahrscheinlichkeitsmatrix_Spuelmaschine(laufvariable1,spalt_hilf) = 1;
                ueberpruefung_spuel = false;
            end

            if Preisfunktion(laufvariable1,spalt_hilf) > Durchschnittspreis(1,spalt_hilf) && laufvariable1 == Zeitfenster_End - Lastgangdauer_Trockner && ueberpruefung_trock && ueberpruefung_mind_on == false
                Wahrscheinlichkeitsmatrix_Trockner(laufvariable1,spalt_hilf) = 1;
                ueberpruefung_trock = false;
            end

            if Zeitfenster == false
                Wahrscheinlichkeitsmatrix_Waschmaschine(laufvariable1,spalt_hilf) = 0;
                Wahrscheinlichkeitsmatrix_Spuelmaschine(laufvariable1,spalt_hilf) = 0;
                Wahrscheinlichkeitsmatrix_Trockner(laufvariable1,spalt_hilf) = 0;
            end

        end
    end
    
    for hilfvar1 = 1:1:12
        Skalierungsvektor_Wasch_Ursprung(hilfvar1,1) = sum(Wahrscheinlichkeitsmatrix_Waschmaschine_Ursprung(:,hilfvar1));
        Skalierungsvektor_Spuel_Ursprung(hilfvar1,1) = sum(Wahrscheinlichkeitsmatrix_Spuelmaschine_Ursprung(:,hilfvar1));
        Skalierungsvektor_Trock_Ursprung(hilfvar1,1) = sum(Wahrscheinlichkeitsmatrix_Trockner_Ursprung(:,hilfvar1));
        Skalierungsvektor_Wasch_Versch(hilfvar1,1) = sum(Wahrscheinlichkeitsmatrix_Waschmaschine(:,hilfvar1));
        Skalierungsvektor_Spuel_Versch(hilfvar1,1) = sum(Wahrscheinlichkeitsmatrix_Spuelmaschine(:,hilfvar1));
        Skalierungsvektor_Trock_Versch(hilfvar1,1) = sum(Wahrscheinlichkeitsmatrix_Trockner(:,hilfvar1));
        Skalierungsvektor_Wasch(hilfvar1,1) = Skalierungsvektor_Wasch_Ursprung(hilfvar1,1) / Skalierungsvektor_Wasch_Versch(hilfvar1,1);
        Skalierungsvektor_Spuel(hilfvar1,1) = Skalierungsvektor_Spuel_Ursprung(hilfvar1,1) / Skalierungsvektor_Spuel_Versch(hilfvar1,1);
        Skalierungsvektor_Trock(hilfvar1,1) = Skalierungsvektor_Trock_Ursprung(hilfvar1,1) / Skalierungsvektor_Trock_Versch(hilfvar1,1);
        Wahrscheinlichkeitsmatrix_Waschmaschine(:,hilfvar1) = Wahrscheinlichkeitsmatrix_Waschmaschine(:,hilfvar1) * Skalierungsvektor_Wasch(hilfvar1,1);
        Wahrscheinlichkeitsmatrix_Spuelmaschine(:,hilfvar1) = Wahrscheinlichkeitsmatrix_Spuelmaschine(:,hilfvar1) * Skalierungsvektor_Spuel(hilfvar1,1);
        Wahrscheinlichkeitsmatrix_Trockner(:,hilfvar1) = Wahrscheinlichkeitsmatrix_Trockner(:,hilfvar1) * Skalierungsvektor_Trock(hilfvar1,1);
    end

    xlswrite('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung_Lastverschiebung.xlsm',Wahrscheinlichkeitsmatrix_Waschmaschine,'Waschmaschine','B18');
    xlswrite('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung_Lastverschiebung.xlsm',Wahrscheinlichkeitsmatrix_Spuelmaschine,'Spülmaschine','B18');
    xlswrite('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung_Lastverschiebung.xlsm',Wahrscheinlichkeitsmatrix_Trockner,'Trockner','B18');
    
end

%%
% Lastverschiebung (Normalverteilung)

if Wahl == 5
    
    Preisfunktion = xlsread('Preisfunktion_2014.xlsm','Preismatrix','C9:N104');
    Durchschnittspreis = xlsread('Preisfunktion_2014.xlsm','Preismatrix','C106:N106');
    Wahrscheinlichkeitsmatrix_Waschmaschine_Ursprung = Wahrscheinlichkeitsmatrix_Waschmaschine;
    Wahrscheinlichkeitsmatrix_Spuelmaschine_Ursprung = Wahrscheinlichkeitsmatrix_Spuelmaschine;
    Wahrscheinlichkeitsmatrix_Trockner_Ursprung = Wahrscheinlichkeitsmatrix_Trockner;
    Wahrscheinlichkeitsmatrix_Waschmaschine = zeros(96,12);
    Wahrscheinlichkeitsmatrix_Spuelmaschine = zeros(96,12);
    Wahrscheinlichkeitsmatrix_Trockner = zeros(96,12);
    Verteilungsfunktion = normpdf(-2.8:0.4:2.8);
    Verteilungsfunktion_Wasch = normpdf(-2.8:0.4:2.8);
    Verteilungsfunktion_Spuel = normpdf(-3.2:0.4:3.2);
    Verteilungsfunktion_Trock = normpdf(-2.4:0.4:2.4);
    Zeitfenster_Start = 1;
    Zeitfenster_End = 96;
    Lastgangdauer_Waschmaschine = length(Lastgang_Waschmaschine);
    Lastgangdauer_Spuelmaschine = length(Lastgang_Spuelmaschine);
    Lastgangdauer_Trockner = length(Lastgang_Trockner);
    
    for spaltlauf = 1:1:12
        ueberpruefung = true;
        ueberpruefung_wasch = true;
        ueberpruefung_spuel = true;
        ueberpruefung_trock = true;
        Zeitfenster = false;
        for hilflauf1 = 1:1:96
            if hilflauf1 < Zeitfenster_Start
                Zeitfenster = false;
            end
            if hilflauf1 >= Zeitfenster_Start && hilflauf1 <= Zeitfenster_End
                Zeitfenster = true;
            end
            if hilflauf1 > Zeitfenster_End
                Zeitfenster = false;
            end
            if Preisfunktion(hilflauf1,spaltlauf) <= Durchschnittspreis(1,spaltlauf) && ueberpruefung && Zeitfenster
                if hilflauf1 <= 82
                    for hilflauf2 = 1:1:15
                        Wahrscheinlichkeitsmatrix_Waschmaschine(hilflauf1+hilflauf2-1,spaltlauf) = Verteilungsfunktion(hilflauf2);
                        Wahrscheinlichkeitsmatrix_Spuelmaschine(hilflauf1+hilflauf2-1,spaltlauf) = Verteilungsfunktion(hilflauf2);
                        Wahrscheinlichkeitsmatrix_Trockner(hilflauf1+hilflauf2-1,spaltlauf) = Verteilungsfunktion(hilflauf2);
                    end
                end
                if hilflauf1 <= 83
                    for hilflauf2 = 1:1:14
                        Wahrscheinlichkeitsmatrix_Waschmaschine(hilflauf1+hilflauf2-1,spaltlauf) = Verteilungsfunktion(hilflauf2);
                        Wahrscheinlichkeitsmatrix_Spuelmaschine(hilflauf1+hilflauf2-1,spaltlauf) = Verteilungsfunktion(hilflauf2);
                        Wahrscheinlichkeitsmatrix_Trockner(hilflauf1+hilflauf2-1,spaltlauf) = Verteilungsfunktion(hilflauf2);
                    end
                end
                if hilflauf1 <= 84
                    for hilflauf2 = 1:1:13
                        Wahrscheinlichkeitsmatrix_Waschmaschine(hilflauf1+hilflauf2-1,spaltlauf) = Verteilungsfunktion(hilflauf2);
                        Wahrscheinlichkeitsmatrix_Spuelmaschine(hilflauf1+hilflauf2-1,spaltlauf) = Verteilungsfunktion(hilflauf2);
                        Wahrscheinlichkeitsmatrix_Trockner(hilflauf1+hilflauf2-1,spaltlauf) = Verteilungsfunktion(hilflauf2);
                    end
                end
                if hilflauf1 <= 85
                    for hilflauf2 = 1:1:12
                        Wahrscheinlichkeitsmatrix_Waschmaschine(hilflauf1+hilflauf2-1,spaltlauf) = Verteilungsfunktion(hilflauf2);
                        Wahrscheinlichkeitsmatrix_Spuelmaschine(hilflauf1+hilflauf2-1,spaltlauf) = Verteilungsfunktion(hilflauf2);
                        Wahrscheinlichkeitsmatrix_Trockner(hilflauf1+hilflauf2-1,spaltlauf) = Verteilungsfunktion(hilflauf2);
                    end
                end
                if hilflauf1 <= 86
                    for hilflauf2 = 1:1:11
                        Wahrscheinlichkeitsmatrix_Waschmaschine(hilflauf1+hilflauf2-1,spaltlauf) = Verteilungsfunktion(hilflauf2);
                        Wahrscheinlichkeitsmatrix_Spuelmaschine(hilflauf1+hilflauf2-1,spaltlauf) = Verteilungsfunktion(hilflauf2);
                        Wahrscheinlichkeitsmatrix_Trockner(hilflauf1+hilflauf2-1,spaltlauf) = Verteilungsfunktion(hilflauf2);
                    end
                end
                if hilflauf1 == 87
                    for hilflauf2 = 1:1:10
                        Wahrscheinlichkeitsmatrix_Waschmaschine(hilflauf1+hilflauf2-1,spaltlauf) = Verteilungsfunktion(hilflauf2);
                        Wahrscheinlichkeitsmatrix_Spuelmaschine(hilflauf1+hilflauf2-1,spaltlauf) = Verteilungsfunktion(hilflauf2);
                        Wahrscheinlichkeitsmatrix_Trockner(hilflauf1+hilflauf2-1,spaltlauf) = Verteilungsfunktion(hilflauf2);
                    end
                end
                if hilflauf1 == 88
                    for hilflauf2 = 1:1:9
                        Wahrscheinlichkeitsmatrix_Waschmaschine(hilflauf1+hilflauf2-1,spaltlauf) = Verteilungsfunktion(hilflauf2);
                        Wahrscheinlichkeitsmatrix_Spuelmaschine(hilflauf1+hilflauf2-1,spaltlauf) = Verteilungsfunktion(hilflauf2);
                        Wahrscheinlichkeitsmatrix_Trockner(hilflauf1+hilflauf2-1,spaltlauf) = Verteilungsfunktion(hilflauf2);
                    end
                end
                if hilflauf1 == 89
                    for hilflauf2 = 1:1:8
                        Wahrscheinlichkeitsmatrix_Waschmaschine(hilflauf1+hilflauf2-1,spaltlauf) = Verteilungsfunktion(hilflauf2);
                        Wahrscheinlichkeitsmatrix_Spuelmaschine(hilflauf1+hilflauf2-1,spaltlauf) = Verteilungsfunktion(hilflauf2);
                        Wahrscheinlichkeitsmatrix_Trockner(hilflauf1+hilflauf2-1,spaltlauf) = Verteilungsfunktion(hilflauf2);
                    end
                end
                if hilflauf1 == 90
                    for hilflauf2 = 1:1:7
                        Wahrscheinlichkeitsmatrix_Waschmaschine(hilflauf1+hilflauf2-1,spaltlauf) = Verteilungsfunktion(hilflauf2);
                        Wahrscheinlichkeitsmatrix_Spuelmaschine(hilflauf1+hilflauf2-1,spaltlauf) = Verteilungsfunktion(hilflauf2);
                        Wahrscheinlichkeitsmatrix_Trockner(hilflauf1+hilflauf2-1,spaltlauf) = Verteilungsfunktion(hilflauf2);
                    end
                end
                if hilflauf1 == 91
                    for hilflauf2 = 1:1:6
                        Wahrscheinlichkeitsmatrix_Waschmaschine(hilflauf1+hilflauf2-1,spaltlauf) = Verteilungsfunktion(hilflauf2);
                        Wahrscheinlichkeitsmatrix_Spuelmaschine(hilflauf1+hilflauf2-1,spaltlauf) = Verteilungsfunktion(hilflauf2);
                        Wahrscheinlichkeitsmatrix_Trockner(hilflauf1+hilflauf2-1,spaltlauf) = Verteilungsfunktion(hilflauf2);
                    end
                end
                if hilflauf1 == 92
                    for hilflauf2 = 1:1:5
                        Wahrscheinlichkeitsmatrix_Waschmaschine(hilflauf1+hilflauf2-1,spaltlauf) = Verteilungsfunktion(hilflauf2);
                        Wahrscheinlichkeitsmatrix_Spuelmaschine(hilflauf1+hilflauf2-1,spaltlauf) = Verteilungsfunktion(hilflauf2);
                        Wahrscheinlichkeitsmatrix_Trockner(hilflauf1+hilflauf2-1,spaltlauf) = Verteilungsfunktion(hilflauf2);
                    end
                end
                if hilflauf1 == 93
                    for hilflauf2 = 1:1:4
                        Wahrscheinlichkeitsmatrix_Waschmaschine(hilflauf1+hilflauf2-1,spaltlauf) = Verteilungsfunktion(hilflauf2);
                        Wahrscheinlichkeitsmatrix_Spuelmaschine(hilflauf1+hilflauf2-1,spaltlauf) = Verteilungsfunktion(hilflauf2);
                        Wahrscheinlichkeitsmatrix_Trockner(hilflauf1+hilflauf2-1,spaltlauf) = Verteilungsfunktion(hilflauf2);
                    end
                end
                if hilflauf1 == 94
                    for hilflauf2 = 1:1:3
                        Wahrscheinlichkeitsmatrix_Waschmaschine(hilflauf1+hilflauf2-1,spaltlauf) = Verteilungsfunktion(hilflauf2);
                        Wahrscheinlichkeitsmatrix_Spuelmaschine(hilflauf1+hilflauf2-1,spaltlauf) = Verteilungsfunktion(hilflauf2);
                        Wahrscheinlichkeitsmatrix_Trockner(hilflauf1+hilflauf2-1,spaltlauf) = Verteilungsfunktion(hilflauf2);
                    end
                end
                if hilflauf1 == 95
                    for hilflauf2 = 1:1:2
                        Wahrscheinlichkeitsmatrix_Waschmaschine(hilflauf1+hilflauf2-1,spaltlauf) = Verteilungsfunktion(hilflauf2);
                        Wahrscheinlichkeitsmatrix_Spuelmaschine(hilflauf1+hilflauf2-1,spaltlauf) = Verteilungsfunktion(hilflauf2);
                        Wahrscheinlichkeitsmatrix_Trockner(hilflauf1+hilflauf2-1,spaltlauf) = Verteilungsfunktion(hilflauf2);
                    end
                end
                if hilflauf1 == 96
                    Wahrscheinlichkeitsmatrix_Waschmaschine(hilflauf1,spaltlauf) = Verteilungsfunktion(1);
                    Wahrscheinlichkeitsmatrix_Spuelmaschine(hilflauf1,spaltlauf) = Verteilungsfunktion(1);
                    Wahrscheinlichkeitsmatrix_Trockner(hilflauf1,spaltlauf) = Verteilungsfunktion(1);
                end
                ueberpruefung = false;
                ueberpruefung_wasch = false;
                ueberpruefung_spuel = false;
                ueberpruefung_trock = false;
            end
            if Preisfunktion(hilflauf1,spaltlauf) > Durchschnittspreis(1,spaltlauf)
                if ueberpruefung_wasch
                    Wahrscheinlichkeitsmatrix_Waschmaschine(hilflauf1,spaltlauf) = 0;
                end
                if ueberpruefung_spuel
                    Wahrscheinlichkeitsmatrix_Spuelmaschine(hilflauf1,spaltlauf) = 0;
                end
                if ueberpruefung_trock
                    Wahrscheinlichkeitsmatrix_Trockner(hilflauf1,spaltlauf) = 0;
                end
                ueberpruefung = true;
            end
            if Preisfunktion(hilflauf1,spaltlauf) > Durchschnittspreis(1,spaltlauf) && hilflauf1 == Zeitfenster_End - Lastgangdauer_Waschmaschine && ueberpruefung_wasch
                for hilflauf3 = 1:1:15
                    Wahrscheinlichkeitsmatrix_Waschmaschine(hilflauf1+(hilflauf3-8),spaltlauf) = Verteilungsfunktion_Wasch(hilflauf3);
                end
                ueberpruefung_wasch = false;
            end
            if Preisfunktion(hilflauf1,spaltlauf) > Durchschnittspreis(1,spaltlauf) && hilflauf1 == Zeitfenster_End - Lastgangdauer_Spuelmaschine && ueberpruefung_spuel
                for hilflauf3 = 1:1:17
                    Wahrscheinlichkeitsmatrix_Spuelmaschine(hilflauf1+(hilflauf3-9),spaltlauf) = Verteilungsfunktion_Spuel(hilflauf3);
                end
                ueberpruefung_spuel = false;
            end
            if Preisfunktion(hilflauf1,spaltlauf) > Durchschnittspreis(1,spaltlauf) && hilflauf1 == Zeitfenster_End - Lastgangdauer_Trockner && ueberpruefung_trock
                for hilflauf3 = 1:1:13
                    Wahrscheinlichkeitsmatrix_Trockner(hilflauf1+(hilflauf3-7),spaltlauf) = Verteilungsfunktion_Trock(hilflauf3);
                end
                ueberpruefung_trock = false;
            end
            if Zeitfenster == false
                Wahrscheinlichkeitsmatrix_Waschmaschine(hilflauf1,spaltlauf) = 0;
                Wahrscheinlichkeitsmatrix_Spuelmaschine(hilflauf1,spaltlauf) = 0;
                Wahrscheinlichkeitsmatrix_Trockner(hilflauf1,spaltlauf) = 0;
            end
        end
    end
    
    for hilfvar1 = 1:1:12
        Skalierungsvektor_Wasch_Ursprung(hilfvar1,1) = sum(Wahrscheinlichkeitsmatrix_Waschmaschine_Ursprung(:,hilfvar1));
        Skalierungsvektor_Spuel_Ursprung(hilfvar1,1) = sum(Wahrscheinlichkeitsmatrix_Spuelmaschine_Ursprung(:,hilfvar1));
        Skalierungsvektor_Trock_Ursprung(hilfvar1,1) = sum(Wahrscheinlichkeitsmatrix_Trockner_Ursprung(:,hilfvar1));
        Skalierungsvektor_Wasch_Versch(hilfvar1,1) = sum(Wahrscheinlichkeitsmatrix_Waschmaschine(:,hilfvar1));
        Skalierungsvektor_Spuel_Versch(hilfvar1,1) = sum(Wahrscheinlichkeitsmatrix_Spuelmaschine(:,hilfvar1));
        Skalierungsvektor_Trock_Versch(hilfvar1,1) = sum(Wahrscheinlichkeitsmatrix_Trockner(:,hilfvar1));
        Skalierungsvektor_Wasch(hilfvar1,1) = Skalierungsvektor_Wasch_Ursprung(hilfvar1,1) / Skalierungsvektor_Wasch_Versch(hilfvar1,1);
        Skalierungsvektor_Spuel(hilfvar1,1) = Skalierungsvektor_Spuel_Ursprung(hilfvar1,1) / Skalierungsvektor_Spuel_Versch(hilfvar1,1);
        Skalierungsvektor_Trock(hilfvar1,1) = Skalierungsvektor_Trock_Ursprung(hilfvar1,1) / Skalierungsvektor_Trock_Versch(hilfvar1,1);
        Wahrscheinlichkeitsmatrix_Waschmaschine(:,hilfvar1) = Wahrscheinlichkeitsmatrix_Waschmaschine(:,hilfvar1) * Skalierungsvektor_Wasch(hilfvar1,1);
        Wahrscheinlichkeitsmatrix_Spuelmaschine(:,hilfvar1) = Wahrscheinlichkeitsmatrix_Spuelmaschine(:,hilfvar1) * Skalierungsvektor_Spuel(hilfvar1,1);
        Wahrscheinlichkeitsmatrix_Trockner(:,hilfvar1) = Wahrscheinlichkeitsmatrix_Trockner(:,hilfvar1) * Skalierungsvektor_Trock(hilfvar1,1);
    end
    
    xlswrite('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung_Lastverschiebung.xlsm',Wahrscheinlichkeitsmatrix_Waschmaschine,'Waschmaschine','B18');
    xlswrite('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung_Lastverschiebung.xlsm',Wahrscheinlichkeitsmatrix_Spuelmaschine,'Spülmaschine','B18');
    xlswrite('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung_Lastverschiebung.xlsm',Wahrscheinlichkeitsmatrix_Trockner,'Trockner','B18');
    
end

