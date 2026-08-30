function [data, auxData, metaData, txtData, weights] = mydata_Selene_dorsalis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Carangiformes'; 
metaData.family     = 'Carangidae';
metaData.species    = 'Selene_dorsalis'; 
metaData.species_en = 'African moonfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20.6); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 03 01];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 01];

%% set data
% zero-variate data

data.ab = 1.4;        units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'fishbase';   
  temp.ab = C2K(20.6);units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 30 * 365;   units.am = 'd';    label.am = 'life span';                 bibkey.am = 'fishbase'; 
  temp.am = C2K(20.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 21.29;      units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'ArraSyll2018'; 
  comment.Lp = 'for females';
data.Li  = 40;        units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.78e-4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.81 mm of Trachurus_mediterraneus: pi/6*0.081^3';
data.Wwp = 253.7;      units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwi = 'based on 0.01479*Lp^2.89, see F1';
data.Wwi = 1143;      units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'ArraSyll2018';
  comment.Wwi = 'based on 496.6 g at TL 30.3; max. published weight: 1.5 kg';

data.GSI  = 0.056;  units.GSI  = 'g/g'; label.GSI  = 'gonado-somatic index';   bibkey.GSI  = 'ArraSyll2018';   
temp.GSI = C2K(20.6); units.temp.GSI = 'K';    label.temp.GSI = 'temperature';
 
% uni-variate data
% time-length
data.tL = [  % time since birth (d), total length (cm)
129.065	7.094
188.666	8.718
219.904	9.231
309.921	10.598
365-0.822	11.538
365+65.766	13.590
365+129.476	15.299];
data.tL(:,1) = data.tL(:,1) + 100; % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(20.6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'AmpoAsie2021';

% length-weight
data.LW_f = [ ... % total length (log cm), weight (log g)
2.170	2.522
2.198	2.646
2.232	2.691
2.311	3.005
2.330	3.140
2.339	3.095
2.341	3.174
2.363	3.129
2.431	3.365
2.450	3.455
2.482	3.612
2.495	3.533
2.559	3.747
2.564	3.792
2.600	3.792
2.602	3.938
2.613	3.949
2.617	4.118
2.630	4.062
2.647	4.017
2.651	4.095
2.654	4.005
2.662	4.140
2.662	4.084
2.673	4.118
2.686	4.185
2.694	4.230
2.698	4.129
2.703	4.331
2.709	4.196
2.711	4.163
2.713	4.320
2.713	4.241
2.724	4.331
2.728	4.264
2.733	4.410
2.748	4.286
2.748	4.241
2.750	4.500
2.756	4.421
2.758	4.342
2.776	4.286
2.778	4.432
2.782	4.511
2.786	4.455
2.790	4.421
2.797	4.590
2.799	4.511
2.803	4.556
2.808	4.387
2.810	4.691
2.816	4.533
2.816	4.387
2.827	4.713
2.831	4.567
2.835	4.601
2.840	4.747
2.842	4.668
2.848	4.544
2.859	4.725
2.859	4.623
2.867	4.691
2.874	4.758
2.882	4.781
2.882	4.691
2.889	4.950
2.891	4.848
2.895	4.814
2.897	4.690
2.904	4.612
2.906	4.882
2.906	4.679
2.908	4.837
2.923	4.949
2.927	4.803
2.932	4.882
2.936	4.859
2.938	5.152
2.940	5.005
2.953	5.039
2.968	4.881
2.977	5.028
2.981	5.174
2.996	5.219
3.000	5.050
3.009	5.185
3.009	5.073
3.013	5.264
3.015	5.174
3.019	5.253
3.030	5.174
3.039	5.219
3.041	5.129
3.047	5.309
3.053	5.376
3.060	5.500
3.075	5.252
3.077	5.365
3.086	5.309
3.088	5.410
3.098	5.444
3.107	5.387
3.118	5.511
3.118	5.455
3.165	5.680
3.169	5.680
3.190	5.657
3.205	5.724
3.220	5.747
3.233	5.769
3.263	5.870
3.293	6.140];
data.LW_f = exp(data.LW_f); % remove log transform
units.LW_f   = {'cm', 'g'};  label.LW_f = {'total length', 'weight', 'females'};  
bibkey.LW_f = 'ArraSyll2018';
%
data.LW_m = [ ... % total length (log cm), weight (log g)
2.002	1.969
2.234	2.673
2.276	2.877
2.319	2.990
2.332	3.051
2.379	3.050
2.385	3.214
2.400	3.132
2.411	3.306
2.452	3.479
2.524	3.704
2.546	3.612
2.550	3.786
2.574	3.888
2.593	3.908
2.595	3.816
2.601	3.959
2.623	4.000
2.642	3.908
2.659	4.071
2.661	3.989
2.670	4.214
2.674	4.102
2.698	4.296
2.698	4.235
2.702	4.020
2.706	4.112
2.710	4.255
2.728	4.153
2.736	4.306
2.738	4.418
2.738	4.204
2.753	4.326
2.758	4.203
2.764	4.439
2.766	4.510
2.777	4.449
2.779	4.244
2.783	4.357
2.790	4.571
2.802	4.469
2.807	4.346
2.828	4.632
2.828	4.551
2.828	4.397
2.845	4.469
2.849	4.827
2.854	4.540
2.856	4.755
2.858	4.643
2.877	4.632
2.884	4.786
2.888	4.888
2.899	4.652
2.901	4.744
2.909	4.796
2.920	4.724
2.929	4.990
2.931	4.867
2.937	4.744
2.939	4.908
2.946	4.785
2.950	5.051
2.961	4.959
2.961	4.846
2.963	5.041
2.971	4.979
2.974	4.785
2.976	5.112
2.982	5.255
2.984	5.030
2.997	5.132
3.014	5.255
3.046	5.296
3.049	5.173
3.074	5.306
3.076	5.183
3.081	5.439
3.089	5.367
3.113	5.428
3.119	5.316
3.121	5.571
3.121	5.500
3.158	5.500
3.164	5.612
3.226	5.806
3.230	5.734
3.267	5.642
3.277	5.836];
data.LW_m = exp(data.LW_m); % remove log transform
units.LW_m   = {'cm', 'g'};  label.LW_m = {'total length', 'weight', 'males'};  
bibkey.LW_m = 'ArraSyll2018';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: wet weight (g) = 0.01479*(TL in cm)^2.89';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6YBXH'; % Cat of Life
metaData.links.id_ITIS = '641954'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Selene'; % Wikipedia
metaData.links.id_ADW = 'Selene_dorsalis'; % ADW
metaData.links.id_Taxo = '187379'; % Taxonomicon
metaData.links.id_WoRMS = '126814'; % WoRMS
metaData.links.id_fishbase = 'Selene-dorsalis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Selene}}';
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
bibkey = 'AmpoAsie2021'; type = 'Article'; bib = [ ... 
'doi = {10.24018/ejbio.2021.2.2.154}, ' ...
'author = {Samuel K.K. Amponsah and Berchie Asiedu and Selasi Yao Avornyo and Seyramsarah Blossom Setufe and Nana Ama Boadu Afranewaa and Pierre Failler}, ' ... 
'year = {2021}, ' ...
'title = {Growth, Mortality and Exploitation Rates of {A}frican Moonfish (\emph{Selene dorsalis}, {G}ill 1863) Encountered in the {C}oast of {G}hana ({W}est {A}frica)}, '...
'journal = {European Journal of Biology and Biotechnology}, ' ...
'volume = {2(2)}, ' ...
'pages = {17-26}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ArraSyll2018'; type = 'Article'; bib = [ ... 
'author = {Stanislas Arra and Souma\"{i}la Sylla and Amoin C\''{e}line Kouame and Tiz\''{e} Thierry Zanbi and Mamadou Ouattara}, ' ... 
'year = {2018}, ' ...
'title = {Reproductive biology of the {A}frican moonfish, \emph{Selene dorsalis} ({G}ill, 1862) ({C}arangidae) in continental shelf of C\^{o}te d''Ivoire fishery ({W}est {A}frica)}, '...
'journal = {International Journal of Fisheries and Aquatic Studies}, ' ...
'volume = {6(2)}, ' ...
'pages = {358-363}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Selene-dorsalis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

