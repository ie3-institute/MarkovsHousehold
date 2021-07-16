% MonteCarlo

% !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
% !!!!!!!!!!!!!!Monte Carlo Berechnung durchf�hren!!!!!!!!!!!!!!!!!!!!!!!!!!
% !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

   
V_Monte_neu = zeros(max(size(P)),1);


for var_monte = 1:max(size(P))
    for var_monte2 = 1:V_Monte(var_monte)
        % W�rfeln f�r jedes Ger�t
        Wuerfel = rand(1);
        for var_monte3 = 1:max(size(P))
            if Wuerfel <= sum(P(1:var_monte3,var_monte))
                % Wenn die gew�rfelte Zahl kleiner als die angegebene
                % Wahrscheinlichkeit in P ist, geht das Ger�t in diesen
                % neuen Zustand �ber
               V_Monte_neu(var_monte3) = V_Monte_neu(var_monte3) + 1;
               break
            end
        end
    end
end
V_Monte = V_Monte_neu; % �berschreiben des alten Zustandsvektors

% Monte Carlo Ende