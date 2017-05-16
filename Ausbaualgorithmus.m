%% Aufgabe 2.3 - Implementierung des Ausbaualgorithmus

clear all

%%Ausführen der entsprechenden Skripte
LadeNetzdaten
BestimmeAdmittanzmatrix
Leistungsflussberechnung
Leitungsbelastung

%%Überprüfung auf vorhandene Überlastungen
if UeberlastungGesamt <= 0
    
    fprintf('\n Ausbau nicht nötig \n \n')
 
%%Beginne mit dem Ausbaualgorithmus und baue so lange zu bis keine Überlastungen mehr existieren
else
    
    %%Vorgegebene Definitionen und Initialisierungen
    NummerIteration = 0;
    Ausbaukosten = 0;    %Die gesamten Ausbaukosten bis keine Überlastungen mehr im Netz vorhanden sind
    
    %%Durchführen des Ausbaualgorithmus
    while UeberlastungGesamt ~= 0
        
        %Iterationsschritt erhöhen
        NummerIteration = NummerIteration+1;
        
        
        %Vorgegebene Definitionen und Initialisierungen
        Zubau = 0;    %Index der Trasse auf der der Zubau durchgeführt wird
        
        
        %ToDo: Bestimme die EntlastungsSensitivitaet (Netzentlastung/Investitionskosten) jeder Trasse
        for IteratorTrasse = 1:AnzahlTrassen
            
            %...;

        end
        
        
        %ToDo: Baue die effizienteste Trasse aus
        %...;
        Ausbaukosten = %...;
        fprintf ('Leitung von '), fprintf('%6g', Anfangsknoten(Zubau)), fprintf(' nach %9.3g', Endknoten(Zubau)), fprintf(' wird zugebaut   \n')
        
        
        %ToDo: Bestimmen die verbliebenen Überlastungen
        %...;
                
    end
    
end

fprintf('\n\n');
TrassenInformation
