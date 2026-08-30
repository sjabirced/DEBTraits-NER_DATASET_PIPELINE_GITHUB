  function [data, auxData, metaData, txtData, weights] = mydata_Neosalanx_taihuensis

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Osmeriformes'; 
metaData.family     = 'Salangidae';
metaData.species    = 'Neosalanx_taihuensis'; 
metaData.species_en = 'Yangtze icefish';

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFr', '0jFl'};
metaData.ecoCode.embryo  = {'Fs', 'Fg', 'Fh'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz', 'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(16.9); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 03 27];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 27];

%% set data
% zero-variate data
data.ab = 11;  units.ab = 'd';   label.ab = 'age at hatch';                bibkey.ab = 'ZhuYe2014';   
  temp.ab = C2K(16.9); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 365;  units.am = 'd';   label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(16.9); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 6.3;   units.Lp = 'cm';  label.Lp = 'total length at puberty'; bibkey.Lp = 'fishbase'; 
data.Li = 9.8;   units.Li = 'cm';  label.Li = 'ultimate total length';    bibkey.Li = 'fishbase';

data.Wwb = 2.2e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.6 to 0.9 mm for Osmerus mordax: pi/6*0.075^3';
data.Wwp = 0.73;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00209*Lp^3.18, see F1';
data.Wwi = 3.0;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00209*Li^3.18, see F1';

data.Ni = 1250; units.Ni = '#'; label.Ni = 'total fecundity'; bibkey.Ni = 'ZhuYe2014';   
  temp.Ni = C2K(16.9);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature'; 
    
% uni-variate data

% time - length
data.tL_2009fm = [ ... % time since birth (mnth), total length (cm)
 0 5.211 5.249
 1 5.167 5.431
 2 5.480 5.383
 3 5.607 5.409
 4 6.117 5.707
 5 6.764 6.205
 6 6.981 6.318
 7 7.242 6.665
 8 7.045 6.868];
data.tL_2009fm(:,1) = (4+data.tL_2009fm(:,1)) * 30.5; % convert mnth to d
units.tL_2009fm = {'d', 'cm'}; label.tL_2009fm = {'time since birth', 'total length'};  
temp.tL_2009fm = C2K(16.9); units.temp.tL_2009fm = 'K'; label.temp.tL_2009fm = 'temperature';
bibkey.tL_2009fm = 'ZhuYe2014'; comment.tL_2009fm = 'temp varies as 10.2–22.6 C; average 16.9 C';
treat.tL_2009fm = {1 {'females','males'}}; title.tL_2009fm = '2009 data';
%
data.tL_2010fm = [ ... % time since birth (mnth), total length (cm)
 0 4.990 5.029
 1 5.114 5.358
 2 5.774 5.655
 3 6.012 5.682
 4 6.315 5.801
 5 6.403 6.064
 6 6.636 6.304
 7 6.823 6.489];
data.tL_2010fm(:,1) = (4+data.tL_2010fm(:,1)) * 30.5; % convert mnth to d
units.tL_2010fm = {'d', 'cm'}; label.tL_2010fm = {'time since birth', 'total length'};  
temp.tL_2010fm = C2K(16.9); units.temp.tL_2010fm = 'K'; label.temp.tL_2010fm = 'temperature';
bibkey.tL_2010fm = 'ZhuYe2014'; comment.tL_2010fm = 'temp varies as 10.2–22.6 C; average 16.9 C';
treat.tL_2010fm = {1 {'females','males'}}; title.tL_2010fm = '2010 data';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_2009fm = 5 * weights.tL_2009fm;
weights.tL_2010fm = 5 * weights.tL_2010fm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.title = title;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL','tL1'}; subtitle1 = {'Data for 2 varying food levels'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'Temperature (in C) for tL data is assumed to vary as T(t)=16.9+6*sin(2*pi*(t-t_0)/365)';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00209*(TL in cm)^3.180';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'endemic to China. Inhabits mainly the middle and lower reaches of the Yangtze River';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);
                                 
%% Links
metaData.links.id_CoL = '46S6J'; % Cat of Life
metaData.links.id_ITIS = '623675'; % ITIS
metaData.links.id_EoL = '215327'; % Ency of Life
metaData.links.id_Wiki = 'Neosalanx'; % Wikipedia
metaData.links.id_ADW = 'Neosalanx_taihuensis'; % ADW
metaData.links.id_Taxo = '181208'; % Taxonomicon
metaData.links.id_WoRMS = '1013993'; % WoRMS
metaData.links.id_fishbase = 'Neosalanx-taihuensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Neosalanx}}';  
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
bibkey = 'ZhuYe2014'; type = 'Article'; bib = [ ... 
'doi = {10.1111/jai.12475}, ' ...
'author = {Zhu, F.-Y. and S.-W. Ye and Z.-J. Li and T.-L. Zhang and J. Yuan and Z.-Q. Guo and J.-F. Tang and J.-S. Liu}, ' ...
'year = {2014}, ' ...
'title = {Growth and reproduction of the non-native icefish \emph{Neosalanx taihuensis} {C}hen, 1956 ({S}alangidae) in a plateau lake, southwestern {C}hina}, ' ... 
'journal = {J. Appl. Ichthyol.}, ' ...
'volume = {30(5)}, '...
'pages = {862-869}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Neosalanx-taihuensis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  
