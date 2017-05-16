%% Aufgabe 1.1 - Modellierung des Netzes
                          
%TrassenParameter 
%                   Anfangs-      Endknoten    Widerstand      Reaktanz    Maximale       Investitions-      Anzahl der         Maximale Anzahl der
%                    knoten                     						   Belastung          kosten		 Leitungen		       Leitungen

TrassenParameter = [   1              2            0.003         0.014        175                3               1                    3;
                       1              3            0.055         0.211        175                55              1                    3;
                       1              4            0.022         0.085        175                22              1                    3;
                       2              4            0.033         0.127        175                33              1                    3
                    %ToDo: Fuelle die Matrix "TrassenParameter" mit den zugeh�rigen Werten
                   ];
       

%ToDo: Lege einzelne Vektoren f�r jede einzelne Spalte der Matrix TrassenParameter an, indem du die Spalten aus der Matrix extrahierst
Anfangsknoten =    TrassenParameter(:,1); %Vektor, der den Index des Anfangsknotens der Trassen enth�lt
Endknoten =  TrassenParameter(:,2);%Vektor, der den Index des Endknotens der Trassen enth�lt
Widerstand = TrassenParameter(:,3);    %Vektor, der die Widerst�nde einer Leitung der Trassen enth�lt
Reaktanz =  TrassenParameter(:,4);   %Vektor, der die Reaktanzen einer Leitung der Trassen enth�lt
Maximale_Belastung = TrassenParameter(:,5);    %Vektor, der die maximal zul�ssige Belastungen einer Leitung der Trassen enth�lt
Investitionskosten = TrassenParameter(:,6);    %Vektor, der die Investitionskosten einer Leitung der Trassen enth�lt 
Anzahl_Stromkreise = TrassenParameter(:,7);    %Vektor, der die Anzahl der existierenden Stromkreise auf den Trassen enth�lt 
Maximale_Anzahl_Stromkreise = TrassenParameter(:,8);    %Vektor, der die Anzahl m�glicher Stromkreise auf den Trassen enth�lt 



%% Aufgabe 1.2 - Modellierung des Last-/Einspeisefalles

%Tipp: Kopiere und benenne das MatLab-Skript entsprechend, um die einzelnen Netznutzungsf�lle zu parametrieren 

%KnotenParameter
%                  Knoten-       Knoten-           Spannung               Last               Erzeugung    
%                  nummer         typ          Betrag    Winkel        MW     Mvar         MW      Mvar 

KnotenParameter = [    
                   %ToDo: Fuelle die Matrix "KnotenParameter" mit den zugeh�rigen Werten
				  ];
  

%ToDo: Lege einzelne Vektoren f�r jede einzelne Spalte der Matrix KnotenParameter an, indem du die Spalten aus der Matrix extrahierst
Knotenummer = KnotenParameter(:,1);    %Vektor, der die Knotennummer der Knoten enth�lt
Knotentyp = KnotenParameter(:,2);    %Vektor, der den Knotentypen der Knoten enth�lt
Knotenspannung_Betrag = KnotenParameter(:,3);    %Vektor, der den Betrag der Knotenspannung der Knoten enth�lt (Tipp: Startwert 1.0)
Knotenspannung_Winkel = KnotenParameter(:,4);    %Vektor, der den Winkel der Knotenspannung der Knoten enth�lt (Tipp: Startwert 0.0)
Last_MW = KnotenParameter(:,5);    %Vektor, der die Wirkleistungslast anliegend an den Knoten enth�lt
Last_Mvar = KnotenParameter(:,6);    %Vektor, der die Blindleistungslast anleigend an den Knoten enth�lt
Erzeugung_MW = KnotenParameter(:,7);    %Vektor, der die Wirkleistungserzeugung anliegend an den Knoten enth�lt
Erzeugung_Mvar = KnotenParameter(:,8);    %Vektor, der die Blindleistungserzeugung anliegend an den Knoten enth�lt


