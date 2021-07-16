
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
    
    Preisfunktion = xlsread('Spotvektor_2014.xlsm','Funktion','G2:G35041');
    Wahrscheinlichkeitsvektor_Waschmaschine_Ursprung = xlsread('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung_Jahr.xlsm','Waschmaschine','G2:G35041');
    Wahrscheinlichkeitsvektor_Spuelmaschine_Ursprung = xlsread('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung_Jahr.xlsm','Spülmaschine','G2:G35041');
    Wahrscheinlichkeitsvektor_Trockner_Ursprung = xlsread('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung_Jahr.xlsm','Trockner','G2:G35041');
    
    Wahrscheinlichkeitsvektor_Waschmaschine = Wahrscheinlichkeitsvektor_Waschmaschine_Ursprung * Faktor_Versch;
    Wahrscheinlichkeitsvektor_Spuelmaschine = Wahrscheinlichkeitsvektor_Spuelmaschine_Ursprung * Faktor_Versch;
    Wahrscheinlichkeitsvektor_Trockner = Wahrscheinlichkeitsvektor_Trockner_Ursprung * Faktor_Versch;
    
    for tag = 1:1:365
    Durchschnittspreis = mean(Preisfunktion(tag*96-95:tag*96));
    Maximalwert = max(Preisfunktion(tag*96-95:tag*96));
    Minimalwert = min(Preisfunktion(tag*96-95:tag*96));
    fismat = readfis('Fuzzy_Preisfunktion_variabel');
    if Minimalwert < 0
        fismat.input(2).mf(1).params = [Minimalwert Minimalwert Durchschnittspreis-8 Durchschnittspreis-4];
    else
        fismat.input(2).mf(1).params = [0 0 Durchschnittspreis-8 Durchschnittspreis-4];
    end
    fismat.input(2).mf(2).params = [Durchschnittspreis-8 Durchschnittspreis-4 Durchschnittspreis-3 Durchschnittspreis+1];
    fismat.input(2).mf(3).params = [Durchschnittspreis-0.5 Durchschnittspreis+2 Maximalwert-1 Maximalwert];
    fismat.input(2).mf(4).params = [Durchschnittspreis+2 Maximalwert Maximalwert];
    if Minimalwert < 0
        fismat.input(2).range = [Minimalwert Maximalwert];
    else
        fismat.input(2).range = [0 Maximalwert];
    end
    
    Wahrscheinlichkeitsmatrix_Waschmaschine_Fuzzy(:,1) = Wahrscheinlichkeitsvektor_Waschmaschine((tag*96-95:tag*96),1);
    Wahrscheinlichkeitsmatrix_Waschmaschine_Fuzzy(:,2) = Preisfunktion(tag*96-95:tag*96);
    Wahrscheinlichkeitsmatrix_Spuelmaschine_Fuzzy(:,1) = Wahrscheinlichkeitsvektor_Spuelmaschine((tag*96-95:tag*96),1);
    Wahrscheinlichkeitsmatrix_Spuelmaschine_Fuzzy(:,2) = Preisfunktion(tag*96-95:tag*96);
    Wahrscheinlichkeitsmatrix_Trockner_Fuzzy(:,1) = Wahrscheinlichkeitsvektor_Trockner((tag*96-95:tag*96),1);
    Wahrscheinlichkeitsmatrix_Trockner_Fuzzy(:,2) = Preisfunktion(tag*96-95:tag*96);
        
    Wahrscheinlichkeitsvektor_Waschmaschine((tag*96-95:tag*96),1) = evalfis(Wahrscheinlichkeitsmatrix_Waschmaschine_Fuzzy,fismat);
    Wahrscheinlichkeitsvektor_Spuelmaschine((tag*96-95:tag*96),1) = evalfis(Wahrscheinlichkeitsmatrix_Spuelmaschine_Fuzzy,fismat);
    Wahrscheinlichkeitsvektor_Trockner((tag*96-95:tag*96),1) = evalfis(Wahrscheinlichkeitsmatrix_Trockner_Fuzzy,fismat);
    
    for hilfvar = 1:1:96
        if Wahrscheinlichkeitsvektor_Waschmaschine((tag*96)-96+hilfvar,1) < 0
            Wahrscheinlichkeitsvektor_Waschmaschine((tag*96)-96+hilfvar,1) = 0;
        end
            
        if Wahrscheinlichkeitsvektor_Spuelmaschine((tag*96)-96+hilfvar,1) < 0
            Wahrscheinlichkeitsvektor_Spuelmaschine((tag*96)-96+hilfvar,1) = 0;
        end
            
        if Wahrscheinlichkeitsvektor_Trockner((tag*96)-96+hilfvar,1) < 0
            Wahrscheinlichkeitsvektor_Trockner((tag*96)-96+hilfvar,1) = 0;
        end
    end
    

    Skalierungsfaktor_Wasch = (sum(Wahrscheinlichkeitsvektor_Waschmaschine_Ursprung((tag*96-95:tag*96),1))) / (sum(Wahrscheinlichkeitsvektor_Waschmaschine((tag*96-95:tag*96),1)));
    Skalierungsfaktor_Spuel = (sum(Wahrscheinlichkeitsvektor_Spuelmaschine_Ursprung((tag*96-95:tag*96),1))) / (sum(Wahrscheinlichkeitsvektor_Spuelmaschine((tag*96-95:tag*96),1)));
    Skalierungsfaktor_Trock = (sum(Wahrscheinlichkeitsvektor_Trockner_Ursprung((tag*96-95:tag*96),1))) / (sum(Wahrscheinlichkeitsvektor_Trockner((tag*96-95:tag*96),1)));

    Wahrscheinlichkeitsvektor_Waschmaschine((tag*96-95:tag*96),1) = Wahrscheinlichkeitsvektor_Waschmaschine((tag*96-95:tag*96),1) * Skalierungsfaktor_Wasch * Faktor_Versch;
    Wahrscheinlichkeitsvektor_Spuelmaschine((tag*96-95:tag*96),1) = Wahrscheinlichkeitsvektor_Spuelmaschine((tag*96-95:tag*96),1) * Skalierungsfaktor_Spuel * Faktor_Versch;
    Wahrscheinlichkeitsvektor_Trockner((tag*96-95:tag*96),1) = Wahrscheinlichkeitsvektor_Trockner((tag*96-95:tag*96),1) * Skalierungsfaktor_Trock * Faktor_Versch;
    
    Wahrscheinlichkeitsvektor_Waschmaschine((tag*96-95:tag*96),1) = (Wahrscheinlichkeitsvektor_Waschmaschine_Ursprung((tag*96-95:tag*96),1) * (1 - Faktor_Versch)) + Wahrscheinlichkeitsvektor_Waschmaschine((tag*96-95:tag*96),1);
    Wahrscheinlichkeitsvektor_Spuelmaschine((tag*96-95:tag*96),1) = (Wahrscheinlichkeitsvektor_Spuelmaschine_Ursprung((tag*96-95:tag*96),1) * (1 - Faktor_Versch)) + Wahrscheinlichkeitsvektor_Spuelmaschine((tag*96-95:tag*96),1);
    Wahrscheinlichkeitsvektor_Trockner((tag*96-95:tag*96),1) = (Wahrscheinlichkeitsvektor_Trockner_Ursprung((tag*96-95:tag*96),1) * (1 - Faktor_Versch)) + Wahrscheinlichkeitsvektor_Trockner((tag*96-95:tag*96),1);
    
    end
    
    xlswrite('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung_Lastverschiebung_Jahr.xlsx',Wahrscheinlichkeitsvektor_Waschmaschine,'Waschmaschine','G2');
    xlswrite('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung_Lastverschiebung_Jahr.xlsx',Wahrscheinlichkeitsvektor_Spuelmaschine,'Spülmaschine','G2');
    xlswrite('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung_Lastverschiebung_Jahr.xlsx',Wahrscheinlichkeitsvektor_Trockner,'Trockner','G2');

end

%%
% Starre Lastverschiebung (Durchschnittspreis)

if Wahl == 4
    
    Preisfunktion = xlsread('Spotvektor_2014.xlsm','Funktion','G2:G35041');
    Wahrscheinlichkeitsvektor_Waschmaschine_Ursprung = xlsread('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung_Jahr.xlsm','Waschmaschine','G2:G35041');
    Wahrscheinlichkeitsvektor_Spuelmaschine_Ursprung = xlsread('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung_Jahr.xlsm','Spülmaschine','G2:G35041');
    Wahrscheinlichkeitsvektor_Trockner_Ursprung = xlsread('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung_Jahr.xlsm','Trockner','G2:G35041');
    
    Wahrscheinlichkeitsvektor_Waschmaschine = Wahrscheinlichkeitsvektor_Waschmaschine_Ursprung * Faktor_Versch;
    Wahrscheinlichkeitsvektor_Spuelmaschine = Wahrscheinlichkeitsvektor_Spuelmaschine_Ursprung * Faktor_Versch;
    Wahrscheinlichkeitsvektor_Trockner = Wahrscheinlichkeitsvektor_Trockner_Ursprung * Faktor_Versch;
    Zeitfenster_Start = 1;
    Zeitfenster_End = 96;
    Lastgangdauer_Waschmaschine = length(Lastgang_Waschmaschine);
    Lastgangdauer_Spuelmaschine = length(Lastgang_Spuelmaschine);
    Lastgangdauer_Trockner = length(Lastgang_Trockner);
    
    for tag = 1:1:365
        
        Durchschnittspreis = mean(Preisfunktion(tag*96-95:tag*96));
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

            if Preisfunktion((tag*96)-96+laufvariable1,1) > Durchschnittspreis
                Wahrscheinlichkeitsvektor_Waschmaschine((tag*96)-96+laufvariable1,1) = 0;
                Wahrscheinlichkeitsvektor_Spuelmaschine((tag*96)-96+laufvariable1,1) = 0;
                Wahrscheinlichkeitsvektor_Trockner((tag*96)-96+laufvariable1,1) = 0;
                ueberpruefung = true;
            end
            
            if Preisfunktion((tag*96)-96+laufvariable1,1) <= Durchschnittspreis && ueberpruefung == false
                Wahrscheinlichkeitsvektor_Waschmaschine((tag*96)-96+laufvariable1,1) = 0;
                Wahrscheinlichkeitsvektor_Spuelmaschine((tag*96)-96+laufvariable1,1) = 0;
                Wahrscheinlichkeitsvektor_Trockner((tag*96)-96+laufvariable1,1) = 0;
            end

            if Preisfunktion((tag*96)-96+laufvariable1,1) <= Durchschnittspreis && ueberpruefung && Zeitfenster
                Wahrscheinlichkeitsvektor_Waschmaschine((tag*96)-96+laufvariable1,1) = 1;
                Wahrscheinlichkeitsvektor_Spuelmaschine((tag*96)-96+laufvariable1,1) = 1;
                Wahrscheinlichkeitsvektor_Trockner((tag*96)-96+laufvariable1,1) = 1;
                ueberpruefung = false;
                ueberpruefung_mind_on = true;
            end

            if Preisfunktion((tag*96)-96+laufvariable1,1) > Durchschnittspreis && laufvariable1 == Zeitfenster_End - Lastgangdauer_Waschmaschine && ueberpruefung_wasch && ueberpruefung_mind_on == false
                Wahrscheinlichkeitsvektor_Waschmaschine((tag*96)-96+laufvariable1,1) = 1;
                ueberpruefung_wasch = false;
            end

            if Preisfunktion((tag*96)-96+laufvariable1,1) > Durchschnittspreis && laufvariable1 == Zeitfenster_End - Lastgangdauer_Spuelmaschine && ueberpruefung_spuel && ueberpruefung_mind_on == false
                Wahrscheinlichkeitsvektor_Spuelmaschine((tag*96)-96+laufvariable1,1) = 1;
                ueberpruefung_spuel = false;
            end

            if Preisfunktion((tag*96)-96+laufvariable1,1) > Durchschnittspreis && laufvariable1 == Zeitfenster_End - Lastgangdauer_Trockner && ueberpruefung_trock && ueberpruefung_mind_on == false
                Wahrscheinlichkeitsvektor_Trockner((tag*96)-96+laufvariable1,1) = 1;
                ueberpruefung_trock = false;
            end

            if Zeitfenster == false
                Wahrscheinlichkeitsvektor_Waschmaschine((tag*96)-96+laufvariable1,1) = 0;
                Wahrscheinlichkeitsvektor_Spuelmaschine((tag*96)-96+laufvariable1,1) = 0;
                Wahrscheinlichkeitsvektor_Trockner((tag*96)-96+laufvariable1,1) = 0;
            end

        end

        Skalierungsfaktor_Wasch = (sum(Wahrscheinlichkeitsvektor_Waschmaschine_Ursprung((tag*96-95:tag*96),1))) / (sum(Wahrscheinlichkeitsvektor_Waschmaschine((tag*96-95:tag*96),1)));
        Skalierungsfaktor_Spuel = (sum(Wahrscheinlichkeitsvektor_Spuelmaschine_Ursprung((tag*96-95:tag*96),1))) / (sum(Wahrscheinlichkeitsvektor_Spuelmaschine((tag*96-95:tag*96),1)));
        Skalierungsfaktor_Trock = (sum(Wahrscheinlichkeitsvektor_Trockner_Ursprung((tag*96-95:tag*96),1))) / (sum(Wahrscheinlichkeitsvektor_Trockner((tag*96-95:tag*96),1)));
        
        Wahrscheinlichkeitsvektor_Waschmaschine((tag*96-95:tag*96),1) = Wahrscheinlichkeitsvektor_Waschmaschine((tag*96-95:tag*96),1) * Skalierungsfaktor_Wasch * Faktor_Versch;
        Wahrscheinlichkeitsvektor_Spuelmaschine((tag*96-95:tag*96),1) = Wahrscheinlichkeitsvektor_Spuelmaschine((tag*96-95:tag*96),1) * Skalierungsfaktor_Spuel * Faktor_Versch;
        Wahrscheinlichkeitsvektor_Trockner((tag*96-95:tag*96),1) = Wahrscheinlichkeitsvektor_Trockner((tag*96-95:tag*96),1) * Skalierungsfaktor_Trock * Faktor_Versch;
        
        Wahrscheinlichkeitsvektor_Waschmaschine((tag*96-95:tag*96),1) = (Wahrscheinlichkeitsvektor_Waschmaschine_Ursprung((tag*96-95:tag*96),1) * (1 - Faktor_Versch)) + Wahrscheinlichkeitsvektor_Waschmaschine((tag*96-95:tag*96),1);
        Wahrscheinlichkeitsvektor_Spuelmaschine((tag*96-95:tag*96),1) = (Wahrscheinlichkeitsvektor_Spuelmaschine_Ursprung((tag*96-95:tag*96),1) * (1 - Faktor_Versch)) + Wahrscheinlichkeitsvektor_Spuelmaschine((tag*96-95:tag*96),1);
        Wahrscheinlichkeitsvektor_Trockner((tag*96-95:tag*96),1) = (Wahrscheinlichkeitsvektor_Trockner_Ursprung((tag*96-95:tag*96),1) * (1 - Faktor_Versch)) + Wahrscheinlichkeitsvektor_Trockner((tag*96-95:tag*96),1);
        
    end

    xlswrite('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung_Lastverschiebung_Jahr.xlsx',Wahrscheinlichkeitsvektor_Waschmaschine,'Waschmaschine','G2');
    xlswrite('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung_Lastverschiebung_Jahr.xlsx',Wahrscheinlichkeitsvektor_Spuelmaschine,'Spülmaschine','G2');
    xlswrite('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung_Lastverschiebung_Jahr.xlsx',Wahrscheinlichkeitsvektor_Trockner,'Trockner','G2');
    
end

%%
% Lastverschiebung (Normalverteilung)

if Wahl == 5
    
    Preisfunktion = xlsread('Spotvektor_2014.xlsm','Funktion','G2:G35041');
    Wahrscheinlichkeitsvektor_Waschmaschine_Ursprung = xlsread('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung_Jahr.xlsm','Waschmaschine','G2:G35041');
    Wahrscheinlichkeitsvektor_Spuelmaschine_Ursprung = xlsread('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung_Jahr.xlsm','Spülmaschine','G2:G35041');
    Wahrscheinlichkeitsvektor_Trockner_Ursprung = xlsread('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung_Jahr.xlsm','Trockner','G2:G35041');
    
    Wahrscheinlichkeitsvektor_Waschmaschine = Wahrscheinlichkeitsvektor_Waschmaschine_Ursprung * Faktor_Versch;
    Wahrscheinlichkeitsvektor_Spuelmaschine = Wahrscheinlichkeitsvektor_Spuelmaschine_Ursprung * Faktor_Versch;
    Wahrscheinlichkeitsvektor_Trockner = Wahrscheinlichkeitsvektor_Trockner_Ursprung * Faktor_Versch;
    Verteilungsfunktion = normpdf(-2.8:0.4:2.8);
    Verteilungsfunktion_Wasch = normpdf(-2.8:0.4:2.8);
    Verteilungsfunktion_Spuel = normpdf(-3.2:0.4:3.2);
    Verteilungsfunktion_Trock = normpdf(-2.4:0.4:2.4);
    Zeitfenster_Start = 1;
    Zeitfenster_End = 96;
    Lastgangdauer_Waschmaschine = length(Lastgang_Waschmaschine);
    Lastgangdauer_Spuelmaschine = length(Lastgang_Spuelmaschine);
    Lastgangdauer_Trockner = length(Lastgang_Trockner);
    ueberpruefung_naechstertag = false;
    uebertrag_vortag = 0;
    laenge_verteilungsfunktion = 0;
    
    for tag = 1:1:365
        
        Durchschnittspreis = mean(Preisfunktion(tag*96-95:tag*96));
        ueberpruefung = true;
        ueberpruefung_wasch = true;
        ueberpruefung_spuel = true;
        ueberpruefung_trock = true;
        Zeitfenster = false;
        ueberpruefung_funktion = false;
        
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
            if laufvariable1 == uebertrag_vortag + 1
                ueberpruefung_naechstertag = false;
            end
            if laufvariable1 == laenge_verteilungsfunktion
                ueberpruefung_funktion = false;
            end
            if Preisfunktion((tag*96)-96+laufvariable1,1) <= Durchschnittspreis && ueberpruefung && Zeitfenster && ueberpruefung_naechstertag == false
                for hilflauf1 = 1:1:15
                    Wahrscheinlichkeitsvektor_Waschmaschine((tag*96)-96+laufvariable1+hilflauf1-1,1) = Verteilungsfunktion(hilflauf1);
                    Wahrscheinlichkeitsvektor_Spuelmaschine((tag*96)-96+laufvariable1+hilflauf1-1,1) = Verteilungsfunktion(hilflauf1);
                    Wahrscheinlichkeitsvektor_Trockner((tag*96)-96+laufvariable1+hilflauf1-1,1) = Verteilungsfunktion(hilflauf1);
                end
                if laufvariable1 >= 83
                    ueberpruefung_naechstertag = true;
                    uebertrag_vortag = laufvariable1-97+15;
                end
                laenge_verteilungsfunktion = laufvariable1 + 15;
                ueberpruefung = false;
                ueberpruefung_wasch = false;
                ueberpruefung_spuel = false;
                ueberpruefung_trock = false;
                ueberpruefung_funktion = true;
            end
            if Preisfunktion((tag*96)-96+laufvariable1,1) < Durchschnittspreis && ueberpruefung == false && ueberpruefung_funktion == false
                Wahrscheinlichkeitsvektor_Waschmaschine((tag*96)-96+laufvariable1,1) = 0;
                Wahrscheinlichkeitsvektor_Spuelmaschine((tag*96)-96+laufvariable1,1) = 0;
                Wahrscheinlichkeitsvektor_Trockner((tag*96)-96+laufvariable1,1) = 0;
            end
            if Preisfunktion((tag*96)-96+laufvariable1,1) > Durchschnittspreis && ueberpruefung_funktion == false && ueberpruefung_naechstertag == false
                Wahrscheinlichkeitsvektor_Waschmaschine((tag*96)-96+laufvariable1,1) = 0;
                Wahrscheinlichkeitsvektor_Spuelmaschine((tag*96)-96+laufvariable1,1) = 0;
                Wahrscheinlichkeitsvektor_Trockner((tag*96)-96+laufvariable1,1) = 0;
                ueberpruefung = true;
            end
            if Preisfunktion((tag*96)-96+laufvariable1,1) > Durchschnittspreis && ueberpruefung_naechstertag == false
                if ueberpruefung_wasch
                    Wahrscheinlichkeitsvektor_Waschmaschine((tag*96)-96+laufvariable1,1) = 0;
                end
                if ueberpruefung_spuel
                    Wahrscheinlichkeitsvektor_Spuelmaschine((tag*96)-96+laufvariable1,1) = 0;
                end
                if ueberpruefung_trock
                    Wahrscheinlichkeitsvektor_Trockner((tag*96)-96+laufvariable1,1) = 0;
                end
                ueberpruefung = true;
            end
            if Preisfunktion((tag*96)-96+laufvariable1,1) > Durchschnittspreis && laufvariable1 == Zeitfenster_End - Lastgangdauer_Waschmaschine && ueberpruefung_wasch
                for hilflauf2 = 1:1:15
                    Wahrscheinlichkeitsvektor_Waschmaschine((tag*96)-96+laufvariable1+(hilflauf2-8),1) = Verteilungsfunktion_Wasch(hilflauf2);
                end
                ueberpruefung_wasch = false;
            end
            if Preisfunktion((tag*96)-96+laufvariable1,1) > Durchschnittspreis && laufvariable1 == Zeitfenster_End - Lastgangdauer_Spuelmaschine && ueberpruefung_spuel
                for hilflauf2 = 1:1:17
                    Wahrscheinlichkeitsvektor_Spuelmaschine((tag*96)-96+laufvariable1+(hilflauf2-9),1) = Verteilungsfunktion_Spuel(hilflauf2);
                end
                ueberpruefung_spuel = false;
            end
            if Preisfunktion((tag*96)-96+laufvariable1,1) > Durchschnittspreis && laufvariable1 == Zeitfenster_End - Lastgangdauer_Trockner && ueberpruefung_trock
                for hilflauf2 = 1:1:13
                    Wahrscheinlichkeitsvektor_Trockner((tag*96)-96+laufvariable1+(hilflauf2-7),1) = Verteilungsfunktion_Trock(hilflauf2);
                end
                ueberpruefung_trock = false;
            end
            if tag == 365 && Preisfunktion((tag*96)-96+laufvariable1,1) <= Durchschnittspreis && ueberpruefung && Zeitfenster
                if laufvariable1 >= 83
                    for hilflauf3 = 1:1:97-laufvariable1
                        Wahrscheinlichkeitsvektor_Waschmaschine((tag*96)-96+laufvariable1+hilflauf3-1,1) = Verteilungsfunktion(hilflauf3);
                        Wahrscheinlichkeitsvektor_Spuelmaschine((tag*96)-96+laufvariable1+hilflauf3-1,1) = Verteilungsfunktion(hilflauf3);
                        Wahrscheinlichkeitsvektor_Trockner((tag*96)-96+laufvariable1+hilflauf3-1,1) = Verteilungsfunktion(hilflauf3);
                    end
                    ueberpruefung = false;
                    ueberpruefung_wasch = false;
                    ueberpruefung_spuel = false;
                    ueberpruefung_trock = false;
                end
            end
            if Zeitfenster == false
                Wahrscheinlichkeitsvektor_Waschmaschine((tag*96)-96+laufvariable1,1) = 0;
                Wahrscheinlichkeitsvektor_Spuelmaschine((tag*96)-96+laufvariable1,1) = 0;
                Wahrscheinlichkeitsvektor_Trockner((tag*96)-96+laufvariable1,1) = 0;
            end
        end
        
        Skalierungsfaktor_Wasch = (sum(Wahrscheinlichkeitsvektor_Waschmaschine_Ursprung((tag*96-95:tag*96),1))) / (sum(Wahrscheinlichkeitsvektor_Waschmaschine((tag*96-95:tag*96),1)));
        Skalierungsfaktor_Spuel = (sum(Wahrscheinlichkeitsvektor_Spuelmaschine_Ursprung((tag*96-95:tag*96),1))) / (sum(Wahrscheinlichkeitsvektor_Spuelmaschine((tag*96-95:tag*96),1)));
        Skalierungsfaktor_Trock = (sum(Wahrscheinlichkeitsvektor_Trockner_Ursprung((tag*96-95:tag*96),1))) / (sum(Wahrscheinlichkeitsvektor_Trockner((tag*96-95:tag*96),1)));
        
        Wahrscheinlichkeitsvektor_Waschmaschine((tag*96-95:tag*96),1) = Wahrscheinlichkeitsvektor_Waschmaschine((tag*96-95:tag*96),1) * Skalierungsfaktor_Wasch * Faktor_Versch;
        Wahrscheinlichkeitsvektor_Spuelmaschine((tag*96-95:tag*96),1) = Wahrscheinlichkeitsvektor_Spuelmaschine((tag*96-95:tag*96),1) * Skalierungsfaktor_Spuel * Faktor_Versch;
        Wahrscheinlichkeitsvektor_Trockner((tag*96-95:tag*96),1) = Wahrscheinlichkeitsvektor_Trockner((tag*96-95:tag*96),1) * Skalierungsfaktor_Trock * Faktor_Versch;
        
        Wahrscheinlichkeitsvektor_Waschmaschine((tag*96-95:tag*96),1) = (Wahrscheinlichkeitsvektor_Waschmaschine_Ursprung((tag*96-95:tag*96),1) * (1 - Faktor_Versch)) + Wahrscheinlichkeitsvektor_Waschmaschine((tag*96-95:tag*96),1);
        Wahrscheinlichkeitsvektor_Spuelmaschine((tag*96-95:tag*96),1) = (Wahrscheinlichkeitsvektor_Spuelmaschine_Ursprung((tag*96-95:tag*96),1) * (1 - Faktor_Versch)) + Wahrscheinlichkeitsvektor_Spuelmaschine((tag*96-95:tag*96),1);
        Wahrscheinlichkeitsvektor_Trockner((tag*96-95:tag*96),1) = (Wahrscheinlichkeitsvektor_Trockner_Ursprung((tag*96-95:tag*96),1) * (1 - Faktor_Versch)) + Wahrscheinlichkeitsvektor_Trockner((tag*96-95:tag*96),1);
        
    end
    
    xlswrite('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung_Lastverschiebung_Jahr.xlsx',Wahrscheinlichkeitsvektor_Waschmaschine,'Waschmaschine','G2');
    xlswrite('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung_Lastverschiebung_Jahr.xlsx',Wahrscheinlichkeitsvektor_Spuelmaschine,'Spülmaschine','G2');
    xlswrite('Eingabeoberflaeche_Wahrscheinlichkeit_Leistung_Lastverschiebung_Jahr.xlsx',Wahrscheinlichkeitsvektor_Trockner,'Trockner','G2');
    
end

