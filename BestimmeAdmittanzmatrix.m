%% Aufgabe 1.3 - Aufstellen der Admittanzmatrix

%Vorgegebene Definitionen und Initialisierungen
i = sqrt(-1);
AnzahlKnoten = size(KnotenParameter,1);  %Anzahl Knoten
AnzahlTrassen = size(TrassenParameter,1);  %Anzahl Trassen


%ToDo: Initialisiere eine Matrix mit der Gr��e AnzahlKnoten x AnzahlKnoten und Eintr�gen gleich Null 
AMatrix = zeros(AnzahlKnoten, AnzahlKnoten); %Admittanzmatrix

 	 
%ToDo: Bestimme und setze die Nebendiagonalelemente der Admittanzmatrix        
for Trasse = 1:AnzahlTrassen;
    
 AMatrix(Anfangsknoten(Trasse), Endknoten(Trasse)) = -(Widerstand(Trasse) + i*Reaktanz(Trasse));
 AMatrix(Endknoten(Trasse), Anfangsknoten(Trasse)) = -(Widerstand(Trasse) + i*Reaktanz(Trasse));
    
    
end



%ToDo: Bestimme und setze die Hauptdiagonalelemente der Admittanzmatrix
for Trasse = 1:AnzahlTrassen
    AMatrix(Anfangsknoten(Trasse),Anfangsknoten(Trasse)) = AMatrix(Anfangsknoten(Trasse),Anfangsknoten(Trasse)) + Widerstand(Trasse) + i*Reaktanz(Trasse);
    AMatrix(Endknoten(Trasse),Endknoten(Trasse)) = AMatrix(Endknoten(Trasse),Endknoten(Trasse)) + Widerstand(Trasse) + i*Reaktanz(Trasse);
end

clear AnzahlKnoten AnzahlTrassen;  %L�schen der Variablen aus dem Workspace