function [data, auxData, metaData, txtData, weights] = mydata_Helicoverpa_armigera 

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Insecta'; 
metaData.order      = 'Lepidoptera'; 
metaData.family     = 'Noctuidae';
metaData.species    = 'Helicoverpa_armigera'; 
metaData.species_en = 'Cotton Bollworm'; 

metaData.ecoCode.climate = {'A','BWh','Cfa','Dfb'}; 
metaData.ecoCode.ecozone = {'TN','TH','TPa','TA'}; 
metaData.ecoCode.habitat = {'0iTg'}; 
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {'Ml'}; 
metaData.ecoCode.food    = {'bjHl','eiHn'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};  

metaData.T_typical  = C2K(25); % K, 
metaData.data_0     = {'tp'; 'tj'; 'te'; 'Lb'; 'Lj'; 'Wwj'; 'Ni'};
metaData.data_1     = {'T-ab'; 'T-tj'; 'T-te'; 't-L'; 't-Ww'; 'T-astar'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author_mod_1   = {'Klagkou Evridiki', 'Andre Gergs', 'Christian Baden', 'Dina Lika'};        
metaData.date_mod_1 = [];                           
metaData.email_mod_1    = {'biop1070@edu.biology.uoc.gr'};                 
metaData.address_mod_1  = {'University of Crete'}; 

metaData.author   = {'Andre Gergs','Christian Baden'};    
metaData.date_subm = [2020 10 02];              
metaData.email    = {'andre.gergs@bayer.com'};            
metaData.address  = {'Bayer AG'};   

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2020 10 02]; 

%% set data
% zero-variate data 
data.tp = 9.93; units.tp = 'd'; label.tp = 'time since birth at puberty'; bibkey.tp = 'MiroSavo2008';   
  temp.tp = C2K(27.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';  

data.tj = 12.7; units.tj = 'd'; label.tj = 'time since birth at pupation'; bibkey.tj = 'BarboVali2016';   
  temp.tj = C2K(27);  units.temp.tj = 'K'; label.temp.tj = 'temperature';  
data.te = 12.35; units.te = 'd'; label.te = 'duration of pupa stage'; bibkey.te = 'MiroSavo2008';   
  temp.te = C2K(25); units.temp.te = 'K'; label.temp.te = 'temperature';

data.Lb = 0.16; units.Lb = 'cm'; label.Lb = 'length at birth'; bibkey.Lb = 'PatiKane2018'; 
data.Lj = 19.60/10; units.Lj = 'cm'; label.Lj = 'body lengh at pupation'; bibkey.Lj = 'Baye2021';
 
data.Wwj = 0.3581;   units.Wwj = 'g'; label.Wwj = 'wet weight of pupa';      bibkey.Wwj = 'BarboVali2016';
  comment.Wwj = 'weight measure for artificial diet';  

data.Ni = 656.27; units.Ni = '#'; label.Ni = 'number of eggs'; bibkey.Ni = 'MiroSavo2008';   
    comment.Ni = 'average egg number excluding outliers';
 
% uni-variate data
% time - age at birth 
data.Tab = [ ... % temperature (C), age at birth (d)
12.5 19.11
15   13.57
17.5 6.6
20   5.12
25   3.31
27.5 2.4
30   2.1
32.5 2.01
35   2.04
37.5 2.11];
units.Tab  = {'C', 'd'}; label.Tab = {'temperature', 'age at birth'};  
bibkey.Tab = 'MiroSavo2008';

% temperature - duration of instars
data.TtI1 = [ ... % temperature (C), duration instar 1 (d)
15   9.31
17.5 4.3
20   4.17
25   3.27
27.5 2.46
30   2.22
32.5 2.04
35   2
37.5 2.01];
units.TtI1  = {'C', 'd'}; label.TtI1 = {'temperature', 'duration instar 1'};  
bibkey.TtI1 = 'MiroSavo2008';
%
data.TtI2 = [ ... % temperature (C), duration instar 2 (d)
15   7.87 
17.5 3.14
20   3.06
25   1.91
27.5 1.91
30   1.6
32.5 1.21
35   1.02
37.5 1.19];
units.TtI2  = {'C', 'd'}; label.TtI2 = {'temperature', 'duration instar 2'};  
bibkey.TtI2 = 'MiroSavo2008';
%
data.TtI3 = [ ... % temperature (C), duration instar 3 (d)
15   8.22
17.5 3.84
20   2.98
25   2.03
27.5 2.03
30   1.96
32.5 1.57
35   1.12
37.5 1.76];
units.TtI3  = {'C', 'd'}; label.TtI3 = {'temperature', 'duration instar 3'};  
bibkey.TtI3 = 'MiroSavo2008';
%
data.TtI4 = [ ... % temperature (C), duration instar 4 (d)
15   10.41
17.5 5.14
20   4.06
25   2.31
27.5 3.53
30   3.03
32.5 2.55
35   2.49
37.5 3.05];
units.TtI4  = {'C', 'd'}; label.TtI4 = {'temperature', 'duration instar 4'};  
bibkey.TtI4 = 'MiroSavo2008';
%
data.TtI5 = [ ... % temperature (C), duration instar 5 (d)
15   19.81
17.5 10.74
20   8.6
25   5.18
27.5 5.06
30   4
32.5 3.37
35   4.51
37.5 3.75];
units.TtI5  = {'C', 'd'}; label.TtI5 = {'temperature', 'duration instar 5'};  
bibkey.TtI5 = 'MiroSavo2008';

% temperature - duration of pupa stage
data.Tte = [ ... % temperature (C), duration pupa stage (d)
17.5 23.81
20   20.8
25   12.35
27.5 11.29
30   9.07
32.5 8.36
35   8.56
37.5 8.33];
units.Tte  = {'C', 'd'}; label.Tte = {'temperature', 'duration pupa stage'};  
bibkey.Tte = 'MiroSavo2008';

% temperature - age at birth 
data.Tab2 = [ ... % temperature (C), age at birth (d)
37.5 2.852
35   2.315
30   2.987
27.5 3.485
25   4.154
20   8.101
17.5 10.669
15   15.305
10   23.388];
units.Tab2  = {'C', 'd'}; label.Tab2 = {'temperature', 'age at birth'};  
bibkey.Tab2 = 'NoorAli2017';

% temperature - duration of larva
data.Ttj(:,1) = data.TtI1(:,1);
data.Ttj(:,2) = data.TtI1(:,2)+data.TtI2(:,2)+data.TtI3(:,2)+data.TtI4(:,2)+data.TtI5(:,2);
units.Ttj  = {'C', 'd'}; label.Ttj = {'temperature', 'duration of larva'};  
bibkey.Ttj = 'MiroSavo2008';

%temperature - duration of pupa
data.Tte2 = [ ... % temperature (C), duration of pupa (d)
37.5 11.170
35   7.950
30   10.248
27.5 11.168
25   12.434
20   22.317
17.5 31.337];
units.Tte2  = {'C', 'd'}; label.Tte2 = {'temperature', 'duration of pupa'};  
bibkey.Tte2 = 'NoorAli2017';

%temperature - duration of pupa
data.Tte3 = [ ... % temperature (C), duration of pupa (d)
15 60.107
25 9.913
35 7.502];
units.Tte3  = {'C', 'd'}; label.Tte3 = {'temperature', 'duration of pupa'};  
bibkey.Tte3 = 'AkbaPava2015';

% temperature - age at birth 
data.Tab3 = [ ... % temperature (C), age at birth (d)
13.3 14.1
16.4 9.9
20.0 5.5
22.5 4.9
25.0 3.0
27.9 2.8
30.5 2.6
32.5 2.5];
units.Tab3  = {'C', 'd'}; label.Tab3 = {'temperature', 'age at birth'};  
bibkey.Tab3 = 'JallMats2001';

%temperature - duration of pupa
data.Tte4 = [ ... % temperature (C), duration of pupa (d)
16.4 43.0
20.0 24.1
22.5 19.4
25.0 13.5
27.9 11.1
30.5 9.4
32.5 9.0];
units.Tte4  = {'C', 'd'}; label.Tte4 = {'temperature', 'duration of pupa'};  
bibkey.Tte4 = 'JallMats2001';


% time - length
data.tL = [ ... % time (d), length (cm)
1 0.0263
2 0.0304
3 0.0386
4 0.0421
5 0.062
7 0.137
8 0.154
9 0.197
10 0.249];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'head length'};  
temp.tL    = C2K(26);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BarboVali2016';
%
tL_B = [... % time since birth (d), bodylength (mm) for different feeding
    0   2.18   2.18   2.18   2.18   2.18   2.18   2.18
    1   3.10   3.64   2.94   2.80   3.67   3.28   2.64
    3   3.83   5.71   4.07   3.77   5.15   5.06   3.30
    6   6.94   10.70  6.95   6.54   7.47   7.90   5.48
    8   10.57  13.80  10.91  10.01  7.72   9.98   6.70
    10  15.87  20.45  14.02  13.16  12.85  12.28  9.08
    13  24.22  27.06  21.63  20.51  19.71  13.35  13.52
    15  30.00  30.21  29.62  26.12  22.65  14.60  12.96
    17  33.93  30.79  32.62  31.29  23.51  NaN    13.55]; 
tL_B(:,1) = tL_B(:,1) + 0.5; % age of insect at day 0 of the experiment is approx <24h
tL_B(:,2:8) = tL_B(:,2:8)/ 10; % convert mm to  cm

notNaN = find(~isnan(tL_B(:,2))); lastnotNaN = notNaN(end); % last non NaN value
data.tL_B1 = tL_B(notNaN,[1,2]);
units.tL_B1  = {'d', 'cm'};  label.tL_B1 = {'time since birth', 'length'};  
temp.tL_B1  = C2K(24);  units.temp.tL_B1 = 'K'; label.temp.tL_B1 = 'temperature';  
bibkey.tL_B1 = 'Baye2021';
comment.tL_B1  = 'Data for bodylength for food level: 100 % 2nd run';

notNaN = find(~isnan(tL_B(:,3))); lastnotNaN = notNaN(end); % last non NaN value
data.tL_B2 = tL_B(notNaN,[1,3]);
units.tL_B2  = {'d', 'cm'};  label.tL_B2 = {'time since birth', 'length'};  
temp.tL_B2  = C2K(24);  units.temp.tL_B2 = 'K'; label.temp.tL_B2 = 'temperature';  
bibkey.tL_B2 = 'Baye2021';
comment.tL_B2  = 'Data for bodylength for food level: 100 % 3rd run';

notNaN = find(~isnan(tL_B(:,4))); lastnotNaN = notNaN(end); % last non NaN value
data.tL_B3 = tL_B(notNaN,[1,4]);
units.tL_B3  = {'d', 'cm'};  label.tL_B3 = {'time since birth', 'length'};  
temp.tL_B3  = C2K(24);  units.temp.tL_B3 = 'K'; label.temp.tL_B3 = 'temperature';  
bibkey.tL_B3 = 'Baye2021';
comment.tL_B3  = 'Data for bodylength for food level: 80%';

notNaN = find(~isnan(tL_B(:,5))); lastnotNaN = notNaN(end); % last non NaN value
data.tL_B4 = tL_B(notNaN,[1,5]);
units.tL_B4  = {'d', 'cm'};  label.tL_B4 = {'time since birth', 'length'};  
temp.tL_B4  = C2K(24);  units.temp.tL_B4 = 'K'; label.temp.tL_B4 = 'temperature';  
bibkey.tL_B4 = 'Baye2021';
comment.tL_B4  = 'Data for bodylength for food level: 50%';

notNaN = find(~isnan(tL_B(:,6))); lastnotNaN = notNaN(end); % last non NaN value
data.tL_B5 = tL_B(notNaN,[1,6]);
units.tL_B5  = {'d', 'cm'};  label.tL_B5 = {'time since birth', 'length'};  
temp.tL_B5  = C2K(24);  units.temp.tL_B5 = 'K'; label.temp.tL_B5 = 'temperature';  
bibkey.tL_B5 = 'Baye2021';
comment.tL_B5  = 'Data for bodylength for food level: 40%';

notNaN = find(~isnan(tL_B(:,7))); lastnotNaN = notNaN(end); % last non NaN value
data.tL_B6 = tL_B(notNaN,[1,7]);
units.tL_B6  = {'d', 'cm'};  label.tL_B6 = {'time since birth', 'length'};  
temp.tL_B6  = C2K(24);  units.temp.tL_B6 = 'K'; label.temp.tL_B6 = 'temperature';  
bibkey.tL_B6 = 'Baye2021';
comment.tL_B6  = 'Data for bodylength for food level: 30%';

notNaN = find(~isnan(tL_B(:,8))); lastnotNaN = notNaN(end); % last non NaN value
data.tL_B7 = tL_B(notNaN,[1,8]);
units.tL_B7  = {'d', 'cm'};  label.tL_B7 = {'time since birth', 'length'};  
temp.tL_B7  = C2K(24);  units.temp.tL_B7 = 'K'; label.temp.tL_B7 = 'temperature';  
bibkey.tL_B7 = 'Baye2021';
comment.tL_B7  = 'Data for bodylength for food level: 20%';

tHL_B = [... % time since birth (d), headlength (mm) for different feeding
    0  0.32  0.32  0.32  0.32  0.32  0.32  0.32
    1  0.33  0.34  0.32  0.31  0.35  0.33  0.31
    3  0.37  0.50  0.41  0.40  0.46  0.46  0.33
    6  0.62  0.80  0.58  0.55  0.62  0.69  0.47
    8  0.83  1.08  0.76  0.75  0.71  0.82  0.55
    10 1.25  1.70  1.03  1.13  1.01  1.18  0.67
    13 2.12  2.41  1.90  1.62  1.55  1.11  1.11
    15 2.50  2.64  2.61  2.36  1.95  1.37  1.23
    17 2.81  2.67  2.82  2.71  2.22  NaN   1.32]; 
tHL_B(:,1) = tHL_B(:,1) + 0.5; % age of insect at day 0 of the experiment is approx <24h
tHL_B(:,2:8) = tHL_B(:,2:8)/ 10; % convert mm to  cm

notNaN = find(~isnan(tHL_B(:,2))); lastnotNaN = notNaN(end); % last non NaN value
data.tHL_B1 = tHL_B(notNaN,[1,2]);
units.tHL_B1  = {'d', 'cm'};  label.tHL_B1 = {'time since birth', 'head length'};  
temp.tHL_B1  = C2K(24);  units.temp.tHL_B1 = 'K'; label.temp.tHL_B1 = 'temperature';  
bibkey.tHL_B1 = 'Baye2021';
comment.tHL_B1  = 'Data for head length for food level: 100 % 2nd run';

notNaN = find(~isnan(tHL_B(:,3))); lastnotNaN = notNaN(end); % last non NaN value
data.tHL_B2 = tHL_B(notNaN,[1,3]);
units.tHL_B2  = {'d', 'cm'};  label.tHL_B2 = {'time since birth', 'head length'};  
temp.tHL_B2  = C2K(24);  units.temp.tHL_B2 = 'K'; label.temp.tHL_B2 = 'temperature';  
bibkey.tHL_B2 = 'Baye2021';
comment.tHL_B2  = 'Data for head length for food level: 100 % 3rd run';

notNaN = find(~isnan(tHL_B(:,4))); lastnotNaN = notNaN(end); % last non NaN value
data.tHL_B3 = tHL_B(notNaN,[1,4]);
units.tHL_B3  = {'d', 'cm'};  label.tHL_B3 = {'time since birth', 'head length'};  
temp.tHL_B3  = C2K(24);  units.temp.tHL_B3 = 'K'; label.temp.tHL_B3 = 'temperature';  
bibkey.tHL_B3 = 'Baye2021';
comment.tHL_B3  = 'Data for head length for food level: 80%';

notNaN = find(~isnan(tHL_B(:,5))); lastnotNaN = notNaN(end); % last non NaN value
data.tHL_B4 = tHL_B(notNaN,[1,5]);
units.tHL_B4  = {'d', 'cm'};  label.tHL_B4 = {'time since birth', 'head length'};  
temp.tHL_B4  = C2K(24);  units.temp.tHL_B4 = 'K'; label.temp.tHL_B4 = 'temperature';  
bibkey.tHL_B4 = 'Baye2021';
comment.tHL_B4  = 'Data for head length for food level: 50%';

notNaN = find(~isnan(tHL_B(:,6))); lastnotNaN = notNaN(end); % last non NaN value
data.tHL_B5 = tHL_B(notNaN,[1,6]);
units.tHL_B5  = {'d', 'cm'};  label.tHL_B5 = {'time since birth', 'head length'};  
temp.tHL_B5  = C2K(24);  units.temp.tHL_B5 = 'K'; label.temp.tHL_B5 = 'temperature';  
bibkey.tHL_B5 = 'Baye2021';
comment.tHL_B5  = 'Data for head length for food level: 40%';

notNaN = find(~isnan(tHL_B(:,7))); lastnotNaN = notNaN(end); % last non NaN value
data.tHL_B6 = tHL_B(notNaN,[1,7]);
units.tHL_B6  = {'d', 'cm'};  label.tHL_B6 = {'time since birth', 'head length'};  
temp.tHL_B6  = C2K(24);  units.temp.tHL_B6 = 'K'; label.temp.tHL_B6 = 'temperature';  
bibkey.tHL_B6 = 'Baye2021';
comment.tHL_B6  = 'Data for bodylength for food level: 30%';

notNaN = find(~isnan(tHL_B(:,8))); lastnotNaN = notNaN(end); % last non NaN value
data.tHL_B7 = tHL_B(notNaN,[1,8]);
units.tHL_B7  = {'d', 'cm'};  label.tHL_B7 = {'time since birth', 'head length'};  
temp.tHL_B7  = C2K(24);  units.temp.tHL_B7 = 'K'; label.temp.tHL_B7 = 'temperature';  
bibkey.tHL_B7 = 'Baye2021';
comment.tHL_B7  = 'Data for bodylength for food level: 20%';


tWw_B = [... % time since birth (d), wet weight (mg) for different feeding
    0  0.131   0.131   0.131    0.131    0.131    0.131   0.131
    1  0.316   0.587   0.388    0.380    0.469    0.364   0.259
    3  0.774   2.338   1.155    1.018    1.634    1.452   0.610
    6  5.652   16.455  5.038    4.553    5.121    5.689   2.407
    8  16.22   36.36   18.836   15.68    13.07    15.40   4.780
    10 54.88   107.41  46.705   39.06    37.84    27.67   12.255
    13 196.90  268.23  172.085  132.30   119.06   38.88   38.970
    15 343.75  423.05  369.325  255.32   175.52   47.17   38.715
    17 525.15  441.88  505.025  485.42   238.03   NaN     37.783]; 
tWw_B(:,1) = tWw_B(:,1) + 0.5; % age of insect at day 0 of the experiment is approx <24h
tWw_B(:,2:8) = tWw_B(:,2:8)/1000; % convert mg to  g

notNaN = find(~isnan(tWw_B(:,2))); lastnotNaN = notNaN(end); % last non NaN value
data.tWw_B1 = tWw_B(notNaN,[1,2]);
units.tWw_B1  = {'d', 'g'};  label.tWw_B1 = {'time since birth', 'weight'};  
temp.tWw_B1  = C2K(24);  units.temp.tWw_B1 = 'K'; label.temp.tWw_B1 = 'temperature';  
bibkey.tWw_B1 = 'Baye2021';
comment.tWw_B1  = 'Data for weight for food level: 100 % 2nd run';

notNaN = find(~isnan(tWw_B(:,3))); lastnotNaN = notNaN(end); % last non NaN value
data.tWw_B2 = tWw_B(notNaN,[1,3]);
units.tWw_B2  = {'d', 'g'};  label.tWw_B2 = {'time since birth', 'weight'};  
temp.tWw_B2  = C2K(24);  units.temp.tWw_B2 = 'K'; label.temp.tWw_B2 = 'temperature';  
bibkey.tWw_B2 = 'Baye2021';
comment.tWw_B2  = 'Data for weight for food level: 100 % 3rd run';

notNaN = find(~isnan(tWw_B(:,4))); lastnotNaN = notNaN(end); % last non NaN value
data.tWw_B3 = tWw_B(notNaN,[1,4]);
units.tWw_B3  = {'d', 'g'};  label.tWw_B3 = {'time since birth', 'weight'};  
temp.tWw_B3  = C2K(24);  units.temp.tWw_B3 = 'K'; label.temp.tWw_B3 = 'temperature';  
bibkey.tWw_B3 = 'Baye2021';
comment.tWw_B3  = 'Data for weight for food level: 80%';

notNaN = find(~isnan(tWw_B(:,5))); lastnotNaN = notNaN(end); % last non NaN value
data.tWw_B4 = tWw_B(notNaN,[1,5]);
units.tWw_B4  = {'d', 'g'};  label.tWw_B4 = {'time since birth', 'weight'};  
temp.tWw_B4  = C2K(24);  units.temp.tWw_B4 = 'K'; label.temp.tWw_B4 = 'temperature';  
bibkey.tWw_B4 = 'Baye2021';
comment.tWw_B4  = 'Data for weight for food level: 50%';

notNaN = find(~isnan(tWw_B(:,6))); lastnotNaN = notNaN(end); % last non NaN value
data.tWw_B5 = tWw_B(notNaN,[1,6]);
units.tWw_B5  = {'d', 'g'};  label.tWw_B5 = {'time since birth', 'weight'};  
temp.tWw_B5  = C2K(24);  units.temp.tWw_B5 = 'K'; label.temp.tWw_B5 = 'temperature';  
bibkey.tWw_B5 = 'Baye2021';
comment.tWw_B5  = 'Data for weight for food level: 40%';

notNaN = find(~isnan(tWw_B(:,7))); lastnotNaN = notNaN(end); % last non NaN value
data.tWw_B6 = tWw_B(notNaN,[1,7]);
units.tWw_B6  = {'d', 'g'};  label.tWw_B6 = {'time since birth', 'weight'};  
temp.tWw_B6  = C2K(24);  units.temp.tWw_B6 = 'K'; label.temp.tWw_B6 = 'temperature';  
bibkey.tWw_B6 = 'Baye2021';
comment.tWw_B6  = 'Data for weight for food level: 30%';

notNaN = find(~isnan(tWw_B(:,8))); lastnotNaN = notNaN(end); % last non NaN value
data.tWw_B7 = tWw_B(notNaN,[1,8]);
units.tWw_B7  = {'d', 'g'};  label.tWw_B7 = {'time since birth', 'weight'};  
temp.tWw_B7  = C2K(24);  units.temp.tWw_B7 = 'K'; label.temp.tWw_B7 = 'temperature';  
bibkey.tWw_B7 = 'Baye2021';
comment.tWw_B7  = 'Data for weight for food level: 20%';

%% set weights for all real data
weights = setweights(data, []);
weights.tp = 3 * weights.tp;
weights.Wwj = 5 * weights.Wwj;
weights.tj = 5 * weights.tj;
weights.te = 3 * weights.te;
weights.Tte = 3 * weights.Tte;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.99; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 
weights.psd.p_M = 0.1;
weights.psd.k_J = 0 * weights.psd.k_J;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_B1', 'tL_B2', 'tL_B3', 'tL_B4','tL_B5', 'tL_B6', 'tL_B7'}; subtitle1 ={'Bayer 2021 food levels 100% 2nd run, 100% 3rd run, 80%, 50% 40%, 30%, 20%'};
set2 = {'tHL_B1', 'tHL_B2', 'tHL_B3', 'tHL_B4','tHL_B5', 'tHL_B6', 'tHL_B7'}; subtitle2 ={'Bayer 2021 food levels 100% 2nd run, 100% 3rd run, 80%, 50% 40%, 30%, 20%'};
set3 = {'tWw_B1', 'tWw_B2', 'tWw_B3', 'tWw_B4','tWw_B5', 'tWw_B6', 'tWw_B7'}; subtitle3 ={'Bayer 2021 food levels 100% 2nd run, 100% 3rd run, 80%, 50% 40%, 30%, 20%'};
set4 = {'Tab', 'Tab2', 'Tab3'}; subtitle4 = {'Age ta hatch'};
set5 = {'Tte', 'Tte2', 'Tte3', 'Tte4'}; subtitle5 = {'Duration of pupa'};

metaData.grp.sets = {set1, set2, set3, set4, set5};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3, subtitle4, subtitle5};


%% Discussion points

%% Links
metaData.links.id_CoL = '3K9KB'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '2869488'; % Ency of Life
metaData.links.id_Wiki = 'Helicoverpa_armigera'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '81191'; % Taxonomicon
metaData.links.id_WoRMS = '989246'; % WoRMS
metaData.links.id_lepidoptera = '252627'; % lepidoptera

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Helicoverpa_armigera}}';
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
bibkey = 'BarboVali2016'; type = 'Article'; bib = [ ... 
'author = {Barboisa, T. A. M. and Mendes, S. M. and Rodrigues, G. T. and Ribeiro, P. E. d. A. and Santos, C. A. d. and Valicente, F. H. and Oliveira, C. M. d.}, ' ...
'year = {2016}, ' ...
'title = {Comparison of biology between \emph{Helicoverpa zea} and \emph{Helicoverpa armigera} ({L}epidoptera: {N}octuidae) reared on artificial diets}, ' ...
'journal = {Florida Entomologist}, ' ...
'volume = {99}, ' ...
'pages = {72-76}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PatiKane2018'; type = 'Article'; bib = [ ... 
'author = {Patil, V. M. and Patel, Z. P. and Oak, P. S. and Chauhan, R. C. and Kaneriya, P. B.}, ' ...
'year = {2018}, ' ...
'title = {Biology of fruit borer, \emph{Helicoverpa armigera} ({H}\"{u}bner) in/on chilli fruits}, ' ...
'journal = {International Journal of Entomology Research}, ' ...
'volume = {3}, ' ...
'pages = {6-12}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MiroSavo2008'; type = 'Article'; bib = [ ... 
'author = {Mironidis, G. K. and Savopoulou-Soultani, M.}, ' ...
'year = {2008}, ' ...
'title = {Development, Survivorship, and Reproduction of \emph{Helicoverpa armigera} ({L}epidoptera: {N}octuidae) Under Constant and Alternating Temperatures}, ' ...
'journal = {Physiological Ecology}, ' ...
'volume = {104}, ' ...
'pages = {751-764}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Baye2021'; type = 'Misc'; bib = [ ...
'author = {Bayer, A.G.}, ' ... 
'year = {2021}, ' ...
'note = {Influence of food supply on development and egg production of \textit{Helicoverpa armigera} in a static laboratory test system.}}, ' ...
'howpublished = {unpublished data}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NoorAli2017'; type = 'Article'; bib = [ ... 
'author = {Noor-ul-Ane, M. and Ali Mirhosseini, M. and Crickmore, N. and Saeed, S. and Noor, I. and Zalucki, M. P.}, ' ...
'year = {2017}, ' ...
'title = {Temperature-dependent development of \emp{Helicoverpa armigera} ({H}\"{u}bner) ({L}epidoptera: {N}octuidae) and its larval parasitoid, \emph{Habrobracon hebetor} ({S}ay) ({H}ymenoptera: {B}raconidae): implications for species interactions}, ' ...
'journal = {Bulletin of Entomological Research}, ' ...
'volume = {108}, ' ...
'pages = {295-304}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AkbaPava2015'; type = 'Article'; bib = [ ... 
'author = {Akbar, S. MD. and Pavani, T. and Nagaraja, T. and Sharma, H. C.}, ' ...
'year = {2015}, ' ...
'title = {Influence of {CO2} and Temperature on Metabolism and Development of \emph{Helicoverpa armigera} ({N}octuidae: {L}epidoptera)}, ' ...
'journal = {Physiological Ecology}, ' ...
'volume = {45}, ' ...
'pages = {229-236}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'JallMats2001'; type = 'Article'; bib = [ ... 
'author = {Jallow, M. F. A. and Matsumura, M.}, ' ...
'year = {2001}, ' ...
'title = {Influence of temperature on the rate of development of \emph{Helicoverpa armigera} ({H}\"{u}bner) ({L}epidoptera: {N}octuidae)}, ' ...
'journal = {Appl. Entomol. Zool.}, ' ...
'volume = {36}, ' ...
'pages = {427-430}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
