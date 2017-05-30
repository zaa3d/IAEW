%% Aufgabe 1.2 - Modellierung des Last-/Einspeisefalles

%Tipp: Kopiere und benenne das MatLab-Skript entsprechend, um die einzelnen NetznutzungsfÃ¤lle zu parametrieren 

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
                       24,3,0,0,0,0,0,0;
                   %ToDo: Fuelle die Matrix "KnotenParameter" mit den zugehÃ¶rigen Werten
				  ];
  

%ToDo: Lege einzelne Vektoren fÃ¼r jede einzelne Spalte der Matrix KnotenParameter an, indem du die Spalten aus der Matrix extrahierst
Knotenummer =  KnotenParameter(:,1);   %Vektor, der die Knotennummer der Knoten enthÃ¤lt
Knotentyp =   KnotenParameter(:,2);  %Vektor, der den Knotentypen der Knoten enthÃ¤lt
Knotenspannung_Betrag = KnotenParameter(:,3);    %Vektor, der den Betrag der Knotenspannung der Knoten enthÃ¤lt (Tipp: Startwert 1.0)
Knotenspannung_Winkel =   KnotenParameter(:,4);  %Vektor, der den Winkel der Knotenspannung der Knoten enthÃ¤lt (Tipp: Startwert 0.0)
Last_MW =   KnotenParameter(:,5);  %Vektor, der die Wirkleistungslast anliegend an den Knoten enthÃ¤lt
Last_Mvar =  KnotenParameter(:,6);   %Vektor, der die Blindleistungslast anleigend an den Knoten enthÃ¤lt
Erzeugung_MW =   KnotenParameter(:,7);  %Vektor, der die Wirkleistungserzeugung anliegend an den Knoten enthÃ¤lt
Erzeugung_Mvar =  KnotenParameter(:,8);   %Vektor, der die Blindleistungserzeugung anliegend an den Knoten enthÃ¤lt
