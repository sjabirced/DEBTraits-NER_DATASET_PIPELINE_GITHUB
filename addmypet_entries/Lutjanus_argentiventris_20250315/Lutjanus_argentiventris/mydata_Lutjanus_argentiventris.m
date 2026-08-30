function [data, auxData, metaData, txtData, weights] = mydata_Lutjanus_argentiventris
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Lutjanidae';
metaData.species    = 'Lutjanus_argentiventris'; 
metaData.species_en = 'Yellow snapper'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25.8); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 03 15];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 15];

%% set data
% zero-variate data

data.ab = 7.5;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(25.8);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 16*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'Ramo2001';   
  temp.am = C2K(25.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 19.5; units.Lp  = 'cm';  label.Lp  = 'fork length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 71;  units.Li  = 'cm';  label.Li  = 'ultimate fork length'; bibkey.Li  = 'fishbase';

data.Wwb = 2.5e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.78 mm: pi/6*0.078^3'; 
data.Wwp = 100.3;   units.Wwp = 'g';   label.Wwp = 'ultimate wet weight';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01479*Lp^2.97, see F1';
data.Wwi = 4658; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01479*Li^2.97, see F1; max. published weight: 13 kg';

data.Ri  = 3.56e5/365;   units.Ri  = '#/d'; label.Ri  = 'max reoduction rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(25.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
0.910	20.550
0.934	22.452
0.958	23.848
0.960	19.789
0.961	18.013
0.984	21.311
0.986	17.378
0.987	16.364
1.010	19.027
1.901	27.019
1.902	23.214
1.903	21.184
1.904	19.662
1.926	24.989
1.950	27.653
1.954	18.140
2.001	21.945
2.002	20.803
2.024	28.922
2.051	23.975
2.075	25.877
2.842	32.600
2.867	30.825
2.868	29.937
2.918	28.288
2.919	27.019
2.920	26.004
2.921	23.721
2.940	34.376
2.942	31.205
2.968	26.512
2.992	29.556
2.994	24.863
3.881	38.436
3.882	37.674
3.883	37.167
3.909	33.108
3.932	35.645
3.933	34.503
3.934	33.996
3.935	30.951
4.924	40.719
4.927	34.123
4.928	32.093
4.947	43.890
4.950	37.928
4.976	35.772
4.977	34.630
5.892	41.987
5.918	38.436
5.941	43.002
5.968	37.294
6.931	49.725
8.942	50.867
8.992	48.710
9.960	51.247
9.984	52.262
10.977	52.008
13.980	56.321
16.932	60.254];
data.tL(:,1) = (data.tL(:,1) + 0.9)*365;  % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(25.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GarcQuin2009'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL =  5 * weights.tL;
weights.ab =  0 * weights.ab;
% weights.GSI =  3 * weights.GSI;
% weights.Wwp =  0 * weights.Wwp;
% weights.Wwi =  0 * weights.Wwi;
% weights.Li =  3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are supposed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: Ww in g = 0.01479*(TL in cm)^2.97';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = ''; % Cat of Life
metaData.links.id_ITIS = '168851'; % ITIS
metaData.links.id_EoL = '46580759'; % Ency of Life
metaData.links.id_Wiki = 'Lutjanus'; % Wikipedia
metaData.links.id_ADW = 'Lutjanus_argentiventris'; % ADW
metaData.links.id_Taxo = '179209'; % Taxonomicon
metaData.links.id_WoRMS = '276524'; % WoRMS
metaData.links.id_fishbase = 'Lutjanus-argentiventris'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lutjanus}}';
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
bibkey = 'GarcQuin2009'; type = 'Article'; bib = [ ... 
'doi = {10.1577/M06-025.1}, ' ...
'author = {Oscar Enrique Garci\''{a}-Contreras and Csimiro Qui\~{n}\''{o}nez-Vel\''{a}zquez and Ram\''{o}n Enrique Mor\''{a}n-Angulo and Maria Candelaria Valdez-Pineda}, ' ... 
'year = {2009}, ' ...
'title = {Age, Growth, and Age Structure of Amarillo Snapper off the Coast of {M}azatl\''{a}n, {S}inaloa, {M}exico}, ' ...
'journal = {North American Journal of Fisheries Management}, ' ...
'volume = {29}, ' ...
'pages = {223–230}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Lutjanus-argentiventris.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
