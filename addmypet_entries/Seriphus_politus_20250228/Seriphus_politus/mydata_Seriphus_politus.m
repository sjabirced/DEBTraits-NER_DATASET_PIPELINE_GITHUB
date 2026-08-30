function [data, auxData, metaData, txtData, weights] = mydata_Seriphus_politus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Seriphus_politus'; 
metaData.species_en = 'Queen croaker'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', '0jMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(11); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 02 28];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 02 28];

%% set data
% zero-variate data

data.am = 11*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'guess';   
  temp.am = C2K(11); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 10.3;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase';
data.Li  = 30;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 1.34e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'DemaFoun1981';
  comment.Wwb = 'based on egg diameter of 0.635 mm: pi/6*0.0635^3';
data.Wwp = 16.6;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'Based on 0.01230*Lp^3.09, see F1';
data.Wwi = 451;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01230*Li^3.09, see F1';

data.Ri = 2.2e6/365;  units.Ri = '#/d';    label.Ri = 'reprodion rate at TL 25 cm';   bibkey.Ri = 'DemaFoun1981';   
  temp.Ri = C2K(11);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
 
% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.423	8.369
0.468	11.082
0.469	9.997
1.315	11.464
1.345	10.223
1.346	12.781
1.360	8.828
1.361	9.138
1.362	11.773
1.375	8.440
1.404	10.688
1.405	11.308
1.406	12.238
2.266	13.550
2.267	10.914
2.296	12.775
2.297	11.767
2.298	11.457
2.299	10.604
2.312	14.247
2.313	12.077
3.203	11.063
3.204	12.768
3.205	15.559
3.218	12.380
3.234	14.241
3.235	14.473
3.247	11.838
3.248	13.078
3.249	13.310
3.250	13.621
3.251	16.411
4.125	15.630
4.140	15.940
4.141	14.700
4.142	13.149
4.155	16.870
4.170	13.692
4.171	12.374
4.185	15.009
4.186	14.079
4.986	14.771
5.016	13.608
5.032	15.081
5.047	15.468
5.048	16.941
5.062	16.166
5.063	16.476
5.077	14.305
5.092	12.755
5.938	17.788
5.952	19.958
5.953	18.098
5.954	17.090
5.955	14.764
5.966	16.392
5.967	15.849
5.968	15.462
5.969	12.981
5.982	14.066
5.983	13.834
5.984	12.128
6.875	16.076
6.890	15.533
6.891	17.238
6.905	18.789
6.920	16.773
6.921	18.401
7.782	19.092
7.797	17.697
7.812	19.712
7.813	16.922
7.814	16.224
8.673	19.009
8.703	18.233
8.704	18.698
8.718	16.683
8.734	15.210
8.735	17.458
8.749	16.140
9.640	17.762
9.655	19.389
9.656	17.451
9.657	15.901
9.670	13.885
10.547	20.623
11.484	15.500
11.485	18.214];
data.tL_f(:,1) = 365 * (1.2 + data.tL_f(:,1)); % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-1;end;end
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f = C2K(11);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'MillWill2009'; 
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.468	10.225
1.481	8.607
1.496	11.335
1.497	10.839
1.498	9.971
1.499	9.785
1.511	11.954
1.512	10.467
1.526	10.219
1.527	8.111
2.493	12.755
2.494	11.205
2.508	11.949
2.507	11.639
2.538	12.259
3.490	11.075
3.491	13.741
3.505	11.633
3.506	12.439
3.521	14.670
3.536	12.935
4.457	12.124
4.488	13.797
4.503	12.991
4.504	12.619
4.533	11.627
5.470	13.792
5.471	14.101
5.472	14.783
5.485	14.473
5.500	13.420
5.515	12.490
5.516	16.023
6.497	13.662
7.495	15.640
9.504	16.248
11.514	15.865];
data.tL_m(:,1) = 365 * (1.2 + data.tL_m(:,1)); % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-1;end;end
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m = C2K(11);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'MillWill2009'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Li = 5 * weights.Li;
weights.Wwi = 5 * weights.Wwi;
weights.Wwp = 0 * weights.Wwp;

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
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01230*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4WVK6'; % Cat of Life
metaData.links.id_ITIS = '169362'; % ITIS
metaData.links.id_EoL = '46579245'; % Ency of Life
metaData.links.id_Wiki = 'Seriphus_politus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '187419'; % Taxon
metaData.links.id_WoRMS = '282761'; % WoRMS
metaData.links.id_fishbase = 'Seriphus-politus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Seriphus_politus}}';
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
bibkey = 'MillWill2009'; type = 'article'; bib = [ ... 
'doi = {10.1577/C08-018.1}, ' ...
'author = {Eroc F. Miller and Jonathan P. Williams and Daniel J. Pondella and Kevin T. Herbinson}, '...
'year = {2009}, ' ...
'title = {Life History, Ecology, and Long-term Demographics of Queenfish}, ' ...
'journal = {Marine and Coastal Fisheries: Dynamics, Management, and Ecosystem Science}, ' ....
'volume = {1}, ' ...
'pages = {187–199}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DemaFoun1981'; type = 'article'; bib = [ ... 
'doi = {10.1577/C08-018.1}, ' ...
'author = {E. E. Demartini and Robert K. Fountain}, '...
'year = {1981}, ' ...
'title = {OVARIAN CYCLING FREQUENCY AND BATCH FECUNDITY IN THE QUEENFISH, \emph{Seriphus politus}: ATTRIBUTES REPRESENTATIVE OF SERIAL SPAWNING FISHES}, ' ...
'journal = {Fishery Bulletin}, ' ....
'volume = {79(3)}, ' ...
'pages = {547-560}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Seriphus-politus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

