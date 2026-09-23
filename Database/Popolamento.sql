INSERT INTO ruolo (nome_ruolo) VALUES
    ('Amministratore'),
    ('Gestore'),
    ('Agente'),
    ('Utente')
ON CONFLICT (nome_ruolo) DO NOTHING;


INSERT INTO utente (username_utente, password, id_ruolo, nome, cognome, email) VALUES
    ('alessandrabi', 'agente123', (SELECT id_ruolo FROM ruolo WHERE nome_ruolo = 'Agente'), 'Alessandra', 'Bianchi', 'alessandra.bianchi@email.com'),
    ('giulia.conti', 'user123', (SELECT id_ruolo FROM ruolo WHERE nome_ruolo = 'Utente'), 'Giulia', 'Conti', 'giulia.conti@email.com'),
    ('marco.rossi', 'gestore123', (SELECT id_ruolo FROM ruolo WHERE nome_ruolo = 'Gestore'), 'Marco', 'Rossi', 'marco.rossi@email.com'),
    ('francescomor', 'admin123', (SELECT id_ruolo FROM ruolo WHERE nome_ruolo = 'Amministratore'), 'Francesco', 'Moretti', 'francesco.moretti@email.com'),
    ('martina.neri', 'user456', (SELECT id_ruolo FROM ruolo WHERE nome_ruolo = 'Utente'), 'Martina', 'Neri', 'martina.neri@email.com');


INSERT INTO indirizzo (città, provincia, via, cap) VALUES
    ('Milano', 'MI', 'Via Roma 10', '20121'),
    ('Torino', 'TO', 'Corso Francia 100', '10138'),
    ('Roma', 'RM', 'Via Appia 50', '00183'),
    ('Venezia', 'VE', 'Calle Larga 12', '30124')
ON CONFLICT (città, provincia, via, cap) DO NOTHING;


INSERT INTO filtro_avanzato (tipologia_immobile, stanza, piano, bagno, parcheggio, classe_energetica) VALUES
    ('Appartamento', 3, 2, 2, 'Box privato', 'A'),
    ('Villa', 6, 1, 3, 'Posto auto riservato', 'A'),
    ('Monolocale', 1, 5, 1, 'Posto bici','B'),
    ('Attico', 4, 7, 2, 'Posto auto libero', 'A')
ON CONFLICT DO NOTHING;


INSERT INTO servizio_ulteriore (climatizzatore, balcone, portineria, giardino, ascensore, arredato, id_filtro_avanzato) VALUES
    (TRUE, TRUE, FALSE, FALSE, TRUE, TRUE, 1),
    (TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, 2),
    (FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, 3),
    (TRUE, TRUE, FALSE, TRUE, TRUE, TRUE, 4)
ON CONFLICT DO NOTHING;


INSERT INTO immobile (username_agente, tipo_contratto, tipologia_immobile, titolo, testo, superficie, prezzo, id_indirizzo_immobile, id_filtro_avanzato, id_servizio_ulteriore) VALUES
    ('alessandrabi', 'Vendita', 'Appartamento', 'Splendido trilocale a Milano', 'Luminoso trilocale nel centro di Milano, vicino alla metro.', 85, 350000, 1, 1, 1),
    ('alessandrabi', 'Vendita', 'Villa', 'Villa con piscina a Torino', 'Grande villa con piscina e ampio giardino.', 200, 750000, 2, 2, 2),
    ('alessandrabi', 'Affitto', 'Monolocale', 'Monolocale arredato a Roma', 'Perfetto per studenti o giovani lavoratori.', 35, 800, 3, 3, 3),
    ('alessandrabi', 'Vendita', 'Attico', 'Attico con vista su Venezia', 'Panorama mozzafiato e rifiniture di lusso.', 120, 600000, 4, 4, 4)
ON CONFLICT DO NOTHING;


INSERT INTO foto (id_immobile, percorso_file, ordine) VALUES
    (1, 'foto1_milano.jpg', 1),
    (1, 'foto2_milano.jpg', 2),
    (2, 'foto1_torino.jpg', 1),
    (3, 'foto1_roma.jpg', 1),
    (4, 'foto1_venezia.jpg', 1)
ON CONFLICT DO NOTHING;


INSERT INTO proposta (id_immobile_proposta, vecchio_prezzo, nuovo_prezzo, stato_proposta, data_proposta, ora_proposta, username_utente_proposta) VALUES
    (1, 350000, 340000, 'In attesa', CURRENT_DATE, CURRENT_TIME, 'giulia.conti'),
    (2, 750000, 720000, 'Rifiutata', CURRENT_DATE, CURRENT_TIME, 'giulia.conti'),
    (3, 800, 750, 'Accettata', CURRENT_DATE, CURRENT_TIME, 'giulia.conti'),
    (2, 750000, 730000, 'In attesa', CURRENT_DATE, CURRENT_TIME, 'martina.neri');


INSERT INTO visita (id_immobile, username_utente, data_visita, ora_visita, stato_visita, stato_approvazione_agente, username_agente_approvazione) VALUES
    (1, 'giulia.conti', CURRENT_DATE, '15:00:00', 'In attesa', 'In attesa', 'alessandrabi'),
    (2, 'giulia.conti', CURRENT_DATE, '16:00:00', 'Completata', 'Accettata', 'alessandrabi')
ON CONFLICT DO NOTHING;