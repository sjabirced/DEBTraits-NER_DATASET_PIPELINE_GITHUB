function [data, auxData, metaData, txtData, weights] = mydata_Vombatus_ursinus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Diprotodontia'; 
metaData.family     = 'Vombatidae';
metaData.species    = 'Vombatus_ursinus'; 
metaData.species_en = 'Common wombat'; 

metaData.ecoCode.climate = {'Cfb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35.3); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 08 16];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 08 16];

%% set data
% zero-variate data

data.tg = 27;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(35.3);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 350;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(35.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 730;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'AnAge';
  temp.tp = C2K(35.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 30*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(35.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 0.72;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'GreeRain1987';
data.Wwx = 5700;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning'; bibkey.Wwx = 'AnAge';
data.Wwi = 35e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'Wiki';

data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(35.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 pup per litter; 1 litter per yr';

% univariate data
% time-weight
data.tW = [ ... % time (wk), weight (g)
    0 0.72
    1 4.00
    2 8.00
    3 13.0
    4 17.0
    5 23.0
    6 28.0
    7 34.0
    8 42.0
    9 48.0
   10 54.0
   11 62.0
   12 72.0
   13 84.0
   14 95.0
   15 108
   16 120
   17 135
   18 151
   19 170
   20 194
   21 218
   22 250
   23 295
   24 370
   25 483
   26 612
   27 775
   28 962
   29 1060
   30 1400
   31 1650
   32 1900
   33 2150
   34 2410
   35 2670
   36 2930
   37 3180
   38 3440
   39 3690
   40 3950
   41 4190
   42 4490
   43 4700
   44 4960
   45 5200
   46 5470
   47 5230
   48 5980
   49 6230
   50 6490
   51 6750
   52 7010
   53 7260
   54 7520
   55 7760
   56 8080
   57 8290
   58 8590
   59 8800
   60 9060
   61 9320
   62 9580
   63 9830
   64 10090
   65 10340
   66 10600
   67 10850
   68 11120
   69 11370
   70 11630
   71 11880
   72 12150
   73 12400
   74 12660
   75 12910
   76 13150
   77 13430
   78 13690
   79 13960
   80 14200
   81 14460
   82 14720 
   83 14970
   84 15230
   85 15490];
data.tW(:,1) = 7 * data.tW(:,1);
units.tW = {'d', 'g'};     label.tW = {'time', 'wet weight'};  
temp.tW = C2K(35.3); units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'GreeRain1987';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwi = 3 * weights.Wwi;

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
% set2 = {'tWw_f','tWw_m'}; subtitle2 = {'Data for females, males'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '7FT26'; % Cat of Life
metaData.links.id_ITIS = '552680'; % ITIS
metaData.links.id_EoL = '981577'; % Ency of Life
metaData.links.id_Wiki = 'Vombatus_ursinus'; % Wikipedia
metaData.links.id_ADW = 'Vombatus_ursinus'; % ADW
metaData.links.id_Taxo = '60458'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '11000014'; % MSW3
metaData.links.id_AnAge = 'Vombatus_ursinus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Vombatus_ursinus}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Vombatus_ursinus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GenoIsle2018'; type = 'article'; bib = [ ...  
'doi = {10.1111/brv.12350}, '... 
'title = {Comparative analyses of basal rate of metabolism in mammals: data selection does matter}, ' ...
'journal = {Biol. Rev.}, ' ...
'volume = {93(1)}, ' ...
'year = {2018}, ' ...
'pages = {404-438}, ' ...
'author = {Michel Genoud and Karin Isler and Robert D. Martin}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GreeRain1987'; type = 'article'; bib = [ ...  
'title = {The common wombat \emph{Vombatus ursinus} ({S}haw, 1800) in {N}orthern {T}asmania – {P}art 1. {B}reeding, growth and development}, ' ...
'journal = {Records of the Queen Victoria Museum}, ' ...
'volume = {91}, ' ...
'year = {1987}, ' ...
'pages = {1–19}, ' ...
'author = {Green, R. H. and Rainbird, J. L.}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

