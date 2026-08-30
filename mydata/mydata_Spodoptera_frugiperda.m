function [data, auxData, metaData, txtData, weights] = mydata_Spodoptera_frugiperda 

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Insecta'; 
metaData.order      = 'Lepidoptera'; 
metaData.family     = 'Noctuidae';
metaData.species    = 'Spodoptera_frugiperda'; 
metaData.species_en = 'Fall Armyworm'; 

metaData.ecoCode.climate = {'Am','Aw','Cwa','Cwb'}; 
metaData.ecoCode.ecozone = {'TN','THn','TPa','TPi'};
metaData.ecoCode.habitat = {'0iTg'};
metaData.ecoCode.embryo  = {'Thl','Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjHl','eiHn'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};  

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'tp'; 'tj'; 'te'; 'am'; 'Lp'; 'Lj'; 'Wwj'};
metaData.data_1     = {'T-ab'; 'T-tj'; 'T-te'; 'T-s'; 't-Ww'; 'Ni-f'; 'T-astar'; 'T-X'}; 

metaData.COMPLETE = 3.5; % using criteria of LikaKear2011

metaData.author   = {'Andre Gergs','Christian Baden'};    
metaData.date_subm = [2025 07 07];              
metaData.email    = {'andre.gergs@bayer.com'};            
metaData.address  = {'Bayer AG'};   

metaData.author_mod_1   = {'Evridiki Klagkou', 'Andre Gergs', 'Christian Baden', 'Dina Lika'};        
metaData.date_mod_1     = [2025 07 30];                           
metaData.email_mod_1    = {'biop1070@edu.biology.uoc.gr'};                 
metaData.address_mod_1  = {'University of Crete'}; 

metaData.author_mod_2   = {'Andre Gergs'};        
metaData.date_mod_2 = [2025 09 26];                           
metaData.email_mod_2    = {'andre.gergs@bayer.com'};                 
metaData.address_mod_2  = {'Bayer AG'}; 

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2025 09 28]; 

%% set data
% zero-variate data
data.ab = 4.4;    units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'GarcMeag2018';   
  temp.ab = C2K(22);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 9.25; units.tp = 'd'; label.tp = 'time at puberty since birth'; bibkey.tp = 'MontHunt2019';   
  temp.tp = C2K(25); units.temp.tp = 'K'; label.temp.tp = 'temperature';  
data.tj = 27.5; units.tj = 'd'; label.tj = 'time since birth at pupation'; bibkey.tj = 'GarcMeag2018';   
  temp.tj = C2K(22);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.te_22 = 14.6; units.te_22 = 'd'; label.te_22 = 'time since pupation at emergence'; bibkey.te_22 = 'GarcMeag2018';   
  temp.te_22 = C2K(22);  units.temp.te_22 = 'K'; label.temp.te_22 = 'temperature';

data.t1 = 2.57; units.t1 = 'd'; label.t1 = 'duration of instar 1'; bibkey.t1 = 'MontHunt2019';   
  temp.t1 = C2K(25); units.temp.t1 = 'K'; label.temp.t1 = 'temperature'; 
data.t2 = 2.07; units.t2 = 'd'; label.t2 = 'duration of instar 2'; bibkey.t2 = 'MontHunt2019';   
  temp.t2 = C2K(25); units.temp.t2 = 'K'; label.temp.t2 = 'temperature'; 
data.t3 = 2.13; units.t3 = 'd'; label.t3 = 'duration of instar 3'; bibkey.t3 = 'MontHunt2019';   
  temp.t3 = C2K(25); units.temp.t3 = 'K'; label.temp.t3 = 'temperature'; 
data.t4 = 2.48; units.t4 = 'd'; label.t4 = 'duration of instar 4'; bibkey.t4 = 'MontHunt2019';   
  temp.t4 = C2K(25); units.temp.t4 = 'K'; label.temp.t4 = 'temperature'; 
data.t5 = 2.57; units.t5 = 'd'; label.t5 = 'duration of instar 5'; bibkey.t5 = 'MontHunt2019';   
  temp.t5 = C2K(25); units.temp.t5 = 'K'; label.temp.t5 = 'temperature'; 
data.t6 = 2.13; units.t6 = 'd'; label.t6 = 'duration of instar 6'; bibkey.t6 = 'MontHunt2019';   
  temp.t6 = C2K(25); units.temp.t6 = 'K'; label.temp.t6 = 'temperature';
data.te = 11.57; units.te = 'd'; label.te = 'duration of pupa stage'; bibkey.te = 'SilvOliv2017';   
  temp.te = C2K(25); units.temp.te = 'K'; label.temp.te = 'temperature';
  comment.te ='duration prepupa stage (1.87 d) + duration of pupa stage (9.7 d)';

 data.L1 = 0.035; units.L1 = 'cm'; label.L1 = 'head capsule of instar 1 females'; bibkey.L1 = 'MontHunt2019';
 data.L2 = 0.057; units.L2 = 'cm'; label.L2 = 'head capsule of instar 2 females'; bibkey.L2 = 'MontHunt2019';
 data.L3 = 0.087; units.L3 = 'cm'; label.L3 = 'head capsule of instar 3 females'; bibkey.L3 = 'MontHunt2019';
 data.L4 = 0.129; units.L4 = 'cm'; label.L4 = 'head capsule of instar 4 females'; bibkey.L4 = 'MontHunt2019';
 data.L5 = 0.189; units.L5 = 'cm'; label.L5 = 'head capsule of instar 5 females'; bibkey.L5 = 'MontHunt2019';
 data.L6 = 0.28;  units.L6 = 'cm'; label.L6 = 'head capsule of instar 6 females'; bibkey.L6 = 'MontHunt2019';
 data.Lp = 0.129; units.Lp = 'cm'; label.Lp = 'head capsule at puberty'; bibkey.Lp = 'MontHunt2019';
   comment.Lp = 'coincides with instar 4';
 data.Lj = 16.25/10; units.Lj = 'cm'; label.Lj = 'body lengh at pupation'; bibkey.Lj = 'Baye2021';
 
 data.Wwj = 0.2889;   units.Wwj = 'g'; label.Wwj = 'wet weight of pupa';      bibkey.Wwj = 'SilvOliv2017';
  comment.Wwj ='weight measure for artificial diet';
     
% uni-variate data
% temperature-age at birth
data.Tab = [ ... % temperature (C), age at birth (d)
18	6.3
22	4
26	3
30	2
32	2];
units.Tab  = {'C', 'd'}; label.Tab = {'temperature', 'age at birth', 'Schl2018'};  
bibkey.Tab = 'Schl2018';
%
data.Tab2 = [ ... % temperature (C), age at birth (d)
14	13.2
18	6
22	4.4
26	3
30	2];
units.Tab2  = {'C', 'd'}; label.Tab2 = {'temperature', 'age at birth', 'GarcMeag2018'};  
bibkey.Tab2 = 'GarcMeag2018';
%
data.Tab3 = [ ... % temperature (C), age at birth (d)
16 10.1
20 7.1
24 4.3
28 3.2
32 2.0
36 2.0];
units.Tab3  = {'C', 'd'}; label.Tab3 = {'temperature', 'age at birth', 'LeePark2022'};  
bibkey.Tab3 = 'LeePark2022';

% temperature-instar duration
data.TtI1 = [ ... % temperature (C), duration instar 1 (d)
18	4.9
22	3.7
26	3
30	2.2
32	2.7];
units.TtI1  = {'C', 'd'}; label.TtI1 = {'temperature', 'duration instar 1', 'Schl2018'};  
bibkey.TtI1 = 'Schl2018';
%
data.Tt2I1 = [ ... % temperature (C), duration instar 1 (d)
15	13.20531283
20	4.597309417
25	3.616006833
28	3.00585095
30	2.821319667];
units.Tt2I1  = {'C', 'd'}; label.Tt2I1 = {'temperature', 'duration instar 1', 'LopeCarr2019'};  
bibkey.Tt2I1 = 'LopeCarr2019';
%
data.Tt3I1 = [ ... % temperature (C), duration instar 1 (d)
16 6.4
20 4.4
24 2.1
28 1.3
32 1.1
36 1.0];
units.Tt3I1  = {'C', 'd'}; label.Tt3I1 = {'temperature', 'duration instar 1', 'LeePark2022'};  
bibkey.Tt3I1 = 'LeePark2022';
%
data.TtI2 = [ ... % temperature (C), duration instar 2 (d)
18	4.9
22	3
26	2.1
30	1.9
32	1.3];
units.TtI2  = {'C', 'd'}; label.TtI2 = {'temperature', 'duration instar 2', 'Schl2018'};  
bibkey.TtI2 = 'Schl2018';
%
data.Tt2I2 = [ ... % temperature (C), duration instar 2 (d)
15	7.925312834
20	3.343976084
25	2.122690583
28	1.93921845
30	2.1280205];
units.Tt2I2  = {'C', 'd'}; label.Tt2I2 = {'temperature', 'duration instar 2', 'LopeCarr2019'};  
bibkey.Tt2I2 = 'LopeCarr2019';
%
data.Tt3I2 = [ ... % temperature (C), duration instar 2 (d)
16 4.1
20 2.2
24 1.8
28 1.3
32 1.1
36 1.0];
units.Tt3I2  = {'C', 'd'}; label.Tt3I2 = {'temperature', 'duration instar 2', 'LeePark2022'};  
bibkey.Tt3I2 = 'LeePark2022';
%
data.TtI3 = [ ... % temperature (C), duration instar 3 (d)
18	5
22	2.5
26	2
30	1.4
32	1.1];
units.TtI3  = {'C', 'd'}; label.TtI3 = {'temperature', 'duration instar 3', 'Schl2018'};  
bibkey.TtI3 = 'Schl2018';
%
data.Tt2I3 = [ ... % temperature (C), duration instar 3 (d)
15	8.645329917
20	3.423976084
25	2.362656417
28	2.01921845
30	1.968037583];
units.Tt2I3  = {'C', 'd'}; label.Tt2I3 = {'temperature', 'duration instar 3', 'LopeCarr2019'};  
bibkey.Tt2I3 = 'LopeCarr2019';
%
data.Tt3I3 = [ ... % temperature (C), duration instar 3 (d)
16 6.5
20 2.8
24 1.9
28 1.4
32 1.1
36 1.0];
units.Tt3I3  = {'C', 'd'}; label.Tt3I3 = {'temperature', 'duration instar 3', 'LeePark2022'};  
bibkey.Tt3I3 = 'LeePark2022';
%
data.TtI4 = [ ... % temperature (C), duration instar 4 (d)
18	5.2
22	2.8
26	2.2
30	1.7
32	1.5];
units.TtI4  = {'C', 'd'}; label.TtI4 = {'temperature', 'duration instar 4', 'Schl2018'};  
bibkey.TtI4 = 'Schl2018';
%
data.Tt2I4 = [ ... % temperature (C), duration instar 4 (d)
15	11.65869742
20	3.770745249
25	2.469340167
28	2.232568866
30	2.234687166];
units.Tt2I4  = {'C', 'd'}; label.Tt2I4 = {'temperature', 'duration instar 4', 'LopeCarr2019'};  
bibkey.Tt2I4 = 'LopeCarr2019';
%
data.Tt3I4 = [ ... % temperature (C), duration instar 4 (d)
16 6.5
20 3.4
24 2.0
28 1.6
32 1.1
36 1.3];
units.Tt3I4  = {'C', 'd'}; label.Tt3I4 = {'temperature', 'duration instar 4', 'LeePark2022'};  
bibkey.Tt3I4 = 'LeePark2022';
%
data.TtI5 = [ ... % temperature (C), duration instar 5 (d)
18	6.2
22	3.4
26	2.3
30	2.2
32	1.8];
units.TtI5  = {'C', 'd'}; label.TtI5 = {'temperature', 'duration instar 5', 'Schl2018'};  
bibkey.TtI5 = 'Schl2018';
%
data.Tt2I5 = [ ... % temperature (C), duration instar 5 (d)
15	11.09864617
20	4.837292334
25	2.949340167
28	2.472551783
30	2.554687166];
units.Tt2I5  = {'C', 'd'}; label.Tt2I5 = {'temperature', 'duration instar 5', 'LopeCarr2019'};  
bibkey.Tt2I5 = 'LopeCarr2019';
%
data.Tt3I5 = [ ... % temperature (C), duration instar 5 (d)
16 11.3
20 3.9
24 2.0
28 1.5
32 1.1
36 1.6];
units.Tt3I5  = {'C', 'd'}; label.Tt3I5 = {'temperature', 'duration instar 5', 'LeePark2022'};  
bibkey.Tt3I5 = 'LeePark2022';
%
data.TtI6 = [ ... % temperature (C), duration instar 6 (d)
18	8.6
22	5.1
26	3.4
30	2
32	2.1];
units.TtI6  = {'C', 'd'}; label.TtI6 = {'temperature', 'duration instar 6', 'Schl2018'};  
bibkey.TtI6 = 'Schl2018';
%
data.Tt2I6 = [ ... % temperature (C), duration instar 6 (d)
15	14.83199658
20	5.904027333
25	3.882656417
28	3.272500534
30	3.221319667];
units.Tt2I6  = {'C', 'd'}; label.Tt2I6 = {'temperature', 'duration instar 6', 'LopeCarr2019'};  
bibkey.Tt2I6 = 'LopeCarr2019';
%
data.Tt3I6 = [ ... % temperature (C), duration instar 6 (d)
16 16.7
20 6.8
24 3.8
28 3.1
32 2.5
36 2.4];
units.Tt3I6  = {'C', 'd'}; label.Tt3I6 = {'temperature', 'duration instar 6', 'LeePark2022'};  
bibkey.Tt3I6 = 'LeePark2022';
%
data.Tte = [ ... % temperature (C), duration pupa stage (d)
18	30.68
22	17.06
26	11.43
30	9
32	7.82];
units.Tte  = {'C', 'd'}; label.Tte = {'temperature', 'duration pupa stage', 'Schl2018'};  
bibkey.Tte = 'Schl2018';
%
data.Tte2 = [ ... % temperature (C), duration pupa stage (d)
20 25.61
25 12.31
27 9.07
30 8.17];
units.Tte2  = {'C', 'd'}; label.Tte2 = {'temperature', 'duration pupa stage', 'LopeCarr2019'};  
bibkey.Tte2 = 'LopeCarr2019';
%
data.Tte3 = [ ... % temperature (C), duration pupa stage (d)
16 35.3
20 18.9
24 11.8
28 8.7
32 6.3
36 5.9];
units.Tte3  = {'C', 'd'}; label.Tte3 = {'temperature', 'duration pupa stage', 'LeePark2022'};  
bibkey.Tte3 = 'LeePark2022';
%
data.Taj = [ ... % temperature (C), age at emergence (d)
16 97.2
20 49.6
24 29.5
28 21.9
32 16.1
36 15.5];
units.Taj  = {'C', 'd'}; label.Taj = {'temperature', 'age at emergence'};  
bibkey.Taj = 'LeePark2022';

% temperature-survival prob
data.Ts = [ ... % temperature (C), Larval mortality (%)
18	71
22	37
26	15
30	4
32	28];
units.Ts  = {'C', '%'}; label.Ts = {'temperature', 'larval mortality'};  
bibkey.Ts = 'Schl2018';

% time since birth-body length
data.tL_B = [... % time since birth (d), bodylength (mm) for different feeding
     0   1.70   1.70   1.70   1.70   1.70   1.70   1.70
     1   2.55   2.55   2.54   2.46   2.63   2.43   2.42
     3   3.87   3.69   3.69   3.60   3.59   3.44   3.50
     6   7.49   7.61   8.55   9.29   7.19   6.17   6.87
     8  11.98  13.52  13.80  12.54  11.42  9.15   8.13
    10  15.86  20.25  18.47  17.83  15.72  12.72  9.62
    13  24.27  30.35  25.45  23.16  23.24  16.96  10.85
    15  30.99  33.79  33.71  29.96  28.55  19.10  NaN
    17  NaN    NaN    NaN    NaN    30.91  23.53  NaN
    20  NaN    NaN    NaN    NaN    NaN    29.49  NaN]; 
data.tL_B(:,1) = data.tL_B(:,1) + 0.5; % age of insect at day 0 of the experiment is < 24h
data.tL_B(:,2:8) = data.tL_B(:,2:8)/ 10; % convert mm to  cm
units.tL_B  = {'d', 'cm'};  label.tL_B = {'time since birth', 'body length'};  
temp.tL_B  = C2K(26);  units.temp.tL_B = 'K'; label.temp.tL_B = 'temperature';  
bibkey.tL_B = 'Baye2021'; treat.tL_B = {1 {'100% 1st run','100% 2nd run','100% 3rd run','80%','50%','40%','30%','20%'}};
label.treat.tL_B = 'food level'; subtitle.treat.tL_B = 'Bayer 2021, different food levels';
%
data.tHL_B = [... % time since birth (d), head length (mm) for different feeding
     0 0.33  0.33  0.33  0.33  0.33  0.33  0.33
     1 0.34  0.34  0.35  0.33  0.33  0.34  0.34
     3 0.49  0.48  0.48  0.46  0.46  0.44  0.48
     6 0.73  0.75  0.81  0.76  0.69  0.66  0.72
     8 1.07  1.15  1.24  1.15  1.05  0.89  0.98
    10 1.49  1.67  1.74  1.52  1.35  1.13  0.86
    13 2.16  2.56  2.61  2.26  2.05  1.68  1.25
    15 2.70  2.62  2.71  2.59  2.48  1.90  NaN
    17 NaN   NaN   NaN   NaN   2.60  2.21  NaN
    20 NaN   NaN   NaN   NaN   NaN   2.56  NaN]; 
data.tHL_B(:,1) = data.tHL_B(:,1) + 0.5; % age of insect at day 0 of the experiment is approx <24h
data.tHL_B(:,2:8) = data.tHL_B(:,2:8)/ 10; % convert mm to  cm
units.tHL_B  = {'d', 'cm'};  label.tHL_B = {'time since birth', 'head length'};  
temp.tHL_B  = C2K(26);  units.temp.tHL_B = 'K'; label.temp.tHL_B = 'temperature';  
bibkey.tHL_B = 'Baye2021'; treat.tHL_B = {1 {'100% 1st run','100% 2nd run','100% 3rd run','80%','50%','40%','30%','20%'}};
label.treat.tHL_B = 'food level'; subtitle.treat.tHL_B = 'Bayer 2021, different food levels';

% time since birth-weight
data.tWw_B = [... % time since birth (d), wet weight (mg) for different feeding
    0   0.078   0.078   0.078   0.078   0.078   0.078   0.078
    1   0.363   0.226   0.222   0.245   0.223   0.226   0.196
    3   0.794   0.947   0.783   0.815   0.773   0.675   0.635
    6   8.289   7.605   8.020   7.740   5.556   3.569   4.230
    8   24.630  34.525  30.830  25.940  17.375  11.540  7.530
    10  63.775  102.94  89.200  72.440  46.665  28.635  13.210
    13  215.575 345.78  277.160 196.210 152.98  69.905  27.600
    15  399.055 487.97  504.710 504.720 262.26  101.50  NaN
    17  NaN     NaN     NaN     NaN     351.495 170.425 NaN
    20  NaN     NaN     NaN     NaN     NaN     356.283 NaN]; 
data.tWw_B(:,1) = data.tWw_B(:,1) + 0.5; % age of insect at day 0 of the experiment is approx <24h
data.tWw_B(:,2:8) = data.tWw_B(:,2:8)/1000; % convert mg to  g
units.tWw_B  = {'d', 'g'};  label.tWw_B = {'time since birth', 'weight'};  
temp.tWw_B  = C2K(26);  units.temp.tWw_B = 'K'; label.temp.tWw_B = 'temperature';  
bibkey.tWw_B = 'Baye2021'; treat.tWw_B = {1 {'100% 1st run','100% 2nd run','100% 3rd run','80%','50%','40%','30%','20%'}};
label.treat.tWw_B = 'food level'; subtitle.treat.tWw_B = 'Bayer 2021, different food levels';

% temperature-feeding rate
data.TJX_1 = [ % temperature (C), feeding rate instar 1 (g/d)
    16 0.029
    20 0.026
    24 0.008
    28 0.012
    32 0.006
    36 0.027];
data.TJX_1(:,2) = data.TJX_1(:,2)./data.Tt3I1(:,2);
units.TJX_1  = {'C', 'g/d'}; label.TJX_1 = {'temperature','feeding rate','instar 1'};  
bibkey.TJX_1 = 'LeePark2022';
%
data.TJX_2 = [ % temperature (C), feeding rate instar 2 (g/d)
    16 0.040
    20 0.026
    24 0.028
    28 0.010
    32 0.009
    36 0.035];
data.TJX_2(:,2) = data.TJX_2(:,2)./data.Tt3I2(:,2);
units.TJX_2  = {'C', 'g/d'}; label.TJX_2 = {'temperature','feeding rate','instar 2'};  
bibkey.TJX_2 = 'LeePark2022';
%
data.TJX_3 = [ % temperature (C), feeding rate instar 3 (g/d)
    16 0.164
    20 0.100
    24 0.088
    28 0.104
    32 0.065
    36 0.068];
data.TJX_3(:,2) = data.TJX_3(:,2)./data.Tt3I3(:,2);
units.TJX_3  = {'C', 'g/d'}; label.TJX_3 = {'temperature', 'feeding rate','instar 3'};  
bibkey.TJX_3 = 'LeePark2022';
%
data.TJX_4 = [ % temperature (C), feeding rate instar 4 (g/d)
    16 0.372
    20 0.386
    24 0.364
    28 0.372
    32 0.255
    36 0.239];
data.TJX_4(:,2) = data.TJX_4(:,2)./data.Tt3I4(:,2);
units.TJX_4  = {'C', 'g/d'}; label.TJX_4 = {'temperature', 'feeding rate','instar 4'};  
bibkey.TJX_4 = 'LeePark2022';
%
data.TJX_5 = [ % temperature (C), feeding rate instar 5 (g/d)
    16 1.454
    20 1.172
    24 0.867
    28 0.538
    32 0.567
    36 0.495];
data.TJX_5(:,2) = data.TJX_5(:,2)./data.Tt3I5(:,2);
units.TJX_5  = {'C', 'g/d'}; label.TJX_5 = {'temperature', 'feeding rate','instar 5'};  
bibkey.TJX_5 = 'LeePark2022';
%
data.TJX_6 = [ % temperature (C), feeding rate instar 6 (g/d)
    16 4.526
    20 4.065
    24 2.452
    28 3.640
    32 2.716
    36 2.255];
data.TJX_6(:,2) = data.TJX_6(:,2)./data.Tt3I6(:,2);
units.TJX_6  = {'C', 'g/d'}; label.TJX_6 = {'temperature','feeding rate','instar 6'};  
bibkey.TJX_6 = 'LeePark2022';

% feeding level-eggs/female
data.JXNi = [ ... % feeding level (%), average number of eggs/female (#)
    %100 256
    100 550
    40  412
    30  180];
units.JXNi = {'%','#'}; label.JXNi = {'food concentration','average number of eggs/female'}; 
temp.JXNi = C2K(26); units.temp.JXNi = 'K'; label.temp.JXNi = 'temperature';
bibkey.JXNi = 'Baye2021'; treat.JXNi = {0}; title.JXNi = 'Egg production at various larval feeding levels';

% temperature - duration of larva 
data.Ttj(:,1) = data.TtI1(:,1);
data.Ttj(:,2) = data.TtI1(:,2)+data.TtI2(:,2)+data.TtI3(:,2)+data.TtI4(:,2)+data.TtI5(:,2)+data.TtI6(:,2);
units.Ttj  = {'C', 'd'}; label.Ttj = {'temperature', 'duration of larva'};  
bibkey.Ttj = 'Schl2018';

% temperature - duration of larva 
data.Ttj2(:,1) = data.Tt2I1(:,1);
data.Ttj2(:,2) = data.Tt2I1(:,2)+data.Tt2I2(:,2)+data.Tt2I3(:,2)+data.Tt2I4(:,2)+data.Tt2I5(:,2)+data.Tt2I6(:,2);
units.Ttj2  = {'C', 'd'}; label.Ttj2 = {'temperature', 'duration of larva'};  
bibkey.Ttj2 = 'LopeCarr2019';

% temperature - duration of larva 
data.Ttj3(:,1) = data.Tt3I1(:,1);
data.Ttj3(:,2) = data.Tt3I1(:,2)+data.Tt3I2(:,2)+data.Tt3I3(:,2)+data.Tt3I4(:,2)+data.Tt3I5(:,2)+data.Tt3I6(:,2);
units.Ttj3  = {'C', 'd'}; label.Ttj3 = {'temperature', 'duration of larva'};  
bibkey.Ttj3 = 'LeePark2022';


% survival from starvation experiment
data.tS2  =[... % t in days and S in fraction of surviving individuals, -
0	1
0.82 1.00
1.35 1.00
1.85 1.00
2.34 0.99
2.86 0.99
3.35 0.98
3.84 0.98
4.36 0.96
4.87 0.94
5.39 0.89
5.88 0.84
6.38 0.75
6.88 0.69
7.41 0.58
7.91 0.48
8.40 0.38
8.92 0.30
9.42 0.23
9.91 0.16
10.43 0.11
10.93 0.09
11.45 0.05
11.94 0.03
12.47 0.03
12.94 0.02
13.50 0.01
14.00 0.01
14.48 0.00
15.01 0.00];
units.tS2 = {'d', '-'}; label.tS2 = {'starvation period', 'fraction surviving', 'starved'};      
temp.tS2  = C2K(26); units.temp.tS2 = 'K'; label.temp.tS2 = 'temperature';
bibkey.tS2 = {'GaoLin2023'};
comment.tS2 = 'Survival under starvation in 6th instar larvae';

%% set weights for all real data
weights = setweights(data, []);
weights.Lj = 3 * weights.Lj;
weights.JXNi = 5*weights.JXNi;
weights.Tab = 5 * weights.Tab;
weights.Tab2 = 5 * weights.Tab2;
weights.Tab3 = 5 * weights.Tab3;
weights.TtI1 = 5* weights.TtI1;
weights.Tt2I1 = 5* weights.Tt2I1;
weights.Tt3I1 = 5* weights.Tt3I1;
weights.tL_B = 5 * weights.tL_B;
weights.tHL_B = 5 * weights.tHL_B;


%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.99; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 
weights.psd.k_J = 0 * weights.psd.k_J;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
txtData.subtitle = subtitle;

%% Group plots
set1 = {'Tab', 'Tab2', 'Tab3'}; subtitle1 = {'Data from Schl2018, GarcMeag2018, LeePark2022'};
set2 = {'TtI1', 'Tt2I1', 'Tt3I1'}; subtitle2 = {'Data for instar 1'};
set3 = {'TtI2', 'Tt2I2', 'Tt3I2'}; subtitle3 = {'Data for instar 2'};
set4 = {'TtI3', 'Tt2I3', 'Tt3I3'}; subtitle4 = {'Data for instar 3'};
set5 = {'TtI4', 'Tt2I4', 'Tt3I4'}; subtitle5 = {'Data for instar 4'};
set6 = {'TtI5', 'Tt2I5', 'Tt3I5'}; subtitle6 = {'Data for instar 5'};
set7 = {'TtI6', 'Tt2I6', 'Tt3I6'}; subtitle7 = {'Data for instar 6'};
set8 = {'Tte', 'Tte2', 'Tte3'};   subtitle8 = {'Data from Schl2018, LopeCarr2019, LeePark2022'};
set9 = {'TJX_1', 'TJX_2', 'TJX_3', 'TJX_4', 'TJX_5', 'TJX_6'}; subtitle9 = {'Data different instars'};
set10 = {'Ttj', 'Ttj2', 'Ttj3'}; subtitle10 = {'Data from Schl2018, LopeCarr2019, LeePark2022'};
% 
metaData.grp.sets = {set1, set2, set3, set4, set5, set6, set7, set8, set9, set10};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3,subtitle4,subtitle5,subtitle6,subtitle7,subtitle8,subtitle9,subtitle10};

%% Discussion points
D1 = 'Arrhenium temp of 1st instar and for larval mortality differ from the rest';
D2 = 'mod1: changed model from hex to hax';
D3 = 'mod1: new data added: growth data under different feeding levels, food uptake per instar for different temperatures';
D4 = 'mod2: new data added for survival under starvation conditions';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = '4Z9P3'; % Cat of Life
metaData.links.id_ITIS = '117472'; % ITIS
metaData.links.id_EoL = '533408'; % Ency of Life
metaData.links.id_Wiki = 'Spodoptera_frugiperda'; % Wikipedia
metaData.links.id_ADW = 'Spodoptera_frugiperda'; % ADW
metaData.links.id_Taxo = '591465'; % Taxonomicon
metaData.links.id_WoRMS = '1488755'; % WoRMS
metaData.links.id_lepidoptera = '269238'; % lepidoptera

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Spodoptera_frugiperda}}';
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
bibkey = 'GarcMeag2018'; type = 'Article'; bib = [ ... 
'author = {Garcia, A.G. and Godoy, W.A.C. and Thomas, J.M.G. and  Nagoshi, R.N. and Meagher, R.L.}, ' ...
'year = {2018}, ' ...
'title = {Delimiting Strategic Zones for the Development of Fall Armyworm ({L}epidoptera: {N}octuidae) on Corn in the {S}tate of {F}lorida}, ' ...
'journal = {Journal of Economic Entomology}, ' ...
'volume = {111}, ' ...
'pages = {120-126}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MontHunt2019'; type = 'Article'; bib = [ ... 
'author = {Montezano, D.G and Specht, A. and Sosa-G\''{o}mez, D.R. and Roque-Specht,F.F. and de Paula-Moraes, S.V. and Peterson, J.A. and Hunt, T.E.}, ' ...
'year = {2019}, ' ...
'title = {Developmental Parameters of \emph{Spodoptera frugiperda} ({L}epidoptera: {N}octuidae) Immature Stages Under Controlled and Standardized Conditions}, ' ...
'journal = {Journal of Agricultural Science}, ' ...
'volume = {11}, ' ...
'pages = {76-89}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SilvOliv2017'; type = 'Article'; bib = [ ... 
'author = {Silva, D. M. and Bueno, A.D. and Andrade, K. and Stecca, C.D. and Neves, P.M. and Oliveira, M.C.}, ' ...
'year = {2017}, ' ...
'title = {Biology and nutrition of \emph{Spodoptera frugiperda} ({L}epidoptera: {N}octuidae) fed on different food sources}, ' ...
'journal = {Scientia Agricola}, ' ...
'volume = {74}, ' ...
'pages = {18-31}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Schl2018'; type = 'phdthesis'; bib = [ ... 
'author = {Schlemmer M.}, ' ...
'year = {2018}, ' ...
'title = {Effect of temperature on development and reproduction of \emph{Spodoptera frugiperda} ({L}epidoptera: {N}octuidae)}, ' ...
'publisher = {North-West University}, ' ...
'pages = {93}, ' ...
'howpublished = {\url{https://www.semanticscholar.org/paper/Effect-of-temperature-on-development-and-of-Schlemmer/acdfd8619c3de850d5a4efd9ace900339d1dfcb7}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LopeCarr2019'; type = 'Article'; bib = [ ... 
'author = {L\''{o}pez, R.Y. and Ortega, A.V. and Centeno, J.H.A. and Ru\''{i}z, J.S. and Carranza, J.A.Q.}, ' ...
'year = {2010}, ' ...
'title = {Sistema de alerta contra el gusano cogollero \emph{Spodoptera frugiperda} ({J}. {E}. {S}mith) ({I}nsecta: {L}epidoptera: {N}octuidae)}, ' ...
'journal = {Revista Mexicana de Ciencias Agr\''{i}colas}, ' ...
'volume = {10}, ' ...
'pages = {405-416}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Baye2021'; type = 'Misc'; bib = [ ...
'author = {Bayer, A.G.}, ' ... 
'year = {2021}, ' ...
'note = {Influence of food supply on development and egg production of \textit{Spodoptera frugiperda} in a static laboratory test system}}, ' ...
'howpublished = {unpublished data}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LeePark2022'; type = 'Article'; bib = [ ... 
'author = {Lee, A. and Park, Y. and Hwang, C. and Park, A. and Lee, S. and Kim, J.}, ' ...
'year = {2022}, ' ...
'title = {Prediction of Growth Characteristics and Migration Period of \emph{Spodoptera frugiperda} ({L}epidoptera: {N}octuidae) According to Temperature}, ' ...
'journal = {Insects}, ' ...
'volume = {13}, ' ...
'issue = {987}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GaoLin2023'; type = 'Article'; bib = [ ... 
'author = {Gao, X. and Lin, Y. and Zhang, Z. and Oui, L. and Ding, W. and Goa, Q. and Gao, H. and Xue, J. and Li, Y. and He, H.}, ' ...
'year = {2024}, ' ...
'title = {Storage protein SfSP8 mediates larval starvation tolerance of \emph{Spodoptera frugiperda} }, ' ...
'journal = {Molecular Biology Reports}, ' ...
'volume = {51}, ' ...
'pages = {843}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
