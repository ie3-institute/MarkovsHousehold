# Input Legacy Code

## Wahrscheinlichkeit_Einlesen


Eingabeoberflaeche Wahrscheinlichkeit Leistung.xls
- Lastgänge pro Geraeteklasse aus "Synergy Potential of Smart Appliances" (2008)
- stuendliche Einschaltwahrscheinlichkeit: $$p_{ein,1h}$$ je Geraet und Jahreszeit
- Nutzungswahrscheinlichkeit (Tage/Jahr) $$p_{nutz}$$ je Geraet und Jahreszeit

$$\underbrace {\begin{bmatrix} p_{1, spring} & \dots &p_{1,winter}\\ \vdots &\vdots&\vdots \\ p_{96, spring} & \dots &p_{96,winter}\end{bmatrix}}_{\mathbf{M_{Wk}}}= \frac {p_{ein,1h}} {4} \cdot p_{nutz}$$




## Eingabeoberflaeche_Einlesen


Eingabeoberflaeche Haushalte.xls
- Auswahlkriterium: Durchschnittshaushalte, nach Personenanzahl, nach Einkommen, nach Wohntyp
- Anzahl der zu simulierenden Haushalte
- Anzahl der Geräte in Abhängigkeit des Kriteriums


## VariablenDefinieren


- Steuerparameter
- Zeitschritte pro Tag
- Anzahl zu simulierender Tage
