%% Aufgabe 1.4 - Aufstellen der Leistungsflussgleichungen

%%Steuervariablen für die Leistungsflussberechnung
Konvergenzgrenze = 0.01;   % Hierbei handelt es sich um einen Grenzwert der die maximal erlaubte Abweichung der berechneten Leistungen von der vorgegebenen Leistung angibt. Ist die Differenz aller Leistungen kleiner als der Grenzwert so ist der LEistungsfluss konvergiert und berechnet
AnzahlIterationen = 500;   % Hierbei handelt es sich um einen Grenzwert für die maximal erlaubte Anzahl an Iterationsschritten. Wird diese Anzahl überschritten, wird die Leistungsflussberechnung abgebrochen.


%%Vorgegebene Definitionen und Initialisierungen
AnzahlKnoten = size(KnotenParameter,1);  % Anzahl Knoten
AnzahlTrassen = size(TrassenParameter,1);  % Anzahl der Trassen
Leistung_Basis = 100;  % Basis der p.u.-Werte der Leistung
LFkonvergiert = 0;    % Boolsche Variable, die ausgeben soll ob die Leistungsflussberechnung erfolgreich war (1 = erfolgreich, 0 = nicht erfolgreich) 


%%Definition und Initialisierung vorgegebener Hilfsvariablen
Iteration = 1;    % Variable zum Hochzählen der Iterationen 
MaximalerFehler = [];    % Vektor, in dem der maximale Fehler(größte Abweichung von P und Q zwischen den Sollwerten und den aufgrund der Spannung berechneten Werte) für die aktuelle Iteration gespeichert wird

Spannung_komplex = zeros(AnzahlKnoten,1) + j*zeros(AnzahlKnoten,1);  %Berechnete komplexe Spannungswerte der aktuellen Iteration
ScheinleistungKnotenAktuell = zeros(AnzahlKnoten,1)+j*zeros(AnzahlKnoten,1);  %Berechnete Scheinleistung für die aktuellen Spannungswerte der aktuellen Iteration

SpannungKnoten = [];  % Matrix, in der die komplexe Spannung jedes Knotens der aktuellen Iterartion gespeichert wird
WirkleistungKnoten = [];  % Vektor mit der vorgegebenen Wirkleistung jedes Knotens
BlindleistungKnoten = [];  % Vektor mit der  vorgegebenen Blindleistungen jedes Knotens
ScheinleistungKnoten = [];  % Vektor mit vorgegebenen Scheinleistungen jedes Knotens


%%Initialisieren der Startlösung und der Hilfsvariablen für die Leistungsflussberechnung
for Knoten=1:AnzahlKnoten

    %Startlösung initialisieren
    Knotenspannung_Betrag(Knoten) = 1.0;
    Knotenspannung_Winkel(Knoten) = 0.0;
    
    %Leistungs-Hilfsvariablen in per-unit initialisieren
    WirkleistungKnoten(Knoten) = (Erzeugung_MW(Knoten)-Last_MW(Knoten))/Leistung_Basis;
    BlindleistungKnoten(Knoten) = (Erzeugung_Mvar(Knoten)-Last_Mvar(Knoten))/Leistung_Basis;
    ScheinleistungKnoten(Knoten) = WirkleistungKnoten(Knoten) + j*BlindleistungKnoten(Knoten);
    
    %Eintragen der Startlösung in die Matrix "SpannungKnoten"
    SpannungKnoten(Knoten,1) = Knotenspannung_Betrag(Knoten)*(cos(Knotenspannung_Winkel(Knoten)) + j*sin(Knotenspannung_Winkel(Knoten)));
 
end


%%Leistungsflussberechnung (Iterative Berechnung der Spannungen nach dem Gauss-Seidel-Algorithmus)
while LFkonvergiert == 0 && Iteration < AnzahlIterationen 
    
    %1.) Bestimmung der aktuellen Knotenleistung für die aktuellen Spannungswerte und Anpassung der Knotenspannungen
    for Knoten=1:AnzahlKnoten
        
        %1.1) Berechnung der aktuellen Knotenleistung für den aktuellen Spannungswert
        
        %ToDo: Bestimme die Summe Yij*Uj_k "Summe_Yij*U" aus Formel 1.5
        Summe_Yij_U = 0+j*0;    %Initialisierung
        Summe1=[];
        Summe1=AMatrix*SpannungKnoten(:,Iteration);
        Summe_Yij_U = Summe1(Knoten);
        %...
        
      
        %ToDo: Berechne die aktuelle Leistung je Knoten aus Lastflussgleichung. Nutze dabei die Hilfsvariable des knojugierten Stroms "I_conj"
        I_conj = conj(Summe_Yij_U); %...;
        
        ScheinleistungKnotenAktuell(Knoten) = Spannung_komplex(Knoten) * I_conj;    %Aktuelle berechnete Leistung je Knoten unter zuhilfenahme von Formel 1.4
        
        
        %ToDo: Berechne die Abweichung der berechneten aktuellen Leistung von der vorgegebenen Leistung jedes Knotens (Tipp: Vorgabe - Berechnete Leistung)
        AbweichungWirkleistung(Knoten,Iteration) = WirkleistungKnoten(Knoten)-real(ScheinleistungKnotenAktuell(Knoten));
        AbweichungBlindleistung(Knoten,Iteration) = BlindleistungKnoten(Knoten)-imag(ScheinleistungKnotenAktuell(Knoten));

        %1.2) Anpassung der Knotenspannungen(Berechnen von U_k+1)
        
        %ToDo: Für PQ-Knoten (Lastknoten) die entsprechenden Knotenparameter (Spannungsbetrag und Spannungswinkel) für den nächsten Iterationsschritt aktualisieren
        if Knotentyp(Knoten) == 0

            Spannung_komplex(Knoten) = (1/AMatrix(Knoten,Knoten))*((WirkleistungKnoten(Knoten)-i*ScheinleistungKnoten(Knoten))/(conj(SpannungKnoten(Knoten,Iteration)))- Summe_Yij_U);
        
        end
            
        
        %ToDo: Für Slack-Knoten die entsprechenden Knotenparameter (Wirkleistung und Blindleistung) für den nächsten Iterationsschritt aktualisieren
        %Tipp: Beim Slack-Knoten sind Spannungsbetrag (=1.0) und Spannungswinkel (=0.0) vorgegeben. Die Berechnung der Wirk- und Blindleistung ist also gefragt
        if Knotentyp(Knoten) == 1
           
           ScheinleistungKnoten(Knoten) = ScheinleistungKnotenAktuell(Knoten);
           WirkleistungKnoten(Knoten) = real(ScheinleistungKnotenAktuell(Knoten));
           BlindleistungKnoten(Knoten) = imag(ScheinleistungKnotenAktuell(Knoten));
           
           AbweichungWirkleistung(Knoten,Iteration) = 0;
           AbweichungBlindleistung(Knoten,Iteration) = 0;
           
           %Festlegen der Spannung am Slack 
           Spannung_komplex(Knoten) = SpannungKnoten(Knoten,1);
           
        end
          
        %ToDo: Für PV-Knoten (spannungsgeregelte Knoten) die entsprechenden Knotenparameter (Spannungswinkel und Blindleistung) für den nächsten Iterationsschritt aktualisieren
        if Knotentyp(Knoten) == 2
           
            BlindleistungKnoten(Knoten) = imag(ScheinleistungKnotenAktuell(Knoten));
            ScheinleistungKnoten(Knoten) =ScheinleistungKnotenAktuell(Knoten);
            
            %Vorrübergehende komplexe Spannung nach Formel 1.5
            Spannung_komplex(Knoten) = (1/AMatrix(Knoten,Knoten))*((WirkleistungKnoten(Knoten)-i*ScheinleistungKnoten(Knoten))/(conj(SpannungKnoten(Knoten,Iteration)))- Summe_Yij_U);

            %Bestimmen des Imagimärteils der Spannung (U_imaginär_k+1)
            Spannung_imag = imag(Spannung_komplex(Knoten));
            
            %Bestimmen des zugehörigen Realteils der Spannung (U_real_k+1) mit Formel 1.6
            Spannung_real = sqrt(abs(Spannung_komplex(Knoten,1))*abs(Spannung_komplex(Knoten,1))-Spannung_imag*Spannung_imag);
            
            %Bestimmung der gesamten komplexen Spannung
            Spannung_komplex(Knoten) = Spannung_real + j*Spannung_imag;
           
        end
        
        %Festlegen der aktualisierten Spannung des Knotens
        SpannungKnoten(Knoten,Iteration+1) = Spannung_komplex(Knoten);
        
    end
        
    %2.) Überprüfen ob Abbruchkriterium erfüllt ist und die Leistungsflussbrechnung erfolgreich war

    MaximalerFehler(Iteration) = max(max(abs(AbweichungWirkleistung(:,Iteration))),max(abs(AbweichungBlindleistung(:,Iteration))));
    
    if MaximalerFehler(Iteration) < Konvergenzgrenze
        LFkonvergiert = 1;  
    end
    
    %3.) Vorbereitung der nächsten Iteration durch das Erhöhen des Iterationsschritts
    Iteration = Iteration+1;
   
end


%%Speichern und Übernehmen der Ergebnisse der Leistungsflussberechnung
for Knoten = 1:AnzahlKnoten

    %ToDo: Übernehme die berechneten Spannungen der Knoten in die Vektoren "Knotenspannung_Betrag" und "Knotenspannung_Winkel"
    Knotenspannung_Betrag(Knoten) = abs(Spannung_komplex(Knoten));
    Knotenspannung_Winkel(Knoten) =angle(Spannung_komplex(Knoten))*180/pi ;    %(Tipp: Speichere den Winkel in Grad° und nicht in Rad)

    %Übernahme der berechneten Leistungen des Slackknoten in die Vektoren "Erzeugung_MW" und "Erzeugung_MVar" 
    if Knotentyp(Knoten) == 1
        
        Erzeugung_MW(Knoten) = WirkleistungKnoten(Knoten)*Leistung_Basis + Last_MW(Knoten);
        Erzeugung_Mvar(Knoten) = BlindleistungKnoten(Knoten)*Leistung_Basis + Last_Mvar(Knoten); 
        
    end
    
    %Übernahme die berechneten Blindleistungen der PV-Knoten in den Vektor "Erzeugung_MVar" 
    if  Knotentyp(Knoten) == 2      
        
        Erzeugung_Mvar(Knoten) = BlindleistungKnoten(Knoten)*Leistung_Basis + Last_Mvar(Knoten);
        
    end
end


%Bestimmen der gesamten Erzeugung und der gesamten Last
ErzeugtPTotal = sum(Erzeugung_MW);  
ErzeugtQTotal = sum(Erzeugung_Mvar); 
VerbrauchPTotal = sum(Last_MW); 
VerbrauchQTotal = sum(Last_Mvar);
