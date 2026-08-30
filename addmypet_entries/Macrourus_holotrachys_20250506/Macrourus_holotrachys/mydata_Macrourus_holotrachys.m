function [data, auxData, metaData, txtData, weights] = mydata_Macrourus_holotrachys
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Macrouridae';
metaData.species    = 'Macrourus_holotrachys'; 
metaData.species_en = 'Bigeye grenadier'; 

metaData.ecoCode.climate = {'MC', 'ME'};
metaData.ecoCode.ecozone = {'MASW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMpb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(2.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 4.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 05 06];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 05 06];

%% set data
% zero-variate data

data.am = 25*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'MorlMulv2004';   
  temp.am = C2K(4.5); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 61.6;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'MorlMulv2004'; 
  comment.Lp = 'based on PAL 21 cm, converted to TL using F2';
data.Li  = 100;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'MorlMulv2004';
  comment.Li = 'based on PAL 34 cm from tL data, converted to TL unsing F2';

data.Wwb = 1e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'MorlMulv2004';
  comment.Wwb = 'based on egg diameter of 1.3 mm: pi/6*0.13^3';
data.Wwp = 1e3;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'MorlMulv2004','fishbase'};
  comment.Wwp = 'based on 0.00195*Lp^3.20, see F1';
data.Wwi = 4.9e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00195*Li^3.20, see F1';

data.Ri  = 26e4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'MorlMulv2004';   
  temp.Ri = C2K(2.5);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), PAL (cm)
6.007	16.129
6.957	18.591
6.957	20.015
6.991	21.051
7.025	23.187
7.975	20.147
7.975	19.176
7.975	18.205
8.043	23.254
8.925	19.243
8.959	27.074
8.959	20.278
9.876	18.209
9.943	25.199
9.977	23.128
9.977	20.216
10.011	21.057
10.011	19.180
11.029	25.072
11.946	22.162
11.980	19.120
11.980	23.262
12.014	25.269
12.048	20.997
12.930	28.183
12.964	22.229
12.998	25.206
13.982	25.985
14.050	22.102
14.932	34.078
14.966	27.346
15.034	29.353
15.984	28.255
16.018	25.083
16.018	24.048
16.968	25.215
16.968	26.250
17.002	30.198
17.036	27.156
17.952	33.048
18.020	27.223
18.937	30.138
19.038	33.116
19.072	26.190
19.989	29.105
21.007	30.207
21.957	30.209
22.025	30.986
22.025	29.174
22.975	29.046
22.975	31.247
22.975	32.218
23.959	29.178
25.011	28.145];
data.tL_f(:,1) = 365*data.tL_f(:,1); % convert yr to d
data.tL_f(:,2) = data.tL_f(:,2)*2.9355; % convert PAL to TL, see F2
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f   = C2K(4.5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'MorlMulv2004';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.984	7.704
2.919	9.909
3.971	11.271
4.921	14.056
4.921	13.603
4.955	13.085
5.057	14.509
5.057	11.791
5.905	15.158
5.939	14.123
7.941	24.224
8.043	16.328
9.027	17.236
9.061	22.285
10.995	24.101
10.995	18.082
15.034	23.139];
data.tL_m(:,1) = 365*data.tL_m(:,1); % convert yr to d
data.tL_m(:,2) = data.tL_m(:,2)*2.9355; % convert PAL to TL, see F2
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m   = C2K(4.5);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'MorlMulv2004';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Wwb = 3 * weights.Wwb;
weights.Wwi = 3 * weights.Wwi;
weights.Ri = 3 * weights.Ri;
weights.am = 3 * weights.am;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';     
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00195*(TL in cm)^3.20';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: TL =  182/62*PAL';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'Southwest Atlantic: so far known only from the Patagonian slope from east of the Rio de la Plata to north of the Falkland Islands and off Shag Rock west of South Georgia';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = '3XCVH'; % Cat of Life
metaData.links.id_ITIS = '550629'; % ITIS
metaData.links.id_EoL = '46564614'; % Ency of Life
metaData.links.id_Wiki = 'Macrourus_holotrachys'; % Wikipedia
metaData.links.id_ADW = 'Macrourus_holotrachys'; % ADW
metaData.links.id_Taxo = '179487'; % Taxonomicon
metaData.links.id_WoRMS = '234831'; % WoRMS
metaData.links.id_fishbase = 'Macrourus_holotrachys'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Macrourus_holotrachys}}';
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
bibkey = 'MorlMulv2004'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.0022-1112.2004.00405.x}, ' ...
'author = {Morley, S. A. and Mulvey, T. and Dickson, J. and Belchier, M.}, ' ... 
'year = {2004}, ' ...
'title = {The biology of the bigeye grenadier at {S}outh {G}eorgia}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {64(6)}, ' ...
'pages = {1514–1529}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Macrourus_holotrachys}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

