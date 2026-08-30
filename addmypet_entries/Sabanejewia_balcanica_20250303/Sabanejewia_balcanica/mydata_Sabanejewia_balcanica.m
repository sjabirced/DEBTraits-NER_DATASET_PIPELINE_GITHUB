  function [data, auxData, metaData, txtData, weights] = mydata_Sabanejewia_balcanica
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cobitidae';
metaData.species    = 'Sabanejewia_balcanica'; 
metaData.species_en = 'Balcan spined loach'; 

metaData.ecoCode.climate = {'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFm', '0iFp'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 03 03];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 03];

%% set data
% zero-variate data
data.am = 5*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'ZaneMrak2008';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 5.6;    units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'fishbase';
data.Li = 9;    units.Li = 'cm'; label.Li = 'ultimate total length'; bibkey.Li = 'fishbase';

data.Wwb = 1.4e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';            bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.4 mm: pi/6*0.14^3';
data.Wwp = 1.44;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'Based on 0.00646*Li^3.14, see F1';
data.Wwi = 6.5; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'Based on 0.00646*Li^3.14, see F1';

data.Ri = 968/365;   units.Ri = '#/d';  label.Ri = 'max reprod rate';    bibkey.Ri = 'guess';
  temp.Ri = C2K(22); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Cobitis calderoni';
  
% univariate data

% time-length
data.tL_fm = [ ... % time since birth (yr), total length (cm)
1	3.531 3.662
2	6.177 6.125
3	7.209 7.374
4   8.108 8.072];
data.tL_fm(:,1) = 365 * (0+data.tL_fm(:,1)); % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(22);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'ZaneMrak2008'; treat.tL_fm = {1 {'females','males'}};
comment.tL_fm = 'Data from Rijeka River';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.Wwb = 3 * weights.Wwb;
weights.Wwi = 3 * weights.Wwi;
weights.Ri = 3 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1; 

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww (in g) = 0.00646*(TL in cm)^3.14';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Black Sea Bassin';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '78Z2J'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '1156742'; % Ency of Life
metaData.links.id_Wiki = 'Sabanejewia'; % Wikipedia
metaData.links.id_ADW = 'Sabanejewia_balcanica'; % ADW
metaData.links.id_Taxo = '186350'; % Taxonomicon
metaData.links.id_WoRMS = '1016368'; % WoRMS
metaData.links.id_fishbase = 'Sabanejewia-balcanica'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Sabanejewia}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%73167
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ZaneMrak2008'; type = 'Article'; bib = [ ...  
'author = {Zanella, D. and M. Mrakov\v{c}i\''{c} and P. Mustafi\''{c} and M. \''{C}aleta and I. Buj and Z. Mar\v{c}i\''{c} and S. Zrn\v{c}i\''{c} and J. Razlog-Grlica}, ' ...
'year = {2008}, ' ...
'title = {Age and growth of \emph{Sabanejewia balcanica} in the {R}ijeka {R}iver, central {C}roatia}, ' ... 
'journal = {Folia Zool.}, ' ...
'volume = {57(1-2)}, '...
'pages = {162-167}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Sabanejewia-balcanica}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

