function [data, auxData, metaData, txtData, weights] = mydata_Periophthalmus_barbarus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Oxudercidae';
metaData.species    = 'Periophthalmus_barbarus'; 
metaData.species_en = 'Atlantic mudskipper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAE','MPW'};
metaData.ecoCode.habitat = {'0iMm','0iMr'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 03 25];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 25];

%% set data
% zero-variate data

data.ab = 7.5;     units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(27.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 5*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(27.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 9.6;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'fishbase'; 
data.Li  = 14.7;   units.Li  = 'cm';  label.Li  = 'ultimate total length';     bibkey.Li  = 'fishbase';

data.Wwb = 2.1e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length of 1.1 mm and width of 0.6 mm: pi/6*0.11*0.06^2';
data.Wwp = 7.2;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01023*Lp^2.96, see F1';
data.Wwi = 25;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for males';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01023*Li^2.96, see F1';

data.Ri  = 23933/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(27.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL = [... %  time (d), total length (cm)
167.150	3.674
198.098	5.138
227.894	6.111
258.271	7.183
286.331	7.666
318.510	7.461
347.735	8.042
365+14.329	7.837
365+75.698	9.195
365+105.516	9.580
365+137.056	10.847
365+165.700	11.330
365+196.673	12.107
365+257.468	13.171
730+136.887	15.461];
data.tL(:,1) = data.tL(:,1) - 100; % set origin at birth
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(27.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'EtimKing2002';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

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
D1 = 'Males are assumed not to differ from females';
D2 = 'Temperature (C) in tL data is is assumed to vary as T(t)=18+8*sin(2*pi*(t-t_0)/365)';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Weight-length: Ww in g = 0.01023*(TL in cm)^2.96';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4F2T7'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46576692'; % Ency of Life
metaData.links.id_Wiki = 'Periophthalmus_barbarus'; % Wikipedia
metaData.links.id_ADW = 'Periophthalmus_barbarus'; % ADW
metaData.links.id_Taxo = '46597'; % Taxonomicon
metaData.links.id_WoRMS = '277973'; % WoRMS
metaData.links.id_fishbase = 'Periophthalmus-barbarus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Periophthalmus_barbarus}}';
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
bibkey = 'EtimKing2002'; type = 'Article'; bib = [ ... 
'author = {Lawrence Etim and Richard P. King and Mfon T. Udo}, ' ... 
'year = {2002}, ' ...
'title = {Breeding, growth, mortality and yield of the mudskipper \emph{Periophthalmus barbarus} ({L}inneaus 1766) ({T}eleostei: {G}obiidae) in the {I}mo {R}iver estuary, {N}igeria}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {56}, ' ...
'pages = {227–238}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Periophthalmus-barbarus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

