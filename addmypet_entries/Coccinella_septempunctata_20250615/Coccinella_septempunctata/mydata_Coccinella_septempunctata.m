function [data, auxData, metaData, txtData, weights] = mydata_Coccinella_septempunctata 

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Insecta'; 
metaData.order      = 'Coleoptera'; 
metaData.family     = 'Coccinellidae';
metaData.species    = 'Coccinella_septempunctata'; 
metaData.species_en = 'Seven-spot ladybird';

metaData.ecoCode.climate = {'A','C','D'};
metaData.ecoCode.ecozone = {'TH','TPi'};
metaData.ecoCode.habitat = {'0iTh','0iTf','0iTi','0iTs','0iTg'};
metaData.ecoCode.embryo  = {'Th'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCii'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'astar'; 'aj'; 'ae'; 'am'; 'Le'; 'Li'; 'Ww0'; 'Wwj'; 'Wwe'; 'Wwi'; 'pAi'; 'Ri'};
metaData.data_1     = {'T-ab'; 'T-aj'; 'T-ae'; 'T-Ri'; 'T-am'; 't-Ww_f'; 't-L'};

metaData.COMPLETE = 3.5; % using criteria of LikaKear2011

metaData.author   = {'Josef Koch','Kim Rakel','Heike Fremdt','Daniela Jans','Andre Gergs','Thomas Preuss'};         
metaData.date_subm = [2025 05 23];
metaData.email    = {'koch@gaiac-eco.de'};        
metaData.address  = {'gaiac - Research Institute for Ecosystem Analysis and Assessment, Aachen, Germany'};  

metaData.author_mod_1   = {'Bas Kooijman'};         
metaData.date_mod_1     = [2025 06 14];
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};        
metaData.address_mod_1  = {'VU University Amsterdam'}; 

metaData.curator     = {'Dina Lika'}; 
metaData.email_cur   = {'lika@uoc.gr'};  
metaData.date_acc    = [2025 06 15];

%% set data
% zero-variate data

%------ OmkaSriv2003
% food: Lipaphis erysimi (Kalt.)
% other food sources of lower quality also presented in same study, may be added at a later point

data.t01_25 = 1.72;    units.t01_25 = 'd';    label.t01_25 = 'duration of instar 1 at 25 C';    bibkey.t01_25 = 'OmkaSriv2003';   
  temp.t01_25 = C2K(25);    units.temp.t01_25 = 'K';    label.temp.t01_25 = 'temperature';
  comment.t01_25 = 'initial sample size N = 10; food: Lipaphis erysimi';
data.t12_25 = 1.64;    units.t12_25 = 'd';    label.t12_25 = 'duration of instar 2 at 25 C';    bibkey.t12_25 = 'OmkaSriv2003';   
  temp.t12_25 = C2K(25);    units.temp.t12_25 = 'K';    label.temp.t12_25 = 'temperature';
  comment.t12_25 = 'initial sample size N = 10; food: Lipaphis erysimi';
data.t23_25 = 1.84;    units.t23_25 = 'd';    label.t23_25 = 'duration of instar 3 at 25 C';    bibkey.t23_25 = 'OmkaSriv2003';   
  temp.t23_25 = C2K(25);    units.temp.t23_25 = 'K';    label.temp.t23_25 = 'temperature';
  comment.t23_25 = 'initial sample size N = 10; food: Lipaphis erysimi';
data.t34_25 = 2.75;    units.t34_25 = 'd';    label.t34_25 = 'duration of instar 4 at 25 C';    bibkey.t34_25 = 'OmkaSriv2003';   
  temp.t34_25 = C2K(25);    units.temp.t34_25 = 'K';    label.temp.t34_25 = 'temperature';
  comment.t34_25 = 'initial sample size N = 10; food: Lipaphis erysimi';

data.Ww01 = 0.00226;    units.Ww01 = 'g';    label.Ww01 = 'wet weight of instar 1';    bibkey.Ww01 = 'OmkaSriv2003';
data.Ww12 = 0.00555;    units.Ww12 = 'g';    label.Ww12 = 'wet weight of instar 2';    bibkey.Ww12 = 'OmkaSriv2003';
data.Ww23 = 0.01063;    units.Ww23 = 'g';    label.Ww23 = 'wet weight of instar 3';    bibkey.Ww23 = 'OmkaSriv2003';
data.Ww34 = 0.01979;    units.Ww34 = 'g';    label.Ww34 = 'wet weight of instar 4';    bibkey.Ww34 = 'OmkaSriv2003';
data.Wwj = 0.01505;    units.Wwj = 'g';    label.Wwj = 'wet weight of pupa';    bibkey.Wwj = 'OmkaSriv2003';
data.Wwe_25 = 0.04063;    units.Wwe_25 = 'g';    label.Wwe_25 = 'wet weight of female imago after emergence';    bibkey.Wwe_25 = 'OmkaSriv2003';

%------ ObryOrr1990
% food: Diet of water, a Wheast-honey mixture, and a daily supply of R. maidis OR A. pisum
% for now only data on A. pisum used

data.t01_23 = 3.1;    units.t01_23 = 'd';    label.t01_23 = 'duration of instar 1 at 23 C';    bibkey.t01_23 = 'ObryOrr1990';   
  temp.t01_23 = C2K(23);    units.temp.t01_23 = 'K';    label.temp.t01_23 = 'temperature';
  comment.t01_23 = 'initial sample size N = 59; food: A. pisum';  
data.t12_23 = 2.2;    units.t12_23 = 'd';    label.t12_23 = 'duration of instar 2 at 23 C';    bibkey.t12_23 = 'ObryOrr1990';   
  temp.t12_23 = C2K(23);    units.temp.t12_23 = 'K';    label.temp.t12_23 = 'temperature';
  comment.t12_23 = 'initial sample size N = 59; food: A. pisum'; 
data.t23_23 = 2.4;    units.t23_23 = 'd';    label.t23_23 = 'duration of instar 3 at 23 C';    bibkey.t23_23 = 'ObryOrr1990';   
  temp.t23_23 = C2K(23);    units.temp.t23_23 = 'K';    label.temp.t23_23 = 'temperature';
  comment.t23_23 = 'initial sample size N = 59; food: A. pisum'; 
data.t34_23 = 5.4;    units.t34_23 = 'd';    label.t34_23 = 'duration of instar 4 at 23 C';    bibkey.t34_23 = 'ObryOrr1990';   
  temp.t34_23 = C2K(23);    units.temp.t34_23 = 'K';    label.temp.t34_23 = 'temperature';
  comment.t34_23 = 'initial sample size N = 59; food: A. pisum';

data.L1e = 0.765;    units.L1e = 'cm';    label.L1e = 'body length of female imago after emergence';    bibkey.L1e = 'ObryOrr1990';
data.L2e = 0.591;    units.L2e = 'cm';    label.L2e = 'body width female imago after emergence';    bibkey.L2e = 'ObryOrr1990';

data.Wwe_23 = 0.0377;    units.Wwe_23 = 'g';    label.Wwe_23 = 'wet weight of female imago after emergence';    bibkey.Wwe_23 = 'ObryOrr1990';

%------ SingSing1993
% food: Lipaphis erysimi (Kalt.)

data.t01_28 = 1.76;    units.t01_28 = 'd';    label.t01_28 = 'duration of instar 1 at 28 C';    bibkey.t01_28 = 'SingSing1993';   
  temp.t01_28 = C2K(28);    units.temp.t01_28 = 'K';    label.temp.t01_28 = 'temperature';
  comment.t01_28 = 'sample size N = 20; food: Lipaphis erysimi';
data.t12_28 = 1.80;    units.t12_28 = 'd';    label.t12_28 = 'duration of instar 2 at 28 C';    bibkey.t12_28 = 'SingSing1993';   
  temp.t12_28 = C2K(28);    units.temp.t12_28 = 'K';    label.temp.t12_28 = 'temperature';
  comment.t12_28 = 'sample size N = 20; food: Lipaphis erysimi';
data.t23_28 = 2.40;    units.t23_28 = 'd';    label.t23_28 = 'duration of instar 3 at 28 C';    bibkey.t23_28 = 'SingSing1993';   
  temp.t23_28 = C2K(28);    units.temp.t23_28 = 'K';    label.temp.t23_28 = 'temperature';
  comment.t23_28 = 'sample size N = 20; food: Lipaphis erysimi';
data.t34_28 = 3.15;    units.t34_28 = 'd';    label.t34_28 = 'duration of instar 4 at 28 C';    bibkey.t34_28 = 'SingSing1993';   
  temp.t34_28 = C2K(28);    units.temp.t34_28 = 'K';    label.temp.t34_28 = 'temperature';
  comment.t34_28 = 'sample size N = 20; food: Lipaphis erysimi';
data.tei_28 = 26.74;    units.tei_28 = 'd';    label.tei_28 = 'life span of female imago at 28 C';    bibkey.tei_28 = 'SingSing1993';
  temp.tei_28 = C2K(28);  units.temp.tei_28 = 'K'; label.temp.tei_28 = 'temperature'; 
  comment.tei_28 = 'mean life span of female; food : Lipaphis erysimi';
  
%------ FaroZhu2020
% food: Rhopalosiphum padi
% other food sources of slightly lower quality also presented in same study, may be added at a later point

data.t01_24 = 2.00;    units.t01_24 = 'd';    label.t01_24 = 'duration of instar 1 at 24 C';    bibkey.t01_24 = 'FaroZhu2020';   
  temp.t01_24 = C2K(24);    units.temp.t01_24 = 'K';    label.temp.t01_24 = 'temperature';
  comment.t01_24 = 'sample size N = 45; food: Rhopalosiphum padi';
data.t12_24 = 2.00;    units.t12_24 = 'd';    label.t12_24 = 'duration of instar 2 at 24 C';    bibkey.t12_24 = 'FaroZhu2020';   
  temp.t12_24 = C2K(24);    units.temp.t12_24 = 'K';    label.temp.t12_24 = 'temperature';
  comment.t12_24 = 'sample size N = 43; food: Rhopalosiphum padi';
data.t23_24 = 2.47;    units.t23_24 = 'd';    label.t23_24 = 'duration of instar 3 at 24 C';    bibkey.t23_24 = 'FaroZhu2020';   
  temp.t23_24 = C2K(24);    units.temp.t23_24 = 'K';    label.temp.t23_24 = 'temperature';
  comment.t23_24 = 'sample size N = 38; food: Rhopalosiphum padi';
data.t34_24 = 2.29;    units.t34_24 = 'd';    label.t34_24 = 'duration of instar 4 at 24 C';    bibkey.t34_24 = 'FaroZhu2020';   
  temp.t34_24 = C2K(24);    units.temp.t34_24 = 'K';    label.temp.t34_24 = 'temperature';
  comment.t34_24 = 'sample size N = 35; food: Rhopalosiphum padi';
data.tei_24 = 48.16;    units.tei_24 = 'd';    label.tei_24 = 'life span of female imago at 24 C';    bibkey.tei_24 = 'FaroZhu2020';
  temp.tei_24 = C2K(24);  units.temp.tei_24 = 'K'; label.temp.tei_24 = 'temperature'; 
  comment.tei_24 = 'food: Rhopalosiphum padi';
  
%------ Sing1976; food: Lipaphis erysimi (Kalt.)
data.pA1 = 25020;    units.pA1  = 'J/d.g';    label.pA1  = 'dry-weight-specific assimilation rate at instar 1';    bibkey.pA1  = 'Sing1976';   
  temp.pA1 = C2K(27);    units.temp.pA1 = 'K';    label.temp.pA1 = 'temperature'; comment.pA1 = 'food: Lipaphis erysimi';
data.pA2 = 29832;    units.pA2  = 'J/d.g';    label.pA2  = 'dry-weight-specific assimilation rate at instar 2';    bibkey.pA2  = 'Sing1976';   
  temp.pA2 = C2K(27);    units.temp.pA2 = 'K';    label.temp.pA2 = 'temperature'; comment.pA2 = 'food: Lipaphis erysimi';
data.pA3 = 37196;    units.pA3  = 'J/g.d';    label.pA3  = 'dry-weight-specific assimilation rate at instar 3';    bibkey.pA3  = 'Sing1976';   
  temp.pA3 = C2K(27);    units.temp.pA3 = 'K';    label.temp.pA3 = 'temperature'; comment.pA3 = 'food: Lipaphis erysimi';
data.pA4 = 37321;    units.pA4  = 'J/g.d';    label.pA4  = 'dry-weight-specific assimilation rate at instar 4';    bibkey.pA4  = 'Sing1976';   
  temp.pA4 = C2K(27);    units.temp.pA4 = 'K';    label.temp.pA4 = 'temperature'; comment.pA4 = 'food: Lipaphis erysimi';
data.pAe = 49162;    units.pAe  = 'J/g.d';    label.pAe  = 'dry-weight-specific assimilation rate of imago';    bibkey.pAe  = 'Sing1976';   
  temp.pAe = C2K(27);    units.temp.pAe = 'K';    label.temp.pAe = 'temperature'; comment.pAe = 'food: Lipaphis erysimi';

%------ KaluHode2004
% food: Acyrthosiphon pisum
% other food sources of slightly lower quality also presented in same study, may be added at a later point

data.tbj_25 = 8.9;    units.tbj_25 = 'd';    label.tbj_25 = 'time since hatch at pupation at 25 C';    bibkey.tbj_25 = 'KaluHode2004';   
  temp.tbj_25 = C2K(25);    units.temp.tbj_25 = 'K';    label.temp.tbj_25 = 'temperature'; comment.tbj_25 = 'food: Acyrthosiphon pisum';
  comment.tbj_25 = 'sample size N = 30; food: Acyrthosiphon pisum';

data.Wwe2_25 = 0.0388;    units.Wwe2_25 = 'g';    label.Wwe2_25 = 'wet weight of female imago after emergence';    bibkey.Wwe2_25 = 'KaluHode2004';
  

%------ Other

% food: Myzus persicae
data.Ww0 = 1.87e-4;    units.Ww0 = 'g';    label.Ww0 = 'initial wet weight of an egg';    bibkey.Ww0 = 'ChatNaz2020';
 comment.Ww0 = 'food: Myzus persicae';
% food: Acyrthosiphon pisum
data.L1e_14 = 0.769;    units.L1e_14 = 'cm';    label.L1e_14 = 'body length of female imago after emergence (14 d old)';    bibkey.L1e_14 = 'Baye2024';
  comment.L1e_14 = 'food: Acyrthosiphon pisum';
data.L2e_14 = 0.588;    units.L2e_14 = 'cm';    label.L2e_14 = 'body width of female imago after emergence (14 d old)';    bibkey.L2e_14 = 'Baye2024';
  comment.L2e_14 = 'food: Acyrthosiphon pisum';
data.L1e_14a = 0.720;    units.L1e_14a = 'cm';    label.L1e_14a = 'body length of female imago after emergence (14 d old)';    bibkey.L1e_14a = 'Baye2024';
  comment.L1e_14a = 'food: Acyrthosiphon pisum';
data.L2e_14a = 0.552;    units.L2e_14a = 'cm';    label.L2e_14a = 'body width of female imago after emergence (14 d old)';    bibkey.L2e_14a = 'Baye2024';
  comment.L2e_14a = 'food: Acyrthosiphon pisum';
data.L1e_24 = 0.756;    units.L1e_24 = 'cm';    label.L1e_24 = 'body length of female imago after emergence (24 d old)';    bibkey.L1e_24 = 'Baye2024';
  comment.L1e_24 = 'food: Acyrthosiphon pisum';
data.L2e_24 = 0.555;    units.L2e_24 = 'cm';    label.L2e_24 = 'body width of female imago after emergence (24 d old)';    bibkey.L2e_24 = 'Baye2024';
  comment.L2e_24 = 'food: Acyrthosiphon pisum';
data.Wwj = 0.0424;    units.Wwj = 'g'; label.Wwj = 'wet weight of fresh pupa'; bibkey.Wwj = 'Baye2024'; 
  comment.Wwj = 'food: Acyrthosiphon pisum';
data.Wwe_14 = 0.0390;    units.Wwe_14 = 'g'; label.Wwe_14 = 'wet weight of female imago after emergence (14 d old)'; bibkey.Wwe_14 = 'Baye2024';
  comment.Wwe_14 = 'food: Acyrthosiphon pisum';
data.Wwe_21 = 0.0659;    units.Wwe_21 = 'g';    label.Wwe_21 = 'wet weight of older female imago (21 d old)';    bibkey.Wwe_21 = 'Baye2024';
  comment.Wwe_21 = 'food: Acyrthosiphon pisum';

% food: Acyrthosiphon pisum
data.Wwj2 = 0.0415;    units.Wwj2 = 'g';    label.Wwj2 = 'wet weight of fresh pupa';    bibkey.Wwj2 = 'Baye2024';
  comment.Wwj2 = 'food: Acyrthosiphon pisum';
data.Wwe_14 = 0.0359;    units.Wwe_14 = 'g';    label.Wwe_14 = 'wet weight of female imago after emergence (14 d old)';    bibkey.Wwe_14 = 'Baye2024';
  comment.Wwe_14 = 'food: Acyrthosiphon pisum';
data.Wwe_24 = 0.0658;    units.Wwe_24 = 'g';    label.Wwe_24 = 'wet weight of older female imago (24 d old)';    bibkey.Wwe_24 = 'Baye2024';
  comment.Wwe_24 = 'food: Acyrthosiphon pisum';
data.Ww_asym = 8e-2; units.Ww_asym = 'g'; label.Ww_asym = 'asymptotic wet  weight'; bibkey.Ww_asym = 'guess';
  comment.Ww_asym = 'hypothetical ultimate weight if growth would not cease at emergence';

% uni-variate data

% temperature - mean age at hatch
data.Tab = [ ... % temperature (C), mean age at hatch (d)
    12	21.1
    13	14.4
    15	13.6
    15	12.7
    15	12.2
    15	10.8
    16	8.0
    17	7.6
    18	8.9
    18	4.7
    20	5.7
    20	5.1
    21	5.4
    21	3.7
    22	4.2
    22	3.5
    24	3.7
    25	3.5
    25	2.7
    27	2.6
    28	3.1
    29	2.3
    30	2.6
    30	2.2
    32	2.3
    35	2.5
    35	1.9];
units.Tab = {'C', 'd'};  label.Tab = {'temperature', 'age at hatch', 'TrilFrei1996'};
bibkey.Tab = 'TrilFrei1996';
%
data.Tab1 = [ ... % temperature (C), mean age at hatch (d)
    21 5
    23 3.8
    24 3.56
    25 2.42
    28 3];
units.Tab1 = {'C', 'd'};  label.Tab1 = {'temperature', 'age at hatch', 'Sund1966,ObryOrr1990,FaroZhu2020,OmkaSriv2003,SingSing1993'};
bibkey.Tab1 = {'Sund1966','ObryOrr1990','FaroZhu2020','OmkaSriv2003','SingSing1993'};

% temperature - mean larval development time
data.Ttbj = [ ... % temperature (C), mean larval development time (d)
    15	36.6
    15	36.0
    15	35.3
    16	34.9
    17	31.0
    17	18.4
    18	22.6
    20	20.9
    20	20.0
    20	19.3
    20	18.6
    20	17.7
    20	17.0
    20	14.1
    21	15.3
    21	13.3
    23	18.2
    23	13.1
    24	9.8
    25	10.8
    25	9.9
    26	10.1
    26	9.1
    27	8.0
    28	10.2
    28	6.4
    30	8.2
    30	7.4
    30	6.7
    32	8.2
    32	6.4
    32	6.0
    35	7.2
    35	5.7];
units.Ttbj = {'C', 'd'};  label.Ttbj = {'temperature', 'larval development time'};
bibkey.Ttbj = 'TrilFrei1996';

% temperature - time since pupation at emergence
data.Ttje = [ ... % temperature (C), time since pupation at emergence (d)
    15	15.2
    17	13.3
    18	8.3
    20	13.2
    20	8.7
    20	8.0
    21	8.9
    21	7.1
    21	5.7
    23	5.7
    24	4.6
    25	4.4
    26	4.0
    27	3.6
    28	3.2
    29	3.1
    30	3.7
    30	2.8
    31	2.5
    32	3.1
    35	3.4
    35	2.8
    35	2.2];
units.Ttje = {'C', 'd'};  label.Ttje = {'temperature', 'time since pupation at emergence', 'TrilFrei1996'};
bibkey.Ttje = 'TrilFrei1996';
%
data.Ttje1 = [ ... % temperature (C), time since pupation at emergence (d)
    21 8.5
    24 3.17 + 1.00
    25 2.81 + 0.74
    28 6.30 + 0.38];
units.Ttje1 = {'C', 'd'};  label.Ttje1 = {'temperature', 'time since pupation at emergence', 'Sund1966,FaroZhu2020,OmkaSriv2003,SingSing1993'};
bibkey.Ttje1 = {'Sund1966','FaroZhu2020','OmkaSriv2003','SingSing1993'};
comment.Ttje1 = 'food: Myzus persicae (N=67), Rhopalosiphum padi (N=29), Lipaphis erysimi (N=10), Lipaphis erysimi (N=20)';

data.Ttep = [ ... % temperature (C), time emergence at puberty (d)
    23 6.3
    24 3.26
    25 8.20
    28 6.66];
units.Ttep = {'C', 'd'};  label.Ttep = {'temperature', 'time since emergence at puberty', 'ObryOrr1990,FaroZhu2020,OmkaSriv2003,SingSing1993'};
bibkey.Ttep = {'ObryOrr1990','FaroZhu2020','OmkaSriv2003','SingSing1993'};
comment.Ttep = 'food: ?,Rhopalosiphum padi,Lipaphis erysimi,?';

%------ XiaWerf1999
% food: Aphis gossypii

% temperature - mean imago life span
data.Ttei = [ ... % temperature (C), mean imago life span (d)
    20	37.6
    25	27.1
    30	19.3
    35	13.7];
units.Ttei = {'C', 'd'};  label.Ttei = {'temperature', 'mean imago life span'};
bibkey.Ttei = 'XiaWerf1999';

% temperature - maximum reprod rate per female
data.TRi = [ ... % temperature (C), maximum reprod rate per female (#/d)
    20	11.1
    25	22.4
    30	20.5 % temperature becomes stressor
%   35	10.9 % temperature becomes strong stressor
    ];
units.TRi = {'C', '#/d'};  label.TRi = {'temperature', 'maximum reprod rate', 'XiaWerf1999'};
bibkey.TRi = 'XiaWerf1999';
%
data.TRi1 = [ ... % temperature (C), maximum reprod rate per female (#/d)
    21	814/ 65
    24  760.05/ 25.16
    25	1764.1/ 69.8
    28	634.75/ 13.33];
units.TRi1 = {'C', '#/d'};  label.TRi1 = {'temperature', 'maximum reprod rate', 'Sund1966,FaroZhu2020,OmkaSriv2003,SingSing1993'};
bibkey.TRi1 = {'Sund1966','FaroZhu2020','OmkaSriv2003','SingSing1993'};
comment.TRi1 = 'food: Myzus persicae, Rhopalosiphum padi, Lipaphis erysimi, Lipaphis erysimi';

% time - body length of larvae
data.tL1 =  [ ... % time since birth (d), body length (cm)
0.5	0.273 % 0.5 d means 0-24 h since hatch, which is noted as 1 d in the original test protocol
1.5	0.350
2.5	0.472
3.5	0.634
4.5	0.832
5.5	1.036
6.5	1.183
% 7.5	1.074 % late larval non growth phase shortly before pupation
];
units.tL1  = {'d', 'cm'}; label.tL1 = {'time since birth', 'larval length', 'test run 1'};  
temp.tL1 = C2K(25);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'Baye2024';  comment.tL1 = 'sample size N = 10';

% time - body length of larvae
data.tL12 =  [ ... % time since birth (d), body length (cm)
0.5	0.247 % 0.5 d means 0-24 h since hatch, which is noted as 1 d in the original test protocol
1.5	0.366
2.5	0.492
3.5	0.673
4.5	0.788
5.5	0.986
6.5	1.167
% 7.5	1.162 % late larval non growth phase shortly before pupation
];
units.tL12  = {'d', 'cm'}; label.tL12 = {'time since birth', 'larval length', 'test run 2'};  
temp.tL12 = C2K(25);  units.temp.tL12 = 'K'; label.temp.tL12 = 'temperature';
bibkey.tL12 = 'Baye2024';  comment.tL12 = 'sample size N = 10';

% time - body width of larvae
data.tL2 =  [ ... % time since birth (d), body width (cm)
0.5	0.074 % 0.5 d means 0-24 h since hatch, which is noted as 1 d in the original test protocol
1.5	0.094
2.5	0.124
3.5	0.167
4.5	0.250
5.5	0.310
6.5	0.376
% 7.5	0.366 % late larval non growth phase shortly before pupation
];
units.tL2  = {'d', 'cm'}; label.tL2 = {'time since birth', 'larval width', 'test run 1'};  
temp.tL2 = C2K(25);  units.temp.tL2 = 'K'; label.temp.tL2 = 'temperature';
bibkey.tL2 = 'Baye2024';  comment.tL2 = 'sample size N = 10';

% time - body width of larvae
data.tL22 =  [ ... % time since birth (d), body width (cm)
0.5	0.066 % 0.5 d means 0-24 h since hatch, which is noted as 1 d in the original test protocol
1.5	0.094
2.5	0.130
3.5	0.176
4.5	0.209
5.5	0.262
6.5	0.313
% 7.5	0.339 % late larval non growth phase shortly before pupation
];
units.tL22  = {'d', 'cm'}; label.tL22 = {'time since birth', 'larval width', 'test run 2'};  
temp.tL22 = C2K(25);  units.temp.tL22 = 'K'; label.temp.tL22 = 'temperature';
bibkey.tL22 = 'Baye2024';  comment.tL22 = 'sample size N = 10';

% time - wet weights of larvae fed with Myzus persicae (Brassica)
data.tWwf1 =  [ ... % time since birth (d), wet weight (g)
    5.8     0.00245
    7.5     0.00695
    10.1	0.03023
    11.4	0.04085];
units.tWwf1  = {'d', 'g'}; label.tWwf1 = {'time since birth', 'wet weight', 'Myzus persicae (Brassica)'};
temp.tWwf1 = C2K(20);  units.temp.tWwf1 = 'K'; label.temp.tWwf1 = 'temperature';
bibkey.tWwf1 = 'Blac1967';  comment.tWwf1 = 'food: Myzus persicae (Brassica)';

% time - wet weights of larvae fed with Myzus persicae (Vicia)
data.tWwf2 =  [ ... % time since birth (d), wet weight (g)
     4.6    0.00153
     5.8    0.00317
     7.5    0.00797
    10.1	0.02706
    11.4	0.04371];
units.tWwf2  = {'d', 'g'}; label.tWwf2 = {'time since birth', 'wet weight', 'Myzus persicae (Vicia)'};
temp.tWwf2 = C2K(20);  units.temp.tWwf2 = 'K'; label.temp.tWwf2 = 'temperature';
bibkey.tWwf2 = 'Blac1967';  comment.tWwf2 = 'food: Myzus persicae (Vicia)';

% time - wet weights of larvae fed with Acyrthosiphon pisum
data.tWwf3 =  [ ... % time since birth (d), wet weight (g)
    4.0     0.00112
    6.1     0.00327
    7.9     0.00919
    9.2     0.01440
    10.4	0.02543
    11.1	0.03769
    12.2	0.04443];
units.tWwf3  = {'d', 'g'}; label.tWwf3 = {'time since birth', 'wet weight', 'Acyrthosiphon pisum'};
temp.tWwf3 = C2K(20);  units.temp.tWwf3 = 'K'; label.temp.tWwf3 = 'temperature';
bibkey.tWwf3 = 'Blac1967';  comment.tWwf3 = 'food: Acyrthosiphon pisum';

% time - wet weights of larvae fed with Aphis fabae
data.tWwf4 =  [ ... % time since birth (d), wet weight (g)
    6.1     0.00409
    7.9     0.01103
    9.2     0.01624
    10.4	0.02625
    11.1	0.03677
    12.2	0.04361];
units.tWwf4  = {'d', 'g'}; label.tWwf4 = {'time since birth', 'wet weight', 'Aphis fabae'};
temp.tWwf4 = C2K(20);  units.temp.tWwf4 = 'K'; label.temp.tWwf4 = 'temperature';
bibkey.tWwf4 = 'Blac1967';  comment.tWwf4 = 'food: Aphis fabae';

% time - wet weights of larvae fed with Megoura viciae
data.tWwf5 =  [ ... % time since birth (d), wet weight (g)
    4.0     0.00071
    6.1     0.00235
    7.9     0.00633
    9.2     0.00909
    10.3	0.01491
    11.1	0.02114
    12.2	0.03135
    13.2	0.04024];
units.tWwf5  = {'d', 'g'}; label.tWwf5 = {'time since birth', 'wet weight', 'Megoura viciae'};
temp.tWwf5 = C2K(20);  units.temp.tWwf5 = 'K'; label.temp.tWwf5 = 'temperature';
bibkey.tWwf5 = 'Blac1967';  comment.tWwf5 = 'food: Megoura viciae';

% time - wet weights of larvae fed with Brevicoryne brassicae
data.tWwf6 =  [ ... % time since birth (d), wet weight (g)
    4.6     0.00082
    5.8     0.00174
    7.5     0.00327
    8.6     0.00582
    10.0	0.00848
    11.4	0.01420
    12.9	0.02574
    14.6	0.03605];
units.tWwf6  = {'d', 'g'}; label.tWwf6 = {'time since birth', 'wet weight', 'Brevicoryne brassicae'};
temp.tWwf6 = C2K(20);  units.temp.tWwf6 = 'K'; label.temp.tWwf6 = 'temperature';
bibkey.tWwf6 = 'Blac1967';  comment.tWwf6 = 'food: Brevicoryne brassicae';

% time - wet weights of larvae
data.tWwB1 =  [ ... % time since birth (d), wet weight (g)
0.5	0.00055 % 0.5 d means 0-24 h since hatch, which is noted as 1 d in the original test protocol
1.5	0.00101
2.5	0.00247
3.5	0.00500
4.5	0.01218
5.5	0.02627
6.5	0.04245
% 7.5	0.04283 % late larval non growth phase shortly before pupation
];
units.tWwB1  = {'d', 'g'}; label.tWwB1 = {'time since birth', 'wet weight'};  
temp.tWwB1 = C2K(25);  units.temp.tWwB1 = 'K'; label.temp.tWwB1 = 'temperature';
bibkey.tWwB1 = 'Baye2024';  comment.tWwB1 = 'sample size N = 10';
%
% time - wet weights of larvae
data.tWwB2 =  [ ... % time since birth (d), wet weight (g)
0.5	0.000474 % 0.5 d means 0-24 h since hatch, which is noted as 1 d in the original test protocol
1.5	0.001139
2.5	0.002877
3.5	0.007322
4.5	0.010182
5.5	0.021420
6.5	0.039952
% 7.5	0.042613 % late larval non growth phase shortly before pupation
];
units.tWwB2  = {'d', 'g'}; label.tWwB2 = {'time since birth', 'wet weight'};  
temp.tWwB2 = C2K(25);  units.temp.tWwB2 = 'K'; label.temp.tWwB2 = 'temperature';
bibkey.tWwB2 = 'Baye2024';  comment.tWwB2 = 'sample size N = 10';

%% set weights for all real data
weights = setweights(data, []);
weights.Ww_asym = 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Acknowledgment
metaData.acknowledgment = 'The creation of the original entry was financially supported by Bayer AG';

%% Group plots
set1 = {'tWwB1', 'tWwB2',}; subtitle1 = {'Data for two replicated test runs'};
set2 = {'tWwf1', 'tWwf2', 'tWwf3', 'tWwf4', 'tWwf5', 'tWwf6'}; subtitle2 = {'Data for Myzus persicae (Brassica), Myzus persicae (Vicia), Acyrthosiphon pisum, Aphis fabae, Megoura viciae, Brevicoryne brassicae'};
set3 = {'tL1', 'tL12'}; subtitle3 = {'Data for two replicated test runs'};
set4 = {'tL2', 'tL22'}; subtitle4 = {'Data for two replicated test runs'};
set5 = {'Tab','Tab1'}; subtitle5 = {'Data from various sources'};
set6 = {'Ttje','Ttje1'}; subtitle6 = {'Data from various sources'};
set7 = {'TRi','TRi1'}; subtitle7 = {'Data from various sources'};
metaData.grp.sets = {set1,set2,set3,set4,set5,set6,set7};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3,subtitle4,subtitle5,subtitle6,subtitle7};

%% Discussion points
D1 = 'For now, this entry focuses only on females';
D2 = 'It is assumed that the start of energetic investment in the reproduction takes place during the imago stage (synovigeny) because (a) imagos still feed on live prey, and (b) the wet weight of total reproductive output exceeds the adult female wet weight by a lot (making reproductive investment only during the larval phase implausible)';
D3 = 'mod_1: Pupation is triggered by reserve density at emergence equals reserve density at pupation';
D4 = 'Whenever studies reported the pre-pupa duration, here it was added to the pupa phase due to functional similarity (neither feeding nor growth take place)';
D5 = 'Not all developmental studies reported the pre-pupa duration, meaning that it was either included in the larval or the pupal duration; however since the pre-pupa phase was always very short, the resulting uncertainty is considered tolerable';
D6 = 'mod_1: the kappa-rule applies to all stages';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5, 'D6',D6);

%% Facts
F1 = 'Development of ovaries takes place after emergence in the female imago';
metaData.bibkey.F1 = 'PhooObry1995';
F2 = 'Imagos continue feeding on aphids';
metaData.bibkey.F2 = 'JalaReit2019';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links 
metaData.links.id_CoL = 'C9GBS'; % Cat of Life
metaData.links.id_ITIS = '114347'; % ITIS
metaData.links.id_EoL = '1174745'; % Ency of Life
metaData.links.id_Wiki = 'Coccinella_septempunctata'; % Wikipedia
metaData.links.id_ADW = 'Coccinella_septempunctata'; % ADW
metaData.links.id_Taxo = '25934'; % Taxonomicon
metaData.links.id_WoRMS = '150817'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Coccinella_septempunctata}}';
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
bibkey = 'OmkaSriv2003'; type = 'Article'; bib = [ ... 
'author = {Omkar and Srivastava, S.}, ' ...
'year = {2003}, ' ...
'title = {Influence of six aphid prey species on development and reproduction of a ladybird beetle, \emph{Coccinella septempunctata}}, ' ...
'journal = {BioControl}, ' ...
'volume = {48}, ' ...
'pages = {379-393}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
% bibkey = 'SarwSaqi2011'; type = 'Article'; bib = [ ... 
% 'author = {Sarwar, M. and Saqib, S.M.}, ' ...
% 'year = {2010}, ' ...
% 'title = {Rearing of Predatory Seven Spotted Ladybird Beetle \emph{Coccinella septempunctata} L. (Coleoptera: Coccinellidae) on Natural and Artificial Diets Under Laboratory Conditions}, ' ...
% 'journal = {Pakistan J. Zool.}, ' ...
% 'volume = {42(1)}, ' ...
% 'pages = {47--51}'];
% metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'KaluHode2004'; type = 'Article'; bib = [ ... 
'author = {Kalushkov, P. and Hodek, I.}, ' ...
'year = {2004}, ' ...
'title = {The effects of thirteen species of aphids on some life history parameters of the ladybird \emph{Coccinella septempunctata}}, ' ...
'journal = {BioControl}, ' ...
'volume = {49}, ' ...
'pages = {21-32}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ObryOrr1990'; type = 'Article'; bib = [ ... 
'author = {Obrycki, J.J and Orr, C.J.}, ' ...
'year = {1990}, ' ...
'title = {Suitability of Three Prey Species for {N}earctic Populations of \emph{Coccinella septempunctata}, \emph{Hippodamia variegata}, and \emph{Propylea quatuordecimpunctata} ({C}oleoptera: {C}occinellidae)}, ' ...
'journal = {J. Econ. Entomol.}, ' ...
'volume = {83(4)}, ' ...
'pages = {1292-1297}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ChatNaz2020'; type = 'Article'; bib = [ ... 
'author = {Chatha, A.M.M. and Naz, S.}, ' ...
'year = {2020}, ' ...
'title = {Effect of parasitized prey on prey consumption, survival, growth, and development of \emph{Coccinella septempunctata} {L}. ({C}oleoptera: {C}occinellidae) under laboratory conditions}, ' ...
'journal = {Egyptian Journal of Biological Pest Control}, ' ...
'volume = {30:80}, ' ...
'pages = {1-6}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'Blac1967'; type = 'Article'; bib = [ ... 
'author = {Blackman, R.L.}, ' ...
'year = {1967}, ' ...
'title = {The effects of different aphid foods on \emph{Adalia bipunctata} {L}. and \emph{Coccinella 7-punctata} {L}.}, ' ...
'journal = {Ann. appl. Biol.}, ' ...
'volume = {59}, ' ...
'pages = {207-219}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'FaroZhu2020'; type = 'Article'; bib = [ ... 
'author = {Farooq, M. and Zhu, X. and Shakeel, M. and Iftikhar, A. and Shahid, M.R. and Saeed, N. and Shahid Arain, M.}, ' ...
'year = {2020}, ' ...
'title = {Comparative analysis of the demographic parameters of seven spotted ladybird beetle ({C}oleoptera: {C}occinellidae) reared on various host aphid species}, ' ...
'journal = {PeerJ}, ' ...
'volume = {8}, ' ...
'pages = {e8313}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'TrilFrei1996'; type = 'Book'; bib = [ ... 
'author = {Triltsch, H. and Freier, B. and M\"{o}wes, M.}, ' ...
'year = {1996}, ' ...
'title = {Marienk\"{a}fer ({C}oleoptera, {C}occinellidae) als N\"{u}tzlinge in agrarischen \"{O}kosystemen}, ' ...
'publisher = {Mitteilungen aus der Biologischen Bundesanstalt f\"{u}r Land- und Forstwirtschaft}, ' ...
'pages = {Figure 8 (page 29)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'XiaWerf1999'; type = 'Article'; bib = [ ... 
'author = {Xia, J.Y. and Van der Werf, W. and Rabbinge, R.}, ' ...
'year = {1999}, ' ...
'title = {Temperature and prey density on bionomics of \emph{Coccinella septempunctata} ({C}oleoptera: {C}occinellidae) feeding on \emph{Aphis gossypii} ({H}omoptera: {A}phididae) on cotton}, ' ...
'journal = {Environmental Entomology}, ' ...
'volume = {28(2)}, ' ...
'pages = {307-314}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Sund1966'; type = 'Article'; bib = [ ... 
'author = {Sundby, R.A.}, ' ...
'year = {1966}, ' ...
'title = {A comparative study of the efficiency of three predatory insects \emph{Coccinella septempunctata} L. [{C}oleoptera, {C}occinellidae], \emph{Chrysopa carnea} St. [{N}europtera, {C}hrysopidae] and \emph{Syrphus ribesii} L. [Diptera, Syrphidae] at two different temperatures}, ' ...
'journal = {Entomophaga}, ' ...
'volume = {11(4)}, ' ...
'pages = {395-404}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SingSing1993'; type = 'Article'; bib = [ ... 
'author = {Singh, D. and Singh, H.}, ' ...
'year = {1993}, ' ...
'title = {Biology of lady bird beetle, \emph{Coccinella septempunctata} {L}inn}, ' ...
'journal = {Annals of Biology}, ' ...
'volume = {9(2)}, ' ...
'pages = {250-253}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Sing1976'; type = 'Article'; bib = [ ... 
'author = {Singhal R.N.}, ' ...
'year = {1976}, ' ...
'title = {Food energy budget for the ''ladybird'' beetle \emph{Coccinella septempunctata} {L}.}, ' ...
'journal = {International Journal of Ecology and Environmental Sciences}, ' ...
'volume = {2}, ' ...
'pages = {97-106}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Baye2024'; type = 'Misc'; bib = [ ... 
'year = {2024}, ' ...
'howpublished = {unpblished data}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'JalaReit2019'; type = 'Article'; bib = [ ...
'author = {Jalali, M.A. and Reitz, S. and Mehrnejad, M.R. and Ranjbar, F. and Ziaaddini, M.}, ' ...
'year = {2019}, ' ...
'title = {Food Utilization, Development, and Reproductive Performance of \emph{Coccinella septempunctata} ({C}oleoptera: {C}occinellidae) Feeding on an Aphid or {P}sylla Prey Species}, ' ...
'journal = {Journal of Economic Entomology}, ' ...
'volume = {112(2)}, ' ...
'pages = {571-576}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PhooObry1995'; type = 'Article'; bib = [ ...
'author = {Phoofolo, M.W. and Obrycki, J.J. and Krafsur, E.S.}, ' ...
'year = {1995}, ' ...
'title = {Temperature-Dependent Ovarian Development in \emph{Coccinella septempunctata} ({C}oleoptera: {C}occinellidae)}, ' ...
'journal = {Annals of the Entomological Society of America}, ' ...
'volume = {88(1)}, ' ...
'pages = {72-79}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


