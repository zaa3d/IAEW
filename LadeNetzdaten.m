%% Aufgabe 1.1 - Modellierung des Netzes
                          
%TrassenParameter 
%                   Anfangs- Endknoten Widerstand     Reaktanz /   Maximale   / Invest-     / Anzahl der / Maximale Anzahl der
%                    knoten                                       Belastung    itionskosten    Leitungen     Leitungen

TrassenParameter = [   1        2       0.003    	0.014   	175 	3       1 	3;
                       1        3       0.055    	0.211   	175   	55      1       3;
                       1        5       0.022    	0.085   	175     22      1       3;
                       2        4       0.033    	0.127   	175     33      1       3;
		       2 	6 	0.05	 	0.192	 	175  	50	1	3;
		       3 	9 	0.031	 	0.119		175 	31 	1 	3;
		       3 	24 	0.002 		0.084 		400 	50 	1 	3;
		       4 	9 	0.027 		0.104 		175 	27 	1 	3;
		       5 	10 	0.023 		0.088 		175 	23 	1 	3;
		       6 	10 	0.014 		0.061 		175 	16 	1	3;
		       7 	8 	0.016 		0.061		175 	16 	1 	3;
		       8 	9 	0.043 		0.165 		175 	43 	1 	3;
		       8 	10 	0.043 		0.165 		175 	43 	1 	3;
		       9 	11 	0.002 		0.084 		400 	50 	1 	3;
		       9 	12 	0.002 		0.084 		400 	50 	1 	3;
		       10 	11 	0.002 		0.084 		400 	50 	1 	3;
		       10 	12 	0.002 		0.084 		400 	50 	1 	3;
		       11 	13 	0.006 		0.048 		500 	33 	1 	3;
		       11 	14 	0.005 		0.042 		500 	29 	1 	3;
		       12 	13 	0.006 		0.048 		500 	33	1 	3;
		       12 	23 	0.012 		0.097 		500 	67 	1 	3;
		       13 	23 	0.011		0.087 		500 	60 	1 	3;
		       14 	16 	0.005 		0.059 		500 	27 	1 	3;
		       15 	16 	0.002 		0.017 		500 	12 	1 	3;
		       15 	21 	0.006 		0.049 		500 	34 	2 	3;
		       15 	24 	0.007 		0.052 		500 	36 	1 	3;
		       16 	17 	0.003 		0.026 		500 	18 	1 	3;
		       16 	19 	0.003 		0.023 		500	16 	1 	3;
		       17 	18 	0.002 		0.014 		500 	10	1 	3;
		       17 	22 	0.014 		0.105 		500 	73 	1 	3;
		       18 	21 	0.003 		0.026 		500 	18 	2 	3;
		       19 	20 	0.005 		0.04 		500 	27.5 	2 	3;
		       20 	23 	0.003 		0.022 		500 	15 	2 	3;
		       21 	22 	0.009 		0.068	 	500 	47 	1 	3;
		       1 	8 	0.035 		0.134 		175 	35 	0 	3;
		       2 	8 	0.033 		0.127 		175 	33 	0 	3;
		       6 	7 	0.05 		0.192 		175 	50 	0 	3;
		       13 	14 	0.006 		0.045 		500 	62 	0 	3;
		       14 	23 	0.008 		0.062 		500 	86 	0 	3;
		       16 	23 	0.011 		0.082 		500 	114 	0 	3;
		       19 	23 	0.008 		0.061 		500 	84 	0 	3;%ToDo: Fuelle die Matrix "TrassenParameter" mit den zugehörigen Werten
                   ];
       

%ToDo: Lege einzelne Vektoren für jede einzelne Spalte der Matrix TrassenParameter an, indem du die Spalten aus der Matrix extrahierst
Anfangsknoten =    TrassenParameter(:,1); %Vektor, der den Index des Anfangsknotens der Trassen enthält
Endknoten =  TrassenParameter(:,2);%Vektor, der den Index des Endknotens der Trassen enthält
Widerstand = TrassenParameter(:,3);    %Vektor, der die Widerstände einer Leitung der Trassen enthält
Reaktanz =  TrassenParameter(:,4);   %Vektor, der die Reaktanzen einer Leitung der Trassen enthält
Maximale_Belastung = TrassenParameter(:,5);    %Vektor, der die maximal zulässige Belastungen einer Leitung der Trassen enthält
Investitionskosten = TrassenParameter(:,6);    %Vektor, der die Investitionskosten einer Leitung der Trassen enthält 
Anzahl_Stromkreise = TrassenParameter(:,7);    %Vektor, der die Anzahl der existierenden Stromkreise auf den Trassen enthält 
Maximale_Anzahl_Stromkreise = TrassenParameter(:,8);    %Vektor, der die Anzahl möglicher Stromkreise auf den Trassen enthält 



%% Aufgabe 1.2 - Modellierung des Last-/Einspeisefalles

%Tipp: Kopiere und benenne das MatLab-Skript entsprechend, um die einzelnen Netznutzungsfälle zu parametrieren 

%KnotenParameter
%                  Knoten-       Knoten-           Spannung               Last               Erzeugung    
%                  nummer         typ          Betrag    Winkel        MW     Mvar         MW      Mvar 

KnotenParameter = [    1,2,1,0,150,150*tan(acos(0.98)),720,0;
                       2,2,1,0,300,300*tan(acos(0.98)),765+120,765*tan(acos(0.997));
                       3,0,1,0,180,180*tan(acos(0.98)),0,0;
                       4,0,1,0,75,75*tan(acos(0.98)),0,0;
                       5,0,1,0,70,70*tan(acos(0.98)),0,0;
                       6,0,1,0,125,125*tan(acos(0.98)),0,0;
                       7,2,1,0,250,250*tan(acos(0.98)),940,0;
                       8,0,1,0,170,170*tan(acos(0.98)),0,0;
                       9,0,1,0,175,175*tan(acos(0.98)),0,0;
                       10,0,1,0,200,200*tan(acos(0.98)),0,0;
                       11,0,1,0,0,0,0,0;
                       12,0,1,0,0,0,0,0;
                       13,1,1,0,400,400*tan(acos(0.98)),740+650,0;
                       14,2,1,0,200,200*tan(acos(0.98)),0,0;
                       15,2,1,0,320,320*tan(acos(0.98)),560+780,0;
                       16,2,1,0,250,250*tan(acos(0.98)),825,700*tan(acos(0.977));
                       17,0,1,0,0,0,0,0;
                       18,2,1,0,700,700*tan(acos(0.98)),1700+410,1700*tan(acos(0.946));
                       19,0,1,0,180,180*tan(acos(0.98)),0,0;
                       20,0,1,0,130,130*tan(acos(0.98)),0,0;
                       21,2,1,0,500,500*tan(acos(0.98)),1700,1700*tan(acos(0.965));
                       22,2,1,0,500,500*tan(acos(0.98)),1300,1300*tan(acos(0.995));
                       23,2,1,0,1000,1000*tan(acos(0.98)),2900,2900*tan(acos(0.98));
                       14,3,0,0,0,0,0,0;
                   %ToDo: Fuelle die Matrix "KnotenParameter" mit den zugehörigen Werten
				  ];
  

%ToDo: Lege einzelne Vektoren für jede einzelne Spalte der Matrix KnotenParameter an, indem du die Spalten aus der Matrix extrahierst
Knotenummer =  KnotenParameter(:,1);   %Vektor, der die Knotennummer der Knoten enthält
Knotentyp =   KnotenParameter(:,2);  %Vektor, der den Knotentypen der Knoten enthält
Knotenspannung_Betrag = KnotenParameter(:,3);    %Vektor, der den Betrag der Knotenspannung der Knoten enthält (Tipp: Startwert 1.0)
Knotenspannung_Winkel =   KnotenParameter(:,4);  %Vektor, der den Winkel der Knotenspannung der Knoten enthält (Tipp: Startwert 0.0)
Last_MW =   KnotenParameter(:,5);  %Vektor, der die Wirkleistungslast anliegend an den Knoten enthält
Last_Mvar =  KnotenParameter(:,6);   %Vektor, der die Blindleistungslast anleigend an den Knoten enthält
Erzeugung_MW =   KnotenParameter(:,7);  %Vektor, der die Wirkleistungserzeugung anliegend an den Knoten enthält
Erzeugung_Mvar =  KnotenParameter(:,8);   %Vektor, der die Blindleistungserzeugung anliegend an den Knoten enthält

