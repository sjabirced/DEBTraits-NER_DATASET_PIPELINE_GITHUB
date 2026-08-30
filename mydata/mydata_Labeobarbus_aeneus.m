  function [data, auxData, metaData, txtData, weights] = mydata_Labeobarbus_aeneus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Labeobarbus_aeneus'; 
metaData.species_en = 'Smallmouth yellowfish'; 

metaData.ecoCode.climate = {'Cwa'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 04 16];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 16];

%% set data
% zero-variate data
data.ab = 6;        units.ab = 'd';  label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(28); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 12*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 28.9;    units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'GerbSmit2012'; 
data.Li = 50;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1.2e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'Based on egg diameter of 1.3 mm: pi/6*0.13^3';
data.Wwp = 247;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwi = 'based on 0.00955*Lp^3.02, see F1';
data.Wwi = 1291;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00955*Li^3.02, see F1; max. published weight: 7.8 kg';

data.Ri  = 203233/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(28); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Labeo_gonius';

% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
4.028	28.652
4.065	45.530
4.066	34.565
4.067	30.499
4.972	31.842
4.973	33.074
4.991	35.661
4.992	37.879
5.030	34.059
6.032	39.097
6.051	37.618
6.071	36.139
6.072	33.306
6.109	31.950
6.996	36.989
7.015	37.728
8.035	51.020
8.036	49.541
8.037	47.570
8.038	44.120
9.000	51.130
9.019	52.115
9.037	44.969
9.038	47.310
9.039	54.456
9.058	48.665
10.002	58.632
10.020	51.609
10.021	49.884
10.022	47.420
10.040	56.290
10.041	52.840
10.042	41.013
10.985	51.103
11.024	49.501
12.026	52.074
12.044	55.031
12.045	56.140
12.064	53.675
13.991	51.308
14.994	56.099];
data.tL_f(:,1) = 365 * (0.7 + data.tL_f(:,1)); % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth','total length','females'};  
temp.tL_f = C2K(28);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'GerbSmit2012'; 
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
1.021	17.851
1.966	21.781
1.967	19.317
2.968	31.007
2.987	27.680
3.006	16.345
3.912	29.885
3.989	21.260
4.009	27.050
4.953	36.278
4.954	31.842
4.972	34.922
4.973	29.748
4.991	28.146
5.011	33.074
5.897	36.018
5.916	34.170
5.955	38.235
6.976	41.917
6.977	33.293
7.959	48.557
8.017	46.708
8.961	51.623
9.000	44.107
9.001	47.064
9.944	47.544
9.983	31.650
11.968	48.625
11.987	44.436
14.974	44.272
17.942	54.211
17.981	51.623];
data.tL_m(:,1) = 365 * (0.7 + data.tL_m(:,1)); % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth','total length','males'};  
temp.tL_m = C2K(28);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'GerbSmit2012'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = weights.tL_f * 5;
weights.tL_m = weights.tL_m * 5;
weights.Wwb = weights.Wwb * 3;
weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'TL-weight: weight (in g) = 0.00955*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'originally endemic to the Orange-Vaal River system, South Africa. Has been introduced into the Gouritz River, South Cape and the Olifants River, Limpopo River system where it is now established';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6NPWR'; % Cat of Life
metaData.links.id_ITIS = '689354'; % ITIS
metaData.links.id_EoL = '219011'; % Ency of Life
metaData.links.id_Wiki = 'Labeobarbus_aeneus'; % Wikipedia
metaData.links.id_ADW = 'Labeobarbus_aeneus'; % ADW
metaData.links.id_Taxo = '691152'; % Taxonomicon
metaData.links.id_WoRMS = '1017490'; % WoRMS
metaData.links.id_fishbase = 'Labeobarbus-aeneus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Labeobarbus_aeneus}}';  
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
bibkey = 'GerbSmit2012'; type = 'article'; bib = [ ...  
'doi = {10.2989/16085914.2012.666337 }, ' ...
'author = {R. Gerber and N.J. Smit and G.M. Wagenaar}, ' ...
'year = {2012}, ' ...
'title = {Age, growth rate and size at sexual maturity of \emph{Labeobarbus aeneus} ({T}eleostei: {C}yprinidae) in the middle {V}aal {R}iver, {S}outh {A}frica}, ' ... 
'journal = {African Journal of Aquatic Science}, ' ...
'volume = {37(1)}, ' ...
'pages = {49–58}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Labeobarbus-aeneus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

