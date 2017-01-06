within ;
package CIPE

  model CIPE
    //adjusted charges to fit the steady state
    parameter Real XE = 0;
    parameter Real XP = 0;
    parameter Real XI = 0;
    parameter Real XC = 0;
    //default concentration [mmol/l]
    //erythrocytes
    parameter Real NaE(unit = "mol/m3", displayUnit = "mmol/l") = 13.7;
    parameter Real KE(unit = "mol/m3", displayUnit = "mmol/l") = 136;
    parameter Real ClE(unit = "mol/m3", displayUnit = "mmol/l") = 73.2;
    parameter Real Hb(unit = "mol/m3", displayUnit = "mmol/l") = 5.3;
    parameter Real DPG(unit = "mol/m3", displayUnit = "mmol/l") = 4.4;
    parameter Real ATP(unit = "mol/m3", displayUnit = "mmol/l") = 1.8;
    parameter Real GSH(unit = "mol/m3", displayUnit = "mmol/l") = 2.2;
    parameter Real imE(unit = "mol/m3", displayUnit = "mmol/l") = 16.8;
    parameter Real PiE(unit = "mol/m3", displayUnit = "mmol/l") = 0.92;
    parameter Real LacE(unit = "mol/m3", displayUnit = "mmol/l") = 1.06;
    //Plasma and Intersticium
    parameter Real NaP(unit = "mol/m3", displayUnit = "mmol/l") = 150;
    parameter Real NaI(unit = "mol/m3", displayUnit = "mmol/l") = 141.2;
    parameter Real KP(unit = "mol/m3", displayUnit = "mmol/l") = 4.78;
    parameter Real KI(unit = "mol/m3", displayUnit = "mmol/l") = 4.55;
    parameter Real CaMgP(unit = "mol/m3", displayUnit = "mmol/l") = 3.3;
    parameter Real CaMgI(unit = "mol/m3", displayUnit = "mmol/l") = 3;
    parameter Real ClP(unit = "mol/m3", displayUnit = "mmol/l") = 111;
    parameter Real ClI(unit = "mol/m3", displayUnit = "mmol/l") = 116.5;
    parameter Real PiP(unit = "mol/m3", displayUnit = "mmol/l") = 1.23;
    parameter Real PiI(unit = "mol/m3", displayUnit = "mmol/l") = 1.36;
    parameter Real AlbP(unit = "mol/m3", displayUnit = "mmol/l") = 43 / 66.5;
    parameter Real Tpro(unit = "mol/m3", displayUnit = "mmol/l") = 70.4 / 70;
    parameter Real AlbI(unit = "mol/m3", displayUnit = "mmol/l") = (43 / 66.5)/2;
    parameter Real LacP(unit = "mol/m3", displayUnit = "mmol/l") = 1.51;
    parameter Real LacI(unit = "mol/m3", displayUnit = "mmol/l") = 1.69;
    parameter Real imP(unit = "mol/m3", displayUnit = "mmol/l") = 10.6;
    parameter Real imI(unit = "mol/m3", displayUnit = "mmol/l") = 10.6;
    //cells
    parameter Real NaC(unit = "mol/m3", displayUnit = "mmol/l") = 12;
    parameter Real KC(unit = "mol/m3", displayUnit = "mmol/l") = 141.2;
    parameter Real ClC(unit = "mol/m3", displayUnit = "mmol/l") = 3.75;
    parameter Real imC(unit = "mol/m3", displayUnit = "mmol/l") = 129;
    parameter Real kNa = 368;
    parameter Real kH = 10;
    //charge [-]
    parameter Real ZimE = -3.25;
    parameter Real ZimI = 8.92;
    parameter Real ZimP = -6.04;
    //
    //initial volumes [l]
    parameter Real Vblood(unit="l") = 5.1;
    parameter Real Vint(unit="l") = 9.68;
    parameter Real Vcell(unit="l") = 26.8;
    //
    //partial pressure of CO2 [mmHg]
    //parameter Real pCO2(unit = "torr") = 46;
    Real pCO2;
    parameter Real fSat = 0.75;
    //
    //Water volumes of erythrcytes, plasma and intersticium
    parameter Real hemat0 = 0.4391;
    parameter Real fWe0 = 0.73;
    parameter Real fWp0 = 0.94;
    parameter Real fWi0 = 1;
    parameter Real fWc0 = 1;
    parameter Real Vew0(unit="l") = hemat0 * fWe0 * Vblood;
    parameter Real Vpw0(unit="l") = (1 - hemat0) * fWp0 * Vblood;
    parameter Real Viw0(unit="l") = fWi0 * Vint;
    parameter Real Vcw0(unit="l") = Vcell * fWc0;
    //
    //masses of conserved species [mmol]
    //erythrocytes
    parameter Real m0NaE(unit="mmol") = NaE * Vew0;
    parameter Real m0KE(unit="mmol") = KE * Vew0;
    parameter Real m0ClE(unit="mmol") = ClE * Vew0;
    parameter Real m0Hb(unit="mmol") = Hb * Vew0;
    parameter Real m0DPG(unit="mmol") = DPG * Vew0;
    parameter Real m0ATP(unit="mmol") = ATP * Vew0;
    parameter Real m0GSH(unit="mmol") = GSH * Vew0;
    parameter Real m0imE(unit="mmol") = imE * Vew0;
    parameter Real m0PiE(unit="mmol") = PiE * Vew0;
    parameter Real m0LacE(unit="mmol") = LacE * Vew0;
    //plasma and intersticium
    parameter Real m0NaP(unit="mmol") = NaP * Vpw0;
    parameter Real m0NaI(unit="mmol") = NaI * Viw0;
    parameter Real m0KP(unit="mmol") = KP * Vpw0;
    parameter Real m0KI(unit="mmol") = KI * Viw0;
    parameter Real m0CaMgP(unit="mmol") = CaMgP * Vpw0;
    parameter Real m0CaMgI(unit="mmol") = CaMgI * Viw0;
    parameter Real m0ClP(unit="mmol") = ClP * Vpw0;
    parameter Real m0ClI(unit="mmol") = ClI * Viw0;
    parameter Real m0PiP(unit="mmol") = PiP * Vpw0;
    parameter Real m0PiI(unit="mmol") = PiI * Viw0;
    parameter Real m0AlbP(unit="mmol") = AlbP * Vpw0;
    parameter Real m0AlbI(unit="mmol") = AlbI * Viw0;
    parameter Real m0imP = imP * Vpw0;
    parameter Real m0imI = imI * Viw0;
    parameter Real m0LacP(unit="mmol") = LacP * Vpw0;
    parameter Real m0LacI(unit="mmol") = LacI * Viw0;
    //
    parameter Real m0NaC(unit="mmol") = NaC * Vcw0;
    parameter Real m0KC(unit="mmol") = KC * Vcw0;
    parameter Real m0ClC(unit="mmol") = ClC * Vcw0;
    parameter Real m0imC(unit="mmol") = imC * Vcw0;
    //total masses of mobile ions [mmol]
    parameter Real MCl(unit="mmol") = m0ClE + m0ClP + m0ClI + m0ClC;
    parameter Real MNa(unit="mmol") = m0NaP + m0NaI + m0NaC;
    parameter Real MK(unit="mmol") = m0KP + m0KI + m0KC;
    parameter Real MCaMg(unit="mmol") = m0CaMgP + m0CaMgI;
    parameter Real MPi(unit="mmol") = m0PiE + m0PiP + m0PiI;
    parameter Real MLac(unit="mmol") = m0LacE + m0LacP + m0LacI;
    //after equilibrium
    //masses of mobile ions
    Real mClE(unit="mmol", start = m0ClE);
    Real mClP(unit="mmol", start = m0ClP);
    Real mClI(unit="mmol", start = m0ClI);
    Real mNaP(unit="mmol", start = m0NaP);
    Real mNaI(unit="mmol", start = m0NaI);
    Real mKP(unit="mmol", start = m0KP);
    Real mKI(unit="mmol", start = m0KI);
    Real mCaMgP(unit="mmol", start = m0CaMgP);
    Real mCaMgI(unit="mmol", start = m0CaMgI);
    Real mPiE(unit="mmol", start = m0PiE);
    Real mPiP(unit="mmol", start = m0PiP);
    Real mPiI(unit="mmol", start = m0PiI);
    Real mLacE(unit="mmol", start = m0LacE);
    Real mLacP(unit="mmol", start = m0LacP);
    Real mLacI(unit="mmol", start = m0LacI);
    Real mNaC(unit="mmol", start = m0NaC);
    Real mKC(unit="mmol", start = m0KC);
    Real mClC(unit="mmol", start = m0ClC);
    //18 variables
    //
    //volumes of compartments
    Real Vew(unit="l", start = Vew0);
    Real Vpw(unit="l", start = Vpw0);
    Real Viw(unit="l", start = Viw0);
    Real Vcw(unit="l", start = Vcw0);
    //4 variables
    //
    //concentration of bicarbonates [mmol/l]
    Real HCO3E(unit="mmol/l", start = 20);
    Real HCO3P(unit="mmol/l", start = 27.7);
    Real HCO3I(unit="mmol/l", start = 29.2);
    Real HCO3C(unit="mmol/l", start = 8.35);
    //4 variables
    //
    //pH
    Real pHE;//(start = 7.19);
    Real pHP;//(start = 7.37);
    Real pHI;//(start = 7.39);
    Real pHC;//(start = 6.9);
    //pH dependant charges
    Real ZPiE;
    Real ZPiP;
    Real ZPiI;
    Real ZAlbP;
    Real ZAlbI;
    Real ZHb;
    Real ZDPG;
    Real ZATP;
    Real ZGSH;
    Real fiHb;
    Real ZimC;
    //carbonates
    Real CO3E(unit="mmol/l");
    Real CO3P(unit="mmol/l");
    Real CO3I(unit="mmol/l");
    Real CO3C(unit="mmol/l");
    //concentrations of all species [mmol/l]
    Real C_NaE(unit="mmol/l", start = NaE);
    Real C_KE(unit="mmol/l", start = KE);
    Real C_ClE(unit="mmol/l", start = ClE);
    Real C_Hb(unit="mmol/l", start = Hb);
    Real C_DPG(unit="mmol/l", start = DPG);
    Real C_ATP(unit="mmol/l", start = ATP);
    Real C_GSH(unit="mmol/l", start = GSH);
    Real C_imE(unit="mmol/l", start = imE);
    Real C_PiE(unit="mmol/l", start = PiE);
    Real C_LacE(unit="mmol/l", start = LacE);
    Real C_HE(unit="mmol/l", start = 10 ^ (-(a-0.18)));
    //
    Real C_NaP(unit="mmol/l", start = NaP);
    Real C_NaI(unit="mmol/l", start = NaI);
    Real C_KP(unit="mmol/l", start = KP);
    Real C_KI(unit="mmol/l", start = KI);
    Real C_CaMgP(unit="mmol/l", start = CaMgP);
    Real C_CaMgI(unit="mmol/l", start = CaMgI);
    Real C_ClP(unit="mmol/l", start = ClP);
    Real C_ClI(unit="mmol/l", start = ClI);
    Real C_PiP(unit="mmol/l", start = PiP);
    Real C_PiI(unit="mmol/l", start = PiI);
    Real C_AlbP(unit="mmol/l", start = AlbP);
    Real C_Tpro(unit="mmol/l", start = Tpro);
    Real C_AlbI(unit="mmol/l", start = AlbI);
    Real C_imP(start = imP);
    Real C_imI(start = imI);
    Real C_LacP(unit="mmol/l", start = LacP);
    Real C_LacI(unit="mmol/l", start = LacI);
    Real C_HI(unit="mmol/l", start = 10 ^ (-(a+0.02)));
    Real C_HP(unit="mmol/l", start = 10 ^ (-a));
    //
    Real C_NaC(unit="mmol/l", start = NaC);
    Real C_KC(unit="mmol/l", start = KC);
    Real C_ClC(unit="mmol/l", start = ClC);
    Real C_imC(unit="mmol/l", start = imC);
    Real C_HC(unit="mmol/l", start = 10 ^ (-(a-0.4)));
    //
    Real Oe;
    Real Oc;
    Real Op;
    Real Oi;
    Real PrB;
    Real PrI;
    parameter Real kB = 17.5;
    //Real PrB0;
    //Real PrI0;
    parameter Real kImh = 93;
    Real kItr;
    parameter Real kIoh = 8.3;
    parameter Real PrItr = 9;
    parameter Real Slm = 0.99;
    parameter Real Ssm = 0.5;
    parameter Real PIP(start = 25.4);
    parameter Real PII(start = 12.7);
    Real a;
    Real XNa=0;
    Real XCl=0;
  equation
    a=7.7;
    pHI=7.7-1*time;
    //mass conservation
    MCl = mClE + mClP + mClI + mClC-XCl;
    MNa = mNaP + mNaI + mNaC-XNa;
    MK = mKP + mKI + mKC;
    MCaMg = mCaMgP + mCaMgI;
    MPi = mPiE + mPiP + mPiI;
    MLac = mLacE + mLacP + mLacI;
    //6 equations
    //
    //water conservation
    Vew0 + Vpw0 + Viw0 + Vcw0 = Vew + Vpw + Viw + Vcw;
    //1 equation
    //
    //Donnan equilibrium
    C_ClE / C_ClP = C_HP/C_HE;
    C_ClE / C_ClP = C_LacE / C_LacP;
    (C_ClE / C_ClP) ^ abs(ZPiP) = C_PiE / C_PiP;
    C_ClI / C_ClP = C_HP/C_HI;
    C_ClI / C_ClP = C_NaP / C_NaI;
    C_ClI / C_ClP = C_KP / C_KI;
    (C_ClI / C_ClP) ^ 2 = C_CaMgP / C_CaMgI;
    (C_ClI / C_ClP) ^ abs(ZPiP) = C_PiI / C_PiP;
    C_LacI / C_LacP = C_ClI / C_ClP;
    C_ClC / C_ClI = C_KI / C_KC;
    C_ClI / C_ClC = kNa * (C_NaC / C_NaI);
    C_ClI / C_ClC = kH * (C_HC / C_HI);
    //12 equations
    //
    //electroneutrality
    C_NaP + C_KP + 2 * C_CaMgP - C_ClP - HCO3P - 2 * CO3P + ZPiP * C_PiP + ZAlbP * C_AlbP + ZimP * (Vpw0 / Vpw) - C_LacP + XP = 0;
    C_NaI + C_KI + 2 * C_CaMgI - C_ClI - HCO3I - 2 * CO3I + ZPiI * C_PiI + ZAlbI * C_AlbI + ZimI * (Viw0 / Viw) - C_LacI + XI = 0;
    //C_NaE + C_KE - C_ClE - HCO3E - 2 * CO3E + ZHb * C_Hb + ZDPG * C_DPG + ZATP * C_ATP + ZGSH * C_GSH + ZimE * (Vew0 / Vew) + ZPiE * C_PiE - C_LacE + XE = 0;
    //C_NaC + C_KC - C_ClC - HCO3C - 2 * CO3C + ZimC * (Vcw0 / Vcw) + XC = 0;
    C_NaE + C_KE - C_ClE - HCO3E - 2 * CO3E + ZHb * C_Hb + ZDPG * C_DPG + ZATP * C_ATP + ZGSH * C_GSH + ZimE * C_imE + ZPiE * C_PiE - C_LacE + XE = 0;
    C_NaC + C_KC - C_ClC - HCO3C - 2 * CO3C + ZimC * C_imC + XC = 0;
    //4 equations
    //
    //osmotic equilibrium
    //0.93 * (C_NaP - C_NaI) + 0.93 * (C_KP - C_KI) + 0.93 * (C_ClP - C_ClI) + 0.93*(C_CaMgP - C_CaMgI) + 0.93 * (HCO3P - HCO3I) + 0.93 * (CO3P - CO3I) + 0.93 * (C_PiP - C_PiI) + C_AlbP - C_AlbI + C_LacP-C_LacI = 0;
    //0.93 * (C_NaP - C_NaE) + 0.93 * (C_KP - C_KE) + 0.93 * (C_ClP - C_ClE) + 0.93 * (C_PiP - C_PiE) + 0.93*(C_CaMgP) + C_Tpro - fiHb * C_Hb - C_DPG - C_ATP - C_GSH +0.93*(C_LacP-C_LacE)-C_imE-288.9*(Vew0/Vew)=0;
    //0.93*(C_NaI-C_NaC)+0.93*(C_KI-C_KC)+0.93*(C_ClI-C_ClC)+0.93*(HCO3I-HCO3C)+0.93*(CO3I-CO3C)-C_imC+C_AlbI+C_PiI+C_CaMgI+C_LacI-288.4*(Vcw0/Vcw)=0;
    Oe = Op;
    Oi = Oc;
    //2 equations
    //
    //pressure equilibrium
    PrB - PrI + 17.3 - Slm * (PIP - PII) - 19.3 * Ssm * (Op - Oi) = 0;
    //1 equation
    //
    //pH dependant charges
    ZHb = 15.6 - 23 * (10 ^ (pHE - 6.69) / (1 + 10 ^ (pHE - 6.69))) - 4 * (10 ^ (pHE - 7.89) / (1 + 10 ^ (pHE - 7.89))) + 1.5 * ((1 - fSat) / fSat);
    ZDPG = (-3) - 1 * (10 ^ (pHE - 7.56) / (1 + 10 ^ (pHE - 7.56))) - 1 * (10 ^ (pHE - 7.32) / (1 + 10 ^ (pHE - 7.32)));
    ZATP = (-3) - 1 * (10 ^ (pHE - 6.8) / (1 + 10 ^ (pHE - 6.8)));
    ZGSH = (-1) - 1 * (10 ^ (pHE - 8.54) / (1 + 10 ^ (pHE - 8.54))) - 1 * (10 ^ (pHE - 9.42) / (1 + 10 ^ (pHE - 9.42)));
    ZPiE = (-1) - 10 ^ (pHE - 6.87) / (1 + 10 ^ (pHE - 6.87));
    ZPiP = (-1) - 10 ^ (pHP - 6.87) / (1 + 10 ^ (pHP - 6.87));
    ZPiI = (-1) - 10 ^ (pHI - 6.87) / (1 + 10 ^ (pHI - 6.87));
    ZAlbP = (-10.7) - 16 * (10 ^ (pHP - 7.42) / (1 + 10 ^ (pHP - 7.42)));
    ZAlbI = (-10.7) - 16 * (10 ^ (pHI - 7.42) / (1 + 10 ^ (pHI - 7.42)));
    fiHb = 1 + 0.115 * C_Hb + 0.0256 * C_Hb ^ 2;
    ZimC = (-1.52) * (10 ^ (pHC - 6.5) / (1 + 10 ^ (pHC - 6.5)));
    //carbonates and pH
    HCO3E = 0.026 * pCO2 * 10 ^ (pHE - 6.11);
    CO3E = HCO3E * 10 ^ (pHE - 10.2);
    HCO3P = 0.0306 * pCO2 * 10 ^ (pHP - 6.11);
    CO3P = HCO3P * 10 ^ (pHP - 10.2);
    HCO3I = 0.0326 * pCO2 * 10 ^ (pHI - 6.11);
    CO3I = HCO3I * 10 ^ (pHI - 10.2);
    HCO3C = 0.029 * pCO2 * 10 ^ (pHC - 6.11);
    CO3C = HCO3C * 10 ^ (pHC - 10.2);
    pHE=-log10(C_HE);
    pHP=-log10(C_HP);
    pHI=-log10(C_HI);
    pHC=-log10(C_HC);
    //concentrations
    C_NaE = m0NaE / Vew;
    C_KE = m0KE / Vew;
    C_ClE = mClE / Vew;
    C_Hb = m0Hb / Vew;
    C_DPG = m0DPG / Vew;
    C_ATP = m0ATP / Vew;
    C_GSH = m0GSH / Vew;
    C_imE = m0imE / Vew;
    C_PiE = mPiE / Vew;
    C_LacE = mLacE / Vew;
    //
    C_NaP = mNaP / Vpw;
    C_NaI = mNaI / Viw;
    C_KP = mKP / Vpw;
    C_KI = mKI / Viw;
    C_CaMgP = mCaMgP / Vpw;
    C_CaMgI = mCaMgI / Viw;
    C_ClP = mClP / Vpw;
    C_ClI = mClI / Viw;
    C_PiP = mPiP / Vpw;
    C_PiI = mPiI / Viw;
    C_AlbP = m0AlbP / Vpw;
    C_Tpro = Tpro * Vpw0 / Vpw;
    C_AlbI = m0AlbI / Viw;
    C_imP = m0imP / Vpw;
    C_imI = m0imI / Viw;
    C_LacP = mLacP / Vpw;
    C_LacI = mLacI / Viw;
    //
    C_NaC = mNaC / Vcw;
    C_KC = mKC / Vcw;
    C_ClC = mClC / Vcw;
    C_imC = m0imC / Vcw;
    //
    //PIP=(C_AlbP*6.65)*(2.8+0.18*(C_Tpro*7)+0.012*(C_Tpro*7)^2)+(C_Tpro*7-C_AlbP)*(0.9+0.12*C_Tpro*7+0.004*(C_Tpro*7)^2);
    //PII=(C_AlbI*6.65)*(2.8+0.18*(C_AlbI*6.65)+0.012*(C_AlbI*6.65)^2);
    //PIP=(C_AlbP)*(2.8+0.18*(C_Tpro)+0.012*(C_Tpro)^2)+(C_Tpro-C_AlbP)*(0.9+0.12*C_Tpro+0.004*(C_Tpro)^2);
    //PII=(C_AlbI)*(2.8+0.18*(C_AlbI)+0.012*(C_AlbI)^2);
    Oe = 0.93 * C_NaE + 0.93 * C_KE + 0.93 * C_ClE + 0.93 * C_PiE + fiHb * C_Hb + C_DPG + C_ATP + C_GSH + C_LacE + C_imE + HCO3E + CO3E;
    Op = 0.93 * C_NaP + 0.93 * C_KP + 0.93 * C_ClP + C_CaMgP + HCO3P + CO3P + 0.93 * C_PiP + C_AlbP + C_LacP + C_imP;
    Oi = 0.93 * C_NaI + 0.93 * C_KI + 0.93 * C_ClI + C_CaMgI + HCO3I + CO3I + 0.93 * C_PiI + C_AlbI + C_LacI + C_imI;
    Oc = 0.93 * C_NaC + 0.93 * C_KC + 0.93 * C_ClC + HCO3C + CO3C + C_imC;
    PrB = (kB * ((Vew / 0.73 + Vpw / 0.94)- Vblood) / Vblood);
    kItr = (Viw - Viw0) / Viw0;
    if noEvent(kItr >0.097) then
      PrI=PrItr+kIoh*kItr;
    else
      PrI=kImh*kItr;
    end if;
    //PrB0-PrI0=17.3;
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end CIPE;
  annotation(uses(Modelica(version = "3.2.1")));
end CIPE;
