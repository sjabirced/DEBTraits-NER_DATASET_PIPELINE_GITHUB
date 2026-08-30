function [data, auxData, metaData, txtData, weights] = mydata_Bettongia_gaimardi
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Diprotodontia'; 
metaData.family     = 'Potoroidae';
metaData.species    = 'Bettongia_gaimardi'; 
metaData.species_en = 'Eastern bettong'; 

metaData.ecoCode.climate = {'BSh'};
metaData.ecoCode.ecozone = {'TAt'};
metaData.ecoCode.habitat = {'0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35.6); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb';'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 07 05];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 07 05];

%% set data
% zero-variate data

data.tg = 20;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(35.6);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 161;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(35.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 252;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'AnAge';
  temp.tp = C2K(35.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 11.8*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(35.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 0.307;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 789;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'AnAge';
data.Wwi = 1729;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 3/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(35.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3 litters per yr, 1 pup per litter';

% uni-variate data
% time-weight
data.tWw = [ ... % time (d), weight (g)
48.681	25.555
48.913	27.216
49.126	23.807
55.937	30.164
56.171	32.635
56.207	46.876
62.788	57.098
62.801	65.274
62.975	38.218
62.992	45.444
62.999	49.166
63.209	41.675
63.420	35.605
63.457	51.953
69.325	44.403
69.814	64.286
69.999	42.357
70.019	51.977
70.032	59.420
70.252	55.794
70.272	67.930
70.285	78.271
76.836	70.135
77.076	80.179
77.082	85.391
77.099	101.538
77.297	75.882
77.724	58.986
77.995	93.121
83.905	121.750
84.112	100.791
84.136	127.640
84.324	86.790
84.351	114.322
84.368	135.939
84.993	78.971
90.919	121.810
90.939	149.476
90.965	195.349
91.140	116.192
91.152	130.755
91.181	174.966
91.388	144.847
98.007	257.445
98.423	179.239
98.641	164.373
98.656	190.893
98.671	221.691
104.785	234.350
104.794	255.548
104.823	344.658
105.055	364.189
105.480	276.491
105.686	223.553
111.636	443.606
111.871	483.740
112.270	283.234
112.276	299.279
112.305	403.638
112.515	342.140
112.520	358.688
118.657	476.410
118.672	553.272
118.889	507.386
119.322	413.488
119.555	443.853];
for i=2:size(data.tWw,1); if data.tWw(i,1)<=data.tWw(i-1,1); data.tWw(i,1)=data.tWw(i-1,1)+1e-3; end; end
units.tWw  = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw  = C2K(35.6);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'RoseMora2003';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 5 * weights.tWw;
weights.Wwx = 0 * weights.Wwx;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 3;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = 'LP3C'; % Cat of Life
metaData.links.id_ITIS = '552699'; % ITIS
metaData.links.id_EoL = '128423'; % Ency of Life
metaData.links.id_Wiki = 'Bettongia_gaimardi'; % Wikipedia
metaData.links.id_ADW = 'Bettongia_gaimardi'; % ADW
metaData.links.id_Taxo = '60277'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '11000180'; % MSW3
metaData.links.id_AnAge = 'Bettongia_gaimardi'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bettongia_gaimardi}}';
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
bibkey = 'RoseMora2003'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s00360-002-0315-7}, ' ...
'author = {R.W. Rose and T.M. Morahan and J.E. Mulchay and D.A. Ratkowsky}, ' ... 
'year = {2003}, ' ...
'title = {Milk composition and growth in wild and captive Tasmanian bettongs, \emph{Bettongia gaimardi} ({M}arsupialia)}, ' ...
'journal = {J Comp Physiol B}, ' ...
'volume = {173}, ' ...
'pages = {125–133}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Bettongia_gaimardi}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

