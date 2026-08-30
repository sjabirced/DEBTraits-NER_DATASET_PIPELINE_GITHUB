  function [data, auxData, metaData, txtData, weights] = mydata_Anaecypris_hispanica
  
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Anaecypris_hispanica'; 
metaData.species_en = 'Spanish minnowcarp'; 

metaData.ecoCode.climate = {'Csa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCii', 'biSii'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 02];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 02];

%% set data
% zero-variate data
data.ab = 8;        units.ab = 'd';  label.ab = 'age at birth';                bibkey.ab = 'guess'; 
  temp.ab = C2K(20); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 3*365;   units.am = 'd';  label.am = 'life span';                     bibkey.am = 'RineCowx2000';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 3.5;    units.Lp = 'cm'; label.Lp = 'total length at puberty';       bibkey.Lp = 'RineCowx2000';
data.Li = 7.5;    units.Li = 'cm'; label.Li = 'ultimate total length';           bibkey.Li = 'fishbase';

data.Wwb = 6.6e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'RineCowx2000';
  comment.Wwb = 'based on egg diameter of 1.08 mm: pi/6*0.108^3';
data.Wwp = 0.4;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'RineCowx2000','fishbase'};
  comment.Wwp = 'based on 0.00813*Lp^3.10,  see F1';
data.Wwi = 4.2; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00813*Li^3.10, see F1';

% univariate data

% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
  2.062	3.081
 61.000	3.794
121.477	3.626
179.619	3.828
239.108	4.511
330.076	5.288];
data.tL(:,1) = data.tL(:,1) + 120;
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'RineCowx2000'; 
    
% length-fecundity log10 total length (mm), log10 fecundity (#)
data.LN = [ ... %
1.543	2.453
1.556	2.402
1.568	2.598
1.590	2.654
1.590	2.439
1.591	2.554
1.591	2.707
1.591	2.582
1.602	2.658
1.602	2.809
1.602	2.587
1.603	2.776
1.614	2.675
1.622	2.643
1.623	2.760
1.633	2.733
1.633	2.788
1.643	2.936
1.654	2.954
1.654	2.808
1.661	2.934
1.672	2.873
1.672	2.847
1.673	3.010
1.678	2.941
1.681	2.788
1.682	3.076
1.691	3.126
1.692	2.908
1.692	2.771
1.699	2.918
1.699	3.026
1.700	3.053
1.709	3.040
1.716	3.141
1.716	3.199
1.724	3.073
1.725	3.037
1.733	2.979
1.734	3.077
1.741	3.067
1.750	3.154
1.757	3.086
1.757	3.167
1.764	3.295
1.765	3.077];
data.LN = 10.^data.LN; % remove log transform
data.LN(:,1) = data.LN(:,1)/10; % convert mm to cm
units.LN = {'cm', '#'}; label.LN = {'total length','fecundity'};  
temp.LN = C2K(20);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'RineCowx2000'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;
weights.Wwi = 3 * weights.Wwi;
weights.Lp = 3 * weights.Lp;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'LW_f', 'LW_m'}; subtitle1 = {'Data for females,males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Length-weight: Ww (in g) = 0.00813*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'endemic to Guadu=iana river basin, Spain';
metaData.bibkey.F2 = 'RineCowx2000'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'DCYC'; % Cat of Life
metaData.links.id_ITIS = '688407'; % ITIS
metaData.links.id_EoL = '205459'; % Ency of Life
metaData.links.id_Wiki = 'Anaecypris_hispanica'; % Wikipedia
metaData.links.id_ADW = 'Anaecypris_hispanica'; % ADW
metaData.links.id_Taxo = '107470'; % Taxonomicon
metaData.links.id_WoRMS = '1020904'; % WoRMS
metaData.links.id_fishbase = 'Anaecypris-hispanica'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Anaecypris_hispanica}}';  
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
bibkey = 'RineCowx2000'; type = 'article'; bib = [ ... 
'doi = {10.3906/zoo-1211-13}, ' ...
'author = {F. Ribeiro and I. G. Cowx and M.J. Collares-Pereira}, ' ...
'year = {2000}, ' ...
'title = {Life history traits of the endangered {I}berian cyprinid \emph{Anaecypris hispanica} and their implications for conservation}, ' ... 
'journal = {Arch. Hydrobiol.}, ' ...
'volume = {149}, ' ...
'pages = {569-586}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Anaecypris-hispanica}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

