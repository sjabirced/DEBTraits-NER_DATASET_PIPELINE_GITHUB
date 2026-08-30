  function [data, auxData, metaData, txtData, weights] = mydata_Percopsis_omiscomaycus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Percopsiformes'; 
metaData.family     = 'Percopsidae';
metaData.species    = 'Percopsis_omiscomaycus'; 
metaData.species_en = 'Trout-perch'; 

metaData.ecoCode.climate = {'Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFl', '0iFr', '0iFc'};
metaData.ecoCode.embryo  = {'Fs', 'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ah'; 'ab'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lp'; 'Li'; 'L_W'; 'Wwb'; 'Wwp'; 'Wwi'; 'R_L'};  
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2014 05 07];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 03 11]; 

%% set data
% zero-variate data
data.ah = 6.5;    units.ah = 'd';   label.ah = 'age at hatch';           bibkey.ah = 'wisc'; 
  temp.ah = C2K(21.5); units.temp.ah = 'K'; label.temp.ah = 'temperature'; 
data.ab = data.ah + 5.6; units.ab = 'd'; label.ab = 'age at birth';      bibkey.ab = 'wisc'; 
  temp.ab = C2K(21.5); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.ap = 2*365;  units.ap = 'd';   label.ap = 'age at puberty';         bibkey.ap = 'Wiki';
  temp.ap = C2K(15); units.temp.ap = 'K'; label.temp.ap = 'temperature'; 
  comment.ap = 'temp is guessed, ap for females, 6 yr for males';
data.am = 2*365;  units.am = 'd';   label.am = 'life span';              bibkey.am = 'Kooy2014';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'temp is guessed';

data.Lh = 0.53;   units.Lh = 'cm';  label.Lh = 'total length at hatch';  bibkey.Lh = 'Wiki'; 
data.Lb = 0.8;    units.Lb = 'cm';  label.Lb = 'total length at birth';  bibkey.Lb = 'guess'; 
data.Lp = 5.4;    units.Lp = 'cm';  label.Lp = 'total length at puberty';bibkey.Lp = 'Spaff1999'; 
  comment.Lp = 'for females; 4.8 cm for males';
data.Li = 20;     units.Li = 'cm';  label.L20 = 'total length at 20.56 g';         bibkey.L20 = 'Wiki';
data.L20 = 12.5;  units.L20 = 'cm'; label.Li = 'ultimate total length';            bibkey.Li = 'wisc';

data.Wwb = 3.4e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1.87 mm: pi/6*0.187^3';
data.Wwp = 0.01120 * data.Lp^3; units.Wwp = 'g'; label.Wwp = 'wet weight at puberty'; bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on length';
data.Wwi = 0.01120 * data.Li^3; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on length';
  
data.RL = 1329/365; units.RL = '#/d'; label.RL = 'reprod rate at L = 14.6 cm';  bibkey.RL = 'HousWell1973';   
  temp.RL = C2K(15); units.temp.RL = 'K'; label.temp.RL = 'temperature';
    
% uni-variate data
% time-length 
data.tL = [ ... % time (yr), total length (cm)
1  7
2  9
3 10.9
4 13.5]; 
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
units.tL = {'d', 'g'}; label.tL = {'time since birth', 'total length'}; 
temp.tL = C2K(28.7); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = {'Spaff1999'}; comment.tL = 'Data from Green Bay';
%
% cm, physical length at f and T
data.tL_fm = [ ...time (yr), total length (cm) in Lower Red Lake
1  5.14   5.08  
2  9.22   8.82  
3 10.83  10.35 
4 11.47   NaN];
data.tL_fm(:,1) = 365 * data.tL_fm(:,1); % convert yr to d
treat.tL_fm = {1 {'females','males'}};
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'}; 
temp.tL_fm = C2K(28.7); units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = {'Spaff1999'};
comment.tL_fm = 'Data from lower Red Lake';
 
%% set weights for all real data
weights = setweights(data, []);

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
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Found in deep waters by day, but which migrates to shallower waters at night; no parental care';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'Ww = 0.01120 * L^3';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);
                                 
%% Links
metaData.links.id_CoL = '76S3B'; % Cat of Life
metaData.links.id_ITIS = '164409'; % ITIS
metaData.links.id_EoL = '212344'; % Ency of Life
metaData.links.id_Wiki = 'Percopsis_omiscomaycus'; % Wikipedia
metaData.links.id_ADW = 'Percopsis_omiscomaycus'; % ADW
metaData.links.id_Taxo = '44208'; % Taxonomicon
metaData.links.id_WoRMS = '567538'; % WoRMS
metaData.links.id_fishbase = 'Percopsis-omiscomaycus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Esox_lucius}}';  
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
bibkey = 'HousWell1973'; type = 'Article'; bib = [ ...  
'author = {R. House and L. Wells}, ' ...
'year = {1973}, ' ...
'title = {Age, Growth, Spawning Season, and Fecundity of the Trout-Perch (\emph{Percopsis omiscomaycus}) in Southeastern {L}ake {M}ichigan}, ' ... 
'journal = {Journal of the Fisheries Research Board of Canada}, ' ...
'volume = {30(8)}, '...
'pages = {1221--1225, 10.1139/f73-193}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Spaff1999'; type = 'phdthesis'; bib = [ ...  
'author = {Spafford, M. D.}, ' ...
'year = {1999}, ' ...
'title = {Trout-perch \emph{Percopsis omiscomaycus} ({W}albaum) and {L}ake {C}hub \emph{Couesius plumbeus} ({A}gassiz) as Sentinel Monotoring Species in the {A}thabasca {R}iver, {A}lberta}, ' ... 
'school = {Univ of Alberta}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'wisc'; type = 'Misc'; bib = ...
'howpublished = {\url{http://images.library.wisc.edu/EcoNatRes/EFacs/FishesWI/reference/econatres.fisheswi.i0032.pdf}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/3065}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

