-- Homework

-- 1
-- How many artworks are on file? 
select count(*)  from Artworks;
-- 157813

-- Next, list how many artworks are under the care of each department along with the name of the department and in alphabetical order by department name.
select Department, count(*) as ArtworkCount 
from Artworks
group by Department
order by Department asc;
-- Architecture & Design	33653
-- Architecture & Design - Image Archive	30
-- Drawings & Prints	80502
-- Film	1024
-- Fluxus Collection	1683
-- Media and Performance	3207
-- Painting & Sculpture	4069
-- Photography	33645

-- 2
-- How many distinct classifications does MoMA use for the artworks in its collection? 
select count(distinct Classification)
from Artworks;
-- 39

-- Next list the classifications in alphabetical order along with how many works in each. 
select Classification, count(*) as ArtworkCount 
from Artworks
where Classification is not null
group by Classification
order by Classification asc;
-- (not assigned)	689
-- Architectural Model	1
-- Architecture	4255
-- Audio	794
-- Collage	36
-- Correspondence	9
-- Design	12239
-- Digital	3
-- Document	2
-- Drawing	14247
-- Ephemera	614
-- Fashion	1
-- Film	150
-- Film (object)	2
-- Frank Lloyd Wright Archive	870
-- Furniture and Interiors	2
-- Graphic Design	5
-- Illustrated Book	27875
-- Installation	908
-- Media	41
-- Mies van der Rohe Archive	16316
-- Moving Image	2
-- Multiple	1182
-- News Clipping	1
-- Notebook	1966
-- Painting	2439
-- Performance	33
-- Periodical	950
-- Photograph	34814
-- Photography Research/Reference	6
-- Poster	91
-- Print	32611
-- Publication	4
-- Sculpture	1791
-- Software	3
-- Textile	34
-- Video	2424
-- Wallpaper	22
-- Work on Paper	381

-- Are there any artworks that have not been classified and how would you check for them?
select count(*)
from Artworks 
where Classification is null or Classification = '' or Classification = '(not assigned)';
-- 689

-- 3
-- List the accession number, title, artist, date [created], date acquired, medium, and department for the first 25 works which were acquired under the Department of Photography.
-- First 25 works acquired in Photography department
select AccessionNumber, Title, Artist, Date, DateAcquired, Medium, Department
from Artworks
where Department = 'Photography'
order by DateAcquired asc
limit 25;
-- 33.1971.1	Midtown	Brett Weston	1945		Gelatin silver print	Photography
-- 33.1971.10	Sutton Place	Brett Weston	1945		Gelatin silver print	Photography
-- 33.1971.11	End of Forty-Second Street	Brett Weston	1945		Gelatin silver print	Photography
-- 33.1971.12	New York	Brett Weston	1945		Gelatin silver print	Photography
-- 33.1971.2	Forty-Seventh St	Brett Weston	1945		Gelatin silver print	Photography
-- 33.1971.3	Brownstone on the Fifties	Brett Weston	1947		Gelatin silver print	Photography
-- 33.1971.4	Church Door, Bowery	Brett Weston	1945		Gelatin silver print	Photography
-- 33.1971.5	Skylight, Midtown	Brett Weston	1947		Gelatin silver print	Photography
-- 33.1971.6	Brooklyn Bridge	Brett Weston	1946		Gelatin silver print	Photography
-- 33.1971.7	Brooklyn Beachcomber	Brett Weston	1945		Gelatin silver print	Photography
-- 33.1971.8	Church, Brooklyn Outskirts	Brett Weston	1945		Gelatin silver print	Photography
-- 33.1971.9	Washington Square	Brett Weston	1945		Gelatin silver print	Photography
-- 41.1974.1	The Street called Straight, Damascus (Frontispiece)	Francis Frith	1858-60		Albumen silver print	Photography
-- 41.1974.10	GAZA (THE OLD TOWN)(Plate 9)	Francis Frith	1858-60		Albumen silver print	Photography
-- 41.1974.11	SAMSON'S GATE, GAZA (Plate 10)	Francis Frith	1858-60		Albumen silver print	Photography
-- 41.1974.12	JERUSALEM, FROM MOUNT SCOPUS (Plate 11)	Francis Frith	1858-60		Albumen silver print	Photography
-- 41.1974.13	JERUSALEM, FROM THE WELL OF EN-ROGEL (Plate 12)	Francis Frith	1858-60		Albumen silver print	Photography
-- 41.1974.14	THE MOSQUE OF AKSA, JERUSALEM (Plate 13)	Francis Frith	1858-60		Albumen silver prints	Photography
-- 41.1974.15	The Valley of Jehoshaphat, Jerusalem (Plate 14)	Francis Frith	1858-60		Albumen silver print	Photography
-- 41.1974.16	THE VILLAGE OF SILOAM AND VALLEY OF KIDRON (Plate 15)	Francis Frith	1858-60		Albumen silver print	Photography
-- 41.1974.17	Jerusalem from The Mount of Olives (Plate 16)	Francis Frith	1858-60		Albumen silver print	Photography
-- 41.1974.18	Entrance of the Church of the Holy Sepulchre, Jerusalem (Plate 17)	Francis Frith	1858-60		Albumen silver print	Photography
-- 41.1974.19	STREET VIEW WITH THE CHURCH OF THE HOLY SEPULCHRE, JERUSALEM (Plate 18)	Francis Frith	1858-60		Albumen silver print	Photography
-- 41.1974.2	MOUNT HOREB, SINAI (Plate 1)	Francis Frith	1858-1860		Albumen silver print	Photography
-- 41.1974.20	CHURCH OF THE ASCENSION, MOUNT OF OLIVES (Plate 19)	Francis Frith	1858-60		Albumen silver print	Photography

-- 4
-- List the accession number, title, artist, date, department and medium for the 20 most recently made artworks by Brazilian artists in the collection. [1 point] 
-- First 25 works acquired in Photography department
-- 20 most recent Brazilian artworks
select AccessionNumber, Title, Artist, Date, Department, Medium
from Artworks
where Nationality like '%Brazilian%'
order by Date desc
limit 20;
-- 382.1980	Untitled	Nair Benedicto	n.d.	Photography	Gelatin silver print
-- 430.1970	Beige Rendezvous	Arthur Luis Piza	n.d.	Drawings & Prints	Intaglio
-- 130.2005	Study for a Baroque Cathedral	Alfredo Volpi	late 1950s	Drawings & Prints	Ink and pencil on paper
-- 137.2016	Frei Egídio chair	Lina Bo Bardi, Marcelo Ferraz, Marcelo Suzuki	c.1986	Architecture & Design	Pine
-- 753.2015	Textile	Roberto Burle Marx	c.1980s	Architecture & Design	Printed cotton
-- 68.2005	Untitled from the series Droguinhas (Little Nothings)	Mira Schendel	c.1964-66	Painting & Sculpture	Japanese paper
-- 363.2014	Contribuir para A Criação da Grande Siderurgia e Tomar Parte Ativa na Emancipação Econômica do Brasil	Monteiro Filho	c.1946	Architecture & Design	Lithograph
-- 360.2022	Untitled (Black Folds III)	Iran do Espirito Santo	c. 2006	Drawings & Prints	Felt tip pen on paper
-- 361.2022	Untitled (Black Folds IX)	Iran do Espirito Santo	c. 2006	Drawings & Prints	Felt tip pen on paper
-- 362.2022	Untitled (Black Folds X)	Iran do Espirito Santo	c. 2006	Drawings & Prints	Felt tip pen on paper
-- 363.2022	Untitled (Black Folds XI)	Iran do Espirito Santo	c. 2006	Drawings & Prints	Felt tip pen on paper
-- 364.2022	Untitled (Black Folds XII)	Iran do Espirito Santo	c. 2006	Drawings & Prints	Felt tip pen on paper
-- 365.2022	Untitled (Black Folds XIII)	Iran do Espirito Santo	c. 2006	Drawings & Prints	Felt tip pen on paper
-- 366.2022	Untitled (Black Folds XIV)	Iran do Espirito Santo	c. 2006	Drawings & Prints	Felt tip pen on paper
-- 367.2022	Untitled (Black Folds XV)	Iran do Espirito Santo	c. 2006	Drawings & Prints	Felt tip pen on paper
-- 591.2016	Caderno de referência no. 70	Hudinilson Jr.	c. 2000	Drawings & Prints	Scrapbook with photocopies and cut-and-pasted printed paper on paper
-- 552.2022	Untitled (America e Cristo)	Rosângela Rennó	c. 1996-98	Photography	Inkjet print
-- 136.2016.1-2	"Giraffe" chair and table	Lina Bo Bardi, Marcelo Ferraz, Marcelo Suzuki	c. 1986	Architecture & Design	Grumichama wood
-- 590.2016.a-j	Untitled	Hudinilson Jr.	c. 1980	Drawings & Prints	Cut-and-pasted photocopy on ten sheets of paper
-- 29.2015.a-I	Sonatina, Four Feet No. 22	Alair Gomes	c. 1977	Photography	Twelve gelatin silver prints

-- Does this query return a reasonable result? If not, what would you need to do differently? (You may describe your actions rather than write SQL queries to repair the table if needed.)  
select AccessionNumber, Title, Artist, Date, Department, Medium
from Artworks
where Nationality like '%Brazilian%'
order by BeginDate desc, EndDate desc
limit 20;

-- 4
-- Select a specific artist whose work(s) at MoMA are of interest to you. 
-- What can you learn about that artist with respect to the MoMA collection overall by writing three SQL queries? 
-- For example, what percentage of the artist’s works are associated with a webpage (and therefore publicly available)?

-- Just found out Leo Villareal is an ITP alumni so going to use him as a starting point.
select COUNT(*)
from Artworks
where Artist like '%Leo Villareal%';
-- 1

-- Analyze when Leo Villareal's works were acquired and what media they use and if it's on veiw
select DateAcquired, Title, Medium, Department, OnView
from Artworks
where Artist like '%Leo Villareal%'
order by DateAcquired desc;
-- 2008-03-12	Field	Light-emitting diodes (LEDs), custom software program, electrical hardware, and diffusion material	Media and Performance	

-- what percentage of the artist’s works are associated with a webpage (and therefore publicly available)?
select COUNT(URL)
from Artworks
where Artist like '%Leo Villareal%';
-- 1

-- 5
-- Write two original queries to learn more about the MoMA collection. In what context would the results be useful?
-- Being from Singapore I just realised I've never actually checked if MOMA has any Singaporean artists in their collection

-- Check if there are any Singaporean artists in the collection
select COUNT(*) as SingaporeanArtistsCount
from Artworks
where Nationality like '%Singapore%' or Nationality like '%Singaporean%';
-- 52

-- List all Singaporean artists in the collection
select distinct Artist, Nationality, count(*) as WorkCount
from Artworks
where Nationality like '%Singapore%' or Nationality like '%Singaporean%'
group by Artist
order by WorkCount desc;
-- Chow and Lin, Stefen Chow, Huiyi Lin	() (Malaysian) (Singaporean)	50
-- Vincent Leow	(Singaporean)	1
-- Ming Wong	(Singaporean)	1


-- Analyze departments that collect Singaporean art
select Department, count(*) as WorkCount
from Artworks
where Nationality like '%Singapore%' or Nationality like '%Singaporean%'
group by Department
order by WorkCount desc;
-- Architecture & Design	50
-- Media and Performance	1
-- Drawings & Prints	1

-- Curious about that Media and Performance piece
-- Get detailed information about the Singaporean work in Media and Performance department
select Title, Artist, Date, Medium, Dimensions, Classification, AccessionNumber, CreditLine, DateAcquired, OnView, URL
from Artworks
where (Nationality like '%Singapore%' or Nationality like '%Singaporean%')
and Department = 'Media and Performance';
-- Windows on the World (Part 2)	Ming Wong	2014	24-channel standard-definition video (color, sound; varying durations), 24 flat screen monitors, MDF, wood, and steel	Overall dimensions approx. 65 x 157 ½ x 30” (165×400×75 cm)	Video	699.2019	Fund for the Twenty-First Century	2019-11-13		https://www.moma.org/collection/works/401152

-- Curious about the 50 pieces in the Architecture and Design department and was wondering if it was part of a series by the artist or just a large collection of the artist's work
select Title, Artist, Date, Medium, Dimensions, Classification, AccessionNumber, CreditLine, DateAcquired, OnView, URL
from Artworks
where (Nationality like '%Singapore%' or Nationality like '%Singaporean%')
and Department = 'Architecture & Design';
-- The Poverty Line (Tomatoes)	Chow and Lin, Stefen Chow, Huiyi Lin	2010-2020	Inkjet print	each: 15 9/16 × 22 13/16" (39.5 × 58 cm)	Design	95.2023.1-24	Gift of the Fund for the Twenty-first Century and Committee on Architecture and Design Funds	2023-05-04
-- The Poverty Line (Eggs)	Chow and Lin, Stefen Chow, Huiyi Lin	2010-2020	Inkjet print	each: 15 9/16 × 22 13/16" (39.5 × 58 cm)	Design	94.2023.1-24	Gift of the Fund for the Twenty-first Century and Committee on Architecture and Design Funds	2023-05-04
-- The Poverty Line (Tomatoes) (Ethiopia)	Chow and Lin, Stefen Chow, Huiyi Lin	2010-2020	Inkjet print	each: 15 9/16 × 22 13/16" (39.5 × 58 cm)	Design	95.2023.1	Gift of the Fund for the Twenty-first Century and Committee on Architecture and Design Funds	2023-05-04
-- The Poverty Line (Tomatoes) (Greece)	Chow and Lin, Stefen Chow, Huiyi Lin	2010-2020	Inkjet print	each: 15 9/16 × 22 13/16" (39.5 × 58 cm)	Design	95.2023.2	Gift of the Fund for the Twenty-first Century and Committee on Architecture and Design Funds	2023-05-04
-- The Poverty Line (Tomatoes) (Mauritius)	Chow and Lin, Stefen Chow, Huiyi Lin	2010-2020	Inkjet print	each: 15 9/16 × 22 13/16" (39.5 × 58 cm)	Design	95.2023.3	Gift of the Fund for the Twenty-first Century and Committee on Architecture and Design Funds	2023-05-04
-- The Poverty Line (Tomatoes) (Spain)	Chow and Lin, Stefen Chow, Huiyi Lin	2010-2020	Inkjet print	each: 15 9/16 × 22 13/16" (39.5 × 58 cm)	Design	95.2023.4	Gift of the Fund for the Twenty-first Century and Committee on Architecture and Design Funds	2023-05-04
-- The Poverty Line (Tomatoes) (Switzerland)	Chow and Lin, Stefen Chow, Huiyi Lin	2010-2020	Inkjet print	each: 15 9/16 × 22 13/16" (39.5 × 58 cm)	Design	95.2023.5	Gift of the Fund for the Twenty-first Century and Committee on Architecture and Design Funds	2023-05-04
-- The Poverty Line (Tomatoes) (Brunei)	Chow and Lin, Stefen Chow, Huiyi Lin	2010-2020	Inkjet print	each: 15 9/16 × 22 13/16" (39.5 × 58 cm)	Design	95.2023.6	Gift of the Fund for the Twenty-first Century and Committee on Architecture and Design Funds	2023-05-04
-- The Poverty Line (Tomatoes) (Cambodia)	Chow and Lin, Stefen Chow, Huiyi Lin	2010-2020	Inkjet print	each: 15 9/16 × 22 13/16" (39.5 × 58 cm)	Design	95.2023.7	Gift of the Fund for the Twenty-first Century and Committee on Architecture and Design Funds	2023-05-04
-- The Poverty Line (Tomatoes) (China)	Chow and Lin, Stefen Chow, Huiyi Lin	2010-2020	Inkjet print	each: 15 9/16 × 22 13/16" (39.5 × 58 cm)	Design	95.2023.8	Gift of the Fund for the Twenty-first Century and Committee on Architecture and Design Funds	2023-05-04
-- The Poverty Line (Tomatoes) (France)	Chow and Lin, Stefen Chow, Huiyi Lin	2010-2020	Inkjet print	each: 15 9/16 × 22 13/16" (39.5 × 58 cm)	Design	95.2023.9	Gift of the Fund for the Twenty-first Century and Committee on Architecture and Design Funds	2023-05-04
-- The Poverty Line (Tomatoes) (Georgia)	Chow and Lin, Stefen Chow, Huiyi Lin	2010-2020	Inkjet print	each: 15 9/16 × 22 13/16" (39.5 × 58 cm)	Design	95.2023.10	Gift of the Fund for the Twenty-first Century and Committee on Architecture and Design Funds	2023-05-04
-- The Poverty Line (Tomatoes) (India)	Chow and Lin, Stefen Chow, Huiyi Lin	2010-2020	Inkjet print	each: 15 9/16 × 22 13/16" (39.5 × 58 cm)	Design	95.2023.11	Gift of the Fund for the Twenty-first Century and Committee on Architecture and Design Funds	2023-05-04
-- The Poverty Line (Tomatoes) (Kenya)	Chow and Lin, Stefen Chow, Huiyi Lin	2010-2020	Inkjet print	each: 15 9/16 × 22 13/16" (39.5 × 58 cm)	Design	95.2023.12	Gift of the Fund for the Twenty-first Century and Committee on Architecture and Design Funds	2023-05-04
-- The Poverty Line (Tomatoes) (Myanmar)	Chow and Lin, Stefen Chow, Huiyi Lin	2010-2020	Inkjet print	each: 15 9/16 × 22 13/16" (39.5 × 58 cm)	Design	95.2023.13	Gift of the Fund for the Twenty-first Century and Committee on Architecture and Design Funds	2023-05-04
-- The Poverty Line (Tomatoes) (Nigeria)	Chow and Lin, Stefen Chow, Huiyi Lin	2010-2020	Inkjet print	each: 15 9/16 × 22 13/16" (39.5 × 58 cm)	Design	95.2023.14	Gift of the Fund for the Twenty-first Century and Committee on Architecture and Design Funds	2023-05-04
-- The Poverty Line (Tomatoes) (Norway)	Chow and Lin, Stefen Chow, Huiyi Lin	2010-2020	Inkjet print	each: 15 9/16 × 22 13/16" (39.5 × 58 cm)	Design	95.2023.15	Gift of the Fund for the Twenty-first Century and Committee on Architecture and Design Funds	2023-05-04
-- The Poverty Line (Tomatoes) (Singapore)	Chow and Lin, Stefen Chow, Huiyi Lin	2010-2020	Inkjet print	each: 15 9/16 × 22 13/16" (39.5 × 58 cm)	Design	95.2023.16	Gift of the Fund for the Twenty-first Century and Committee on Architecture and Design Funds	2023-05-04
-- The Poverty Line (Tomatoes) (South Africa)	Chow and Lin, Stefen Chow, Huiyi Lin	2010-2020	Inkjet print	each: 15 9/16 × 22 13/16" (39.5 × 58 cm)	Design	95.2023.17	Gift of the Fund for the Twenty-first Century and Committee on Architecture and Design Funds	2023-05-04
-- The Poverty Line (Tomatoes) (Turkey)	Chow and Lin, Stefen Chow, Huiyi Lin	2010-2020	Inkjet print	each: 15 9/16 × 22 13/16" (39.5 × 58 cm)	Design	95.2023.18	Gift of the Fund for the Twenty-first Century and Committee on Architecture and Design Funds	2023-05-04
-- The Poverty Line (Tomatoes) (United Arab Emirates)	Chow and Lin, Stefen Chow, Huiyi Lin	2010-2020	Inkjet print	each: 15 9/16 × 22 13/16" (39.5 × 58 cm)	Design	95.2023.19	Gift of the Fund for the Twenty-first Century and Committee on Architecture and Design Funds	2023-05-04
-- The Poverty Line (Tomatoes) (Vietnam)	Chow and Lin, Stefen Chow, Huiyi Lin	2010-2020	Inkjet print	each: 15 9/16 × 22 13/16" (39.5 × 58 cm)	Design	95.2023.20	Gift of the Fund for the Twenty-first Century and Committee on Architecture and Design Funds	2023-05-04
-- The Poverty Line (Tomatoes) (Madagascar)	Chow and Lin, Stefen Chow, Huiyi Lin	2010-2020	Inkjet print	each: 15 9/16 × 22 13/16" (39.5 × 58 cm)	Design	95.2023.21	Gift of the Fund for the Twenty-first Century and Committee on Architecture and Design Funds	2023-05-04
-- The Poverty Line (Tomatoes) (Nepal)	Chow and Lin, Stefen Chow, Huiyi Lin	2010-2020	Inkjet print	each: 15 9/16 × 22 13/16" (39.5 × 58 cm)	Design	95.2023.22	Gift of the Fund for the Twenty-first Century and Committee on Architecture and Design Funds	2023-05-04
-- The Poverty Line (Tomatoes) (United Kingdom)	Chow and Lin, Stefen Chow, Huiyi Lin	2010-2020	Inkjet print	each: 15 9/16 × 22 13/16" (39.5 × 58 cm)	Design	95.2023.23	Gift of the Fund for the Twenty-first Century and Committee on Architecture and Design Funds	2023-05-04
-- The Poverty Line (Eggs) (Denmark)	Chow and Lin, Stefen Chow, Huiyi Lin	2010-2020	Inkjet print	each: 15 9/16 × 22 13/16" (39.5 × 58 cm)	Design	94.2023.1	Gift of the Fund for the Twenty-first Century and Committee on Architecture and Design Funds	2023-05-04
-- The Poverty Line (Eggs) (Brazil)	Chow and Lin, Stefen Chow, Huiyi Lin	2010-2020	Inkjet print	each: 15 9/16 × 22 13/16" (39.5 × 58 cm)	Design	94.2023.2	Gift of the Fund for the Twenty-first Century and Committee on Architecture and Design Funds	2023-05-04
-- The Poverty Line (Eggs) (Ethiopia)	Chow and Lin, Stefen Chow, Huiyi Lin	2010-2020	Inkjet print	each: 15 9/16 × 22 13/16" (39.5 × 58 cm)	Design	94.2023.3	Gift of the Fund for the Twenty-first Century and Committee on Architecture and Design Funds	2023-05-04
-- The Poverty Line (Eggs) (Greece)	Chow and Lin, Stefen Chow, Huiyi Lin	2010-2020	Inkjet print	each: 15 9/16 × 22 13/16" (39.5 × 58 cm)	Design	94.2023.4	Gift of the Fund for the Twenty-first Century and Committee on Architecture and Design Funds	2023-05-04
-- The Poverty Line (Eggs) (Korea)	Chow and Lin, Stefen Chow, Huiyi Lin	2010-2020	Inkjet print	each: 15 9/16 × 22 13/16" (39.5 × 58 cm)	Design	94.2023.5	Gift of the Fund for the Twenty-first Century and Committee on Architecture and Design Funds	2023-05-04
-- The Poverty Line (Eggs) (Spain)	Chow and Lin, Stefen Chow, Huiyi Lin	2010-2020	Inkjet print	each: 15 9/16 × 22 13/16" (39.5 × 58 cm)	Design	94.2023.6	Gift of the Fund for the Twenty-first Century and Committee on Architecture and Design Funds	2023-05-04
-- The Poverty Line (Eggs) (Brunei)	Chow and Lin, Stefen Chow, Huiyi Lin	2010-2020	Inkjet print	each: 15 9/16 × 22 13/16" (39.5 × 58 cm)	Design	94.2023.7	Gift of the Fund for the Twenty-first Century and Committee on Architecture and Design Funds	2023-05-04
-- The Poverty Line (Eggs) (Cambodia)	Chow and Lin, Stefen Chow, Huiyi Lin	2010-2020	Inkjet print	each: 15 9/16 × 22 13/16" (39.5 × 58 cm)	Design	94.2023.8	Gift of the Fund for the Twenty-first Century and Committee on Architecture and Design Funds	2023-05-04
-- The Poverty Line (Eggs) (China)	Chow and Lin, Stefen Chow, Huiyi Lin	2010-2020	Inkjet print	each: 15 9/16 × 22 13/16" (39.5 × 58 cm)	Design	94.2023.9	Gift of the Fund for the Twenty-first Century and Committee on Architecture and Design Funds	2023-05-04
-- The Poverty Line (Eggs) (France)	Chow and Lin, Stefen Chow, Huiyi Lin	2010-2020	Inkjet print	each: 15 9/16 × 22 13/16" (39.5 × 58 cm)	Design	94.2023.10	Gift of the Fund for the Twenty-first Century and Committee on Architecture and Design Funds	2023-05-04
-- The Poverty Line (Eggs) (Georgia)	Chow and Lin, Stefen Chow, Huiyi Lin	2010-2020	Inkjet print	each: 15 9/16 × 22 13/16" (39.5 × 58 cm)	Design	94.2023.11	Gift of the Fund for the Twenty-first Century and Committee on Architecture and Design Funds	2023-05-04
-- The Poverty Line (Eggs) (India)	Chow and Lin, Stefen Chow, Huiyi Lin	2010-2020	Inkjet print	each: 15 9/16 × 22 13/16" (39.5 × 58 cm)	Design	94.2023.12	Gift of the Fund for the Twenty-first Century and Committee on Architecture and Design Funds	2023-05-04
-- The Poverty Line (Eggs) (Kenya)	Chow and Lin, Stefen Chow, Huiyi Lin	2010-2020	Inkjet print	each: 15 9/16 × 22 13/16" (39.5 × 58 cm)	Design	94.2023.13	Gift of the Fund for the Twenty-first Century and Committee on Architecture and Design Funds	2023-05-04
-- The Poverty Line (Eggs) (Laos)	Chow and Lin, Stefen Chow, Huiyi Lin	2010-2020	Inkjet print	each: 15 9/16 × 22 13/16" (39.5 × 58 cm)	Design	94.2023.14	Gift of the Fund for the Twenty-first Century and Committee on Architecture and Design Funds	2023-05-04
-- The Poverty Line (Eggs) (Myanmar)	Chow and Lin, Stefen Chow, Huiyi Lin	2010-2020	Inkjet print	each: 15 9/16 × 22 13/16" (39.5 × 58 cm)	Design	94.2023.15	Gift of the Fund for the Twenty-first Century and Committee on Architecture and Design Funds	2023-05-04
-- The Poverty Line (Eggs) (Nigeria)	Chow and Lin, Stefen Chow, Huiyi Lin	2010-2020	Inkjet print	each: 15 9/16 × 22 13/16" (39.5 × 58 cm)	Design	94.2023.16	Gift of the Fund for the Twenty-first Century and Committee on Architecture and Design Funds	2023-05-04
-- The Poverty Line (Eggs) (Norway)	Chow and Lin, Stefen Chow, Huiyi Lin	2010-2020	Inkjet print	each: 15 9/16 × 22 13/16" (39.5 × 58 cm)	Design	94.2023.17	Gift of the Fund for the Twenty-first Century and Committee on Architecture and Design Funds	2023-05-04
-- The Poverty Line (Eggs) (Singapore)	Chow and Lin, Stefen Chow, Huiyi Lin	2010-2020	Inkjet print	each: 15 9/16 × 22 13/16" (39.5 × 58 cm)	Design	94.2023.18	Gift of the Fund for the Twenty-first Century and Committee on Architecture and Design Funds	2023-05-04
-- The Poverty Line (Eggs) (South Africa)	Chow and Lin, Stefen Chow, Huiyi Lin	2010-2020	Inkjet print	each: 15 9/16 × 22 13/16" (39.5 × 58 cm)	Design	94.2023.19	Gift of the Fund for the Twenty-first Century and Committee on Architecture and Design Funds	2023-05-04
-- The Poverty Line (Eggs) (Turkey)	Chow and Lin, Stefen Chow, Huiyi Lin	2010-2020	Inkjet print	each: 15 9/16 × 22 13/16" (39.5 × 58 cm)	Design	94.2023.20	Gift of the Fund for the Twenty-first Century and Committee on Architecture and Design Funds	2023-05-04
-- The Poverty Line (Eggs) (United Arab Emirates)	Chow and Lin, Stefen Chow, Huiyi Lin	2010-2020	Inkjet print	each: 15 9/16 × 22 13/16" (39.5 × 58 cm)	Design	94.2023.21	Gift of the Fund for the Twenty-first Century and Committee on Architecture and Design Funds	2023-05-04
-- The Poverty Line (Eggs) (Vietnam)	Chow and Lin, Stefen Chow, Huiyi Lin	2010-2020	Inkjet print	each: 15 9/16 × 22 13/16" (39.5 × 58 cm)	Design	94.2023.22	Gift of the Fund for the Twenty-first Century and Committee on Architecture and Design Funds	2023-05-04
-- The Poverty Line (Eggs) (Hong Kong)	Chow and Lin, Stefen Chow, Huiyi Lin	2010-2020	Inkjet print	each: 15 9/16 × 22 13/16" (39.5 × 58 cm)	Design	94.2023.23	Gift of the Fund for the Twenty-first Century and Committee on Architecture and Design Funds	2023-05-04
-- The Poverty Line (Tomatoes) (United States of America)	Chow and Lin, Stefen Chow, Huiyi Lin	2010-2020	Inkjet print	each: 15 9/16 × 22 13/16" (39.5 × 58 cm)	Design	95.2023.24	Gift of the Fund for the Twenty-first Century and Committee on Architecture and Design Funds	2023-05-04
-- The Poverty Line (Eggs) (United States of America)	Chow and Lin, Stefen Chow, Huiyi Lin	2010-2020	Inkjet print	each: 15 9/16 × 22 13/16" (39.5 × 58 cm)	Design	94.2023.24	Gift of the Fund for the Twenty-first Century and Committee on Architecture and Design Funds	2023-05-04
