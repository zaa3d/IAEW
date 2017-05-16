%% Aufgabe 1.5 - Bestimmung der Leitungsbelastung

%%Vorgegebene Definitionen und Initialisierungen
UeberlasteteTrassen = 0;    % Anzahl der �berlasteten Trassen
UeberlastungGesamt = 0;    % Summe der Leistungen �ber der maximalen Belastung


%ToDo: Bestimme die Leitungsbelastung sowie die Verluste der Leitungen aus den berechneten Spannungswerten der Knoten
for Trasse = 1:AnzahlTrassen;
    
    %Hilfsvariablen initialisieren
    Knoten_anf = Anfangsknoten(Trasse);
    Knoten_end = Endknoten(Trasse);
    
    %ToDo: Bestimme den Strom am Anfang und am Ende der Trasse (Tipp: Definition der Stromrichtung ist vom Knoten weg) [p.u.]
    I_anf = %...;
    I_end = %...;
    
    %ToDo: Bestimme die Scheinleistung am Anfang und am Ende der Trasse (Tipp: Benutze daf�r den Strom am Anfang bzw. am Ende der Trasse) [MVA]   
    Scheinleistung_anf = %...;
    Scheinleistung_end = %...;
    
    
    %ToDo: Bestimme die Trassenverluste
    Trassenverluste(Trasse) = %...;
    
    
    %ToDo: Bestimme die Belastung(Leistungsfluss) der Trasse [MVA]
    BelastungTrasse(Trasse) = %...;
    
    
    %ToDo: Bestimme die Belastung(Leistungsfluss) der Leitungen der Trasse [MVA]
    BelastungLeitungen(Trasse) = %...;
    
    
    %ToDo: Bestimme die Auslastung(maximaler Leistungsfluss bezogen auf die maximal zul�ssige Belastung) der einzelnen Leitungen [%]
    AuslastungLeitungen(Trasse) = %...;
    
    
    if(AuslastungLeitungen(Trasse) > 100)
       
        %ToDo: Bestimme wie viele Trassen �berlastet sind [Anzahl]
        UeberlasteteTrassen = %...;
        
        %ToDo: Bestimme um welche Leistung die maximale Belastbarkeit �berschritten wird [MVA]
        UeberlastungGesamt = %...;
		
    end
      
end

%ToDo: Bestimme die gesamten Leitungsverluste des Netzes [MVA]
VerlusteGesamt = %...;

