function [data, auxData, metaData, txtData, weights] = mydata_Sus_domesticus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Suidae';
metaData.species    = 'Sus_domesticus'; 
metaData.species_en = 'Pig'; 

metaData.ecoCode.climate = {'A', 'B', 'C', 'D'};
metaData.ecoCode.ecozone = {'TH', 'TP', 'TA', 'TN', 'TO'};
metaData.ecoCode.habitat = {'0iTf', '0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am';'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 07 21];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 07 21];

%% set data
% zero-variate data

data.tg = 115;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg =  'AnAge';   
  temp.tg = C2K(39);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx =   56;  units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(39);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 334;    units.tp = 'd';    label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(39);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 27*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'AnAge';   
  temp.am = C2K(39);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am =  'life span between 15 and 25 yr ';
  
data.Wwb = 1422;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 300000;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'guess';
  comment.Wwi = 'AnAge: 130 kg for Sus scrofa';
  
data.Ri  = 7/230;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(39);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-weight
data.tW = [ % time since birth (d), weight (g)
    0    1422
   15	 4425.287
   30	 7643.678
   45	14080.460
   60	22931.034
   75	32183.908
   90	43448.276
  105	59540.230
  120	76034.483
  135	90919.540
  150  107413.793
  165  123505.747]; 
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'total weight'};  
temp.tW  = C2K(39);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'CeroOliv2020';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 50 * weights.tW;
%weights.Wwi = 0 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'The max weight 140 kg is the age at slaughter of 174 d';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = 'BP3VN'; % Cat of Life
metaData.links.id_ITIS = '898265'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Sus_domesticus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '67675'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14200054'; % MSW3
metaData.links.id_AnAge = 'Sus_scrofa'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sus_domesticus}}';
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
bibkey = 'CeroOliv2020'; type = 'Article'; bib = [ ... 
'doi = {10.1590/S1678-3921.pab2020.v55.01184}, ' ...
'author = {Marcos Speroni Ceron and Vladimir de Oliveira and Natielei Alexandre Nunes Novais Pieve and Nhayandra Christina Dias e Silva and Carlos Augusto Rigon Rossi and Bruno Neutzling Fraga and Henrique da Costa Mendes Muniz and Alexandre de Mello Kessler}, ' ... 
'year = {2020}, ' ...
'title = {Nonlinear equations to determine the growth curve of immunocastrated pigs}, ' ...
'journal = {Animal Science • Pesq. agropec. bras.}, ' ...
'volume = {55}, ' ...
'pages = {77--88}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Sus_scrofa}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Sus_scrofa/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

