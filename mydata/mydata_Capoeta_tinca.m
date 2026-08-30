function [data, auxData, metaData, txtData, weights] = mydata_Capoeta_tinca
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Capoeta_tinca'; 
metaData.species_en = 'Anatolian khramulya'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi','biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 13];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 13];

%% set data
% zero-variate data

data.am = 6*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 17;    units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'guess'; 
data.Li = 36;    units.Li = 'cm'; label.Li = 'ultimate total length';       bibkey.Li = 'fishbase'; 
  
data.Wwb = 2.1e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'EkmekOzer2003';
  comment.Wwb = 'based on egg diameter of 1.6 mm: pi/6*0.16^3';
data.Wwp = 47;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.01072*Li^2.96, see F1';
data.Wwi = 433;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01072*Li^2.96, see F1';

data.GSI = 0.06; units.GSI = 'g/g';  label.GSI = 'gonado somatic index'; bibkey.GSI = 'EkmekOzer2003';
  temp.GSI = C2K(22); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

%% univariate data
 
% time-length-weight
data.tL_fm = [ ... % time (yr), total length (cm)
    1 NaN  10.1
    2 12.4 12.6
    3 16.3 16.8
    4 19.8 20.1
    5 23.1 23.4
    6 26.3 25.7
    7 28.4 28.1];
data.tL_fm(:,1) = 365 * (0.6+data.tL_fm(:,1)); % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm= C2K(22);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'GulYilm2002'; treat.tL_fm = {1 {'females','males'}}; 
    
% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
24.377	11250.743
29.178	19611.007
31.377	18031.116
33.442	19016.553
38.003	37656.090
40.120	48252.542];
units.LN = {'cm', '#'}; label.LN = {'total length', 'fecundity'};  
temp.LN = C2K(22);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'EkmekOzer2003'; 
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;
weights.Li = 10 * weights.Li;
weights.Wwi = 5 * weights.Wwi;
weights.Wwb = 5 * weights.Wwb;
weights.GSI = 0 * weights.GSI;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'GSI data ignored du to inconsistency with LN and Wwb data';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: W in g = 0.01072*(TL in cm)^2.96';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Endemic to Turkey';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = 'QRFY'; % Cat of Life
metaData.links.id_ITIS = '688843'; % ITIS
metaData.links.id_EoL = '208472'; % Ency of Life
metaData.links.id_Wiki = 'Capoeta_tinca'; % Wikipedia
metaData.links.id_ADW = 'Capoeta_tinca'; % ADW
metaData.links.id_Taxo = '165385'; % Taxonomicon
metaData.links.id_WoRMS = '862541'; % WoRMS
metaData.links.id_fishbase = 'Capoeta-tinca'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Capoeta_tinca}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Capoeta-tinca.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'GulYilm2002'; type = 'article'; bib = [ ...
'author = {Ali G\"{u}l and Mehmet Yilmaz}, ' ...
'year = {2002}, ' ...
'title  = {Growth Properties  of \emph{Capoeta tinca} ({H}eckel, 1843) Living in The {D}elice {B}ranch of {K}{\i}z{\i}l{i}rmak {R}iver ({T}urkey)}, ' ...
'journal = {G.\"{U}. Gazi E\v{g}itim Fak\"{u}ltesi Dergisi Cilt}, ' ...
'volume = {22(1)}, ' ...
'pages = {13-24}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'EkmekOzer2003'; type = 'article'; bib = [ ...
'author = {Fitnat G\"{u}ler Ekmek\c{c}i and Saniye Cevher \"{O}zeren}, ' ...
'year = {2003}, ' ...
'title  = {Reproductive biology of \emph{Capoeta tinca} in {G}eling\"{u}ll\"{u} {R}eservoir, {T}urkey}, ' ...
'journal = {Folia Zool.}, ' ...
'volume = {52(3)}, ' ...
'pages = {323–328}'];
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

