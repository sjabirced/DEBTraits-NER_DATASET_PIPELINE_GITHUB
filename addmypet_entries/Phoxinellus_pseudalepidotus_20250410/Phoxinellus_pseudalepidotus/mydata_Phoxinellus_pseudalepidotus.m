function [data, auxData, metaData, txtData, weights] = mydata_Phoxinellus_pseudalepidotus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Phoxinellus_pseudalepidotus'; 
metaData.species_en = 'Mostar minnow'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFc'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biD', 'biHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 10];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 10];

%% set data
% zero-variate data

data.am= 13*365;       units.am = 'd';     label.am = 'lifespan';  bibkey.am = 'MuseBorg2002';
    temp.am = C2K(15);   units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 5.1;        units.Lp = 'cm';  label.Lp = 'Fork length at puberty'; bibkey.Lp = 'fishbase'; 
data.Li = 11.5;     units.Li = 'cm';     label.Li = 'ultimate total length';  bibkey.Li = 'MarkCale2017';

data.Wwb = 5.2e-3; units.Wwb = 'g';  label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 1.3;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00813*Lp^3.10, see F1';
data.Wwi = 15.7;         units.Wwi = 'g';  label.Wwi = 'ultimate wet weight'; bibkey.Wwi = {'MarkCale2017','fishbase'}; 
  comment.Wwi = 'based on 0.00813*Li^3.10, see F1';

data.Ri = 1000/365; units.Ri  = '#/d';  label.Ri = 'max reproduction';  bibkey.Ri= 'guess';
  temp.Ri = C2K(15); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
   
%% uni-variate data

% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
    1  4.00
    2  6.70
    3  9.15
    4 11.05];
data.tL(:,1) = 365 * (data.tL(:,1) - 0.7); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(15);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MarkCale2017';

% %% grouped plots
% set1 = {'tLt1', 'tLt2', 'tLt3', 'tLt4'}; subtitle1 = {'MuseBorg2002'; 'total length'};
% metaData.grp.sets = {set1}; metaData.grp.subtitle = {subtitle1};

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
% weights.psd.kap = 2 * weights.psd.kap;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
             
%% Discussion points
D1 = 'males are supposed not to differ from females'; 
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00813*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Neretva drainage in Bosnia-Herzegovina';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '77CM2'; % Cat of Life
metaData.links.id_ITIS = '689657'; % ITIS
metaData.links.id_EoL = '216985'; % Ency of Life
metaData.links.id_Wiki = 'Phoxinellus_pseudalepidotus'; % Wikipedia
metaData.links.id_ADW = 'Phoxinellus_pseudalepidotus'; % ADW
metaData.links.id_Taxo = '194203'; % Taxonomicon
metaData.links.id_WoRMS = '1009610'; % WoRMS
metaData.links.id_fishbase = 'Phoxinellus_pseudalepidotus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Phoxinellus_pseudalepidotus}}';
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
bibkey = 'MarkCale2017'; type = 'Article'; bib = [ ...  
'author = {Ivana Markoti\''{c} and Marko \''{C}aleta and Branko Glamuzina}, ' ...
'year = {2017}, ' ...
'title = {Age Structure of the Endemic Fish \emph{Phoxinellus pseudalepidotus} ({C}yprinidae) from {M}ostarsko {B}lato ({N}eretva {R}iver Basin, {B}osnia and {H}erzegovina)}, ' ... 
'journal = {European International Journal of Science and Technology}, '...
'volume = {6(5)}, '...
'pages = {50-56}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Phoxinellus-pseudalepidotus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
