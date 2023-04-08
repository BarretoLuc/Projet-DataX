DELIMITER //
CREATE PROCEDURE SF_GSTS_15 ()
BEGIN
SELECT Nom_Personne, Prenom_Personne, Date_Embauche_Employe
FROM Employe, Personne
WHERE Personne.ID_Personne=Employe.ID_Personne
AND Date_Embauche_Employe= (SELECT MIN(Date_Embauche_Employe) FROM Employe);
END //
DELIMITER ;