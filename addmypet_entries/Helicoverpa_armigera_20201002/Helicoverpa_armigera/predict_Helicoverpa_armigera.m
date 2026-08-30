function [prdData, info] = predict_Helicoverpa_armigera(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  if k > 1 || T_H < T_ref || T_L > T_ref
    prdData = []; info = 0; return
  end
  
  T_vec = [T_A, T_L, T_H, T_AL, T_AH];

  % compute temperature correction factors
  TC_27 = tempcorr(temp.tj , T_ref, T_vec);           % data at 27 C
  TC_25 = tempcorr(temp.te, T_ref, T_vec);           % data at 25 C
  TC_20 = tempcorr(C2K(20), T_ref, T_vec);           % data at 20 C
  TC_ab = tempcorr(C2K(Tab(:,1)), T_ref, T_vec);     % instar 0, embryo
  TC_ab2 = tempcorr(C2K(Tab2(:,1)), T_ref, T_vec);     % instar 0, embryo
  TC_ab3 = tempcorr(C2K(Tab3(:,1)), T_ref, T_vec);     % instar 0, embryo
  TC_te2 = tempcorr(C2K(Tte2(:,1)), T_ref, T_vec);  
  TC_te3 = tempcorr(C2K(Tte3(:,1)), T_ref, T_vec);  
  TC_te4 = tempcorr(C2K(Tte4(:,1)), T_ref, T_vec);  
  TC_ab = tempcorr(C2K(Tab(:,1)), T_ref, T_vec);     % instar 0, embryo
  TC_TL = tempcorr(C2K(TtI1(:,1)), T_ref, T_vec);  % Temperature correction for larvae
  TC_te = tempcorr(C2K(Tte(:,1)), T_ref, T_vec);    % Temperature correction for pupae
  TC_B   = tempcorr(temp.tL_B1, T_ref, T_vec);  % Temperature correction for the Bayer experiment
    
 % life cycle
v_Rj = kap/ (1 - kap) * E_Rj/ E_G; 
pars_tj_hax = [g, k, v_Hb, v_Hp, v_Rj, v_He, kap, kap_V];
[t_j, t_e, t_p, t_b, l_j, l_e, l_p, l_b, rho_j, rB, u_Ee, info] = get_tj_hax(pars_tj_hax, f);
if length(t_e) < 1 || length(l_e) < 1
    prdData = []; info = 0; return
end
  
  
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  E_0 = p_Am * initial_scaled_reserve(f, pars_UE0); % J, initial energy content
    
  % birth
  a_b = t_b/ k_M;                     % d, age at birth at f
  L_b = L_m * l_b;                    % cm, structural length at birth
  Lw_b = L_b/ del_M;                  % cm, head length at birth

  % puberty
  tT_p = (t_p-t_b)/ k_M/ TC_27;             % d, age at birth at f and T
  L_p = L_m * l_p;                    % cm, structural length at puberty

  % metam
  tT_j = (t_j - t_b)/ k_M/ TC_27;     % d, time since birth at pupation
  L_j = L_m * l_j;                    % cm, struc length at metam
  Lw_j = L_j/ del_M;                  % cm, length at metam
  E = f * E_m * L_j^3;                % J, reserve at pupation
  E_j = E + E_Rj* L_j^3;                     % J, reserve at pupation, including reproduction buffer
  Ww_j = (L_j^3 + E_j * w_E/ mu_E/ d_E); % g, wet weight at pupation
  
  % emergence
  tT_e = (t_e - t_j)/ k_M/ TC_25;     % d, time since pupation at emergence
  
 % instar age, length
  Lw_1 = Lw_b; Lw_2 = Lw_1 * s_1^0.5; Lw_3 = Lw_2 * s_2^0.5; Lw_4 = Lw_3 * s_3^0.5; Lw_5 = Lw_4 * s_4^0.5;  % cm, head length of instar 1-4

opts = odeset('Events',@instars);

p = [p_M; k_J; E_G; E_Hp; E_Rj; v; p_Am; kap; kap_G; s_1; s_2; s_3; s_4];
[t, ELHE, te, ye] = ode45(@dget_ELHE, [0; 300], [f * E_m * L_b^3; L_b; E_Hb; 0], opts, p, f, TC_20 , L_b, L_p, L_j); %
if length(te)<5
    prdData = []; info = 0; return
end
t_1 = te(1); t_2 = te(2)-te(1); t_3 = te(3) - te(2); t_4 = te(4) - te(3); t_5 = te(5) - te(4); 

% reproduction 
  N_i = kap_R * L_j^3 * E_Rj/ E_0;     % #, life time reprod output
  
  % pack to output
  prdData.tp = tT_p;
  prdData.tj = tT_j;
  prdData.te = tT_e;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Wwj = Ww_j;
  prdData.Ni = N_i;
  
  % uni-variate data 
  
  % temperature - age at birth
  EaT_b = a_b ./ TC_ab;
  EaT_b2 = a_b ./ TC_ab2;
  EaT_b3 = a_b ./ TC_ab3;

  % temperature - development time instar 1
  ET_tI_1 = t_1./ TC_TL;    
  
  % temperature - development time instar 2
  ET_tI_2 = t_2./ TC_TL;     
  
  % temperature - development time instar 3
  ET_tI_3 = t_3./ TC_TL;    
  
  % temperature - development time instar 4
  ET_tI_4 = t_4./ TC_TL;   
  
  % temperature - development time instar 5
  ET_tI_5 = t_5./ TC_TL;   

  % temperature - development time larva
  tj = (t_j - t_b)/ k_M;      % d, time since birth at pupation
  ET_j = tj ./ TC_TL;
  
  % temperature - development time pupa
  te = (t_e - t_j)/ k_M;      % d, time since pupation at emergence
  ET_e = te ./ TC_te;
  ET_e2 = te ./ TC_te2;
  ET_e3 = te ./ TC_te3;
  ET_e4 = te ./ TC_te4;
  
  % time - length
    ELHE_0 = [f * E_m * L_b^3; L_b; E_Hb; 0]; % initial state vector
   p = [p_M; k_J; E_G; E_Hp; E_Rj; v; p_Am; kap; kap_G];
   [t_j, t_e, t_p, t_b, l_j, l_e, l_p, l_b, rho_j, rB, u_Ee, info] = get_tj_hax(pars_tj_hax, f);
   L_b = l_b * L_m; L_p = l_p * L_m;  L_j = l_j * L_m;
   [t ELHE] = ode45(@dget_ELHE, tL(:,1), ELHE_0, [], p, f, TC_25 , L_b, L_p, L_j);
   ELw = ELHE(:,2)./ del_Mh; % cm, length 


   % time - length for different feeding concentrations
  ELHE_0 = [f * E_m * L_b^3; L_b; E_Hb; 0]; % initial state vector
  p = [p_M; k_J; E_G; E_Hp; E_Rj; v; p_Am; kap; kap_G; s_1; s_2; s_3; s_4];
    
   [t_j, t_e, t_p, t_b1, l_j, l_e, l_p, l_b, rho_j, rB, u_Ee, info] = get_tj_hax(pars_tj_hax, f_B1);
   L_b = l_b * L_m;  L_p = l_p * L_m; L_j = l_j * L_m;
   [t1 ELHE1] = ode45(@dget_ELHE, [0; tL_B1(:,1)], ELHE_0, [], p, f_B1, TC_B , L_b, L_p, L_j);
   ELHE1(1,:) = []; t1(1) = [];
   L_B1 = ELHE1(:,2)./ del_M;  % cm, physical length 
   HL_B1 = ELHE1(:,2)./del_Mh; % cm, head length 
   EWw_B1 = ELHE1(:,2).^3 + (ELHE1(:,1) + ELHE1(:,4))* (w_E/mu_E/d_E); % g, wet weight including reproduction buffer
   
   [t_j, t_e, t_p, t_b, l_j, l_e, l_p, l_b, rho_j, rB, u_Ee, info] = get_tj_hax(pars_tj_hax, f_B2);
   L_b = l_b * L_m; L_p = l_p * L_m;  L_j = l_j * L_m;
   [t2 ELHE2] = ode45(@dget_ELHE, [0; tL_B2(:,1)], ELHE_0, [], p, f_B2, TC_B, L_b, L_p, L_j);
   ELHE2(1,:) = []; t2(1) =[];
   L_B2 = ELHE2(:,2)./ del_M; % cm, physical length 
   HL_B2 = ELHE2(:,2) ./del_Mh; % cm, head length
   EWw_B2 = ELHE2(:,2).^3 + (ELHE2(:,1) + ELHE2(:,4))* (w_E/mu_E/d_E); % g, wet weight including reproduction buffer
   
   [t_j, t_e, t_p, t_b, l_j, l_e, l_p, l_b, rho_j, rB, u_Ee, info] = get_tj_hax(pars_tj_hax, f_B3);
   L_b = l_b * L_m;  L_p = l_p * L_m; L_j = l_j * L_m;
   [t3 ELHE3] = ode45(@dget_ELHE, [0; tL_B3(:,1)], ELHE_0, [], p, f_B3, TC_B, L_b, L_p, L_j);
   ELHE3(1,:) = []; t3(1) = [];
   L_B3 = ELHE3(:,2)./ del_M; % cm, physical length
   HL_B3 = ELHE3(:,2)./del_Mh; % cm, head length
   EWw_B3 = ELHE3(:,2).^3 + (ELHE3(:,1) + ELHE3(:,4))* (w_E/mu_E/d_E); % g, wet weight including reproduction buffer
   
   [t_j, t_e, t_p, t_b, l_j, l_e, l_p, l_b, rho_j, rB, u_Ee, info] = get_tj_hax(pars_tj_hax, f_B4);
   L_b = l_b * L_m; L_p = l_p * L_m; L_j = l_j * L_m;
   [t4 ELHE4] = ode45(@dget_ELHE, [0; tL_B4(:,1)], ELHE_0, [], p, f_B4, TC_B, L_b, L_p, L_j);
   ELHE4(1,:) = []; t4(1) = [];
   L_B4 = ELHE4(:,2)./del_M; % cm, physical length 
   HL_B4 = ELHE4(:,2)./del_Mh; % cm, head length
   E_B4 = ELHE4(:,2).^3 + (ELHE4(:,1) + ELHE4(:,4))* (w_E/mu_E/d_E); % g, wet weight including reproduction buffer
   EWw_B4 = interp1(t4, E_B4, tWw_B4(:,1), 'spline'); % returns the values of weight at tWw_B4(:,1)
  
  [t_j, t_e, t_p, t_b, l_j, l_e, l_p, l_b, rho_j, rB, u_Ee, info] = get_tj_hax(pars_tj_hax, f_B5);
   L_b = l_b * L_m; L_p = l_p * L_m; L_j = l_j * L_m;
   [t5 ELHE5] = ode45(@dget_ELHE, [0; tL_B5(:,1)], ELHE_0, [], p, f_B5, TC_B, L_b, L_p, L_j);
   ELHE5(1,:) = []; t5(1) = [];
   L_B5 = ELHE5(:,2)./del_M; % cm, physical length 
   HL_B5 = ELHE5(:,2)./del_Mh; % cm, head length
   E_B5 = ELHE5(:,2).^3 + (ELHE5(:,1) + ELHE5(:,4))* (w_E/mu_E/d_E); % g, wet weight including reproduction buffer
   EWw_B5 = interp1(t5, E_B5, tWw_B5(:,1), 'spline'); % returns the values of weight at tWw_B4(:,1)
   
  [t_j, t_e, t_p, t_b, l_j, l_e, l_p, l_b, rho_j, rB, u_Ee, info] = get_tj_hax(pars_tj_hax, f_B6);
   L_b = l_b * L_m; L_p = l_p * L_m; L_j = l_j * L_m;
   [t6 ELHE6] = ode45(@dget_ELHE, [0; tL_B6(:,1)], ELHE_0, [], p, f_B6, TC_B, L_b, L_p, L_j);
   ELHE6(1,:) = []; t6(1) = [];
   L_B6 = ELHE6(:,2)./del_M; % cm, physical length 
   HL_B6 = ELHE6(:,2)./del_Mh; % cm, head length
   E_B6 = ELHE6(:,2).^3 + (ELHE6(:,1) + ELHE6(:,4))* (w_E/mu_E/d_E); % g, wet weight including reproduction buffer
   EWw_B6 = interp1(t6, E_B6, tWw_B6(:,1), 'spline'); % returns the values of weight at tWw_B4(:,1)
   
   [t_j, t_e, t_p, t_b, l_j, l_e, l_p, l_b, rho_j, rB, u_Ee, info] = get_tj_hax(pars_tj_hax, f_B7);
   L_b = l_b * L_m; L_p = l_p * L_m; L_j = l_j * L_m;
   [t7 ELHE7] = ode45(@dget_ELHE, [0; tL_B7(:,1)], ELHE_0, [], p, f_B7, TC_B, L_b, L_p, L_j);
   ELHE7(1,:) = []; t7(1) = [];
   L_B7 = ELHE7(:,2)./del_M; % cm, physical length 
   HL_B7 = ELHE7(:,2)./del_Mh; % cm, head length
   E_B7 = ELHE7(:,2).^3 + (ELHE7(:,1) + ELHE7(:,4))* (w_E/mu_E/d_E); % g, wet weight including reproduction buffer
   EWw_B7 = interp1(t7, E_B7, tWw_B7(:,1), 'spline'); % returns the values of weight at tWw_B4(:,1)
   
  %pack to output  
  prdData.Tab   = EaT_b;
  prdData.Tab2   = EaT_b2;
  prdData.Tab3   = EaT_b3;
  prdData.TtI1  = ET_tI_1; 
  prdData.TtI2  = ET_tI_2;
  prdData.TtI3  = ET_tI_3;
  prdData.TtI4  = ET_tI_4;
  prdData.TtI5  = ET_tI_5;
  prdData.Ttj   = ET_j;
  prdData.Tte   = ET_e;
  prdData.Tte2   = ET_e2;
  prdData.Tte3  = ET_e3;
  prdData.Tte4  = ET_e4;
  prdData.tL  = ELw;
   
  prdData.tL_B1 = L_B1;
  prdData.tL_B2 = L_B2;
  prdData.tL_B3 = L_B3;
  prdData.tL_B4 = L_B4;
  prdData.tL_B5 = L_B5;
  prdData.tL_B6 = L_B6;
  prdData.tL_B7 = L_B7;
  prdData.tHL_B1 = HL_B1;
  prdData.tHL_B2 = HL_B2;
  prdData.tHL_B3 = HL_B3;
  prdData.tHL_B4 = HL_B4;
  prdData.tHL_B5 = HL_B5;
  prdData.tHL_B6 = HL_B6;
  prdData.tHL_B7 = HL_B7;
  prdData.tWw_B1 = EWw_B1;
  prdData.tWw_B2 = EWw_B2;
  prdData.tWw_B3 = EWw_B3;
  prdData.tWw_B4 = EWw_B4;
  prdData.tWw_B5 = EWw_B5;
  prdData.tWw_B6 = EWw_B6;
  prdData.tWw_B7 = EWw_B7;
end

%% subfunctions 
    
function dELHE = dget_ELHE(t, ELHE, p, f, TC, Lb, Lp, Lj)
  % larval development
  % t: time since birth
  % p_Am: [p_Am] = {p_Am}/ L_b
      
  % unpack variables    
  E  = ELHE(1); % J, reserve
  L  = ELHE(2); % cm, structural length
  EH = ELHE(3); % J, maturity
  ER = ELHE(4); % J, reproduction buffer
      
  % unpack parameters 
  p_M = p(1); k_J = p(2); E_G = p(3); E_Hp = p(4); E_Rj = p(5); v = p(6); p_Am = p(7); kap = p(8); kap_G = p(9);
     
  pT_M = TC * p_M;  pT_Am = TC * p_Am;   kT_J = TC * k_J;   vT = TC * v;

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
dER  = ((1 - kap) * pC - kT_J * E_Hp)*(EH >= E_Hp)*(ER/L^3 < E_Rj); % J/d, change in reproduction buffer

dELHE = [dE; dL; dEH; dER];   
end


function [value,isterminal,direction] = instars(t, ELHE, p, f, TC, Lb, Lp, Lj)
s1 = p(10); s2 = p(11); s3 = p(12); s4 = p(13); ER_j = p(5);
 value = [ELHE(2)-sqrt(s1)*Lb; ELHE(2)-sqrt(s1*s2)*Lb; ELHE(2)-sqrt(s1*s2*s3)*Lb; ELHE(2)-sqrt(s1*s2*s3*s4)*Lb;ELHE(4)/ELHE(2)^3 - ER_j];
 isterminal = [0;0;0;0;1];
 direction = 0;
end

