DELIMITER //
CREATE PROCEDURE SF_GSTS_09 (IN mois INT(3)) #3 mois
BEGIN
SELECT max(Nom_Transport) as Nom_Transport, max(`Nombre_d'utilisation`) as `Nombre_d'utilisation_max` 
FROM
(SELECT Nom_Transport, COUNT(Nom_Transport) as `Nombre_d'utilisation` FROM (
      SELECT Nom_Transport, ID_Etape 
      FROM Moyen_de_Transport, (SELECT ID_Transport,ID_Trajet FROM Trajet) as Trajet_léger, (SELECT ID_Trajet, ID_Etape, Date_Heure_Depart FROM Etape) as Etape_léger 
      WHERE Trajet_léger.ID_Transport=Moyen_de_Transport.ID_Transport 
      AND Etape_léger.ID_Trajet=Trajet_léger.ID_Trajet 
      AND Date_Heure_Depart 
      BETWEEN (SELECT DATE_SUB((SELECT NOW()), INTERVAL mois MONTH) ) AND (SELECT NOW() ) 
     ) as Transport_3_mois
GROUP BY Nom_Transport) as Liste_transport_utilise;
END //
DELIMITER ;