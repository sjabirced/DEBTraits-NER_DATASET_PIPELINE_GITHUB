  function [data, auxData, metaData, txtData, weights] = mydata_Culter_alburnus
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Xenocyprididae';
metaData.species    = 'Culter_alburnus'; 
metaData.species_en = 'Lookup'; 

metaData.ecoCode.climate = {'Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0jFr', 'jpFc'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biC'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 03 30];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 30];

%% set data
% zero-variate data
data.am = 10*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 20;     units.Lp = 'cm';   label.Lp = 'total length at puberty'; bibkey.Lp = 'fishbase'; 
data.Li = 92.8;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1.2e-3;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.3 mm: pi/6*0.13^3';
data.Wwp = 65.7;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00646*Lp^3.08, see F1';
data.Wwi = 7418;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00646*Li^3.08, see F1; max. published weight: 600.00 g';

% uni-variate data
data.tL = [ ... % time since hatch (d), total length (cm)
0.000	0.519
0.808	0.561
0.810	0.520
1.866	0.595
1.981	0.662
2.100	0.620
2.804	0.662
3.040	0.646
3.271	0.746
3.743	0.713
3.977	0.738
3.980	0.671
5.035	0.772
5.154	0.730
5.155	0.705
5.157	0.671
10.789	1.024
10.790	0.991
15.467	1.678
15.816	1.770
15.954	1.285
16.752	1.912
16.753	1.887
16.867	1.963
16.981	2.046
16.993	1.762
24.035	2.157
27.537	2.810
27.669	2.484
27.671	2.443
27.774	2.785
27.777	2.702
28.001	2.969];
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = 'HuanLiu2021';

% length-fecundity
data.LN = [ ...^% total lrmgth (cm), fercundity (#)
36.183	188075.498
37.031	194132.037
37.429	208158.581
37.626	232171.759
37.779	196181.942
38.031	168198.737
38.726	218245.048
39.124	228271.615
39.376	198288.420
39.377	186288.486
39.724	224311.570
40.272	236348.109
40.370	256354.654
40.471	244361.376
40.919	252391.281
41.867	256454.487
41.869	238454.587
42.066	272467.709
42.463	292494.220
42.464	280494.287
42.466	260494.398
42.865	262521.009
43.018	228531.181
43.164	272540.920
43.509	326563.915
43.563	272567.542
43.712	286577.448
43.715	250577.647
43.859	318587.254
44.012	280597.448
44.110	304603.970
44.456	346627.031
44.508	312630.548
44.856	328653.753
45.309	282683.959
45.412	254690.769
45.810	266717.325
46.161	248740.719
46.306	300750.414
46.510	252763.991
46.754	314780.286
46.901	350790.070
47.000	364796.648
47.105	304803.636
47.952	320860.119
48.000	336863.359
48.554	288900.230
49.493	400962.837
49.796	352983.069
49.987	458995.793
49.994	378996.236
50.393	373022.892
50.597	327036.458
50.644	367039.564
50.887	441055.792
51.094	347069.625
51.141	385072.742
51.287	431082.470
51.492	365096.147
52.436	423159.053
52.484	447162.248
53.745	291246.307
54.426	503291.720
55.133	407338.841
56.228	447411.830
56.723	487444.886
58.221	487544.719
58.467	531561.114
60.313	539684.197];
units.LN = {'cm', '#'};  label.LN = {'total length','fecundity'};  
  temp.LN = C2K(18);  units.temp.LN = 'K'; label.temp.LN = 'temperature'; 
bibkey.LN = 'QinXion2009';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 10;
weights.Li = weights.Li * 3;
weights.Wwi = weights.Wwi * 3;
weights.Wwb = weights.Wwb * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; weights.psd.k = 1; 

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
D1 = 'males are assumed not to to differ from females';
D2 = 'mean temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00646*(TL in cm)^3.08'; 
metaData.bibkey.F1 = 'fishbase';
F2 = 'Lake Buir, Onon and Kherlen drainages in Mongolia; Amur and Yangtze drainages';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '32DR6'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '1157829'; % Ency of Life
metaData.links.id_Wiki = 'Culter_alburnus'; % Wikipedia
metaData.links.id_ADW = 'Culter_alburnus'; % ADW
metaData.links.id_Taxo = '43699'; % Taxonomicon
metaData.links.id_WoRMS = '1021471'; % WoRMS
metaData.links.id_fishbase = 'Culter-alburnus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Culter_alburnus}}';  
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
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Culter-alburnus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HuanLiu2021'; type = 'article'; bib = [ ... 
'doi = {10.1007/s10641-021-01181-w}, ' ...
'author = {Yan F. Huang and Liang G. Liu and Bo L. Song and Tao H. Deng and Qin Wang and Qi Shen}, ' ... 
'year = {2021}, ' ...
'title = {Ontogenetic development, allometric growth patterns, and daily increment validation of larvae and juvenile \emph{Culter alburnus}}, ' ...
'journal = {Environ Biol Fish}, ' ...
'volume = {104}, ' ...
'pages = {1593–1610}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'QinXion2009'; type = 'article'; bib = [ ... 
'doi = {10.1007/s10641-021-01181-w}, ' ...
'author = {Liang Qin and Bang-xi Xiong and Guang-jun L\"{u}}, ' ... 
'year = {2009}, ' ...
'title = {Individual fecundity of \emph{Culter alburnus} in {X}ujiahe Reservoir of {C}hina}, ' ...
'journal = {Chinese Journal of Applied Ecology}, ' ...
'volume = {20(8)}, ' ...
'pages = {1952-1957}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

