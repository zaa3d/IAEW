%% Skript zum Ausgeben der berechneten Leistungsflussinformationen

disp('Knotenwerte')
Kopfzeile =['  Knoten  |     Spannung      |        Last         |     Erzeugung      '
            '   Nr.    |  Abs        Phi   |    MW       Mvar    |    MW       Mvar   '
            '-------------------------------------------------------------------------'];
disp(Kopfzeile)
for n=1:AnzahlKnoten
     fprintf(' %3g', n), fprintf(' %12.3f', Knotenspannung_Betrag(n)),
     fprintf(' %10.3f', Knotenspannung_Winkel(n)), fprintf(' %10.3f', Last_MW(n)),
     fprintf(' %9.3f', Last_Mvar(n)),  fprintf(' %11.3f', Erzeugung_MW(n)),
     fprintf(' %9.3f\n ', Erzeugung_Mvar(n))
end

fprintf('      \n'), fprintf('Anzahl Iterationen:        '),fprintf(' %9.3f', Iteration)
fprintf('      \n'), fprintf('Maximaler Fehler:          '),fprintf(' %9.3f', MaximalerFehler(Iteration))
fprintf('      \n'), fprintf('Leistungsfluss konvergiert?'),fprintf(' %9.0f', LFkonvergiert)
fprintf('      \n');
