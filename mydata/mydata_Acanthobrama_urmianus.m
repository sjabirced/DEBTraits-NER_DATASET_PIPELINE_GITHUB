  function [data, auxData, metaData, txtData, weights] = mydata_Acanthobrama_urmianus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Acanthobrama_urmianus'; 
metaData.species_en = 'Urmia Lake chub'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr', '0iFl'};
metaData.ecoCode.embryo  = {'Fs', 'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 03 31];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 31];

%% set data
% zero-variate data
data.ab = 13;        units.ab = 'd';  label.ab = 'age at birth';                 bibkey.ab = 'guess'; 
  temp.ab = C2K(23); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 8*365;   units.am = 'd';  label.am = 'life span';                     bibkey.am = 'AbdoRaso2001';   
  temp.am = C2K(23); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 9;  units.Lp = 'cm'; label.Lp = 'total length at puberty';          bibkey.Lp = 'guess'; 
data.Li = 19; units.Li = 'cm'; label.Li = 'ultimate total length';            bibkey.Li = 'fishbase';

data.Wwb = 2.4e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';           bibkey.Wwb = 'guess';
  comment.Wwb = 'Based on egg diameter of 1.65 mm of Acanthobrama_microlepis: pi/6*0.165^3';
data.Wwp = 7.4;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';          bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00977*Lp^3.02,  see F1';
data.Wwi = 71; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';           bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00977*Li^3.02, see F1';

data.Ri = 3.6e3/365;   units.Ri = '#/d';  label.Ri = 'Reprod rate max size';   bibkey.Ri = 'guess';
  temp.Ri = C2K(23); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Acanthobrama_microlepis: 9705*71/190';

% univariate data

% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
1.966	11.609
1.967	11.836
1.981	11.383
1.982	12.044
2.070	10.986
2.962	12.916
2.977	12.406
2.992	12.803
3.006	12.236
3.021	13.484
3.022	12.576
3.036	11.782
3.956	12.844
3.957	13.827
3.958	14.431
3.971	13.411
3.972	14.167
3.986	12.957
3.987	14.583
4.001	13.638
4.002	13.997
4.966	15.606
4.967	15.474
4.968	15.228
4.999	13.999
5.028	14.434
5.042	15.020
5.043	14.850
5.964	17.159
5.978	17.858
5.979	16.252
5.994	16.630
6.008	16.044
6.023	17.594
6.024	17.008
7.019	19.052];
data.tL_f(:,1) = 365 * (0.5 + data.tL_f(:,1));  % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f = C2K(23);  units.temp.tL_f = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_f = 'AbdoRaso2001'; 
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
1.961	10.996
1.970	11.842
1.985	11.404
1.988	10.785
2.931	12.989
2.946	12.400
2.970	12.808
2.973	12.008
2.985	12.249
2.996	12.611
3.935	13.034
3.974	12.808
3.975	12.611
3.985	13.200
4.965	15.615
4.967	14.996
4.968	14.830
4.969	14.634
4.976	15.811
4.984	14.211
5.921	17.592];
data.tL_m(:,1) = 365 * (0.5 + data.tL_m(:,1));  % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m = C2K(23);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'AbdoRaso2001'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Wwb = 3 * weights.Wwb;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = weights.psd.v * 2;
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Length-weight: Ww (in g) = 0.00977*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Endemic from Urmia Lake basin, Iran';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '64D4T'; % Cat of Life
metaData.links.id_ITIS = '1199845'; % ITIS
metaData.links.id_EoL = '42514157'; % Ency of Life
metaData.links.id_Wiki = 'Acanthobrama_urmianus'; % Wikipedia
metaData.links.id_ADW = 'Acanthobrama_urmianus'; % ADW
metaData.links.id_Taxo = '2702189'; % Taxonomicon
metaData.links.id_WoRMS = '1020219'; % WoRMS
metaData.links.id_fishbase = 'Acanthobrama-urmianus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Acanthobrama_urmianus}}';  
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
bibkey = 'AbdoRaso2001'; type = 'Article'; bib = [ ...  
'author = {Asghar Abdoli and Pooneh Rasooli and Saiid Soltaninasab}, ' ...
'year = {2001}, ' ...
'title = {A contribution to the biology of \emph{Acanthalburnus urmianus} ({G}\"{u}nther, 1899) ({O}steichthyes: {C}yprinidae): an endemic fish of {I}ran}, ' ... 
'journal = {Turk. J. Zool.}, ' ...
'volume = {25}, '...
'pages = {127-133}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Acanthobrama-urmianus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

