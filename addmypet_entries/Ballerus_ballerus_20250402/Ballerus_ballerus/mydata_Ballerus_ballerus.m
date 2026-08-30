function [data, auxData, metaData, txtData, weights] = mydata_Ballerus_ballerus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Ballerus_ballerus'; 
metaData.species_en = 'Zope'; 

metaData.ecoCode.climate = {'Dfd'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr','0iFl'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 02];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 02];

%% set data
% zero-variate data

data.am = 15*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'KompBlas1997';   
  temp.am = C2K(12);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 25.5;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';     bibkey.Lp  = 'fishbase'; 
data.Li  = 49.0;     units.Li  = 'cm';  label.Li  = 'ultimate total length of female';  bibkey.Li  = 'fishbase';

data.Wwb = 2e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on guessed egg diameter of 1.575 mm of Brama brama: pi/6*.1575^3';
data.Wwp = 167;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00661*Lp^3.13, see F1';
data.Wwi = 1290;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00661*Li^3.13, see F1; max. published weight: 1.1 kg';

data.Ri  = 112936/365; units.Ri  = '#/d'; label.Ri  = 'max reproduction rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(12); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
    2 13.7
    3 19.9
    4 21.3
    5 24.7
    6 25.6
    7 29.5
    9 32.3
   10 34.3
   11 34.5
   12 34.5
   13 35.9];
data.tL(:,1) = 365 * (.9 + data.tL(:,1)); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(12);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'KompBlas1997';

% length-fecundity
data.LN = [ ... % std length (cm), fecundity (#)
22.910	10062.164
23.526	10439.551
23.610	19122.778
24.157	14250.614
24.312	10203.525
24.354	15050.165
24.420	16057.408
24.482	10398.166
24.719	12004.083
24.941	10782.357
25.017	8152.768
25.123	9562.332
25.316	24503.462
25.334	11775.414
25.556	10755.711
26.439	19000.322
26.527	33945.988
27.214	21997.082
27.326	13103.341
27.509	33095.413
27.689	27431.069
27.792	45002.367
28.000	43377.181
28.207	39125.807
28.305	48616.516
28.501	47597.940
28.719	40921.823
28.882	50409.697
28.911	54448.849
29.184	50396.658
29.312	47158.757
29.412	39477.672
29.490	38666.209
29.528	55634.292
29.570	40480.940
29.588	48560.951
29.718	47141.183
29.728	61686.217
29.838	49156.223
29.865	30367.180
30.007	48340.793
30.094	61266.322
30.180	51767.670
30.273	53985.856
30.406	57010.407
30.489	64077.512
30.490	46097.663
30.499	59834.636
30.502	44076.947
30.682	58008.579
30.744	53763.436
30.779	47499.289
30.790	62852.384
30.831	66486.948
30.985	61429.781
31.074	37183.512
31.081	67284.231
31.107	47283.099
31.192	57986.469
31.261	83033.995
31.323	58182.810
31.379	62422.839
31.466	56560.453
31.486	65852.558
31.549	62617.492
31.596	54938.674
31.661	53521.740
31.710	47863.065
31.850	41998.410
31.874	59371.087
31.881	70077.847
31.990	76335.763
32.012	69870.167
32.083	58553.962
32.173	75115.738
32.213	57336.204
32.263	73091.626
32.275	71070.916
32.278	56525.303
32.387	62379.186
32.408	54095.469
32.417	68034.460
32.434	74498.355
32.480	64597.383
32.590	52269.400
32.597	62572.138
32.603	72874.875
32.605	55905.086
32.776	76503.770
32.789	55695.138
32.871	61752.177
32.982	51646.348
33.011	75281.477
33.234	75271.839
33.350	53448.607
33.466	70009.249
33.467	72231.414
33.468	73847.524
33.570	88792.635
33.662	69394.712
33.780	90197.663
33.789	83934.644
33.844	107164.606
33.898	69788.529
34.089	40891.394
34.159	88161.079
34.200	90381.532
34.266	71792.798
34.370	70576.175
34.483	82692.509
34.502	112994.690
34.513	88549.794
35.307	81242.694
35.511	52951.030
35.828	77583.752];
units.LN   = {'cm', '#'};  label.LN = {'std length','fecundity'};  
temp.LN    = C2K(12);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'KompBlas1997';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwp = 0 * weights.Wwp;

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
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00661*(TL in cm)^3.13';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'KHGW'; % Cat of Life
metaData.links.id_ITIS = '1199694'; % ITIS
metaData.links.id_EoL = '46581662'; % Ency of Life
metaData.links.id_Wiki = 'Ballerus_ballerus'; % Wikipedia
metaData.links.id_ADW = 'Ballerus_ballerus'; % ADW
metaData.links.id_Taxo = '1009030'; % Taxonomicon
metaData.links.id_WoRMS = '279859'; % WoRMS
metaData.links.id_fishbase = 'Ballerus-ballerus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ballerus_ballerus}}';
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
bibkey = 'KompBlas1997'; type = 'Article'; bib = [ ... 
'doi = {10.3750/AIP1997.27.2.05}, ' ...
'author = {Andrzej Kompowski and Piotr B{\l}aszczyk}, ' ... 
'year = {1997}, ' ...
'title = {Reproduction and fecundity of blue bream \emph{Abramis ballerus} {L}., 1758 in {M}iedzyodrze}, ' ...
'journal = {Acta Ichthyologica et Piscatoria}, ' ...
'volume = {27(2)}, ' ...
'pages = {57-77}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Ballerus_ballerus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
