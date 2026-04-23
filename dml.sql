INSERT INTO especie (id_especie, nome_especie, nome_cientifico, alimentacao, habitat)
VALUES (1, 'Tigre-de-Bengala', 'Panthera tigris tigris', 'Carnívoro', 'Floresta Tropical');

INSERT INTO especie (id_especie, nome_especie, nome_cientifico, alimentacao, habitat)
VALUES (2, 'Leão-Africano', 'Panthera leo', 'Carnívoro', 'Savana');

INSERT INTO especie (id_especie, nome_especie, nome_cientifico, alimentacao, habitat)
VALUES (3, 'Pinguim-Imperador', 'Aptenodytes forsteri', 'Piscívoro', 'Regiões Polares');

-- TABELA JAULA
INSERT INTO jaula (id_jaula, temperatura, status_limpeza, setor)
VALUES (1, 28, 'Limpa', 'Setor A');

INSERT INTO jaula (id_jaula, temperatura, status_limpeza, setor)
VALUES (2, -5, 'Manutenção', 'Setor Frio');

INSERT INTO jaula (id_jaula, temperatura, status_limpeza, setor)
VALUES (3, 31, 'Suja', 'Setor B');

-- TABELA ZOOLÓGICO
INSERT INTO zoologico (id_zoo, nome_zoo, cidade_zoo, estado_zoo)
VALUES (1, 'Zoo São Paulo', 'São Paulo', 'SP');

INSERT INTO zoologico (id_zoo, nome_zoo, cidade_zoo, estado_zoo)
VALUES (2, 'Zoo Campinas', 'Campinas', 'SP');

INSERT INTO zoologico (id_zoo, nome_zoo, cidade_zoo, estado_zoo)
VALUES (3, 'Zoo Curitiba', 'Curitiba', 'PR');

-- TABELA ANIMAL
INSERT INTO animal (id_animal, nome, data_nascimento, jaula_id_jaula, especie_id_especie)
VALUES (1, 'Rajah', DATE '2019-03-14', 1, 1);

INSERT INTO animal (id_animal, nome, data_nascimento, jaula_id_jaula, especie_id_especie)
VALUES (2, 'Mufasa', DATE '2018-07-09', 3, 2);

INSERT INTO animal (id_animal, nome, data_nascimento, jaula_id_jaula, especie_id_especie)
VALUES (3, 'Pingo', DATE '2020-01-22', 2, 3);

-- TABELA VISITANTE
INSERT INTO visitante (id_visitante, nome, idade, cidade, estado, data_visita)
VALUES (1, 'Guilherme Silva', '22', 'São Paulo', 'SP', DATE '2025-11-07');

INSERT INTO visitante (id_visitante, nome, idade, cidade, estado, data_visita)
VALUES (2, 'Mariana Lopes', '27', 'Campinas', 'SP', DATE '2025-11-06');

INSERT INTO visitante (id_visitante, nome, idade, cidade, estado, data_visita)
VALUES (3, 'Carlos Mendes', '31', 'Curitiba', 'PR', DATE '2025-11-05');

-- TABELA FEEDBACK
INSERT INTO feedback (id_feedback, nota_experiencia, comentario, visitante_id_visitante)
VALUES (1, 9, 'Totem muito fácil de usar!', 1);

INSERT INTO feedback (id_feedback, nota_experiencia, comentario, visitante_id_visitante)
VALUES (2, 7, 'Poderia ter mais informações sobre os animais.', 2);

INSERT INTO feedback (id_feedback, nota_experiencia, comentario, visitante_id_visitante)
VALUES (3, 10, 'Experiência incrível!', 3);

-- TABELA TOTEM
INSERT INTO totem (id_totem, localizacao, zoologico_id_zoo)
VALUES (1, 'Entrada Principal', 1);

INSERT INTO totem (id_totem, localizacao, zoologico_id_zoo)
VALUES (2, 'Setor dos Felinos', 2);

INSERT INTO totem (id_totem, localizacao, zoologico_id_zoo)
VALUES (3, 'Área dos Pinguins', 3);

-- TABELAS ASSOCIATIVAS
INSERT INTO visitante_zoo (zoologico_id_zoo, visitante_id_visitante)
VALUES (1, 1);

INSERT INTO visitante_zoo (zoologico_id_zoo, visitante_id_visitante)
VALUES (2, 2);

INSERT INTO visitante_zoo (zoologico_id_zoo, visitante_id_visitante)
VALUES (3, 3);

INSERT INTO zoo_jaula (zoologico_id_zoo, jaula_id_jaula)
VALUES (1, 1);

INSERT INTO zoo_jaula (zoologico_id_zoo, jaula_id_jaula)
VALUES (2, 3);

INSERT INTO zoo_jaula (zoologico_id_zoo, jaula_id_jaula)
VALUES (3, 2);

-- UPDATE EXEMPLO
UPDATE jaula
SET status_limpeza = 'Limpa'
WHERE id_jaula = 3;

-- DELETE EXEMPLO
DELETE FROM animal
WHERE nome = 'Mufasa';
