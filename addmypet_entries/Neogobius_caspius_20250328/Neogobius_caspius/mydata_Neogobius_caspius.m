function [data, auxData, metaData, txtData, weights] = mydata_Neogobius_caspius
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Gobiidae';
metaData.species    = 'Neogobius_caspius'; 
metaData.species_en = 'Caspian goby'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAc'};
metaData.ecoCode.habitat = {'0iMc', '0iMm'};
metaData.ecoCode.embryo  = {'Mc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 03 28];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 28];

%% set data
% zero-variate data

data.am = 6*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'AghaHagh2016';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 17;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'guess'; 
data.Li  = 34.5;   units.Li  = 'cm';  label.Li  = 'ultimate total length';     bibkey.Li  = 'fishbase';

data.Wwb = 7e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'MahdAlav2016';
  comment.Wwb = 'based on egg diameter of 1.1 mm: pi/6*0.11^3';
data.Wwp = 10.7; units.Wwp = 'g'; label.Wwp = 'wet weight at puberty';       bibkey.Wwp = 'ShemKiri2009';
  comment.Wwp = 'based on 0.01000*Lp^3.03, see F1';
data.Wwi = 87.5; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';   bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.01000*Li^3.03, see F1';

data.GSI = 0.13; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'MahdAlav2016';
  temp.GSI = C2K(17.9); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL_fm = [... %  time since birth (yr), total length (cm)
0	 4.895  6.000
1	10.579 12.741
2	13.737 15.556
3	15.395 16.963
4	16.184 NaN];
data.tL_fm(:,1) = (0.4 + data.tL_fm(:,1)) * 365; % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm    = C2K(25);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'AghaHagh2016'; treat.tL_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;

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

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% set2 = {'tW_f','tW_m'}; subtitle2 = {'Data for females, males'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length=weight: Ww in  g = 0.01000*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Eurasia: Azov and Black Sea basins. Invasive in rivers of northern Black Sea basin';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6RW9X'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Neogobius'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '46592'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_fishbase = 'Neogobius-fluvialitis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Neogobius}}';
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
bibkey = 'AghaHagh2016'; type = 'Article'; bib = [ ... 
'author = {Aghajanpour, M. and S. Haghparast and H. Raeisi and A.R. Jabale}, ' ... 
'year = {2016}, ' ...
'title = {Growth parameters and mortality rate of \emph{Neogobius caspius} ({E}ichwald, 1831) in southern part of the {C}aspian {S}ea ({T}eleostei: {G}obiidae)}, ' ...
'journal = {Iran J Ichthyol.}, ' ...
'volume = {3(2)}, ' ...
'pages = {122-129}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MahdAlav2016'; type = 'Article'; bib = [ ...
'doi = {10.22092/ijfs.2020.350834.0}, ' ...
'author = {Mahdipour, E. and Alavi-Yeganeh, M.S. and Sharifpour, I. and Ahnelt, H.}, ' ... 
'year = {2016}, ' ...
'title = {Reproductive biology of {C}aspian goby, \emph{Neogobius caspius} ({E}ichwald, 1831) in the southern {C}aspian {S}ea ({N}oor beach)}, ' ...
'journal = {Iranian Journal of Fisheries Sciences}, ' ...
'volume = {19(6)}, ' ...
'pages = {3345-3363}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Neogobius-fluvialitis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

