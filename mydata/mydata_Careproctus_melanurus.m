function [data, auxData, metaData, txtData, weights] = mydata_Careproctus_melanurus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Liparidae';
metaData.species    = 'Careproctus_melanurus'; 
metaData.species_en = 'Blacktail snailfish'; 

metaData.ecoCode.climate = {'MC','ME'};
metaData.ecoCode.ecozone = {'MPN','MN'};
metaData.ecoCode.habitat = {'bjMp','jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(2.4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 23];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 23];

%% set data
% zero-variate data

data.ab = 205;       units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'guess';   
  temp.ab = C2K(2.4);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 25 * 365;   units.am = 'd';    label.am = 'life span';              bibkey.am = 'GerrAndr2018';   
  temp.am = C2K(2.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 25; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 54; units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 0.0224; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'Glub2010';
  comment.Wwb = 'based on egg diameter of 3.5 mm of C. furcellus: pi/6*0.35^3';
data.Wwp = 153;    units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwi = 'based on 0.00468*Lp^3.23, see F1';
data.Wwi = 1844;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'OrloTokr2011';
  comment.Wwi = 'based on 0.00468*Li^3.23, see F1; max. published weight: 1.7 kg';
 
data.Ri  = 1041/365; units.Ri  = '#/d';label.Ri  = 'max reprod rate'; bibkey.Ri  = 'Glub2010';   
  temp.Ri = C2K(2.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on Careproctus furcellus: 1129*1844/2000';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), std length (cm)
8.882	11.938
8.947	12.784
10.263	11.893
10.987	13.452
11.053	12.517
11.184	13.630
12.171	14.922
13.092	14.878
13.158	15.991
13.224	14.610
13.947	13.808
14.013	15.412
14.014	14.833
14.934	16.125
15.066	15.724
16.908	16.169
17.105	17.060
18.026	16.214
18.947	19.465
19.079	17.194
19.145	16.303
20.263	17.416
21.053	18.263
23.158	21.915
24.276	19.332];	
data.tL(:,1) = (data.tL(:,1)+0.5)*365; % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth','std length'};  
  temp.tL = C2K(2.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GerrAndr2018'; 


%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 10;
weights.ab = weights.ab * 0;
%weights.Wwp = weights.Wwp * 0;
weights.Wwi = weights.Wwi * 3;
weights.Li = weights.Li * 3;
weights.Ri = weights.Ri * 3;
weights.Wwb = weights.Wwb * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: weight in g = 0.00468*(TL in cm)^3.23';
metaData.bibkey.F1 = 'fishbase';
F2 = 'North Pacific: Bering Sea to off San Diego in California, USA';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'R7SS'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46569320'; % Ency of Life
metaData.links.id_Wiki = 'Careproctus'; % Wikipedia
metaData.links.id_ADW = 'Careproctus_melanurus'; % ADW
metaData.links.id_Taxo = '165507'; % Taxonomicon
metaData.links.id_WoRMS = '254549'; % WoRMS
metaData.links.id_fishbase = 'Careproctus-melanurus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Careproctus}}';
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
bibkey = 'GerrAndr2018'; type = 'article'; bib = [ ... 
'doi = {10.1016/j.dsr.2017.12.002}, ' ...
'author = {M.E. Gerringer and A.H. Andrews and G.R. Huss and K. Nagashima and B.N. Popp and T.D. Linley and N.D. Gallo and M.R. Clark and A.J. Jamieson and J.C. Drazen}, ' ... 
'year = {2018}, ' ...
'title = {Life history of abyssal and hadal fishes from otolith growth zones and oxygen isotopic compositions}, ' ...
'journal = {Deep Sea Research Part I: Oceanographic Research Papers}, ' ...
'volume = {132}, ' ...
'pages = {37-50}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Glub2010'; type = 'article'; bib = [ ... 
'doi = {10.1134/s0032945210010078}, ' ...
'author = {Glubokov, A. I.}, ' ... 
'year = {2010}, ' ...
'title = {The data on \emph{Careproctus furcellus} and \emph{C. rastrinus} ({L}iparidae) from the {O}lyutorskii {G}ulf of the {B}ering {S}ea: {S}ize composition, indices of organs, and diet}, ' ...
'journal = {Journal of Ichthyology}, ' ...
'volume = {50(1)}, ' ...
'pages = {52–64}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/Careproctus-melanurus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
