SELECT Mode_Paiement FROM 
(
SELECT Mode_Paiement, COUNT(Mode_Paiement) as Paiement_Total
FROM Commande 
WHERE Date_Commande >= (SELECT DATE_SUB((SELECT NOW()), INTERVAL 200 MONTH)) 
GROUP BY Mode_Paiement
) as Liste_Paiement
WHERE Paiement_Total = (

SELECT Max(Paiement_Total) as Nombre_Paiement_Max FROM 
(
SELECT Mode_Paiement, COUNT(Mode_Paiement) as Paiement_Total
FROM Commande 
WHERE Date_Commande >= (SELECT DATE_SUB((SELECT NOW()), INTERVAL 200 MONTH)) 
GROUP BY Mode_Paiement
) as Nombre_Paiement

)
;