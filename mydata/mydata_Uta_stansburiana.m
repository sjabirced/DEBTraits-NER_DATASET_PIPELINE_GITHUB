function [data, auxData, metaData, txtData, weights] = mydata_Uta_stansburiana
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Phrynosomatidae';
metaData.species    = 'Uta_stansburiana'; 
metaData.species_en = 'Common side-blotched lizard'; 

metaData.ecoCode.climate = {'B'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTg', '0iTh', '0iTd'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2026 01 18];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2026 01 18];

%% set data
% zero-variate data

data.ab = 70;  units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'Tink1967';   
  temp.ab = C2K(16);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '65-77 d, but mean temperature is unknown';
data.am = 5*465;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 4.2;   units.Lp  = 'cm';  label.Lp  = 'SVL at puberty';  bibkey.Lp  = 'Tink1967';  
data.Lpm  = 4.6;  units.Lpm = 'cm';  label.Lpm  = 'SVL at puberty for males';  bibkey.Lpm  = 'Tink1967';  
data.Li  = 6;     units.Li  = 'cm';  label.Li  = 'ultimate SVL';    bibkey.Li  = 'Wiki';

data.Wwb = 0.35;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'Tink1967';  

data.Ri  = 3*4.5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Tink1967';   
  temp.Ri = C2K(24);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4.5 eggs per clutch, 3 clutches per yr assumed';
 
% univariate data
% time-weight
data.tW_f = [ ... % time since birth (d), weight (10*g)
30.509	2.156
33.452	2.026
38.541	3.358
44.185	10.125
50.900	16.894
58.667	18.891
66.724	26.722
73.154	28.983
79.320	32.172
101.561	40.946
109.331	43.871
118.433	45.207
134.481	43.767
149.469	44.976
183.461	48.063
190.963	50.856];
data.tW_f(:,1) = data.tW_f(:,1)-28; 
data.tW_f(:,2) = data.tW_f(:,2)/10; 
units.tW_f  = {'d', 'g'};  label.tW_f = {'time since birth', 'weight', 'females'};  
temp.tW_f   = C2K(35);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Tink1967'; comment.tW_f = 'units of tW_f are confusing and/or inconsistent with LW data)';

%
data.tW_m = [ ... % time since birth (d), weight (10*g)
28.636	2.021
31.843	0.964
36.395	2.029
42.574	8.665
51.156	13.845
55.984	16.900
64.831	21.417
73.935	23.283
79.308	29.122
90.568	35.101
102.605	34.186
111.698	33.003
125.639	40.442
133.148	44.958
144.902	40.199
161.517	46.978
171.165	51.099
191.217	47.276
210.209	46.104];
data.tW_m(:,1) = data.tW_m(:,1)-28; 
data.tW_m(:,2) = data.tW_m(:,2)/10; 
units.tW_m  = {'d', 'g'};  label.tW_m = {'time since birth', 'weight', 'males'};  
temp.tW_m   = C2K(35);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Tink1967';  comment.tW_m = 'units of tW_m are confusing and/or inconsistent with LW data)';

% length-weight
data.LW_fm = [ ... % SVL (cm), weight (g)
    4.2 2.76 NaN
    4.3 3.25 NaN
    4.4 3.27 NaN
    4.5 3.65 NaN
    4.6 3.65 3.72
    4.7 3.98 4.14
    4.8 4.05 4.20
    4.9 3.90 4.57
    5.0 4.30 4.91
    5.1 4.69 5.02
    5.2 4.17 5.27
    5.3 5.27 5.48
    5.4 NaN  5.24
    5.5 NaN  6.12
    5.6 NaN  5.86
    5.7 NaN  6.70]; 
units.LW_fm  = {'cm', 'g'};  label.LW_fm = {'SVL', 'weight'};  
bibkey.LW_fm = 'Tink1967'; treat.LW_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = 3 * weights.tW_f;
weights.tW_m = 3 * weights.tW_m;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by E_Hp only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '7F3TX'; % Cat of Life
metaData.links.id_ITIS = '173956'; % ITIS
metaData.links.id_EoL = '1055085'; % Ency of Life
metaData.links.id_Wiki = 'Uta_stansburiana'; % Wikipedia
metaData.links.id_ADW = 'Uta_stansburiana'; % ADW
metaData.links.id_Taxo = '49029'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Uta&species=stansburiana'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Uta_stansburiana}}';
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
bibkey = 'Tink1967'; type = 'misc'; bib = [ ... 
'author = {Donald W. Tinkle}, ' ... 
'year = {1967}, ' ...
'title = {The Life and Demography of the Side-Blotched Lizard, \emph{Uta stansburiana}}, ' ...
'journal = {Miscellaneous Publications of Museum of Zoology, Univ of Michigan}, ' ...
'howpublished = {\utl{https://deepblue.lib.umich.edu/bitstream/handle/2027.42/56376/MP132.pdf?sequence=1}}, ' ...
'number = {132}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

