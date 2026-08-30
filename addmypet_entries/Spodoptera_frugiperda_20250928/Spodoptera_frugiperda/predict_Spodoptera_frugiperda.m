function [prdData, info] = predict_Spodoptera_frugiperda(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  if s_1 < 1 || s_2 < 1 || s_3 < 1 || s_4 < 1 || s_5 < 1 || ...
         k > 1 || T_H < T_ref || T_L > T_ref || T_L < 0 || T_AH < 0 ||  f_B2 >1 
    prdData = []; info = 0; return
  end

  T_vec = [T_A, T_L, T_H, T_AL, T_AH];
  T_vec_1 = [T_A1, T_L, T_H, T_AL, T_AH];
  
  % compute temperature correction factors
  TC_22 = tempcorr(temp.ab, T_ref, T_vec);           % data at 22 C
  TC_25 = tempcorr(C2K(25), T_ref, T_vec);           % data at 25 C
  TC_ab = tempcorr(C2K(Tab(:,1)), T_ref, T_vec);     % instar 0, embryo
  TC_ab2 = tempcorr(C2K(Tab2(:,1)), T_ref, T_vec);   % instar 0, embryo
  TC_ab3 = tempcorr(C2K(Tab3(:,1)), T_ref, T_vec);   % instar 0, embryo
  TC_tI11 = tempcorr(C2K(TtI1(:,1)), T_ref, T_vec_1); % Temperature correction for instar 1 Schl2018
  TC_tI12 = tempcorr(C2K(Tt2I1(:,1)), T_ref, T_vec_1);% Temperature correction for instar 1 LopeCarr2019
  TC_tI13 = tempcorr(C2K(Tt3I1(:,1)), T_ref, T_vec_1);% Temperature correction for instar 1 LeePark2022  
  TC_tI = tempcorr(C2K(TtI2(:,1)), T_ref, T_vec);    % Temperature correction for Schl2018
  TC_te = tempcorr(C2K(Tte2(:,1)), T_ref, T_vec);    % Temperature correction for LopeCarr2019  
  TC_Ts = tempcorr(C2K(Ts(:,1)), T_ref, T_vec);     % Temperature correction for survival data%
  TC_Ts2 = tempcorr(temp.tS2, T_ref, T_vec);     % Temperature correction for starvation data%   
  TC_B   = tempcorr(temp.tWw_B, T_ref, T_vec);  % Temperature correction for the Bayer experiment
  
  % life cycle
% v_Rj = kap/ (1 - kap) * E_Rj/ E_G; 
pars_tj_hax = [g, k, v_Hb, v_Hp, v_Rj, v_He, kap, kap_V];

[t_j, t_e, t_p, t_b, l_j, l_e, l_p, l_b, rho_j, rB, u_Ee, info] = get_tj_hax(pars_tj_hax, f);

 if length(t_e)< 1
    prdData = []; info = 0; return
 end
  
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  E_0 = p_Am * initial_scaled_reserve(f, pars_UE0); % J, initial energy content
    
  % birth
  a_b = t_b/ k_M;                     % d, age at birth at f
  aT_b = t_b/ k_M/ TC_22;             % d, age at birth at f and T
  L_b = L_m * l_b;                    % cm, structural length at birth
  Lw_b = L_b/ del_Mh;                  % cm, head length at birth

  % puberty
  tT_p = (t_p-t_b)/ k_M/ TC_22;       % d, age at birth at f and T
  L_p = L_m * l_p;                    % cm, structural length at puberty
  Lw_p = L_m * l_p/del_Mh;

  % metam
  tT_j = (t_j - t_b)/ k_M/ TC_22;     % d, time since birth at pupation
  L_j = L_m * l_j;                    % cm, struc length at metam
  Lw_j = L_j/ del_Mp;                  % cm, length at metam
  E = f * E_m * L_j^3;                % J, reserve at pupation
  E_j = E + E_Rj*L_j^3;                     % J, reserve at pupation, including reproduction buffer
  Ww_j = (L_j^3 + E_j * w_E/ mu_E/ d_E); % g, wet weight at pupation
  
  % emergence
  tT_e_22 = (t_e - t_j)/ k_M/ TC_22;     % d, time since pupation at emergence
  tT_e = (t_e - t_j)/ k_M/ TC_25;     % d, time since pupation at emergence
  
  % instar age, length
  Lw_1 = Lw_b; Lw_2 = Lw_1 * s_1^0.5; Lw_3 = Lw_2 * s_2^0.5; Lw_4 = Lw_3 * s_3^0.5; Lw_5 = Lw_4 * s_4^0.5; Lw_6 = Lw_5 * s_5^0.5; % cm, head length of instar 1-4

opts = odeset('Events',@instars);

p = [p_M; k_J; E_G; E_Hp; E_Rj; v; p_Am; kap; kap_G; s_1; s_2; s_3; s_4; s_5; J_X_Am];

[t, ELHE, tei, ye] = ode45(@dget_ELHE, [0; 100], [E_m*L_b^3; L_b; E_Hb; 0; 0], opts, p, f, 1, L_b, L_p, L_j); %

 if length(tei)<6
    prdData = []; info = 0; return
 end

t_1 = tei(1); tT_1 = t_1/TC_25; % duration of instar 1 at T
t_2 = tei(2)-tei(1); tT_2 = t_2/TC_25; % duration of instar 2 at T
t_3 = tei(3) - tei(2); tT_3 = t_3/TC_25; % duration of instar 3 at T
t_4 = tei(4) - tei(3); tT_4 = t_4/TC_25; % duration of instar 4 at T
t_5 = tei(5) - tei(4); tT_5 = t_5/TC_25; % duration of instar 5 at T
t_6 = tei(6) - tei(5); tT_6 = t_6/TC_25; % duration of instar 6 at T

  % pack to output
  prdData.ab = aT_b;
  prdData.tj = tT_j;
  prdData.tp = tT_p;
  prdData.te_22 = tT_e_22;
  prdData.t1 = tT_1;
  prdData.t2 = tT_2;
  prdData.t3 = tT_3;
  prdData.t4 = tT_4;
  prdData.t5 = tT_5;
  prdData.t6 = tT_6;
  prdData.te= tT_e;
  prdData.Lp = Lw_p;
  prdData.Lj = Lw_j;
  prdData.L1 = Lw_1;
  prdData.L2 = Lw_2;
  prdData.L3 = Lw_3;
  prdData.L4 = Lw_4;
  prdData.L5 = Lw_5;
  prdData.L6 = Lw_6;
  prdData.Wwj = Ww_j;

   % uni-variate data 
  
  % temperature - age at birth
  EaT_b = a_b ./ TC_ab;
  EaT_b2 = a_b ./ TC_ab2;
  EaT_b3 = a_b ./ TC_ab3;

  % temperature - duration on larva
  ET_tj = (t_j-t_b)./k_M./TC_tI11;
  ET_tj2 = (t_j-t_b)./k_M./TC_tI12;
  ET_tj3 = (t_j-t_b)./k_M./TC_tI13;

  % temperature - development time instar 1
  ET_tI_1 = t_1./ TC_tI11;    %Schl2018 data  
  ET2_tI_1 = t_1./TC_tI12;    %LopeCarr2019 data  
  ET3_tI_1 = t_1./TC_tI13;    %LeePark2022 data 

  % temperature - development time instar 2
  ET_tI_2 = t_2./ TC_tI11;      %Schl2018 data  
  ET2_tI_2 = t_2./TC_tI12;     %LopeCarr2019 data
  ET3_tI_2 = t_2./TC_tI13;     %LeePark2022 data
  
  % temperature - development time instar 3
  ET_tI_3 = t_3./ TC_tI11;      %Schl2018 data  
  ET2_tI_3 = t_3./TC_tI12;     %LopeCarr2019 data
  ET3_tI_3 = t_3./TC_tI13;     %LeePark2022 data
  
  % temperature - development time instar 4
  ET_tI_4 = t_4./ TC_tI11;      %Schl2018 data  
  ET2_tI_4 = t_4./TC_tI12;     %LopeCarr2019 data  
  ET3_tI_4 = t_4./TC_tI13;     %LeePark2022 data
  
  % temperature - development time instar 5
  ET_tI_5 = t_5./ TC_tI11;      %Schl2018 data  
  ET2_tI_5 = t_5./TC_tI12;     %LopeCarr2019 data 
  ET3_tI_5 = t_5./TC_tI13;     %LeePark2022 data
  
  % temperature - development time instar 6
  ET_tI_6 = t_6./ TC_tI11;      %Schl2018 data  
  ET2_tI_6 = t_6./TC_tI12;     %LopeCarr2019 data
  ET3_tI_6 = t_6./TC_tI13;     %LeePark2022 data
  
  % temperature - development time pupa
  t_ej = (t_e - t_j)/ k_M;      % d, time since pupation at emergence
  ET_e = t_ej ./ TC_tI;          %Schl2018 data  
  ET2_e = t_ej ./TC_te;          %LopeCarr2019 data
  ET3_e = t_ej ./TC_ab3;          %LeePark2022 data

  % temperature-age at emergence
  ET_aj = t_e/k_M./TC_ab3;
 
  % Larval mortality
  tT_j = (t_j - t_b)/ k_M ./ TC_Ts;  
  ETs = 100*(1 - exp (-h_b ./TC_Ts .*tT_j));

  %% food consumed at each instar and temperature
   opts = odeset('Events',@instars);

   n=length(TC_ab3); EJX_1=NaN(n,1); EJX_2=NaN(n,1); EJX_3=NaN(n,1); EJX_4=NaN(n,1); EJX_5=NaN(n,1); EJX_6=NaN(n,1); EJX=NaN(n,1); 
   for i=1:n
    [t, ELHE, te, ye] = ode45(@dget_ELHE, [0; 400], [E_m*L_b^3; L_b; E_Hb; 0; 0], opts, p, f, TC_ab3(i), L_b, L_p, L_j); %
    if length(te)<6
    prdData = []; info = 0; return
    end
    t_1(i) = te(1);         EJX_1(i) = ye(1,5)*w_X/d_X/t_1(i); % g/d, feeding rate instar 1
    t_2(i) = te(2)-te(1);   EJX_2(i) = (ye(2,5) - ye(1,5))*w_X/d_X/t_2(i); % g/d, feeding rate instar 2
    t_3(i) = te(3) - te(2); EJX_3(i) = (ye(3,5) - ye(2,5))*w_X/d_X/t_3(i); % g/d, feeding rate instar 3
    t_4(i) = te(4) - te(3); EJX_4(i) = (ye(4,5) - ye(3,5))*w_X/d_X/t_4(i); % g/d, feeding rate instar 4
    t_5(i) = te(5) - te(4); EJX_5(i) = (ye(5,5) - ye(4,5))*w_X/d_X/t_5(i); % g/d, feeding rate instar 5
    t_6(i) = te(6) - te(5); EJX_6(i) = (ye(6,5) - ye(5,5))*w_X/d_X/t_6(i); % g/d, feeding rate instar 6
    EJX(i) = ye(6,5)*w_X/0.2/te(6);
   end

  %% time - length for different feeding concentrations
   [t_j, t_e, t_p, t_b, l_j, l_e, l_p, l_b, rho_j, rB, u_Ee, info] = get_tj_hax(pars_tj_hax, 1);
   L_b = l_b * L_m;
   ELHE_0 = [f * E_m * L_b^3; L_b; E_Hb; 0; 0]; % initial state vector
   p = [p_M; k_J; E_G; E_Hp; E_Rj; v; p_Am; kap; kap_G; s_1; s_2; s_3; s_4; s_5; J_X_Am];
   t = [0; tL_B(:,1)];
   % 
   [t_j, t_e, t_p, t_b, l_j, l_e, l_p, l_b, rho_j, rB, u_Ee, info] = get_tj_hax(pars_tj_hax, f_B1);
   L_b = l_b * L_m;  L_p = l_p * L_m; L_j = l_j * L_m; L_e = L_m * l_e;
   [t1 ELHE1] = ode45(@dget_ELHE, t, ELHE_0, [], p, f_B1, TC_B , L_b, L_p, L_j);
   ELHE1(1,:) = []; t1(1) = [];
   L_B1 = ELHE1(:,2)./ del_M;  % cm, physical length 
   HL_B1 = ELHE1(:,2)./del_Mh; % cm, head length 
   EWw_B1 = ELHE1(:,2).^3 + (ELHE1(:,1) + ELHE1(:,4))* (w_E/mu_E/d_E); % g, wet weight including reproduction buffer
   %
   [t_j, t_e, t_p, t_b, l_j, l_e, l_p, l_b, rho_j, rB, u_Ee, info] = get_tj_hax(pars_tj_hax, f_B2);
   L_p = l_p * L_m;  L_j = l_j * L_m; 
   [t2 ELHE2] = ode45(@dget_ELHE, t, ELHE_0, [], p, f_B2, TC_B, L_b, L_p, L_j);
   ELHE2(1,:) = []; t2(1) =[];
   L_B2 = ELHE2(:,2)./ del_M; % cm, physical length 
   HL_B2 = ELHE2(:,2) ./del_Mh; % cm, head length
   EWw_B2 = ELHE2(:,2).^3 + (ELHE2(:,1) + ELHE2(:,4))* (w_E/mu_E/d_E); % g, wet weight including reproduction buffer
   ENf_B2   = kap_R * ELHE2(end,4)/ E_0;             % #, ultimate reproduction rate at f
   %
   [t_j, t_e, t_p, t_b, l_j, l_e, l_p, l_b, rho_j, rB, u_Ee, info] = get_tj_hax(pars_tj_hax, f_B3);
   L_p = l_p * L_m; L_j = l_j * L_m; 
   [t3 ELHE3] = ode45(@dget_ELHE, t, ELHE_0, [], p, f_B3, TC_B, L_b, L_p, L_j);
   ELHE3(1,:) = []; t3(1) = [];
   L_B3 = ELHE3(:,2)./ del_M; % cm, physical length
   HL_B3 = ELHE3(:,2)./del_Mh; % cm, head length
   EWw_B3 = ELHE3(:,2).^3 + (ELHE3(:,1) + ELHE3(:,4))* (w_E/mu_E/d_E); % g, wet weight including reproduction buffer
   %
   [t_j, t_e, t_p, t_b, l_j, l_e, l_p, l_b, rho_j, rB, u_Ee, info] = get_tj_hax(pars_tj_hax, f_B4);
   L_p = l_p * L_m; L_j = l_j * L_m; 
   tj_fB4 = (t_j - t_b)/ k_M/ TC_B;       % d, time since birth at pupation
   [t4 ELHE4] = ode45(@dget_ELHE, t, ELHE_0, [], p, f_B4, TC_B, L_b, L_p, L_j);
   ELHE4(1,:) = []; t4(1) = [];
   L_B4 = ELHE4(:,2)./del_M; % cm, physical length 
   HL_B4 = ELHE4(:,2)./del_Mh; % cm, head length
   E_B4 = ELHE4(:,2).^3 + (ELHE4(:,1) + ELHE4(:,4))* (w_E/mu_E/d_E); % g, wet weight including reproduction buffer
   EWw_B4 = interp1(t4, E_B4, tWw_B(:,1), 'spline'); % returns the values of weight at tWw_B(:,1)
   %
   [t_j, t_e, t_p, t_b, l_j, l_e, l_p, l_b, rho_j, rB, u_Ee, info] = get_tj_hax(pars_tj_hax, f_B5);
   L_p = l_p * L_m; L_j = l_j * L_m; 
   [t5 ELHE5] = ode45(@dget_ELHE, t, ELHE_0, [], p, f_B5, TC_B, L_b, L_p, L_j);
   ELHE5(1,:) = []; t5(1) = [];
   L_B5 = ELHE5(:,2)./del_M; % cm, physical length 
   HL_B5 = ELHE5(:,2)./del_Mh; % cm, head length
   E_B5 = ELHE5(:,2).^3 + (ELHE5(:,1) + ELHE5(:,4))* (w_E/mu_E/d_E); % g, wet weight including reproduction buffer
   EWw_B5 = interp1(t5, E_B5, tWw_B(:,1), 'spline'); % returns the values of weight at tWw_B(:,1)
   ENf_B5   = kap_R * ELHE5(end,4)/ E_0;             % #, ultimate reproduction rate at T
   %
   [t_j, t_e, t_p, t_b, l_j, l_e, l_p, l_b, rho_j, rB, u_Ee, info] = get_tj_hax(pars_tj_hax, f_B6);
   L_p = l_p * L_m; L_j = l_j * L_m; 
   [t6 ELHE6] = ode45(@dget_ELHE, t, ELHE_0, [], p, f_B6, TC_B, L_b, L_p, L_j);
   ELHE6(1,:) = []; t6(1) = [];
   L_B6 = ELHE6(:,2)./del_M; % cm, physical length 
   HL_B6 = ELHE6(:,2)./del_Mh; % cm, head length
   E_B6 = ELHE6(:,2).^3 + (ELHE6(:,1) + ELHE6(:,4))* (w_E/mu_E/d_E); % g, wet weight including reproduction buffer
   EWw_B6 = interp1(t6, E_B6, tWw_B(:,1), 'spline'); % returns the values of weight at tWw_B(:,1)
   ENf_B6   = kap_R * ELHE6(end,4)/ E_0;             % #, ultimate reproduction rate at T
   %
   [t_j, t_e, t_p, t_b, l_j, l_e, l_p, l_b, rho_j, rB, u_Ee, info] = get_tj_hax(pars_tj_hax, f_B7);
   L_p = l_p * L_m; L_j = l_j * L_m;
   [t7 ELHE7] = ode45(@dget_ELHE, t, ELHE_0, [], p, f_B7, TC_B, L_b, L_p, L_j);
   ELHE7(1,:) = []; t7(1) = [];
   L_B7 = ELHE7(:,2)./del_M; % cm, physical length 
   HL_B7 = ELHE7(:,2)./del_Mh; % cm, head length
   E_B7 = ELHE7(:,2).^3 + (ELHE7(:,1) + ELHE7(:,4))* (w_E/mu_E/d_E); % g, wet weight including reproduction buffer
   EWw_B7 = interp1(t7, E_B7, tWw_B(:,1), 'spline'); % returns the values of weight at tWw_B(:,1)
   
   % t-S data for 6th instar larvae
    L_6 = (0.133/(1 + f_s * w))^(1/3);
    p = [p_M; k_J; E_G; E_Hp; E_Rj; v; p_Am; kap; kap_G; J_X_Am; s_1; s_2; E_m; ks; e_0; hb];
    ELHES_0 = [ (f * E_m * L_6^3); L_6; E_Hp; 0;1]; % initial state vector   
    [t ELHES] = ode45(@dget_ELHES, tS2(:,1), ELHES_0, [], p, 0, TC_Ts2, L_b, L_p, L_j);
    ES = ELHES(:,5);
   
  
  %pack to output
  prdData.TJX_1 = EJX_1;
  prdData.TJX_2 = EJX_2;
  prdData.TJX_3 = EJX_3;
  prdData.TJX_4 = EJX_4;
  prdData.TJX_5 = EJX_5;
  prdData.TJX_6 = EJX_6;
  
  prdData.Ttj   = ET_tj;
  prdData.Ttj2  = ET_tj2;
  prdData.Ttj3  = ET_tj3;
  prdData.Tab   = EaT_b;
  prdData.Tab2  = EaT_b2;
  prdData.Tab3  = EaT_b3;
  prdData.TtI1  = ET_tI_1;
  prdData.Tt2I1 = ET2_tI_1; 
  prdData.Tt3I1 = ET3_tI_1;  
  prdData.TtI2  = ET_tI_2;
  prdData.Tt2I2 = ET2_tI_2;
  prdData.Tt3I2 = ET3_tI_2;
  prdData.TtI3  = ET_tI_3;
  prdData.Tt2I3 = ET2_tI_3;
  prdData.Tt3I3 = ET3_tI_3;
  prdData.TtI4  = ET_tI_4;
  prdData.Tt2I4 = ET2_tI_4;
  prdData.Tt3I4 = ET3_tI_4;
  prdData.TtI5  = ET_tI_5;
  prdData.Tt2I5 = ET2_tI_5;
  prdData.Tt3I5 = ET3_tI_5;
  prdData.TtI6  = ET_tI_6;
  prdData.Tt2I6 = ET2_tI_6;
  prdData.Tt3I6 = ET3_tI_6;
  prdData.Tte   = ET_e;
  prdData.Tte2  = ET2_e;
  prdData.Tte3  = ET3_e;
  prdData.Taj = ET_aj;
  prdData.Ts    = ETs;
  
  prdData.tL_B = [L_B1, L_B2, L_B3, L_B4, L_B5, L_B6, L_B7];
  prdData.tHL_B = [HL_B1, HL_B2, HL_B3, HL_B4, HL_B5, HL_B6, HL_B7];
  prdData.tWw_B = [EWw_B1, EWw_B2, EWw_B3, EWw_B4, EWw_B5, EWw_B6, EWw_B7];
  prdData.JXNi = [ENf_B2; ENf_B5; ENf_B6];
  prdData.tS2 =ES;
end


function dELHE = dget_ELHE(t, ELHE, p, f, TC, Lb, Lp, Lj)
  % larval development
  % t: time since birth

  % unpack variables    
  E  = ELHE(1); % J, reserve
  L  = ELHE(2); % cm, structural length
  EH = ELHE(3); % J, maturity
  ER = ELHE(4); % J, reproduction buffer
      
  % unpack parameters 
  p_M = p(1); k_J = p(2); E_G = p(3); E_Hp = p(4); E_Rj = p(5); v = p(6); p_Am = p(7); kap = p(8); kap_G = p(9);
  J_X_Am = p(15);

  pT_M = TC * p_M;  pT_Am = TC * p_Am;   kT_J = TC * k_J;   vT = TC * v;
  JT_X_Am = TC * J_X_Am; 

s = min(L, Lp)/Lb;

if  kap * E * vT * s >= pT_M * L^4 % section 4.1.5 comments to Kooy2010
     r  = (E * vT * s/ L -  pT_M * L^3/  kap)/ (E +  E_G  * L^3/  kap); % d^-1, specific growth rate  
else 
     r  = (E * vT * s/ L -  pT_M * L^3/  kap)/ (E +  kap_G *  E_G  * L^3/  kap); % d^-1, specific growth rate                                      
end  
% after pupation the observed physical length is no longer revealing
  % changes in structure -
if L>Lj
    r = 0;
end

pC  = E * (vT * s/ L - r); % J/d, mobilized energy flux
        
% generate derivatives
dE = f * pT_Am * s * L^2 - pC;      % J/d, change in reserve
dL = r * L/ 3;                     % cm/d, change in length
dEH  = ((1 - kap) * pC - kT_J * EH) * (EH<E_Hp); % J/d, change in cumulated energy invested in maturation
dER  = ((1 - kap) * pC - kT_J * E_Hp)*(EH >= E_Hp)*(ER/L^3<E_Rj); % J/d, change in reproduction buffer
dX = JT_X_Am * s * f * L^2; % J/d; food consumption

dELHE = [dE; dL; dEH; dER; dX];   
end

function [value,isterminal,direction] = instars(t, ELHE, p, f, TC, L_b, L_p, L_j)
s1 = p(10); s2 = p(11); s3 = p(12); s4 = p(13); s5 = p(14);
 value = [ELHE(2)-sqrt(s1)*L_b; ELHE(2)-sqrt(s1*s2)*L_b; ELHE(2)-sqrt(s1*s2*s3)*L_b; ELHE(2)-sqrt(s1*s2*s3*s4)*L_b;ELHE(2)-sqrt(s1*s2*s3*s4*s5)*L_b;ELHE(2) - L_j];
 isterminal = [0;0;0;0;0;1];
 direction = 0;
end





%%
function dELHES = dget_ELHES(t, ELHE, p, tf, TC, Lb, Lp, Lj)
  % larval development
  % t: time since birth
  % p_Am: [p_Am] = {p_Am}/ L_b
      
  % unpack variables    
  E  = ELHE(1); % J, reserve
  L  = ELHE(2); % cm, structural length
  EH = ELHE(3); % J, maturity
  ER = ELHE(4); % J, reproduction buffer
  S = ELHE(5);  % -, survival probability

  % unpack parameters 
  p_M = p(1); k_J = p(2); E_G = p(3); E_Hp = p(4); E_Rj = p(5); v = p(6); p_Am = p(7); kap = p(8); kap_G = p(9);
  E_m = p(13); k_starv = p(14); e_0 = p(15); hb = p(16);
     
  pT_M = TC * p_M;  pT_Am = TC * p_Am;   kT_J = TC * k_J;   vT = TC * v;  k_starv = k_starv*TC;

  if length(tf) == 1
      f = tf;
  else
      f = spline1(t, tf);
  end

  s = min(L, Lp)/Lb;

  if  kap * E * vT * s >= pT_M * L^4 % section 4.1.5 comments to Kooy2010
     r  = (E * vT * s/ L -  pT_M * L^3/  kap)/ (E +  E_G  * L^3/  kap); % d^-1, specific growth rate  
  else 
     r  = (E * vT * s/ L -  pT_M * L^3/  kap)/ (E +  kap_G *  E_G  * L^3/  kap); % d^-1, specific growth rate     
  end  

  e = E/L^3 / E_m;
  pC  = E * (vT * s/ L - r*(ER/L^3 < E_Rj)); % J/d, mobilized energy flux
  p_maint = kT_J * EH + pT_M*L^3;
        
  % generate derivatives
  dE = f * pT_Am * s * L^2 - (pC-p_maint)*(ER/L^3 < E_Rj) - p_maint;  % J/d, change in reserve
  dL = r * L/ 3 *(ER/L^3 < E_Rj);                     % cm/d, change in length
  dEH  = ((1 - kap) * pC - kT_J * EH) * (EH<E_Hp);     % J/d, change in cumulated energy invested in maturation
  dER  = ((1 - kap) * pC - kT_J * E_Hp)*(EH >= E_Hp)*(ER/L^3 < E_Rj); % J/d, change in reproduction buffer
  h_sh = k_starv * max(0, e_0 - e)/e_0;
  dS = - S * (h_sh + hb); % 1/d, survival fraction

  dELHES = [dE; dL; dEH; dER; dS];
end
