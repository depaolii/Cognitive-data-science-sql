-- 1. Listar todos os animais com sua espécie e habitat
SELECT a.nome AS animal, e.nome_especie, e.habitat
FROM animal a
JOIN especie e ON a.especie_id_especie = e.id_especie;

-- 2. Mostrar animais e o setor da jaula onde estão
SELECT a.nome AS animal, j.setor, j.status_limpeza
FROM animal a
JOIN jaula j ON a.jaula_id_jaula = j.id_jaula;

-- 3. Quantidade de animais por espécie
SELECT e.nome_especie, COUNT(a.id_animal) AS total
FROM especie e
LEFT JOIN animal a ON a.especie_id_especie = e.id_especie
GROUP BY e.nome_especie;

-- 4. Mostrar visitantes e zoológicos visitados
SELECT v.nome AS visitante, z.nome_zoo AS zoologico
FROM visitante v
JOIN visitante_zoo vz ON v.id_visitante = vz.visitante_id_visitante
JOIN zoologico z ON vz.zoologico_id_zoo = z.id_zoo;

-- 5. Média das notas de feedback por zoológico
SELECT z.nome_zoo, AVG(f.nota_experiencia) AS media_nota
FROM feedback f
JOIN visitante_zoo vz ON f.visitante_id_visitante = vz.visitante_id_visitante
JOIN zoologico z ON vz.zoologico_id_zoo = z.id_zoo
GROUP BY z.nome_zoo;

-- 6. Jaulas com temperatura abaixo de 0 graus
SELECT setor, temperatura
FROM jaula
WHERE temperatura < 0;

-- 7. Espécies e tipo de alimentação
SELECT nome_especie, alimentacao
FROM especie;

-- 8. Visitantes que deram nota maior que 8 no feedback
SELECT v.nome, f.nota_experiencia, f.comentario
FROM visitante v
JOIN feedback f ON v.id_visitante = f.visitante_id_visitante
WHERE f.nota_experiencia > 8;

-- 9. Totens e o zoológico onde estão instalados
SELECT t.localizacao, z.nome_zoo
FROM totem t
JOIN zoologico z ON t.zoologico_id_zoo = z.id_zoo;

-- 10. Quantidade total de visitantes por zoológico
SELECT z.nome_zoo, COUNT(vz.visitante_id_visitante) AS total_visitantes
FROM zoologico z
JOIN visitante_zoo vz ON z.id_zoo = vz.zoologico_id_zoo
GROUP BY z.nome_zoo;
