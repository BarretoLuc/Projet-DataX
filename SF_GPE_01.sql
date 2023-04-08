drop procedure if exists SF_GPE_01;

DELIMITER //
CREATE PROCEDURE SF_GPE_01 (IN Nom_Ville_SF VARCHAR (30), Code_Postal_SF INT (10), Disponibilite_Ville_SF BOOL)
BEGIN

INSERT INTO Ville(Nom_Ville,Code_Postal,Disponibilite_Ville) 
SELECT Nom_Ville_SF, Code_Postal_SF, Disponibilite_Ville_SF FROM DUAL
WHERE NOT EXISTS (SELECT * FROM Ville
WHERE Nom_Ville_SF=Nom_Ville AND Code_Postal_SF=Code_Postal) ;
END //
DELIMITER ;
#CALL SF_GPE_01 ('Marseille','13055',0)