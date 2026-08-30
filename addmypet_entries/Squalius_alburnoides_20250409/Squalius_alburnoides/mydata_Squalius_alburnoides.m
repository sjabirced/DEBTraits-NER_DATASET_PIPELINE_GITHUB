  function [data, auxData, metaData, txtData, weights] = mydata_Squalius_alburnoides
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Squalius_alburnoides'; 
metaData.species_en = 'Iberian roach'; 

metaData.ecoCode.climate = {'Cfb', 'Csb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFp', '0iFm'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'jiHl', 'jiD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 09];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 09];

%% set data
% zero-variate data
data.am = 11*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(12); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 3.9;  units.Lp = 'cm'; label.Lp = 'fork length at puberty'; bibkey.Lp = 'MaiaMaria2006'; 
data.Li = 25;    units.Li = 'cm'; label.Li = 'ultimate fork length';  bibkey.Li = 'fishbase';

data.Wwb = 1.9e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.54 mm: pi/6*0.154^3';
data.Wwp = 0.52;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'MaiaMaria2006','fishbase'};
  comment.Wwp = 'based on 0.00724*Lp^3.14, see F1';
data.Wwi = 117;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00724*Li^3.14, see F1; max. published weight: 620 g ';

% univariate data

% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
    1  3.4 3.6 3.6
    2  4.8 5.0 4.4
    3  6.1 6.1 5.1
    4  7.1 7.1 NaN
    5  NaN 7.6 NaN];
data.tL(:,1) = 365 * (0.2 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'fork length'};  
temp.tL = C2K(12);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'RibeCowx2003'; treat.tL = {1 {'diploid females','triploid females','diploid males'}};

% length-fecundity
data.LN_t = [ ... log10 std length (mm), log10 fecundity (#)
1.634	0.601
1.656	1.098
1.675	2.942
1.682	2.706
1.682	3.029
1.690	2.943
1.690	2.124
1.691	1.952
1.692	1.758
1.693	2.814
1.698	3.246
1.699	2.987
1.699	2.728
1.716	3.139
1.724	3.096
1.725	2.234
1.725	2.838
1.733	3.118
1.733	3.022
1.749	3.324
1.749	2.839
1.750	3.055
1.770	2.970
1.772	3.024
1.772	2.507
1.773	3.121
1.779	2.949
1.780	3.175
1.780	3.509
1.786	2.605
1.789	3.241
1.794	3.327
1.794	2.724
1.794	3.198
1.796	3.047
1.800	3.554
1.801	3.392
1.802	2.994
1.802	3.446
1.802	3.349
1.807	3.209
1.808	2.617
1.809	3.371
1.814	2.930
1.814	3.382
1.821	3.016
1.821	2.801
1.822	3.243
1.827	3.319
1.827	3.232
1.828	2.694
1.833	3.039
1.834	3.147
1.835	3.599
1.835	3.416
1.847	2.964
1.847	3.568
1.848	3.751
1.852	3.051
1.858	3.105
1.860	3.730
1.860	3.310
1.861	3.849
1.862	3.666
1.863	3.418
1.870	3.580
1.870	3.472
1.871	3.634
1.877	3.462
1.877	3.236
1.879	3.667
1.885	3.279
1.888	3.861
1.889	3.721
1.891	3.635
1.894	3.657
1.897	3.528
1.898	3.733
1.899	3.614
1.899	3.226
1.905	3.776
1.909	3.011
1.914	3.777
1.916	3.885
1.921	3.109
1.925	3.390
1.927	3.918
1.941	3.681
1.957	3.876];
data.LN_t = 10.^data.LN_t; % remove log transform
data.LN_t(:,1) = data.LN_t(:,1)/10; % convert mm to cm
units.LN_t = {'cm', '#'}; label.LN_t = {'std length','fecundity','triploids'};  
temp.LN_t = C2K(12);  units.temp.LN_t = 'K'; label.temp.LN_t = 'temperature';
bibkey.LN_t = 'RibeCowx2003'; 
%
data.LN_d = [ ...
1.604	0.933
1.612	2.410
1.624	1.506
1.626	2.691
1.673	2.576
1.673	1.692
1.681	2.760
1.682	3.126
1.700	2.082
1.709	2.697
1.718	2.977
1.719	2.783
1.725	2.633
1.734	2.601
1.741	2.666
1.749	3.454
1.751	3.109
1.767	3.228
1.772	3.563
1.772	3.434
1.782	3.725
1.792	3.058
1.802	2.907
1.814	2.477
1.815	3.458
1.820	3.674
1.820	3.437
1.823	3.501
1.827	3.448
1.829	3.523
1.831	3.707
1.856	3.579
1.862	3.493
1.874	3.602
1.877	3.365
1.879	3.731
1.880	3.537
1.897	3.582
1.916	3.648
1.917	3.120
1.922	3.734
1.932	3.552
1.952	3.790];
data.LN_d = 10.^data.LN_d; % remove log transform
data.LN_d(:,1) = data.LN_d(:,1)/10; % convert mm to cm
units.LN_d = {'cm', '#'}; label.LN_d = {'std length','fecundity','diploids'};  
temp.LN_d = C2K(12);  units.temp.LN_d = 'K'; label.temp.LN_d = 'temperature';
bibkey.LN_d = 'RibeCowx2003'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;
weights.Li = 5 * weights.Li;
weights.Wwi = 5 * weights.Wwi;
weights.Wwb = 5 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LN_t', 'LN_d'}; subtitle1 = {'Data for triploids, diploids'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males and triploid females are assumed to differ from diploid females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00794*(TL in cm)^3.11';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Iberian Peninsula in Douro, Tagus, Sado, Guadiana, Odiel, Guadalquivir and Quarteira drainages. Introduced in Júca drainage';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'Interspecific hybridization occurs between males of Squalius carolitertii and females of Squalius alburnoides';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = '6ZDZL'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '220096'; % Ency of Life
metaData.links.id_Wiki = 'Squalius_alburnoides'; % Wikipedia
metaData.links.id_ADW = 'Squalius_alburnoides'; % ADW
metaData.links.id_Taxo = '2741711'; % Taxonomicon
metaData.links.id_WoRMS = '1020902'; % WoRMS
metaData.links.id_fishbase = 'Squalius-alburnoides'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Squalius_alburnoides}}';  
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
bibkey = 'RibeCowx2003'; type = 'Article'; bib = [ ...
'doi = {10.1127/0003-9136/2003/0156-0471}, ' ...
'author = {Ribeiro, F. and Cowx, I. G. and Tiago, P. and Filipe, A. F. and Moreira Da Costa, L. and Collares-Pereira, M. J.}, ' ...
'year = {2003}, ' ...
'title = {Growth and reproductive traits of diploid and triploid forms of the \emph{Squalius alburnoides} cyprinid complex in a tributary of the {G}uadiana {R}iver, {P}ortugal}, ' ... 
'journal = {Archiv Fur Hydrobiologie}, ' ...
'volume = {156(4)}, '...
'pages = {471–484}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Squalius-alburnoides.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

