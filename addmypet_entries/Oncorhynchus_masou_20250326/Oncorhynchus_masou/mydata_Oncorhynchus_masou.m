function [data, auxData, metaData, txtData, weights] = mydata_Oncorhynchus_masou

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Oncorhynchus_masou'; 
metaData.species_en = 'Masu salmon'; 

metaData.ecoCode.climate = {'MC','Dfb'};
metaData.ecoCode.ecozone = {'MPW','THp'};
metaData.ecoCode.habitat = {'0iFr','0iMp'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'bjCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(3.3); 
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2025 03 26]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 26];


%% set data
% zero-variate data
  
  data.ab = 145.5;    units.ab = 'd';    label.ab = 'age at birth';     bibkey.ab = 'guess';  
    temp.ab = C2K(3.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
    comment.ab = 'based on O. nerka';
  data.am = 4*365;    units.am = 'd';    label.am = 'life span';    bibkey.am = 'KisoMats1992';           
    temp.am = C2K(3.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
 
  data.Lp  = 35;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess';
  data.Li  = 79;  units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';
  
  data.Wwb = 0.3137;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'guess';  
    comment.Wwb = 'based on O. nerka';
  data.Wwp = 455;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
    comment.Wwp = 'based on 0.00955*Lp^3.03, see F1';
  data.Wwi = 5.4e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';  bibkey.Wwi = 'fishbase';
    comment.Wwi = 'based on 0.00955*Li^3.03, see F1;  max. published weight: 10 kg';

  data.NR  = 3850;   units.NR  = '#';   label.NR  = 'eggs at the end of life';bibkey.NR  = 'fishbase';   
    temp.NR = C2K(3.3); units.temp.NR = 'K'; label.temp.NR = 'temperature';

% Uni-variated data
% time-length
data.tL_f = [ % ... % time (yr), fork length (cm)
0.524	4.767
0.593	7.093
0.682	7.674
0.791	8.140
0.851	10.698
0.959	11.628
1.048	12.558
1.108	13.837
1.186	12.442
1.265	13.256
1.345	15.581
1.443	15.465
1.513	16.047
1.602	17.093
1.749	16.860
1.839	20.349
2.174	18.837
2.450	19.651
2.489	20.465
2.598	20.000
3.022	23.023
3.418	28.605
3.673	24.186];
data.tL_f(:,1) = (0 + data.tL_f(:,1)) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time','fork length', 'females'};  
temp.tL_f    = C2K(3.3);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature'; 
bibkey.tL_f = 'KisoMats1992';
%
data.tL_m = [ % ... % time (yr), fork length (cm)
0.500	4.692
0.581	7.250
0.642	8.299
0.762	9.587
0.813	11.331
0.893	11.803
1.002	12.511
1.071	11.940
1.141	12.295
1.322	15.212
1.430	14.761
1.470	14.766
1.589	14.896
1.661	17.916
1.780	17.814
1.861	19.213
2.075	15.415
2.424	18.583
2.530	15.584
2.766	23.256
2.875	23.848
2.990	20.386];
data.tL_m(:,1) = (0 + data.tL_m(:,1)) * 365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time','fork length', 'males'};  
temp.tL_m    = C2K(3.3);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature'; 
bibkey.tL_m = 'KisoMats1992';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.NR = 5 * weights.NR;
weights.Wwb = 5 * weights.Wwb;
weights.am = 10 * weights.am;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

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
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00955*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '49JFC'; % Cat of Life
metaData.links.id_ITIS = '49JFC'; % ITIS
metaData.links.id_EoL = '205249'; % Ency of Life
metaData.links.id_Wiki = 'Oncorhynchus_masou'; % Wikipedia
metaData.links.id_ADW = 'Oncorhynchus_masou'; % ADW
metaData.links.id_Taxo = ''; % Taxonomicon
metaData.links.id_WoRMS = '293637'; % WoRMS
metaData.links.id_fishbase = 'Oncorhynchus-masou'; % fishbase

%% References%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Oncorhynchus_masou}}';
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
bibkey = 'KisoMats1992'; type = 'Article'; bib = [ ... 
'doi = {10.2331/SUISAN.58.9}, ' ...
'author = {Kiso, K. and Y. Matsumiya}, ' ... 
'year = {1992}, ' ...
'title = {Growth of fluviatile form masu salmon \emph{Onchorhynchus masou} in southern {S}anriku {D}istrict, {H}onshu, {J}apan}, ' ...
'journal = {Nippon Suisan Gakkaishi}, ' ...
'volume = {58(1)}, ' ...
'pages = {9-13}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Oncorhynchus-masou.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

