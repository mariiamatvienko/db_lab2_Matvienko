CREATE TABLE volcano(
    volc_number INT NOT NULL,
    volc_name CHAR(30) NOT NULL,
	volc_country CHAR(30) NOT NULL
);
CREATE TABLE eruption_types(
    eruption_id INT NOT NULL,
    eruption_type CHAR(30) NOT NULL
);	
	
CREATE TABLE eruption (
    volc_number INT NOT NULL,
	eruption_id INT NOT NULL,
	elevation INT
);

ALTER TABLE volcano 
ADD  PRIMARY KEY (volc_number); 
ALTER TABLE eruption_types 
ADD  PRIMARY KEY (eruption_id); 
ALTER TABLE eruption 
ADD  PRIMARY KEY (volc_number, eruption_id); 

ALTER TABLE volcano
ADD CONSTRAINT FK_volcano_eruption_id FOREIGN KEY (eruption_id) REFERENCES eruption_types (eruption_id);



