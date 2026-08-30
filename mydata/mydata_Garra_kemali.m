function [data, auxData, metaData, txtData, weights] = mydata_Garra_kemali
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Garra_kemali'; 
metaData.species_en = 'Eregli minnow'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bjCi','biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 14];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 14];

%% set data
% zero-variate data

data.am = 4*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'SajaMerc2015';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 4;    units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'SariIlha2008'; 
data.Li = 7.5;    units.Li = 'cm'; label.Li = 'ultimate total length';       bibkey.Li = 'fishbase'; 
  
data.Wwb = 3.8e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'SariIlha2008';
  comment.Wwb = 'based on egg diameter of 0.9 mm: pi/6*0.09^3';
data.Wwp = 1;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'SariIlha2008';
  comment.Wwp = 'fishbase: 0.01047*Lp^3.02, see F1, gives 0.7 g';
data.Wwi = 6.6;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'SariIlha2008';
  comment.Wwi = 'fishbase: 0.01047*Li^3.02, see F1, gives 4.6 g';

data.Ri = 666/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate'; bibkey.Ri = 'SariIlha2008';   
  temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

%% univariate data
 
% time-length-weight
data.tLW = [ ... % time (yr), total length (cm), weight (g)
    1 4.72 1.44
    2 6.06 3.08
    3 6.90 4.66
    4 7.53 5.83];
data.tLW(:,1) = 365*(0.7++data.tLW(:,1)); % convert yr to d
units.tLW = {'d', 'cm', 'g'}; label.tLW = {'time since birth', 'total length', 'weight'};  
temp.tLW = C2K(20);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'SariIlha2008'; treat.tLW = {1 {'length','weight'}};
 
% length-weight
data.LW_f = [ ... % total length (cm), weight (g)
3.427	0.617
3.608	0.722
3.709	0.710
3.809	0.815
3.839	0.698
4.020	1.061
4.020	0.932
4.121	1.014
4.211	1.225
4.211	1.131
4.231	0.896
4.322	1.107
4.412	1.200
4.422	0.918
4.492	1.317
4.623	1.540
4.633	1.434
4.633	1.340
4.714	1.822
4.714	1.551
4.714	0.835
4.734	1.457
4.774	1.340
4.804	1.457
4.814	1.704
4.814	1.528
4.894	1.457
4.925	1.915
4.925	1.210
4.975	1.903
5.005	1.527
5.005	1.445
5.035	1.832
5.035	1.703
5.106	1.691
5.106	1.926
5.126	1.820
5.206	2.524
5.206	2.207
5.206	1.843
5.226	2.113
5.226	1.585
5.296	1.714
5.317	2.136
5.317	1.878
5.327	2.324
5.397	2.841
5.397	2.300
5.397	2.148
5.447	2.195
5.508	2.359
5.518	2.124
5.538	2.535
5.608	3.040
5.608	2.370
5.608	2.323
5.608	2.264
5.628	2.605
5.698	2.605
5.709	2.910
5.779	2.616
5.789	3.109
5.799	2.804
5.819	2.945
5.829	2.545
5.889	2.768
5.889	2.580
5.899	3.097
5.899	2.921
5.899	2.827
5.899	2.498
5.899	2.416
5.910	3.825
5.910	2.674
5.920	2.275
5.990	3.085
6.000	3.520
6.000	2.815
6.090	2.709
6.101	3.202
6.101	3.002
6.121	2.908
6.231	3.812
6.271	2.920
6.291	3.495
6.332	3.612
6.332	3.777
6.382	4.105
6.392	3.025
6.402	4.000
6.412	4.211
6.432	3.635
6.482	3.823
6.503	3.635
6.523	3.917
6.523	3.729
6.573	4.798
6.593	3.905
6.613	4.034
6.613	2.190
6.714	4.222
6.814	4.797
7.095	5.289
7.106	5.207
7.296	5.394
7.407	5.710
7.437	5.487
7.497	6.603];
units.LW_f = {'cm', 'g'}; label.LW_f = {'total length','weight','females'};  
bibkey.LW_f = 'SariIlha2008'; 
%
data.LW_m = [ ...
3.524	0.494
3.584	0.779
3.675	0.623
3.695	0.649
3.715	0.779
3.795	0.623
3.815	0.766
3.885	0.792
3.976	0.792
4.086	1.000
4.106	0.896
4.106	0.818
4.176	1.091
4.196	0.870
4.226	1.065
4.296	0.974
4.316	0.974
4.347	1.039
4.367	0.909
4.386	1.273
4.386	1.208
4.407	1.117
4.417	0.974
4.467	1.078
4.487	1.221
4.487	1.000
4.487	0.844
4.497	1.403
4.507	1.221
4.567	1.104
4.597	1.494
4.607	1.299
4.617	1.156
4.637	1.390
4.688	0.714
4.707	1.442
4.717	1.610
4.717	1.260
4.757	1.519
4.798	1.377
4.837	1.571
4.857	1.896
4.868	1.338
4.878	1.506
4.898	1.688
4.899	0.714
4.968	1.883
4.968	1.481
4.978	1.597
4.988	1.208
4.997	2.234
5.008	1.779
5.008	1.662
5.028	1.714
5.038	1.403
5.098	1.844
5.098	1.519
5.128	1.662
5.178	2.013
5.189	1.688
5.219	1.571
5.288	2.390
5.299	1.883
5.299	1.558
5.309	1.987
5.309	1.831
5.309	1.636
5.409	2.104
5.499	2.299
5.499	1.779
5.508	2.623
5.509	2.455
5.539	1.922
5.599	2.143
5.600	1.779
5.669	2.688
5.679	2.532
5.679	2.442
5.710	2.221
5.799	2.675
5.879	3.104
5.900	2.623
6.000	2.727
6.100	3.182
6.100	2.727
6.190	3.104
6.230	3.221
6.901	4.506
7.092	4.104];
units.LW_m = {'cm', 'g'}; label.LW_m = {'total length','weight','males'};  
bibkey.LW_m = 'SariIlha2008'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 10 * weights.tLW;
weights.Li = 3 * weights.Li;
weights.Wwi = 3 * weights.Wwi;
weights.Wwb = 3 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: W in g = 0.00776*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase';
F2 = 'endemic to Turkey';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '3FBK3'; % Cat of Life
metaData.links.id_ITIS = '689216'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Garra_kemali'; % Wikipedia
metaData.links.id_ADW = 'Hemigrammocapoeta_kemali'; % ADW
metaData.links.id_Taxo = '5398571'; % Taxonomicon
metaData.links.id_WoRMS = '1525643'; % WoRMS
metaData.links.id_fishbase = 'Garra-kemali'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Garra_kemali}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Garra-kemali.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'SariIlha2008'; type = 'article'; bib = [ ...
'author = {H. M. Sar{\i} and A. Ilhan and S. Bal{\i}k}, ' ...
'year = {2008}, ' ...
'title  = {Some biological characteristics of \emph{Hemigrammocapoeta kemali} ({H}anko, 1924) inIs¸ {\I}\c{s}kl{\i} {L}ake ({D}enizli-{T}urkey)}, ' ...
'journal = {J. Appl. Ichthyol.}, ' ...
'volume = {24}, ' ...
'pages = {88–90}'];
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

