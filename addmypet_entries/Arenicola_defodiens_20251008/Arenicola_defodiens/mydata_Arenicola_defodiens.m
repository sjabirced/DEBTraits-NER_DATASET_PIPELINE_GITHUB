function [data, auxData, metaData, txtData, weights] = mydata_Arenicola_defodiens  

%% set metaData

metaData.phylum = 'Annelida' ;
metaData.class = 'Polychaeta' ;
metaData.order = 'Capitellida' ;
metaData.family = 'Arenicolidae' ;
metaData.species = 'Arenicola_defodiens' ;
metaData.species_en = 'Black lug' ;

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN'};
metaData.ecoCode.habitat = {'0iMi', '0iMcb'};
metaData.ecoCode.embryo  = {'Mt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPp', 'bjD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ah'; 'aj'; 'am'; 'L0'; 'Lh'; 'Lp'; 'Li'; 'Ww0';'Wwi'}; 
metaData.data_1     = {'L-Ww'; 'L-R'; 'JO-Ww_T'};

metaData.COMPLETE = 2; % using criteria of LikaKear2011

metaData.author   = {'Lola DeCubber'};            
metaData.date_subm = [2025 10 07];                       
metaData.email    = {'lola.decubber@gmail.com'};             
metaData.address  = {'UMR LOG/univ-Lille, 62930, France'};   

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2025 10 08]; 

%% set data
% zero-variate data;

data.ah = 3 ; units.ah = 'd' ; label.ah = 'age at hatch' ; bibkey.ah = 'DeCuLefe2023' ;
  temp.ah = C2K(13) ; units.temp.ah = 'K' ; label.temp.ah = 'temperature' ; 
  comment.ah = 'hatch of trochophora larva'; 
data.aj = 90 ;  units.aj = 'd'; label.aj = 'age at metamorphosis'; bibkey.aj = 'FarkBerg1979';
  temp.aj = C2K(12);  units.temp.aj = 'K'; label.temp.aj = 'temperature';
  comment.aj = 'temperature varying between 16 to 8C; larvae start their second migration: extension of the proboscis';
data.am = 2190; units.am = 'd' ; label.am = 'life span' ; bibkey.am = 'guess';
  temp.am = C2K(11) ; units.temp.am = 'K' ; label.temp.am = 'temperature'; 
  comment.am = 'based on Arenicola_marina';
  
data.L0 = 0.015 ; units.L0 = 'cm' ;  label.L0 = 'Egg diameter' ; bibkey.L0 = {'DeCu2025','WatsCadm1998'} ; 
data.Lh  = 0.014; units.Lh  = 'cm';  label.Lh  = 'total length at hach';    bibkey.Lh  = 'DeCu2025';  

data.Lp = 1.5 ;  units.Lp = 'cm';  label.Lp = 'trunc Length at puberty' ;bibkey.Lp = 'FarkBerg1979' ; 
data.Li = 25.2;  units.Li = 'cm';  label.Li = 'maximum trunc length';    bibkey.Li  = 'DeCu2025';
  comment.Li = 'guessed, must be longer';

data.Ww0 = 1.8e-6; units.Ww0 = 'g'; label.Ww0 = 'wet weight at fertilization';  bibkey.Ww0 = 'guess';
data.Wwi = 60.1;   units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';          bibkey.Wwi = 'DeCuLefe2023';

% uni-variate data

% length-weight
data.LW = [... % utilisation des donnes de spop juillet 2018
%trunk length (cm)vs wet weight (g)
13.4   15.6; 14.1   29;   10.5	 15.8; 14.5   21.1; 12.2   19.5; 18.2	35;
14.7   18.1; 19.7	31.6; 18.4   31.5; 23.9   44.8; 6.5	   2.6;  15.3	17;
13.2   14.2; 19.4	29;   6.7    2.8;  6	  2.3;  9.6	   6.5;  12.5	13.7;
19.2   27.2; 22	    41.2; 18.5   31.4; 25.2   28.9; 12.4   55.5; 18	    38.7;
17.4   36.7; 20.2	36.3; 23.4   35.9; 20.3   31.4; 18.4   38.6; 19  	38;
17.6   31.2; 17.8	32.5; 14.3   30.1; 15.5   33.4; 18.4   60.1; 21.8	38.6;
15.3   14.6; 14.4	15.9; 12.4   11.1; 12.9   11.6; 17.1   25.6; 18.5	15.6;
12	   12.4; 10.3	11.7; 14.1   15.2; 15.6   13;   11.2   6.8;  13.4	16.5;
15.5   16.2; 24.4	23.1; 13.4   7.3;  14.8   19.6; 12.6   16.1; 10.8	7.4;
11.9   12;   15.8	13.6; 18.4   14.7; 12.4   9.6;  11.4   6.4;  13.2	13.8;
16	   20.9; 15.8	40;   13.5   15.7; 19.8   35.4; 19.2   32.8; 19.6	37.3;
14.2   18;   16.6	20.6; 17	 46.3; 21.2   27.8; 19	   31.5; 11.3	8.3;
19.3   22;   13.5   21.3; 20.6	 18.8; 15.5   25;   15.5   20.2; 15.7	20.3;
17.4   21.8; 15.8	17.4; 15.8	 20.6; 13.7   9.2;  17.5   12.2; 16.4	16.8;
13.7   12.2; 16.5	19;   13.8	 9.7;  14	  13.1; 16.1   14.6; 15.5	17.1;
15.9   14.6; 19.8	14.3; 14.9	 14.3; 5.5	  4.4;  13	   16.1; 11.7	11.6;
13.2   6.7;  13.6	9.8;  10	 13.6; 9.5	  11.5; 10.7   10.4; 9.5	10;
16.8   31.3; 11.6	21.9; 9.5	 12.8; 16	  21.9; 24.5   22.6; 13.5	17;
16	   18.2; 17.5	31;   14.7   18.1; 13	  13.1; 11.5   18.1; 6.5	3.25;
11.7   10.37;7.4	5.55; 6.4	 4.58; 5.2	  4.21; 12.5   22.05;10.8	13.31;
10.2   9.55; 11.6	11.84;12.4   14.39;15.5   23.15;9.8	   12.85;9.6	15.58;
13.5   19.31;10.5	15.87;12.3	 12.21;13	  26.73;14.9   29.71;11.6	20.82;
9.1	   7.89; 16.8	33.83;10.9	 13.33;10.7   11.81;17.3   14.29;10.2	7.59;
10.4   9.41; 9.9	7.59; 9.4	 11.97;7.7	  6.84; 13.7   13.83;11	    13.53;
11.2   12.04;10.8   10.1; 7.8	 6.6;  9.8	  10.3; 12.5   12.05;11.2	14.06;
11.5   11.31;7.2	3.4;  5.8	 3.31; 6.4	  4.3;  5.4	   2.25; 6.2	3.09;
7.5	   3.71; 5.2	1.51; 6.5	 2.91; 5.8	  2.69; 6.7	   2.51; 6	    2.79;
5.2	   2.44; 7.2	3.03; 5.8	 2.05; 5.9	  2.97; 6.3	   3.72; 6	    3.27;
6.5	   2.28; 4.3	1.19; 5.5	 1.4;  5.5	  2.44; 6.9	   5.65; 6.5	3.33;
6.2	   5.08; 5.6	1.93; 6.1	 2.98; 7.2	  4.23; 7	   4.64; 5.8	3.13;
4.9	   1.79; 6.8	3.6;  4.5	 1.2;  6.8	  4.43; 6.5	   3.65; 7.7	6.76;
4.8	   1.69; 3.9	0.98; 4.8	 2.97; 5.7	  2.84; 5.5	   3.44; 7.2	5.96;
5.7	   2.78; 6.2	3.17; 5.2	 1.9;  5.6	  3.35; 5.3	   3.92; 4.9	3.28;
5.8	   3.04; 4.8	3;    5.4	 2.95; 6.7	  5.6;  6.9	   4.35; 6.4	4.52;
6	   3.06; 5.4	2.44; 9.4	 6.45; 7.8	  5.08; 6.3	   3.42; 5.7	2.31;
8.2	   4.87; 7.6	4.31; 3.7	 0.67; 4.7	  1.23; 4.4	   0.8;  4.4	0.99;
5.9	   1.86; 5	    1.89; 4.6	 1.56; 5.4	  1.99; 4.9	   2.23; 5.8	2.66;
4.4    1.87; 4.6	0.99; 4.3	 2.39; 3.5	  0.92; 3.6	   0.79; 3.7	0.9;
3.8	   1.6;  5.1	1.82; 3	     0.61; 3.8	  0.88; 3.2	   0.4;  4.8	1.63;
3.9	   1.12; 2.9	0.57; 3.3	 0.77; 4.8	  1.47; 3.6	   0.8;  3.3	0.56;
3.8	   1.05; 4.7	1.42; 3.3	 0.65; 3.9	  1.31; 4.8	   0.87; 3.4	0.72;
3.2	   0.54; 3.6	0.59; 2.7	 0.19; 4.3	  1.31; 4.1	   0.74; 4.8	1.52;
4	   1.3;  3.6	0.72; 4.3	 1.26; 4.9	  1.07; 4.6	   1.26; 4.4	1.23;
4.8	   1.22; 4.5	1.17; 3.7	 0.54; 3.7	  1.04; 4.2	   0.79; 4.8	1.04;
5.2	   1.53; 4.7	2.01; 3.6	 0.51; 2.2	  0.14; 4	   1.28; 4.3	1.04;
4.2	   1.25; 4.6	1.72; 4.8	 1.7;  2.4	  0.23; 4.3	   1.29; 4.7	1.34;
3.6	   0.53; 5.1	1.22; 3.4	 0.41; 4.3	  1.07; 4.3	   0.87; 4.8	1.53;
3.8	   0.47; 3.4	0.33; 3	     0.47; 3.5	  0.71; 3.4	   0.82; 4.6	1.27;
2.2	   0.285;2.7	0.486;2.3	 0.297;2.3	  0.561;1.6    0.142;2.1	0.334;
2.2	   0.326;2.2	0.537;2	     0.267;1.8	  0.335;1.9	   0.349;1.9	0.357;
2	   0.287;1.5	0.178;2.9	 0.541;1.9	  0.214;2.3    0.32; 1.6	0.28;
2.2	   0.545;2.3	0.402;1.6	 0.257;2.2	  0.428;2	   0.273;1.7	0.221;
1.4	   0.1;  1.7	0.194;1.5	 0.219;1.2	  0.096;2.3	   0.519;1.9	0.245;
2	   0.242;1.2	0.141;1.6	 0.234;2.2	  0.524;1.7	   0.235;2.6	0.741;
2	   0.326;2.4	0.43; 1.8	 0.203;2	  0.335;2.1	   0.286;2	    0.328;
2.3	   0.33; 2.6	0.533;2.2	 0.363;1.8	  0.246;1.7	   0.278;2	    0.182;
2.5	   0.308;2	    0.228;1.4    0.128;2.1	  0.356;2	   0.158;4	    1.016;
2.8	   0.575;2.8	0.68; 2.8	 0.369;2	  0.354;1.9	   0.252;1.8	0.195;
2	   0.32; 2	    0.43; 1.9	 0.21; 1.8	  0.274;2.2	   0.549;1.8	0.228;
1.8	   0.186;1.7	0.176;1.9	 0.152;2.4	  0.322;1.7	   0.146;2.6	0.423;
2.3	   0.356;2.3	0.396;3.5	 1.185;2.4	  0.434;1.6	   0.127;2.4	0.386;
2.6	   0.4;  2.2	0.394;2.2	 0.307;2.3	  0.439];
units.LW = {'cm', 'g'};  label.LW = {'trunk length', 'wet weight'}; bibkey.LW = 'DeCuLefe2023';

% trunk length-total numer of eggs per year
data.LR = [12.5	4038461.53846154;
10.2	1188461.53846154;
 9.8	1100000;
10.5	284615.384615385;
11.6	2100000;
14.9	4800000];
data.LR(:,2) = data.LR(:,2)/365;
temp.LR= C2K(13); units.LR = {'cm', '#/d'};  label.LR = {'trunk length', 'reproduction rate'}; 
units.temp.LR = {'K'}; label.temp.LR= {'Temperature'};bibkey.LR = 'DeCuLefe2023';

% wet weight-oxygen consumption
data.WJO_10=[ ...
       4.0	8.73;  6.0  8.52;  6.3  9.71;  6.8  5.66;  6.9 11.48;  7.4 21.18; 
       8.1 19.08;  9.0 21.63;  9.4 17.88; 10.1 15.11; 10.8 10.07; 11.0 28.22;
      11.3 17.75; 11.8 28.42; 12.4 25.16; 12.7 18.92; 14.8 15.27; 19.1 17.62];
temp.WJO_10= C2K(10) ; units.WJO_10 = {'g', 'mumol O2/h'};  label.WJO_10 = {'wet weight', 'O2 consumption rate', '10 C'}; 
units.temp.WJO_10 = {'K'}; label.temp.WJO_10= {'Temperature'}; bibkey.WJO_10 = 'DeCuLefe2023';
comment.WJO_10 = 'Data for salitiny 35 promille; Lugworms collected at Wimereux (France) in May, June and July (Rise of the water temperatures)';
% 
data.WJO_13 = [23.6   34.91;
    29.8    30.07;10.3  17.61;7.7	 16.58;17.1  9.26;
       27.9   19.42;11.41	8.11; 22.1  34.25;8.4	 25.76;8.8   22.17;
       8.1    17.57;6.8	    19.98;8.3	14.70;8.5	 8.81; 4.7	 11.24;
       5.9    15.74;5.7     16.86;7.4   32.30;6.2	 15.80;5.5   19.34;
       6.5    19.11;6.3	    13.78;5.3   15.20;17.2   27.64;20.1   23.07;
       24.6   28.27;25.5	31.97;8.2   10.59;12.1	 27.69;12.0  11.12;
       10.8   18.47;11.42	40.98;8.9   11.57;11.4	 2.28; 7.8   2.04;
       7.3    36.55;6.9	    2.04; 9.2   10.06;4.71	 9.28; 3.6	 11.08;
       7.9    9.67; 4.3	    36.21;6.0   8.26; 5.0	 15.55;10.5  31.05;
       3.3    32.29];
temp.WJO_13= C2K(13) ;units.WJO_13 = {'g', 'mumol O2/h'};  label.WJO_13 = {'wet weight', 'O2 consumption rate', '13 C'}; 
units.temp.WJO_13 = {'K'}; label.temp.WJO_13= {'Temperature'};bibkey.WJO_13 = 'DeCuLefe2023';
comment.WJO_13 = 'Data for salitiny 35 promille';
% 
data.WJO_16 = [11.6   29.80;10.52	25.27;7.0	 21.72;11.4  41.16;14.7	 42.82;
       10.3   17.82;11.5	20.00;11.61  18.91;9.21  12.43;8.5	 11.79;
       8.31   11.47;6.31    9.30; 9.8	 10.67;6.9   8.02; 5.5	 7.38;
       8.32   13.63;6.91    10.52;14.0   31.87;8.3   19.19;7.3	 11.86;
       8.51   37.65;12.7	38.78;9.5	 11.04;7.7   5.05; 7.63  9.28;
       10.51  25.12;7.61    16.57;4.1	 8.38; 9.2   21.58;9.9	 14.63;
       8.21   18.55;10.6	27.39;15.2   31.17;9.3   27.12;12.1  47.38;
       11.2   30.03;7.62    28.81;7.91   37.93;10.7  32.80;8.0	 34.86;
       7.31   29.66;10.5	32.89;8.7    33.93;8.2   24.34;6.3	 35.61;
       8.9	  31.68;5.9  	35.14;7.6	 13.85;9.0   34.88;7.9	 44.73];
temp.WJO_16 = C2K(16); units.WJO_16 = {'g', 'mumol O2/h'};  label.WJO_16 = {'wet weight', 'O2 consumption rate', '16 C'}; 
units.temp.WJO_16 = {'K'}; label.temp.WJO_16= {'Temperature'}; bibkey.WJO_16 = 'DeCuLefe2023';
comment.WJO_16 = 'Data for salitiny 35 promille';
% 
data.WJO_20 = [13.1	26.51;15.8    35.80;6.81    13.80;8.34	16.93;11.4   9.81;
         10.21	24.98;16.5    25.45;4.1	    8.42; 7.0	17.24;7.31    16.67;
         8.51	25.07;7.42	  16.13;8.31    20.99;9.32	33.41;6.8    13.76;
         8.11	28.73;7.51	  22.40;9	    24.86;9.4	22.50;8.3	 22.63;
         7.41	15.31;9.01    18.66;7.7	    26.45;6.82	6.49; 7.2	 7.76;
         9.3	24.28;9.7	  22.64;9.9	    16.90;7.9	16.42;8.8	 35.24;
         6.51	17.04;9.2	  49.65;7.01	26.36;6.2	13.69;7.5	 26.71;
         9.31	28.19;9.02    55.78;8	    31.79;6.5	30.59;7.3	 22.64;
         9.51	66.27;8.1     23.84;9.5	    28.05;7.53	22.64;10.2	 18.80;
         8.01   19.19;7.52	  31.85;8.32	27.77;7.1	29.13;7.4	 47.11;
         6.7	36.44;8.5	  50.80;8.33    39.33];
temp.WJO_20 = C2K(20) ;units.WJO_20 = {'g', 'mumol O2/h'};  label.WJO_20 = {'wet weight', 'O2 consumption rate', '20 C'}; 
units.temp.WJO_20 = {'K'}; label.temp.WJO_20= {'Temperature'};bibkey.WJO_20 = 'DeCuLefe2023';
comment.WJO_20 = 'Data for salitiny 35 promille';
% 
data.WJO_24 = [10.31	29.22;8.3	 30.61;10.52   26.24;7.1	14.38 ;7	 18.39;
         7.81	9.81; 7.7	 17.07;7.4	   11.77;11.6	26.82; 8.51	 29.10;
         8.61	22.23;11.3	 34.58;10.6    19.17;10.8	14.87; 10.3	 17.24;
         9.51	26.53;8.21	 11.26;10.5	   22.48;8.9	13.90; 9	 34.40;
         10.51	27.28;8.2	 13.71;7.11	   6.16; 8.62	13.86; 9.5 	 24.68;
         10.9	20.54;9.52	 24.92;10.2	   44.65;8.4	53.21; 8.5	 35.27;
         9.3	54.84;11	 59.06;7.8	   47.12;8.6	49.85; 6	 28.57;
         7.2	31.38;8.31	 35.22;11.5	   50.50;9.1	30.65; 7.5	 26.97;
         7.3	28.56;6.4	 28.56;8	   17.67];
temp.WJO_24= C2K(10); units.WJO_24 = {'g', 'mumol O2/h'};  label.WJO_24 = {'wet weight', 'O2 consumption rate', '24 C'}; 
units.temp.WJO_24 = {'K'}; label.temp.WJO_24= {'Temperature'};bibkey.WJO_24 = 'DeCuLefe2023';
comment.WJO_24 = 'Data for salitiny 35 promille';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% Group plots
 set1 = {'WJO_24', 'WJO_20', 'WJO_16', 'WJO_13', 'WJO_10'}; subtitle1 = {'respiration at different temperatures'};
 metaData.grp.sets = {set1};
 metaData.grp.subtitle = {subtitle1};

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points

%% Facts

%% Links
metaData.links.id_CoL = 'GFHY'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '2966543'; % Ency of Life
metaData.links.id_Wiki = 'Arenicola_defodiens'; % Wikipedia
metaData.links.id_ADW = 'Arenicola_defodiens'; % ADW
metaData.links.id_Taxo = '162389'; % Taxonomicon
metaData.links.id_WoRMS = '129867'; % WoRMS

%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{http://www.bio.vu.nl/thb/research/bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DeCuLefe2023'; type = 'Article'; bib = [ ...  
'doi = {10.1016/j.pocean.2023.103154}, ' ...
'author = {De Cubber, L. and  Lefebvre, S. and Lancelot, T. and Schaffer Ferreira, J. D. and Gaudron, S. M.},'...
'year = {2023},'...
'title = {Unravelling mechanisms behind population dynamics, biological traits and latitudinal distribution in two benthic ecosystem engineers: a modelling approach},'...
'journal = {Progress in Oceanography},'...
'volume = {219},'...
'pages = {103154}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WatsCadm1998'; type = 'Article'; bib = [ ...  
'doi = {10.3354/meps175167}, ' ...
'author = {Watson, G. J. and Cadman, P. S. and Paterson, L. A. and Bentley, M. G. and Auckland, M. F.},'...
'year = {1998},'...
'title = {Control of oocyte maturation, sperm activation and spawning in two lugworm species: \emph{Arenicola marina} and \emph{Arenicola defodiens}},'...
'journal = {Mar Ecol Prog Ser}, '...
'volume = {175}, '...
'pages = {167–176}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FarkBerg1979'; type = 'Article'; bib = [ ...  
'author = {Farke, H. and Berghuis, E.M.},'...
'year = {1979},'...
'title = {Spawning, larval development and migration of \emph{Arenicola marina} under field conditions in the western {W}adden sea},'...
'journal = {Netherlands J Sea Res},'...
'volume = {13},'...
'pages = {529–535}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DeCu2025'; type = 'Misc'; bib = [ ...
'author = {Lola DeCubber}, ' ...
'year = {2025}, ' ...
'note = {personal observation}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
