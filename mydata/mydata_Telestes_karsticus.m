function [data, auxData, metaData, txtData, weights] = mydata_Telestes_karsticus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Telestes_karsticus'; 
metaData.species_en = 'Karstic dace'; 

metaData.ecoCode.climate = {'Csa','Cfa','Dfb','Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFl','0iFp','0iFr'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi','jiHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 06];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 06];

%% set data
% zero-variate data

data.am = 7*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(10); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 5.1;    units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'MarcMilk2021'; 
data.Li = 12.7;    units.Li = 'cm'; label.Li = 'ultimate total length';       bibkey.Li = 'fishbase'; 
  
data.Wwb = 9.5e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'MarcMilk2021';
  comment.Wwb = 'based on egg diameter of 1.22 mm: pi/6*0.122^3';
data.Wwp = 2.4;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on Wwi*(Lp/Li)^3; fishbase: 0.00813*Lp^3.10, see F1, give 1.3 g';
data.Wwi = 37;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'MarcKoml2021';
  comment.Wwi = 'fishbase: based on 0.00813*Li^3.10, see F1, gives 21.5 g';

data.Ri = 3188/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate'; bibkey.Ri = 'MarcMilk2021';   
  temp.Ri = C2K(10); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

%% univariate data
 
% time-length
data.tL_fm = [ ... % time (d), std length (cm)
    0  2.29 3.52
    1  5.70 4.84
    2  6.27 6.87
    3  8.41 7.86
    4  9.50 8.99
    5 12.20 NaN];
data.tL_fm(:,1) = (1.3 + data.tL_fm(:,1)) * 365; % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'std length'};  
temp.tL_fm = C2K(10);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'MarcKoml2021'; treat.tL_fm = {1 {'females','males'}}; 

% time-weight
data.tW_fm = [ ... % time (d), weight (g)
    0  0.3  0.9
    1  3.7  2.6
    2  4.5  5.9
    3 10.7 11.1
    4 16.7 11.7
    5 36.7 NaN];
data.tW_fm(:,1) = (1.3 + data.tW_fm(:,1)) * 365; % convert yr to d
units.tW_fm = {'d', 'g'}; label.tW_fm = {'time since birth', 'weight'};  
temp.tW_fm = C2K(10);  units.temp.tW_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tW_fm = 'MarcKoml2021'; treat.tW_fm = {1 {'females','males'}}; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;
weights.tW_fm = 10 * weights.tW_fm;
weights.Li = 3 * weights.Li;

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
% set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'I has to add 1 yr to age estimates in tL data to arrive at a reasonable fit';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00813*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase';
F2 = 'known only from Croatia';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '556DL'; % Cat of Life
metaData.links.id_ITIS = '1199878'; % ITIS
metaData.links.id_EoL = '24112207'; % Ency of Life
metaData.links.id_Wiki = 'Telestes_karsticus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '2741819'; % Taxonomicon
metaData.links.id_WoRMS = '1006935'; % WoRMS
metaData.links.id_fishbase = 'Telestes-karsticus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Telestes_karsticus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Telestes-karsticus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'MarcKoml2021'; type = 'article'; bib = [ ...
'doi = {10.3897/aiep.51.67815}, ' ...
'author = {Zoran Mar\v{c}i\''{c} and Irena Komljenovi\''{c} and Marko \''{C}aleta and Ivana Buj and Davor Zanella and Perica Mustafi\''{c}}, ' ...
'year = {2021}, ' ...
'title  = {Age, growth, and population structure of endemic \emph{Telestes karsticus} ({A}ctinopterygii: {C}yprinidae: {L}euciscinae) from {S}u\v{s}ik {C}reek, {C}roatia}, ' ...
'journal = {Acta Ichthyologica et Piscatoria}, ' ...
'pages = {225–232}, ' ...
'volume = {51(3)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'MarcMilk2021'; type = 'article'; bib = [ ...
'doi = {10.3897/aiep.51.67815}, ' ...
'author = {Zoran Mar\v{c}i\''{c} and A. Milkovi\''{c} and Marko \''{C}aleta and Ivana Buj and Davor Zanella and Perica Mustafi\''{c}}, ' ...
'year = {2021}, ' ...
'title  = {Reproductive biology of the endemic dace \emph{Telestes karsticus} {M}ar\v{c}i\''{c} and Mrakov\v{c}i\''{c}, 2011 ({C}yprinidae, {L}euciscinae), in {C}roatia}, ' ...
'journal = {Acta Ichthyologica et Piscatoria}, ' ...
'pages = {225–232}, ' ...
'volume = {51(3)}'];
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

