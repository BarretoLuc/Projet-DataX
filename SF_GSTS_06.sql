DELIMITER //
CREATE PROCEDURE SF_GSTS_06 ()
BEGIN
SELECT COUNT(Nom_Voyage) as "Voyage_qui_utilise_l'avion"
FROM Voyage, Comprendre, (SELECT ID_Etape,ID_Trajet FROM Etape) as Etape_léger, (SELECT ID_Trajet,ID_Transport FROM Trajet) as Trajet_léger, Moyen_de_Transport 
WHERE Voyage.ID_Voyage=Comprendre.ID_Voyage 
AND Comprendre.ID_Etape=Etape_léger.ID_Etape 
AND Etape_léger.ID_Trajet=Trajet_léger.ID_Trajet 
AND Trajet_léger.ID_Transport=Moyen_de_Transport.ID_Transport 
AND Nom_transport="Avion";
END //
DELIMITER ;