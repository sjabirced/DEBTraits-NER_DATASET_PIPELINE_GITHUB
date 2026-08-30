  function [data, auxData, metaData, txtData, weights] = mydata_Alosa_kessleri
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Alosidae';
metaData.species    = 'Alosa_kessleri'; 
metaData.species_en = 'Caspian anadromous shad'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAc','THp'};
metaData.ecoCode.habitat = {'jiMpe', 'piFr', '0jFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10.8); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 18];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 18];

%% set data
data.am = 8*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(10.8);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 38;     units.Lp = 'cm';   label.Lp = 'total length at puberty';  bibkey.Lp = 'fishbase';
data.Li = 52;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 0.0042; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.7-2.4 mm of Alosa_fallax: pi/6*0.2^3';
data.Wwp = 591;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00776*Lp^3.09, see F1';
data.Wwi = 1557;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00776*Li^3.09, see F1;max. published weight: 1.2 kg';
  
data.Ri = 312000/365;units.Ri = '#/d';  label.Ri = 'maximum reprod rate';    bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(10.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-length
data.tL_fm = [ ... % year class (yr), total length (cm)
    2 21.8 20.6
    3 27.7 24.9
    4 31.9 28.4
    5 32.5 31.6];
data.tL_fm(:,1) = 365*(0+data.tL_fm(:,1)); % convert yr to d
units.tL_fm = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
  temp.tL_fm = C2K(10.8);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature'; 
bibkey.tL_fm = {'KuziGruz2020'}; treat.tL_fm = {1 {'females','males'}};
comment.tL_fm = 'data for migration peak';

% time-weight
data.tW_fm = [ ... % year class (yr), weight (g)
    2 112  96
    3 177 127
    4 303 205
    5 332 309];
data.tW_fm(:,1) = 365*(0+data.tW_fm(:,1)); % convert yr to d
units.tW_fm = {'d', 'g'};  label.tW_fm = {'time since birth', 'weight'};  
  temp.tW_fm = C2K(10.8);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature'; 
bibkey.tW_fm = {'KuziGruz2020'}; treat.tW_fm = {1 {'females','males'}};
comment.tL_fm = 'data for migration peak';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = weights.tL_fm * 50;
weights.Ri = weights.Ri * 5;
weights.Wwb = weights.Wwb * 5;
weights.Wwi = weights.Wwi * 5;

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
% set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: Ww in g = 0.00776*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Caspian Sea from where adults ascend Volga (only few fish enter Ural and Terek) to spawn. Earlier reached upriver up to Kama and Oka system. Migration now blocked by Volgograd dam. May have formed land-lock populations in Volga reservoirs';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '5TWJV'; % Cat of Life
metaData.links.id_ITIS = '551288'; % ITIS
metaData.links.id_EoL = '46562379'; % Ency of Life
metaData.links.id_Wiki = 'Alosa_kessleri'; % Wikipedia
metaData.links.id_ADW = 'Alosa_kessleri'; % ADW
metaData.links.id_Taxo = '160463'; % Taxonomicon
metaData.links.id_WoRMS = '272252'; % WoRMS
metaData.links.id_fishbase = 'Alosa-kessleri'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Alosa_kessleri}}';  
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
bibkey = 'KuziGruz2020'; type = 'article'; bib = [ ... 
'author = {K. V. Kuzishchina and M. A. Gruzdevaa and V. A. Filenkoa and D. S. Pavlov}, '...
'year = {2020}, ' ...
'title = {Caspian Anadromous Shad \emph{Alosa kessleri kessleri} ({G}rimm, 1887) from the {A}khtuba {R}iver, {L}ower {V}olga {R}iver {B}asin: Biological and Morphological Features}, ' ...
'journal = {Inland Water Biology}, ' ...
'volume = {13(1)}, ' ...
'pages = {79–87}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Alosa-kessleri.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  