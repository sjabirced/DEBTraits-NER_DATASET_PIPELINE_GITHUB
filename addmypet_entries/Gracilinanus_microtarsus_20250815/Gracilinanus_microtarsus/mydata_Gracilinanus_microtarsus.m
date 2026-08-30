function [data, auxData, metaData, txtData, weights] = mydata_Gracilinanus_microtarsus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Didelphimorphia'; 
metaData.family     = 'Didelphidae';
metaData.species    = 'Gracilinanus_microtarsus'; 
metaData.species_en = 'Brazilian gracile opossum'; 

metaData.ecoCode.climate = {'A', 'Cfa', 'Csb', 'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf', '0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCi', 'xiCv', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 08 15];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 08 15];

%% set data
% zero-variate data

data.tg = 12.5;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'guess';   
  temp.tg = C2K(35);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 3*30.5;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'Wiki';   
  temp.tx = C2K(35);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 365;     units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'Wiki';
  temp.tp = C2K(35);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 2*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(35);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 33;     units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Wiki';
  comment.Li = '21.6-47 cm';

data.Wwb = 0.02;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
data.Wwx = 8;  units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'FernCruz2010';
data.Wwi = 35;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'Wiki';
data.Wwim = 52;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'Wiki';

data.Ri  = 12/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(35); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '12 pups per litter, 1 litter per yr';
 
% univariate data
% time-weight
data.tW_f = [ ... % time since birth (d), weight (g)
0.904	8.156
1.355	5.932
29.819	10.523
31.175	8.012
32.078	9.088
59.187	11.957
60.090	16.332
60.090	11.598
60.090	11.025
60.542	13.463
60.542	10.379
60.994	15.758
119.277	15.973
120.181	14.252
121.084	13.607
178.916	15.256
178.916	14.252
209.187	17.695
209.639	16.045
209.639	18.770
210.090	15.113
239.910	14.969
240.813	17.695
240.813	15.830
268.825	17.695
269.729	18.627];
data.tW_f(:,1) = data.tW_f(:,1) + 3*30.5; % add time since birth to weaning
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'females'};  
temp.tW_f    = C2K(35);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature'; 
bibkey.tW_f = 'FernCruz2010';
%
data.tW_m = [ ... % time since birth (d), weight (g)
0.452	11.096
30.271	10.164
30.271	11.742
30.271	12.316
30.271	12.818
30.271	13.248
30.271	14.324
30.723	13.678
31.175	16.404
60.542	14.467
60.994	15.041
60.994	12.674
119.729	18.627
119.729	20.061
120.181	17.838
120.181	18.268
120.633	16.762
121.084	21.424
178.916	19.846
178.916	15.543
179.367	18.484
179.367	16.189
180.723	17.408
208.735	22.428
209.187	26.516
210.090	25.297
210.542	23.504
210.994	19.416
239.910	25.154
239.910	24.508
240.361	27.592
240.813	30.461
269.277	29.457
269.277	36.414
269.729	23.863
269.729	26.947
269.729	30.102
270.181	24.867
270.633	33.330];
data.tW_m(:,1) = data.tW_m(:,1) + 3*30.5; % add time since birth to weaning
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'males'};  
temp.tW_m    = C2K(35);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature'; 
bibkey.tW_m = 'FernCruz2010';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'only in Brazil, being endemic to the south-eastern parts of the country, from Espírito Santo to Rio Grande do Sul';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3H59J'; % Cat of Life
metaData.links.id_ITIS = '552542'; % ITIS
metaData.links.id_EoL = '290120'; % Ency of Life
metaData.links.id_Wiki = 'Gracilinanus_microtarsus'; % Wikipedia
metaData.links.id_ADW = 'Gracilinanus_microtarsus'; % ADW
metaData.links.id_Taxo = '59715'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '10400059'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gracilinanus_microtarsus}}';
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
bibkey = 'FernCruz2010'; type = 'Article'; bib = [ ... 
'doi = {10.1017/S0266467409990526}, ' ...
'author = {Fernanda Rodrigues Fernandes and Leonardo Dominici Cruz and Eduardo Guimar\˜{a}es Martins and S\´{e}rgio Furtado dos Reis}, ' ... 
'year = {2010}, ' ...
'title = {Growth and home range size of the gracile mouse opossum \emph{Gracilinanus microtarsus} ({M}arsupialia: {D}idelphidae) in {B}razilian cerrado}, ' ...
'journal = {Journal of Tropical Ecology}, ' ...
'volume = {26}, ' ...
'pages = {185–192}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

