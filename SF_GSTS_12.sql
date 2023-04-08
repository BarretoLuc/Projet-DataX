DELIMITER //
CREATE PROCEDURE SF_GSTS_12 (IN age_senior INT(10),mois INT(10)) #55 ans et 6 mois
BEGIN
SELECT AVG(Age_Personne) as Moyenne_age_senior

FROM (SELECT ID_Client, ID_Personne FROM Client) as Client_léger, (SELECT ID_Personne, Age_Personne FROM Personne) as Personne_léger, Recevoir, (SELECT ID_Commande, ID_Voyage FROM Commande) as Commande_léger, (SELECT ID_Voyage FROM Voyage) as Voyage_léger, Comprendre, (SELECT ID_Etape,Date_Heure_Depart FROM Etape) as Etape_léger 

WHERE Client_léger.ID_Personne=Personne_léger.ID_Personne
AND Personne_léger.ID_Personne=Recevoir.ID_Personne
AND Recevoir.ID_Commande=Commande_léger.ID_Commande 
AND Commande_léger.ID_Voyage=Voyage_léger.ID_Voyage 
AND Voyage_léger.ID_Voyage=Comprendre.ID_Voyage 
AND Comprendre.ID_Etape=Etape_léger.ID_Etape 
AND Age_Personne >= age_senior
AND Date_Heure_Depart >= (SELECT DATE_SUB((SELECT NOW()), INTERVAL mois MONTH));
END //
DELIMITER ;