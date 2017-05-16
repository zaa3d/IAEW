%% Skript zum Ausgeben der berechneten Trassen- und Leitungsinformationen

disp('Trassenwerte')
Kopfzeile =['  Trasse   |   Leitungen   |   Belastung   |   Verluste   |   Auslastung    '
            '    Nr.    |    Anzahl     |      MVA      |     MW       |      %          '
            '----------------------------------------------------------------------------'];
disp(Kopfzeile)
for Trasse=1:AnzahlTrassen
     fprintf(' %4g', Trasse), fprintf(' %12g', Anzahl_Stromkreise(Trasse)),
     fprintf(' %17.3f', BelastungLeitungen(Trasse)), fprintf(' %13.3f', Trassenverluste(Trasse)),
     fprintf(' %13.3f\n ', AuslastungLeitungen(Trasse))
end
    fprintf('      \n'), fprintf('Netzverluste:            '), fprintf(' %9.3f', VerlusteGesamt)
    fprintf('      \n'), fprintf('Ueberlastete Trassen:    '), fprintf(' %9g', UeberlasteteTrassen), fprintf('\n')