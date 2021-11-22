INSERT INTO volcano
VALUES (210010, 'West Eifel Volcanic Field','Germany'),
       (210020, 'Chaine des Puys', 'France'),
       (210030, 'Olot Volcanic Field','Spain'),
       (211003, 'Vulsini','Italy'),
       (211020, 'Vesuvius','Italy'),
       (211070, 'Campi Flegrei Mar Sicilia','Italy'),
	   (212020, 'Methana', 'Greece'),
       (211071, 'Pantelleria', 'Italy');

INSERT INTO eruption_types
VALUES (1, 'Maar'),
	   (2, 'Lava dome'),
       (3, 'Pyroclastic cone'),
       (4, 'Caldera'),
	   (5, 'Stratovolcano'),
	   (6, 'Submarine'),
	   (7, 'Shield');

INSERT INTO eruption
VALUES (210010, 1, 600),
       (210020, 2, 1464),
       (210030, 3, 893),
       (211003, 4, 800),
       (211020, 5, 1281),
       (211070, 6,-8),
	   (212020, 1, 760),
       (211071, 7, 836);
	   