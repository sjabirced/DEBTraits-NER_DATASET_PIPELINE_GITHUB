function [data, auxData, metaData, txtData, weights] = mydata_Leptagonus_decagonus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Agonidae';
metaData.species    = 'Leptagonus_decagonus'; 
metaData.species_en = 'Arctic poacher'; 

metaData.ecoCode.climate = {'MC','ME'};
metaData.ecoCode.ecozone = {'MPNW','MAN','MN'};
metaData.ecoCode.habitat = {'biMd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(0.7); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 05 04];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 05 04];

%% set data
% zero-variate data
data.ab = 54; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(0.7);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 3*365;  units.tp = 'd';    label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AunePrim2014'; 
  temp.tp = C2K(0.7); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 14*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'HeggOtte2015';   
  temp.am = C2K(0.7);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 11.6;     units.Lp = 'cm';   label.Lp = 'std length at puberty'; bibkey.Lp = 'AunePrim2014';
data.Li = 21.1;  units.Li = 'cm';   label.Li = 'ultimate std length';  bibkey.Li = 'AunePrim2014';

data.Wwb = 0.0042;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'AunePrim2014';
  comment.Wwb = 'based on egg diameter of 2 mm: pi/6*0.2^3';
data.Wwp = 8.1;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','AunePrim2014'};
  comment.Wwp = 'based on 0.00389*Lp^3.12, see F1';
data.Wwi = 52.7;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00389*Li^3.12, see F1';
 
data.Ri  = 687/365;   units.Ri  = '#/d'; label.Ri  = 'max reproduction rate';   bibkey.Ri  = 'AunePrim2014';   
  temp.Ri = C2K(0.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

%% univariate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
0.131	13.415
0.218	10.463
0.218	12.163
0.959	9.211
1.787	11.268
1.918	7.691
1.918	10.821
1.962	12.073
2.790	13.146
2.877	12.520
2.877	14.488
2.921	13.862
2.965	10.732
2.965	11.268
2.965	11.626
3.052	9.480
3.749	14.935
3.749	10.285
3.793	14.577
3.837	13.236
3.837	12.878
3.837	12.520
3.837	12.073
3.837	11.089
3.837	10.821
3.880	15.740
3.924	16.992
4.011	13.862
4.926	10.463
4.926	11.626
4.970	13.236
4.970	13.772
4.970	14.130
4.970	15.382
5.057	11.984
5.057	12.610
5.057	14.756
5.929	14.577
5.973	13.236
5.973	12.610
5.973	11.268
6.016	15.024
6.932	11.447
6.932	13.593
6.975	15.382
7.847	12.341
12.076	10.285
14.125	10.553];
data.tL(:,1) = (0.8 + data.tL(:,1)) * 365; % convert yr to d
for i = 2:size(data.tL,1);if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(0.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HeggOtte2015';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;
weights.ab = weights.ab * 0;
weights.Wwb = weights.Wwb * 5;
weights.Ri = weights.Ri * 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

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
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00389*(TL in cm)^3.12'; 
metaData.bibkey.F1 = 'fishbase';
F2 = 'Arctic to Northwest Atlantic and Northwest Pacific: Grand Bank and Gulf of St. Lawrence, Canada in western Atlantic. Eastern Atlantic: Spitsbergen and Finmarken coasts in Norway eastward to White Sea, Barents Sea and Kara Sea; also Iceland and Greenland. Also Okhotsk and Bering seas';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3THFM'; % Cat of Life
metaData.links.id_ITIS = '167478'; % ITIS
metaData.links.id_EoL = '46568884'; % Ency of Life
metaData.links.id_Wiki = 'Leptagonus_decagonus'; % Wikipedia
metaData.links.id_ADW = 'Leptagonus_decagonus'; % ADW
metaData.links.id_Taxo = '178561'; % Taxonomicon
metaData.links.id_WoRMS = '127191'; % WoRMS
metaData.links.id_fishbase = 'Leptagonus_decagonus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Leptagonus_decagonus}}';  
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
bibkey = 'HeggOtte2015'; type = 'misc'; bib = [ ... 
'howpublished = {\url{https://munin.uit.no/bitstream/handle/10037/30726/article.pdf?sequence=3}}, ' ...
'author = {K. Heggland and C. A. Meyer Ottesen and J. Berge}, ' ... 
'year = {2015}, ' ...
'title = {Life history of \emph{Leptagonus decagonus} ({A}tlantic poacher) in {S}valbard waters}, ' ...
'journal = {Deep–Sea Research II}, ' ...
'volume = {177}, ' ...
'pages = {104779}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AunePrim2014'; type = 'Misc'; bib = [ ...
'author = {Magnus Aune and Raul Primicerio and Andrey V. Dolgov and C. A. Meyer Ottesen}, ' ... 
'year = {2014}, ' ...
'howpublished = {\url{https://www.researchgate.net/publication/294948269_Appendix_S1}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Leptagonus_decagonus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

