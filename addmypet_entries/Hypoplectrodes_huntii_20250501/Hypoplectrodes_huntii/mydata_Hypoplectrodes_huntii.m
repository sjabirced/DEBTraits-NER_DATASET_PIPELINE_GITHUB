  function [data, auxData, metaData, txtData, weights] = mydata_Hypoplectrodes_huntii
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Anthiadidae';
metaData.species    = 'Hypoplectrodes_huntii'; 
metaData.species_en = 'Redbanded perch'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'biMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','biCvf'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 05 01];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 05 01];

%% set data
% zero-variate data
data.ab = 18; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(17);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 6*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 8;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'Jone1980';
data.Li = 20;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 6.9;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';  bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.01349*Lp^3.00, see F1';
data.Wwi = 108;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01349*Li^3.00, see F1';

data.Ri  = 365/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(17);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Pronotogrammus_martinicensis; females become males at SL 8 cm';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), std length (cm)
0.730	5.978
0.965	7.638
0.969	6.706
1.651	9.800
1.724	9.399
1.734	10.131
1.964	8.640
1.965	8.951
1.981	9.350
1.997	9.594
2.023	8.484
2.741	11.333
2.988	10.419]; 
data.tL_f(:,1) = 365 * (0.95+data.tL_f(:,1)); % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'std length', 'females'};  
temp.tL_f = C2K(17);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Jone1980'; 
%
data.tL_m = [ ... % time since birth (yr), std length (cm)
0.711	6.710
0.719	6.954
0.721	5.534
0.978	9.146
1.715	11.108
1.732	9.798
1.750	8.489
1.957	10.615
1.964	8.574
1.984	8.041
2.009	8.906
2.688	10.935
2.727	11.600
2.730	10.313
2.733	11.090
2.791	10.955
2.956	11.640
2.974	10.486
2.974	10.597
2.986	11.817
3.629	12.072
3.688	12.271
3.702	12.071
3.769	12.070
3.947	12.310
3.967	11.955
3.968	12.177
3.972	11.178
3.977	12.465
3.985	12.643
4.723	12.918
4.725	13.450
4.732	13.162
4.967	12.980
5.737	13.987
5.756	13.099]; 
data.tL_m(:,1) = 365 * (0.95+data.tL_m(:,1)); % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'std length', 'males'};  
temp.tL_m = C2K(17);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Jone1980'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.ab = weights.ab * 0;
% weights.Wwp = weights.Wwp * 0;
weights.Wwi = weights.Wwi * 5;
weights.Li = weights.Li * 5;

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
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01349*(TL in cm)^3.00'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Southwest Pacific: endemic to New Zealand';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3NXW7'; % Cat of Life
metaData.links.id_ITIS = '643274'; % ITIS
metaData.links.id_EoL = '46579565'; % Ency of Life
metaData.links.id_Wiki = 'Hypoplectrodes_huntii'; % Wikipedia
metaData.links.id_ADW = 'Hypoplectrodes_huntii'; % ADW
metaData.links.id_Taxo = '177146'; % Taxonomicon
metaData.links.id_WoRMS = '281106'; % WoRMS
metaData.links.id_fishbase = 'Hypoplectrodes_huntii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Hypoplectrodes_huntii}}';  
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
bibkey = 'Jone1980'; type = 'techreport'; bib = [ ... 
'doi = {10.1111/j.1095-8649.1980.tb02753.x}, ' ...
'author = {Jones, G. P.}, ' ... 
'year = {1980}, ' ...
'title = {Contribution to the biology of the redbanded perch, \emph{Ellerkeldia huntii} ({H}ector), with a discussion on hermaphroditism}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {17(2)}, ' ...
'pages = {197–207}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Hypoplectrodes_huntii.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

