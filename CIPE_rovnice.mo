within ;
package CIPE_rovnice
  model IPE
    //default concentration [mmol/l]
    //erythrocytes
    parameter Real NaE = 10;
    parameter Real KE = 99;
    parameter Real ClE = 55.3;
    parameter Real Hb = 5.3;
    parameter Real DPG = 4.4;
    parameter Real ATP = 1.8;
    parameter Real GSH = 2.2;
    parameter Real imE = 95.9;
    parameter Real PiE = 0.67;
    //Plasma and Intersticium
    parameter Real NaP = 141;
    parameter Real NaI = 142;
    parameter Real KP = 4.2;
    parameter Real KI = 4.14;
    parameter Real CaP = 2.3;
    parameter Real CaI = 2.2;
    parameter Real MgP = 0.8;
    parameter Real MgI = 0.75;
    parameter Real ClP = 104;
    parameter Real ClI = 118;
    parameter Real PiP = 1.16;
    parameter Real PiI = 1.2;
    parameter Real AlbP = 0.65;
    parameter Real AlbI = 0.19;
    parameter Real imP = 21.5;
    parameter Real imI = 20;
    //charge [-]
    parameter Real ZimE = 0.02;
    parameter Real ZimI = 0.012;
    parameter Real ZimP = -0.2;
    //
    //initial volumes [l]
    parameter Real Vblood = 1;
    parameter Real Vint = 2;
    //
    //partial pressure of CO2 [mmHg]
    parameter Real pCO2 = 46;
    //
    //Water volumes of erythrcytes, plasma and intersticium
    parameter Real hemat0=0.44;
    parameter Real fWe0=0.73;
    parameter Real fWp0=0.94;
    parameter Real fWi0=1;
    parameter Real Vew0 = hemat0 * fWe0 * Vblood;
    parameter Real Vpw0 = (1 - hemat0) * fWp0 * Vblood;
    parameter Real Viw0= fWi0* Vint;
    //
    //masses of conserved species [mmol]
    //erythrocytes
    parameter Real m0NaE = NaE * Vew0;
    parameter Real m0KE = KE * Vew0;
    parameter Real m0ClE = ClE * Vew0;
    parameter Real m0Hb = Hb * Vew0;
    parameter Real m0DPG = DPG * Vew0;
    parameter Real m0ATP = ATP * Vew0;
    parameter Real m0GSH = GSH * Vew0;
    parameter Real m0imE = imE * Vew0;
    parameter Real m0PiE = PiE * Vew0;
    //plasma and intersticium
    parameter Real m0NaP = NaP * Vpw0;
    parameter Real m0NaI = NaI * Viw0;
    parameter Real m0KP = KP * Vpw0;
    parameter Real m0KI = KI * Viw0;
    parameter Real m0CaP = CaP * Vpw0;
    parameter Real m0CaI = CaI * Viw0;
    parameter Real m0MgP = MgP * Vpw0;
    parameter Real m0MgI = MgI * Viw0;
    parameter Real m0ClP = ClP * Vpw0;
    parameter Real m0ClI = ClI * Viw0;
    parameter Real m0PiP = PiP * Vpw0;
    parameter Real m0PiI = PiI * Viw0;
    parameter Real m0AlbP = AlbP * Vpw0;
    parameter Real m0AlbI = AlbI * Viw0;
    parameter Real m0imP = imP * Vpw0;
    parameter Real m0imI = imI * Viw0;
    //total masses of mobile ions [mmol]
    parameter Real MCl = m0ClE + m0ClP + m0ClI;
    parameter Real MNa = m0NaP + m0NaI;
    parameter Real MK = m0KP + m0KI;
    parameter Real MCa = m0CaP + m0CaI;
    parameter Real MMg = m0MgP + m0MgI;
    parameter Real MPi = m0PiP + m0PiI;
    //after equillibrium
    //masses of mobile ions
    Real mClE;
    Real mClP(start = m0ClP);
    Real mClI;
    Real mNaP;
    Real mNaI;
    Real mKP(start = m0KP);
    Real mKI(start = m0KI);
    Real mCaP;
    Real mCaI(start = m0CaI);
    Real mMgP(start = m0MgP);
    Real mMgI(start = m0MgI);
    Real mPiP(start = m0PiP);
    Real mPiI(start = m0PiI);
    //13 variables
    //
    //volumes of compartments
    Real Vew(start = Vew0);
    Real Vpw(start = Vpw0);
    Real Viw(start = Viw0);
    //3 variables
    //
    //concentration of bicarbonates [mmol/l]
    Real HCO3E;
    Real HCO3P;
    Real HCO3I;
    //3variables
    //
    //pH
    Real pHE(start = 7.22);
    Real pHP(start = 7.4);
    Real pHI(start = 7.39);
    //pH dependant charges
    Real ZPi;
    Real ZAlb;
    Real ZHb;
    Real ZDPG;
    Real ZATP;
    Real ZGSH;
    Real fiHb;
    //carbonates
    Real CO3E;
    Real CO3P;
    Real CO3I;
    //concentrations of all species [mmol/l]
    Real C_NaE(start = NaE);
    Real C_KE(start = KE);
    Real C_ClE(start = ClE);
    Real C_Hb(start = Hb);
    Real C_DPG(start = DPG);
    Real C_ATP(start = ATP);
    Real C_GSH(start = GSH);
    Real C_imE(start = imE);
    Real C_PiE(start = PiE);
    //
    Real C_NaP(start = NaP);
    Real C_NaI(start = NaI);
    Real C_KP(start = KP);
    Real C_KI(start = KI);
    Real C_CaP(start = CaP);
    Real C_CaI(start = CaI);
    Real C_MgP(start = MgP);
    Real C_MgI(start = MgI);
    Real C_ClP(start = ClP);
    Real C_ClI(start = ClI);
    Real C_PiP(start = PiP);
    Real C_PiI(start = PiI);
    Real C_AlbP(start = AlbP);
    Real C_AlbI(start = AlbI);
    Real C_imP(start = imP);
    Real C_imI(start = imI);
  equation
    //mass conservation
    MCl = mClE + mClP + mClI;
    MNa = mNaP + mNaI;
    MK = mKP + mKI;
    MCa = mCaP + mCaI;
    MMg = mMgP + mMgI;
    MPi = mPiP + mPiI;
    //6 equations
    //
    //water conservation
    Vew0 + Vpw0 + Viw0 = Vew + Vpw + Viw;
    //1 equation
    //
    //Donnan equllibrium
    C_ClE / C_ClP = 0.92 * (HCO3E / HCO3P);
    C_ClI / C_ClP = 0.92 * (HCO3I / HCO3P);
    C_ClI / C_ClP = C_NaP / C_NaI;
    C_ClI / C_ClP = C_KP / C_KI;
    (C_ClI / C_ClP) ^ 2 = C_CaP / C_CaI;
    (C_ClI / C_ClP) ^ 2 = C_MgP / C_MgI;
    (C_ClI / C_ClP) ^ abs(ZPi) = C_PiI / C_PiP;
    //7 equations
    //
    //electroneutrality
    C_NaP + C_KP + 2 * C_CaP + 2 * C_MgP - C_ClP - HCO3P - 2 * CO3P + ZPi * C_PiP + ZAlb * C_AlbP + ZimP * imP = 0;
    C_NaI + C_KI + 2 * C_CaI + 2 * C_MgI - C_ClI - HCO3I - 2 * CO3I + ZPi * C_PiI + ZAlb * C_AlbI + ZimI * imI = 0;
    C_NaE + C_KE - C_ClE - HCO3E - 2 * CO3E + ZHb * C_Hb + ZDPG * C_DPG + ZATP * C_ATP + ZGSH * C_GSH + ZimE * imE = 0;
    //3 equations
    //
    //osmotic equllibrium
    0.93 * (C_NaP - C_NaI) + 0.93 * (C_KP - C_KI) + 0.93 * (C_ClP - C_ClI) + C_CaP - C_CaI + C_MgP - C_MgI + 0.93 * (HCO3P - HCO3I) + 0.93 * (CO3P - CO3I) + 0.93 * (C_PiP - C_PiI) + C_AlbP - C_AlbI + C_imP - C_imI = 0;
    0.93 * (C_NaP - C_NaE) + 0.93 * (C_KP - C_KE) + 0.93 * (C_ClP - C_ClE) + 0.93 * (C_PiP - C_PiE) + C_imP - C_imE + C_CaP + C_MgP + C_AlbP - fiHb * C_Hb - C_DPG - C_ATP - C_GSH = 0;
    //2 equations
    //
    //pH dependant charges
    ZHb = 15.6 - 23 * (10 ^ (pHE - 6.69) / (1 + 10 ^ (pHE - 6.69))) - 4 * (10 ^ (pHE - 7.89) / (1 + 10 ^ (pHE - 7.89))) + 1.5 * ((1 - 0.75) / 0.75);
    ZDPG = (-3) - 1 * (10 ^ (pHE - 7.56) / (1 + 10 ^ (pHE - 7.56))) - 1 * (10 ^ (pHE - 7.32) / (1 + 10 ^ (pHE - 7.32)));
    ZATP = (-3) - 1 * (10 ^ (pHE - 6.8) / (1 + 10 ^ (pHE - 6.8)));
    ZGSH = (-1) - 1 * (10 ^ (pHE - 8.54) / (1 + 10 ^ (pHE - 8.54))) - 1 * (10 ^ (pHE - 9.42) / (1 + 10 ^ (pHE - 9.42)));
    ZPi = (-1) - 10 ^ (pHP - 6.87) / (1 + 10 ^ (pHP - 6.87));
    ZAlb = (-10.7) - 16 * (10 ^ (pHP - 7.42) / (1 + 10 ^ (pHP - 7.42)));
    fiHb = 1 + 0.115 * C_Hb + 0.0256 * C_Hb ^ 2;
    //carbonates and pH
    HCO3E = 0.026 * pCO2 * 10 ^ (pHE - 6.11);
    CO3E = HCO3E * 10 ^ (pHE - 10.2);
    HCO3P = 0.0306 * pCO2 * 10 ^ (pHP - 6.11);
    CO3P = HCO3P * 10 ^ (pHP - 10.2);
    HCO3I = 0.0326 * pCO2 * 10 ^ (pHI - 6.11);
    CO3I = HCO3I * 10 ^ (pHI - 10.2);
    //concentrations
    C_NaE = m0NaE / Vew;
    C_KE = m0KE / Vew;
    C_ClE = mClE / Vew;
    C_Hb = m0Hb / Vew;
    C_DPG = m0DPG / Vew;
    C_ATP = m0ATP / Vew;
    C_GSH = m0GSH / Vew;
    C_imE = m0imE / Vew;
    C_PiE = m0PiE / Vew;
    //
    C_NaP = mNaP / Vpw;
    C_NaI = mNaI / Viw;
    C_KP = mKP / Vpw;
    C_KI = mKI / Viw;
    C_CaP = mCaP / Vpw;
    C_CaI = mCaI / Viw;
    C_MgP = mMgP / Vpw;
    C_MgI = mMgI / Viw;
    C_ClP = mClP / Vpw;
    C_ClI = mClI / Viw;
    C_PiP = mPiP / Vpw;
    C_PiI = mPiI / Viw;
    C_AlbP = m0AlbP / Vpw;
    C_AlbI = m0AlbI / Viw;
    C_imP = m0imP / Vpw;
    C_imI = m0imI / Viw;
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end IPE;

  model CIPE1
    //default concentration [mmol/l]
    //erythrocytes
    parameter Real NaE = 13.7;
    parameter Real KE = 136;
    parameter Real ClE = 73.2;
    parameter Real Hb = 5.3;
    parameter Real DPG = 4.4;
    parameter Real ATP = 1.8;
    parameter Real GSH = 2.2;
    parameter Real imE = 16.8;
    parameter Real PiE = 0.92;
    parameter Real LacE=1.06;
    //Plasma and Intersticium
    parameter Real NaP = 150;
    parameter Real NaI = 141.2;
    parameter Real KP = 4.78;
    parameter Real KI = 4.55;
    parameter Real CaMgP = 3.3;
    parameter Real CaMgI = 3;
    parameter Real ClP = 111;
    parameter Real ClI = 116.5;
    parameter Real PiP = 1.23;
    parameter Real PiI = 1.36;
    parameter Real AlbP = 43/6.65;
    parameter Real Tpro=70.4/9;
    parameter Real AlbI = 43/6.65;
    parameter Real LacP=1.51;
    parameter Real LacI=1.69;
    //cells
    parameter Real NaC=12;
    parameter Real KC=141.2;
    parameter Real ClC=3.75;
    parameter Real imC=129;
    parameter Real kNa=368;
    parameter Real kH=10;

    //parameter Real imP = 0;
    //parameter Real imI = 0;
    //charge [-]
    parameter Real ZimE = -3.25;
    parameter Real ZimI = 8.92;
    parameter Real ZimP = -6.04;
    //
    //initial volumes [l]
    parameter Real Vblood = 5.1;
    parameter Real Vint = 9.68;
    parameter Real Vcell=26.8;
    //
    //partial pressure of CO2 [mmHg]
    parameter Real pCO2 = 46;
    parameter Real fSat=0.75;
    //
    //Water volumes of erythrcytes, plasma and intersticium
    parameter Real hemat0=0.4391;
    parameter Real fWe0=0.73;
    parameter Real fWp0=0.94;
    parameter Real fWi0=1;
    parameter Real fWc0=1;
    parameter Real Vew0 = hemat0 * fWe0 * Vblood;
    parameter Real Vpw0 = (1 - hemat0) * fWp0 * Vblood;
    parameter Real Viw0= fWi0* Vint;
    parameter Real Vcw0=Vcell*fWc0;
    //
    //masses of conserved species [mmol]
    //erythrocytes
    parameter Real m0NaE = NaE * Vew0;
    parameter Real m0KE = KE * Vew0;
    parameter Real m0ClE = ClE * Vew0;
    parameter Real m0Hb = Hb * Vew0;
    parameter Real m0DPG = DPG * Vew0;
    parameter Real m0ATP = ATP * Vew0;
    parameter Real m0GSH = GSH * Vew0;
    parameter Real m0imE = imE * Vew0;
    parameter Real m0PiE = PiE * Vew0;
    parameter Real m0LacE=LacE*Vew0;
    //plasma and intersticium
    parameter Real m0NaP = NaP * Vpw0;
    parameter Real m0NaI = NaI * Viw0;
    parameter Real m0KP = KP * Vpw0;
    parameter Real m0KI = KI * Viw0;
    parameter Real m0CaMgP = CaMgP * Vpw0;
    parameter Real m0CaMgI = CaMgI * Viw0;
    parameter Real m0ClP = ClP * Vpw0;
    parameter Real m0ClI = ClI * Viw0;
    parameter Real m0PiP = PiP * Vpw0;
    parameter Real m0PiI = PiI * Viw0;
    parameter Real m0AlbP = AlbP * Vpw0;
    parameter Real m0AlbI = AlbI * Viw0;
    //parameter Real m0imP = imP * Vpw0;
    //parameter Real m0imI = imI * Viw0;
    parameter Real m0LacP=LacP*Vpw0;
    parameter Real m0LacI=LacI*Viw0;
    //
    parameter Real m0NaC=NaC*Vcw0;
    parameter Real m0KC=KC*Vcw0;
    parameter Real m0ClC=ClC*Vcw0;
    parameter Real m0imC=imC*Vcw0;
    //total masses of mobile ions [mmol]
    parameter Real MCl = m0ClE + m0ClP + m0ClI+m0ClC;
    parameter Real MNa = m0NaP + m0NaI+m0NaC;
    parameter Real MK = m0KP + m0KI+m0KC;
    parameter Real MCaMg = m0CaMgP + m0CaMgI;
    parameter Real MPi= m0PiE+ m0PiP + m0PiI;
    parameter Real MLac=m0LacE+m0LacP+m0LacI;
    //after equilibrium
    //masses of mobile ions
    Real mClE(start=m0ClE);
    Real mClP(start = m0ClP);
    Real mClI(start=m0ClI);
    Real mNaP(start=m0NaP);
    Real mNaI(start=m0NaI);
    Real mKP(start = m0KP);
    Real mKI(start = m0KI);
    Real mCaMgP(start = m0CaMgP);
    Real mCaMgI(start = m0CaMgI);
    Real mPiE(start=m0PiE);
    Real mPiP(start = m0PiP);
    Real mPiI(start = m0PiI);
    Real mLacE(start=m0LacE);
    Real mLacP(start=m0LacP);
    Real mLacI(start=m0LacI);
    Real mNaC(start=m0NaC);
    Real mKC(start=m0KC);
    Real mClC(start=m0ClC);
    //18 variables
    //
    //volumes of compartments
    Real Vew(start = Vew0);
    Real Vpw(start = Vpw0);
    Real Viw(start = Viw0);
    Real Vcw(start = Vcw0);
    //4 variables
    //
    //concentration of bicarbonates [mmol/l]
    Real HCO3E(start=20);
    Real HCO3P(start=27.7);
    Real HCO3I(start=29.2);
    Real HCO3C(start=8.35);
    //4 variables
    //
    //pH
    Real pHE(start = 7.19);
    Real pHP(start = 7.37);
    Real pHI(start = 7.39);
    Real pHC(start = 6.9);
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
    Real CO3E;
    Real CO3P;
    Real CO3I;
    Real CO3C;
    //concentrations of all species [mmol/l]
    Real C_NaE(start = NaE);
    Real C_KE(start = KE);
    Real C_ClE(start = ClE);
    Real C_Hb(start = Hb);
    Real C_DPG(start = DPG);
    Real C_ATP(start = ATP);
    Real C_GSH(start = GSH);
    Real C_imE(start = imE);
    Real C_PiE(start = PiE);
    Real C_LacE(start=LacE);
    //
    Real C_NaP(start = NaP);
    Real C_NaI(start = NaI);
    Real C_KP(start = KP);
    Real C_KI(start = KI);
    Real C_CaMgP(start = CaMgP);
    Real C_CaMgI(start = CaMgI);
    Real C_ClP(start = ClP);
    Real C_ClI(start = ClI);
    Real C_PiP(start = PiP);
    Real C_PiI(start = PiI);
    Real C_AlbP(start = AlbP);
    Real C_Tpro(start=Tpro);
    Real C_AlbI(start = AlbI);
    //Real C_imP(start = imP);
    //Real C_imI(start = imI);
    Real C_LacP(start=LacP);
    Real C_LacI(start=LacI);
    Real C_HI(start=10^(-7.39));
    //
    Real C_NaC(start=NaC);
    Real C_KC(start=KC);
    Real C_ClC(start=ClC);
    Real C_imC(start=imC);
    Real C_HC(start=10^(-6.9));
    Real Op;
    Real Oi;
    Real PrB;
    Real PrI;
    parameter Real kB=17.5;
    //Real PrB0;
    //Real PrI0;
    parameter Real kImh=93;
    Real kItr;
    parameter Real kIoh=8.3;
    parameter Real PrItr=9;
    parameter Real Slm=0.99;
    parameter Real Ssm=0.5;
    parameter Real PIP=25.4;
    parameter Real PII=12.7;
  equation
    //mass conservation
    MCl = mClE + mClP + mClI+mClC;
    MNa = mNaP + mNaI+mNaC;
    MK = mKP + mKI+mKC;
    MCaMg = mCaMgP + mCaMgI;
    MPi = mPiE+mPiP + mPiI;
    MLac = mLacE+mLacP+mLacI;
    //6 equations
    //
    //water conservation
    Vew0 + Vpw0 + Viw0+Vcw0 = Vew + Vpw + Viw+Vcw;
    //1 equation
    //
    //Donnan equilibrium
    C_ClE / C_ClP = 0.92 * (HCO3E / HCO3P);
    C_ClE/C_ClP=C_LacE/C_LacP;
    (C_ClE/C_ClP)^abs(ZPiP)=C_PiE/C_PiP;
    C_ClI / C_ClP = 0.92 * (HCO3I / HCO3P);
    C_ClI / C_ClP = C_NaP / C_NaI;
    C_ClI / C_ClP = C_KP / C_KI;
    (C_ClI / C_ClP) ^ 2 = C_CaMgP / C_CaMgI;
    (C_ClI / C_ClP) ^ abs(ZPiP) = C_PiI / C_PiP;
    C_LacI/C_LacP=C_ClI/C_ClP;
    C_ClC/C_ClI=C_KI/C_KC;
    (C_ClI/C_ClC)=kNa*(C_NaC/C_NaI);
    C_ClI/C_ClC=kH*(C_HC/C_HI);
    //12 equations
    //
    //electroneutrality
    C_NaP + C_KP + 2 * C_CaMgP - C_ClP - HCO3P - 2 * CO3P + ZPiP * C_PiP + ZAlbP * C_AlbP + ZimP*(Vpw0/Vpw) -C_LacP = 0;
    C_NaI + C_KI + 2 * C_CaMgI - C_ClI - HCO3I - 2 * CO3I + ZPiI * C_PiI + ZAlbI * C_AlbI + ZimI*(Viw0/Viw) -C_LacI= 0;
    C_NaE + C_KE - C_ClE - HCO3E - 2 * CO3E + ZHb * C_Hb + ZDPG * C_DPG + ZATP * C_ATP + ZGSH * C_GSH + ZimE*(Vew0/Vew)+ZPiE*C_PiE-C_LacE =0;
    C_NaC+C_KC-C_ClC-HCO3C-2*CO3C-ZimC*(Vcw0/Vcw)=0;
    //4 equations
    //
    //osmotic equilibrium
    //0.93 * (C_NaP - C_NaI) + 0.93 * (C_KP - C_KI) + 0.93 * (C_ClP - C_ClI) + 0.93*(C_CaMgP - C_CaMgI) + 0.93 * (HCO3P - HCO3I) + 0.93 * (CO3P - CO3I) + 0.93 * (C_PiP - C_PiI) + C_AlbP - C_AlbI + C_LacP-C_LacI = 0;
    0.93 * (C_NaP - C_NaE) + 0.93 * (C_KP - C_KE) + 0.93 * (C_ClP - C_ClE) + 0.93 * (C_PiP - C_PiE) + 0.93*(C_CaMgP) + C_Tpro - fiHb * C_Hb - C_DPG - C_ATP - C_GSH +0.93*(C_LacP-C_LacE)-C_imE-288.9*(Vew0/Vew)=0;
    0.93*(C_NaI-C_NaC)+0.93*(C_KI-C_KC)+0.93*(C_ClI-C_ClC)+0.93*(HCO3I-HCO3C)+0.93*(CO3I-CO3C)-C_imC+C_AlbI+C_PiI+C_CaMgI+C_LacI-288.4*(Vcw0/Vcw)=0;
    //2 equations
    //
    //pressure equilibrium
    PrB-PrI+17.3-Ssm*(PIP-PII)-19.3*Slm*(Op-Oi)=0;
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
    ZimC = (-1.52)*(10 ^ (pHC - 6.5) / (1 + 10 ^ (pHC - 6.5)));
    //carbonates and pH
    HCO3E = 0.026 * pCO2 * 10 ^ (pHE - 6.11);
    CO3E = HCO3E * 10 ^ (pHE - 10.2);
    HCO3P = 0.0306 * pCO2 * 10 ^ (pHP - 6.11);
    CO3P = HCO3P * 10 ^ (pHP - 10.2);
    HCO3I = 0.0326 * pCO2 * 10 ^ (pHI - 6.11);
    CO3I = HCO3I * 10 ^ (pHI - 10.2);
    HCO3C = 0.029 * pCO2 * 10 ^ (pHC - 6.11);
    CO3C = HCO3C * 10 ^ (pHC - 10.2);
    C_HI=10^(-pHI);
    C_HC=10^(-pHC);
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
    C_LacE=mLacE/Vew;
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
    C_Tpro=Tpro*Vpw0/Vpw;
    C_AlbI = m0AlbI / Viw;
    //C_imP = m0imP / Vpw;
    //C_imI = m0imI / Viw;
    C_LacP=mLacP/Vpw;
    C_LacI=mLacI/Viw;
    //
    C_NaC=mNaC/Vcw;
    C_KC=mKC/Vcw;
    C_ClC=mClC/Vcw;
    C_imC=m0imC/Vcw;
    //
    Op=0.93 * (C_NaP) + 0.93 * (C_KP) + 0.93 * (C_ClP) + 0.93*(C_CaMgP) + 0.93 * (HCO3P) + 0.93 * (CO3P) + 0.93 * (C_PiP) + C_Tpro + C_LacP;
    Oi=0.93 * (C_NaI) + 0.93 * (C_KI) + 0.93 * (C_ClI) + 0.93*(C_CaMgI) + 0.93 * (HCO3I) + 0.93 * (CO3I) + 0.93 * (C_PiI) + C_AlbI + C_LacI;
    PrB=kB*((Vew/0.73+Vpw/0.94)-Vblood)/Vblood;
    kItr=(Viw-Viw0)/Viw0;
    if kItr>0.097 then
      PrI=PrItr+kIoh*(kItr);
    else
      PrI=kImh*kItr;
    end if;
    //PrB0-PrI0=17.3;
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end CIPE1;
  annotation (uses(Modelica(version="3.2.1")));
end CIPE_rovnice;
