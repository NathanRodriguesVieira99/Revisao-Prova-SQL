-- Exercicio 01
SELECT tr.nome,
       tr.tipo,
       tr.risco_nivel,
       SUM(vst.visitantes) AS total_visitantes
FROM cartografia.territorios AS tr
         INNER JOIN cartografia.visitas_territorio AS vst ON tr.id = vst.territorio_id
GROUP BY tr.id, vst.id
ORDER BY total_visitantes DESC;

-- Exercicio 02
SELECT tr.tipo,
       SUM(vst.visitantes) AS total_visitantes
FROM cartografia.territorios AS tr
         INNER JOIN cartografia.visitas_territorio AS vst
                    ON tr.id = vst.territorio_id
GROUP BY tr.tipo
ORDER BY total_visitantes DESC;

-- Exercicio 03
SELECT tr.nome,
       SUM(vst.id) AS numero_visitantes,
       vst.data_visita
FROM cartografia.territorios AS tr
         INNER JOIN cartografia.visitas_territorio as vst
                    ON tr.id = vst.territorio_id
WHERE tr.nome = 'Ilha Farol Errante'
GROUP BY tr.nome, vst.data_visita
ORDER BY numero_visitantes DESC
LIMIT 3;

-- Exercicio 04


-- Exercicio 05
SELECT tr.nome,
       tr.tipo
FROM cartografia.territorios AS tr
         LEFT JOIN cartografia.visitas_territorio AS vst
                   ON tr.id = vst.territorio_id
WHERE vst.territorio_id IS NULL;

