function [data, auxData, metaData, txtData, weights] = mydata_Elops_lacerta

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Elopiformes'; 
metaData.family     = 'Elopidae';
metaData.species    = 'Elops_lacerta'; 
metaData.species_en = 'West African ladyfish'; 

metaData.ecoCode.climate = {'MC', 'MB'};
metaData.ecoCode.ecozone = {'MAW','MAg','THn'};
metaData.ecoCode.habitat = {'0iMr', '0iMcp', 'piFe', 'piFr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'bpCi', 'piCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Ls'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'tL'; 'L-Ww'}; 
metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 27];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 27];

%% set data
% zero-variate data;
data.ab = 4.5;   units.ab = 'd';    label.ab = 'age at birth';                            bibkey.ab = 'guess'; 
  temp.ab = C2K(26.7);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 55*365;units.am = 'd';    label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(26.7); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on Elops_saurus';

data.Ls  = 2.8;   units.Ls  = 'cm';  label.Ls  = 'standard length at metamorphosis to stage 2'; bibkey.Ls  = 'guess';
  comment.Ls = 'based on Megalops atlanticus';
data.Lp  = 52;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';   bibkey.Lp  = 'guess';
  comment.Lp = 'based on Elops_saurus';
data.Li  = 100;   units.Li  = 'cm';  label.Li  = 'ultimate total length';     bibkey.Li  = 'fishbase';

data.Wwb = 5.23e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on  egg diameter of 1 mm : pi/6*0.1^3';
data.Wwp = 807; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'SantArbo1993','fishbase'};
  comment.Wwp = 'based on  0.00646*Lp^2.97, see F1';
data.Wwi = 5.6e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';                bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on  0.00646*Li^2.97, see F1';

data.Ri  = 519400/365; units.Ri  = '#/d';label.Ri  = 'reprod rate at TL 95 cm';       bibkey.Ri  = 'guess';   
  temp.Ri = C2K(26.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Elops_saurus';

% univariate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm) 
    1 16.45
    2 25.45];
data.tL(:,1) = 365 * (0.1+data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(26.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'LawsAgud2010';

% length-weight
data.LW_f = [ ... % log10 total length (mm), log10 wet weight (g)
2.210	1.394
2.231	1.481
2.232	1.414
2.233	1.420
2.241	1.346
2.243	1.447
2.273	1.602
2.275	1.561
2.285	1.446
2.291	1.520
2.303	1.608
2.314	1.574
2.338	1.742
2.342	1.769
2.343	1.668
2.353	1.837
2.358	1.796
2.364	1.782
2.367	1.823
2.373	1.856
2.380	1.849
2.383	1.951
2.388	1.809
2.390	1.863
2.395	1.903
2.402	1.862
2.404	1.944
2.404	1.964
2.405	1.903
2.413	1.869
2.416	1.957
2.425	1.950
2.430	2.065
2.436	2.031
2.436	1.922
2.442	2.037
2.448	1.969
2.449	2.024
2.452	2.145
2.453	2.098
2.453	1.976
2.455	2.050
2.459	2.098
2.463	2.064
2.464	2.030
2.468	2.091
2.469	2.057
2.472	2.158
2.473	2.063
2.479	2.111
2.483	2.138
2.520	2.245
2.568	2.305];
data.LW_f = 10.^data.LW_f; data.LW_f(:,1) = data.LW_f(:,1)/ 10; % remove log transform and convert mm to cm
units.LW_f = {'cm', 'g'};     label.LW_f = {'total length','wet weight','females'};  
bibkey.LW_f = 'LawsAgud2010';
%
data.LW_m = [ ... % total length (mm), wet weight (g)
2.167	1.275
2.168	1.305
2.179	1.269
2.182	1.233
2.183	1.335
2.188	1.281
2.193	1.293
2.195	1.335
2.198	1.377
2.204	1.479
2.206	1.359
2.211	1.311
2.214	1.359
2.221	1.425
2.224	1.479
2.229	1.401
2.233	1.485
2.238	1.425
2.242	1.425
2.244	1.497
2.246	1.365
2.253	1.449
2.253	1.353
2.253	1.581
2.256	1.521
2.256	1.407
2.258	1.324
2.262	1.485
2.268	1.497
2.274	1.402
2.278	1.497
2.279	1.581
2.281	1.617
2.283	1.462
2.284	1.533
2.287	1.605
2.287	1.491
2.289	1.497
2.291	1.629
2.302	1.743
2.303	1.587
2.308	1.611
2.312	1.617
2.319	1.701
2.323	1.606
2.324	1.683
2.328	1.504
2.331	1.689
2.333	1.432
2.333	1.618
2.334	1.779
2.336	1.689
2.337	1.743
2.343	1.695
2.344	1.749
2.345	1.648
2.347	1.749
2.351	1.696
2.352	1.821
2.352	1.737
2.361	1.779
2.363	1.773
2.367	1.905
2.372	1.768
2.373	1.881
2.378	1.810
2.381	1.744
2.381	1.875
2.382	1.845
2.385	1.899
2.389	1.929
2.390	1.852
2.392	1.905
2.394	1.846
2.395	1.786
2.397	1.911
2.399	1.864
2.401	1.894
2.402	1.995
2.403	1.840
2.404	1.929
2.408	1.965
2.410	1.894
2.413	1.983
2.416	1.983
2.416	1.936
2.420	2.055
2.421	1.948
2.425	1.978
2.426	2.067
2.427	1.870
2.430	2.025
2.434	1.954
2.435	2.061
2.440	2.026
2.440	1.978
2.447	2.008
2.447	2.115
2.450	1.978
2.452	2.080
2.465	2.068
2.467	2.146
2.480	2.164
2.482	2.223
2.486	2.146
2.489	2.140
2.503	2.206
2.515	2.266
2.530	2.278
2.534	2.284
2.550	2.332];
data.LW_m = 10.^data.LW_m; data.LW_m(:,1) = data.LW_m(:,1)/ 10; % remove log transform and convert mm to cm
units.LW_m = {'cm', 'g'};     label.LW_m = {'total length','wet weight','males'};  
bibkey.LW_m = 'LawsAgud2010';

%% set weights for all real data
weights = setweights(data, []);
weights.tL =  5 * weights.tL;

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
set1 = {'LW_f','LW_m'}; subtitle1 = {'data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females (lack of data)';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00646*(TL in cm)^2.97';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Eastern Atlantic: coastal waters of West Africa from Mauritania to Angola or Namibia. Sometimes it enters freshwater, like in Cross River and Kouilou-Niari River';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '39CJ8'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46561208'; % Ency of Life
metaData.links.id_Wiki = 'Elops_lacerta'; % Wikipedia
metaData.links.id_ADW = 'Elops_lacerta'; % ADW
metaData.links.id_Taxo = '173630'; % Taxonomicon
metaData.links.id_WoRMS = '275405'; % WoRMS
metaData.links.id_fishbase = 'Elops_lacerta'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Elops_saurus}}';  
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
bibkey = 'LawsAgud2010'; type = 'Article'; bib = [ ...  
'doi = {10.5251/abjna.2010.1.5.974.984}, ' ...
'author = {Lawson, Emmanuel O. and Aguda, Abigail F.}, ' ...
'year = {2010}, ' ...
'title  = {Growth patterns, diet composition and reproduction in the ten pounder, \emph{Elops lacerta} from {O}loge lagoon, {L}agos, {N}igeria}, ' ...
'journal = {Agriculture and Biology Hournal of North America}, ' ...
'volume = {1(5)}, ' ...
'pages = {974-984}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Elops_lacerta.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

