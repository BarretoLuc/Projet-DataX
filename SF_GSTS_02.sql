SELECT Nom_Ville, count(ID_Client) as Nombre_de_Client
FROM
(SELECT ID_Client, Nom_Ville 
FROM Client, (SELECT ID_Adresse_Personne, ID_Ville FROM Adresse_personne) as Adresse_personne_léger, (SELECT ID_Ville, Nom_Ville FROM Ville) as Ville_léger
WHERE Client.ID_Adresse_habitation=Adresse_personne_léger.ID_Adresse_Personne
AND Adresse_personne_léger.ID_Ville=Ville_léger.ID_Ville) as Ville_Client 
GROUP BY Nom_Ville