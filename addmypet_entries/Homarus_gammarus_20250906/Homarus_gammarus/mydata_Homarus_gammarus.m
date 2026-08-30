function [data, auxData, metaData, txtData, weights] = mydata_Homarus_gammarus

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Decapoda'; 
metaData.family     = 'Nephropidae';
metaData.species    = 'Homarus_gammarus'; 
metaData.species_en = 'European lobster'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MANE', 'MAm'};
metaData.ecoCode.habitat = {'0bMb', 'bjMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjP', 'biD', 'jiCi', 'jiS'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(8); % K, body temp
metaData.data_0     = {'ab', 'aj_T', 'ap', 'am', 'Lj', 'Lp', 'Li', 'L_t', 'Wdb', 'Wwp', 'Wwi', 'Ww_t', 'Ri', 'E0'}; 
metaData.data_1     = {'t-L', 't-Ww', 'L-Ww', 'Ww-JO', 'Ww-JN', 'Ww-N'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm = [2017 08 24];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author2   = {'Brecht Stechele'};    
metaData.date_subm2 = [2025 08 18];              
metaData.email2    = {'bstechele@naturalsciences.be'};            
metaData.address2  = {'RBINS'};  

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2025 09 06]; 

%% set data
% zero-variate data

data.ab = 365;  units.ab = 'd'; label.ab = 'age at birth'; bibkey.ab = 'ProdJors2010';   
  temp.ab = C2K(6); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'After extrusion, the eggs are held on the pleopods for approximately another year until hatching the following summer';
data.tj_15 = 35;  units.tj_15 = 'd'; label.tj_15 = 'time since birth at metam at 15 C'; bibkey.tj_15 = 'ProdJors2010';   
  temp.tj_15 = C2K(15); units.temp.tj_15 = 'K'; label.temp.tj_15 = 'temperature';
data.tj_20 = 12;  units.tj_20 = 'd'; label.tj_20 = 'time since birth at metam at 20 C'; bibkey.tj_20 = 'ProdJors2010';   
  temp.tj_20 = C2K(20); units.temp.tj_20 = 'K'; label.temp.tj_20 = 'temperature';
data.tp = 6*365;  units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'ProdJors2010';
  temp.tp = C2K(8); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '5-8 yr';
data.am = 60*365; units.am = 'd';    label.am = 'life span';                    bibkey.am = 'Hans2005';   
  temp.am = C2K(8);   units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'at least 60 years, van der Meeren and Agnalt 2000 in Hans2005';
  
data.Lj  = 0.6;   units.Lj  = 'cm';  label.Lj  = 'carapace length at settle'; bibkey.Lj  = 'ProdJors2010';
data.Lp  = 8.27;  units.Lp  = 'cm';  label.Lp  = 'carapace length at puberty'; bibkey.Lp  = 'Wiki';
data.Li  = 21.4;  units.Li  = 'cm';  label.Li  = 'ultimate carapace length'; bibkey.Li  = 'Wiki';
  comment.Li = 'Converted from TL = 60 cm by 60 * 7.5/ 20, see ProdJors2010';
data.L2 = 7.5;    units.L2  = 'cm';  label.L2  = 'carapace length at 2yr'; bibkey.L2  = 'ProdJors2010';
  temp.L2 = C2K(20); units.temp.L2 = 'K'; label.temp.L2 = 'temperature'; 

data.Wdb = 1.7e-3; units.Wdb = 'g';   label.Wdb = 'dry weight at birth';       bibkey.Wdb = 'Pand1970';
  comment.Wdb = 'Based on 6172 cal/g and 10.49 cal per egg';
data.Wwj = 0.154;  units.Wwj = 'g';   label.Wwj = 'wet weight at metam';       bibkey.Wwj = 'ProdJors2010';
  comment.Wwj = 'Computed as (Lj/ L2)^3 * Ww2';
data.Wwp = 331;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';       bibkey.Wwp = 'ProdJors2010';
  comment.Wwp = 'Computed as (Lp/ L2)^3 * Ww2';
data.Wwi = 6e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';         bibkey.Wwi = 'Wiki';
data.Ww2 = 300;    units.Ww2  = 'g';  label.Ww2  = 'wet weight at 2yr'; bibkey.Ww2  = 'ProdJors2010';
  temp.Ww2 = C2K(20); units.temp.Ww2 = 'K'; label.temp.Ww2 = 'temperature'; 

data.E0 = 43.9; units.E0 = 'J';   label.E0 = 'egg energy content';       bibkey.E0 = 'Pand1970';
  comment.E0 = '10.49 cal';

data.Ri  = 30;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on kap = 0.90';

% uni-variate data

% t-L data aquaculture
data.tL = [ ... % time(d), carapace length (cm)
1   0.5
90  1.1
200 2.1
270 3.0
360 3.5
540 4.5];
units.tL   = {'d', 'cm'};  label.tL = {'time since start', 'carapace length'};  
temp.tL    = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Kris2004';

% t_Ww data wild
tLFM = [ ... % time(y), carapace length female (cm), carapace length male (cm)
0.5    0.5   0.5
2.2    3.6   4.1
3.1    5.7   6.3
4.1    7.3   8.1
5.1    8.7   9.5
5.9    9.4   10.7
7.1    10.1  11.8
9.0    10.9  12.9];
data.tLF = tLFM(:,[1,2]);
data.tLF(:,1) = data.tLF(:,1) .* 365;
units.tLF   = {'d', 'g'};  label.tLF = {'time since start', 'Carapace length female'};  
temp.tLF    = C2K(12);  units.temp.tLF = 'K'; label.temp.tLF = 'temperature';
bibkey.tLF = 'Schm2011';

data.tLM = tLFM(:,[1,3]);
data.tLM(:,1) = data.tLM(:,1) .* 365;
units.tLM   = {'d', 'g'};  label.tLM = {'time since start', 'Carapace length male'};  
temp.tLM    = C2K(12);  units.temp.tLM = 'K'; label.temp.tLM = 'temperature';
bibkey.tLM = 'Schm2011';

tWwFM = [ ... % time(y), total weight female (g), total weight male (g)
1      10    10
2.0    25    33
3.0    110   212
4.0    229   433
5.0    399   705
6.0    543   985
7.0    654   1283
8.0    781   1538
9.0    841   1733
10.0   917   1912];
data.tWwF = tWwFM(:,[1,2]);
data.tWwF(:,1) = data.tWwF(:,1) .* 365;
units.tWwF   = {'d', 'g'};  label.tWwF = {'time since start', 'total weight female'};  
temp.tWwF    = C2K(12);  units.temp.tWwF = 'K'; label.temp.tWwF = 'temperature';
bibkey.tWwF = 'Schm2011';

data.tWwM = tWwFM(:,[1,3]);
data.tWwM(:,1) = data.tWwM(:,1) .* 365;
units.tWwM   = {'d', 'g'};  label.tWwM = {'time since start', 'total weight male'};  
temp.tWwM    = C2K(12);  units.temp.tWwM = 'K'; label.temp.tWwM = 'temperature';
bibkey.tWwM = 'Schm2011';


% L - Ww data
data.LWw = [ ... % carapace length (cm), wet weight (g)
1.0   1
4.0   20
6.0   120
8.0   320
9.0   668
10.0  787
10.6  937
11.3  1090
12.1  1259
12.   1451
13.2  1662
13.9  1896];
units.LWw   = {'cm', 'g'};  label.LWw = {'Carapace length', 'total weight'};  
bibkey.LWw = 'Cont2008';

% Weight - O2 consumption
data.WwJO = [ ... % total body weight[g], dioxygen consumption rate[mgO2/kg/min]
0.1     14.3
1.6     7.6
20.6    3.2
43.6    2.4
93.8    1.5
120.7   1.1
208.2   1.7];
data.WwJO(:,2) = data.WwJO(:,2) / 32000 * 60*24; % convert mgO2/h to mol/d
units.WwJO   = {'g', 'mol/kg/d'};  label.WwJO = {'total weight', 'O2 consumption'};  
temp.WwJO    = C2K(20);  units.temp.WwJO = 'K'; label.temp.WwJO = 'temperature';
bibkey.WwJO = 'Dren2017';

% Weight - O2 consumption
data.WwJN = [ ... % total body weight[g], TAN production rate[mgTAN/kg/min]
0.1    0.35
20.1   0.11
43.4   0.08
94.0   0.06
121.1  0.05
121.8  0.09
207.8  0.10];
data.WwJN(:,2) = data.WwJN(:,2) / 14010 * 60*24; % convert mgO2/h to mol/d
units.WwJN   = {'g', 'mol/kg/d'};  label.WwJN = {'total weight', 'TAN production'};  
temp.WwJN    = C2K(20);  units.temp.WwJN = 'K'; label.temp.WwJN = 'temperature';
bibkey.WwJN = 'Dren2017';

% Reproduction
data.LN = [... % Carapace length [cm], Larvae [#]]
9.0   2770
10.0  4628
11.0  6993
12.0  9290
12.7  11722
14.0  15608];
units.LN  = {'cm', '#'};  label.LN = {'Carapace length', 'larvae'};  
temp.LN    = C2K(10);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Cont2008';

%% set weights for all real data
weights = setweights(data, []);
%weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'During the pelagic stage, larvae undergo four developmental stages until metamorphosis to stage IV (meta-larvae) when they settle to the seabed';
metaData.bibkey.F1 = 'ProdJors2010'; 
F2 = 'Males reach puberty earlier than females';
metaData.bibkey.F2 = 'ProdJors2010'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '7VDPS'; % Cat of Life
metaData.links.id_ITIS = '97315'; % ITIS
metaData.links.id_EoL = '46505673'; % Ency of Life
metaData.links.id_Wiki = 'Homarus_gammarus'; % Wikipedia
metaData.links.id_ADW = 'Homarus_gammarus'; % ADW
metaData.links.id_Taxo = '33906'; % Taxonomicon
metaData.links.id_WoRMS = '107253'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Homarus_gammarus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Hepp1967'; type = 'Article'; bib = [ ... 
'author = {Hepper, B. T.}, ' ... 
'year = {1967}, ' ...
'title = {On the growth at moulting of lobsters (\emph{Homarus vulgaris}) in {C}ornwall and {Y}orkshire}, ' ...
'journal = {J. mar. biol. Ass. U.K.}, ' ...
'volume = {47}, ' ...
'pages = {629--643}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Hans2005'; type = 'Techreport'; bib = [ ... 
'author = {B.-I. Hansen}, ' ... 
'year = {2005}, ' ...
'title = {Hummeren i Tysfjord. Unders{\o}kelse av Tysfjordens egnethet med tanke p/a havbeite og oppdrett av verdens nordligste hummer}, ' ...
'institution = {Nordlands Forskning}, ' ...
'address = {Bod/o}, '...
'ISSN = {0805-4460}, ' ...
'ISBN = {82-7321-528-8}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ProdJors2010'; type = 'Techreport'; bib = [ ... 
'author = {Prod\"{o}hl, P. A. and J{\o}rstad, K. E.  and Triantafyllidis, A. and Katsares, V.  and Triantaphyllidis, C.}, ' ... 
'year = {2010}, ' ...
'title = {Genetic Impact of Aquaculture Activities on Native Populations}, ' ...
'institution = {Norwegian Institute of Marine Research}, ' ...
'address = {Bergen}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Pand1970'; type = 'Article'; bib = [ ... 
'author = {T. J. Pandian}, ' ... 
'year = {1970}, ' ...
'title = {Ecophysiological studies on the developing eggs and embryos of the European lobster \emph{Homarus gammarus}}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {5}, ' ...
'pages = {154--167}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Dren2017'; type = 'Article'; bib = [ ... 
'author = {Drengstig, A. and Bergheim, A. and Westerlund, S. and Agnalt, A.}, ' ... 
'year = {2017}, ' ...
'title = {Metabolic rates in hatchery-reared European lobster juveniles \emph{Homarus gammarus}}, ' ...
'journal = {Journal of Aquaculture & Marine Biology}, ' ...
'volume = {5}, ' ...
'issue = {5},' ...
'doi = {10.15406/jamb.2017.05.00134},'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kris2004'; type = 'Article'; bib = [ ... 
'author = {Kristiansen, T. S. and Drengstig, A. and Bergheim, A. and Drengstig, T. and Kollsgård, I. and Svendsen, R. and Aardal, L.}, ' ... 
'year = {2004}, ' ...
'title = {Development of methods for intensive farming of European lobster in recirculated seawater.}, ' ...
'journal = {Fisken og havet}, ' ...
'volume = {6}, ' ...
'issue = {55},'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Schm2011'; type = 'Article'; bib = [ ... 
'author = {Schmalenbach, I. and F. Mehrtens, M. J. and Bucholz, F.}, ' ... 
'year = {2011}, ' ...
'title = {Mark-recapture study of hatchery-reared juvenile European lobsters, Homarus gammarus, released at the rocky island of Helgoland(German Bight, North Sea) from 2000 to 2009}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {108}, ' ...
'pages = {22--30}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Cont2008'; type = 'Article'; bib = [ ... 
'author = {Contarini, G. and Rerrella, N. and Hickey, J. and Ballestrazzi, R.}, ' ... 
'year = {2008}, ' ...
'title = {Hatchery production of European Lobster (\emph{homarus gammarus, L.}): broodstock management and effects of different holding systems on larval survival}, ' ...
'journal = {Italian Journal of Animal Science}, ' ...
'volume = {7}, ' ...
'pages = {351--362}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

