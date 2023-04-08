DELIMITER //
CREATE PROCEDURE SF_GSTS_03 ()
BEGIN
SELECT AVG(Montant_Total) as Coût_moyen_des_voyages
FROM (
      SELECT DISTINCT Montant_Total,Nom_Voyage
      FROM (SELECT ID_Voyage,Montant_Total FROM Commande) as coût , Voyage 
      WHERE coût.ID_Voyage=Voyage.ID_Voyage
     ) as coût2 ;
END //
DELIMITER ;
