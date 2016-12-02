within ;
package IPE_rovnice
  model IPE0
    parameter Real NaE = 10;
    parameter Real KE = 99;
    parameter Real ClE = 53.8;
    parameter Real Hb = 5.3;
    parameter Real DPG = 4.4;
    parameter Real ATP = 1.8;
    parameter Real GSH = 2.2;
    parameter Real imE = 95.9;
    parameter Real PiE = 0.67;
    //
    parameter Real NaP = 140;
    parameter Real NaI = 142;
    parameter Real KP = 4.1;
    parameter Real KI = 4.14;
    parameter Real CaP = 2.3;
    parameter Real CaI = 2.2;
    parameter Real MgP = 0.8;
    parameter Real MgI = 0.75;
    parameter Real ClP = 105;
    parameter Real ClI = 118;
    parameter Real PiP = 1.16;
    parameter Real PiI = 1.2;
    parameter Real AlbP = 0.65;
    parameter Real AlbI = 0.19;
    parameter Real imP = 21.6;
    parameter Real imI = 2.9;
    //
    parameter Real ZimE = 0.57;
    parameter Real ZimI = 1;
    parameter Real ZimP = -0.06;
    //
    parameter Real Vblood = 1;
    parameter Real Vint = 2;
    parameter Real PaCO2 = 40;
    //
    //
    parameter Real Vew0 = 0.44 * 0.73 * Vblood;
    parameter Real Vpw0 = (1 - 0.44) * 0.94 * Vblood;
    parameter Real Viw0 = Vint;
    //
    parameter Real m0NaE = NaE * Vew0;
    parameter Real m0KE = KE * Vew0;
    parameter Real m0ClE = ClE * Vew0;
    parameter Real m0Hb = Hb * Vew0;
    parameter Real m0DPG = DPG * Vew0;
    parameter Real m0ATP = ATP * Vew0;
    parameter Real m0GSH = GSH * Vew0;
    parameter Real m0imE = imE * Vew0;
    parameter Real m0PiE = PiE * Vew0;
    //
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
    //celkovy mnozstvi
    parameter Real MCl = m0ClE + m0ClP + m0ClI;
    parameter Real MNa = m0NaP + m0NaI;
    parameter Real MK = m0KP + m0KI;
    parameter Real MCa = m0CaP + m0CaI;
    parameter Real MMg = m0MgP + m0MgI;
    parameter Real MPi = m0PiP + m0PiI;
    //mobilni ionty
    Real mClE;
    Real mClP(start = m0ClP);
    Real mClI;
    Real mNaP;
    Real mNaI;
    Real mKP(start = m0KP);
    Real mKI;
    Real mCaP;
    Real mCaI(start = m0CaI);
    Real mMgP;
    Real mMgI;
    Real mPiP(start = m0PiP);
    Real mPiI;
    //13
    Real Vew;
    Real Vpw(start = Vpw0);
    Real Viw(start = Viw0);
    //3
    Real HE(start = 5.67e-8);
    Real HP;
    Real HI(start = 2.58e-8);
    //3
    //ostatni
    //pH
    Real pHE;
    Real pHP(start = 7.4);
    Real pHI;
    //Z
    Real ZPi;
    Real ZAlb;
    Real ZHb;
    Real ZDPG;
    Real ZATP;
    Real ZGSH;
    Real fiHb;
    //karbonaty
    Real HCO3E;
    Real HCO3P;
    Real HCO3I;
    Real CO3E;
    Real CO3P;
    Real CO3I;
  equation
    //zachovani hmoty
    MCl = mClE + mClP + mClI;
    MNa = mNaP + mNaI;
    MK = mKP + mKI;
    MCa = mCaP + mCaI;
    MMg = mMgP + mMgI;
    MPi = mPiP + mPiI;
    //6
    Vew0 + Vpw0 + Viw0 = Vew + Vpw + Viw;
    //1
    //donan
    mClE * Vew / mClP * Vpw * 0.73 = HP / HE;
    mClI * Viw / mClP * Vpw * 0.73 = HP / HI;
    mClI * Viw / mClP * Vpw = mNaP * Vpw / mNaI * Viw;
    mClI * Viw / mClP * Vpw = mKP * Vpw / mKI * Viw;
    (mClI * Viw / mClP * Vpw) ^ 2 = mCaP * Vpw / mCaI * Viw;
    (mClI * Viw / mClP * Vpw) ^ 2 = mMgP * Vpw / mMgI * Viw;
    (mClI * Viw / mClP * Vpw) ^ abs(ZPi) = mPiI * Viw / mPiP * Vpw;
    //7
    //elektroneutralita
    mNaP + mKP + 2 * mCaP + 2 * mMgP - mClP - HCO3P - 2 * CO3P + ZPi * mPiP + ZAlb * m0AlbP + ZimP * m0imP = 0;
    mNaI + mKI + 2 * mCaI + 2 * mMgI - mClI - HCO3I - 2 * CO3I + ZPi * mPiI + ZAlb * m0AlbI + ZimI * m0imI = 0;
    m0NaE + m0KE - mClE - HCO3E - 2 * CO3E + ZHb * m0Hb + ZDPG * m0DPG + ZATP * m0ATP + ZGSH * m0GSH + ZimE * m0imE = 0;
    //3
    //osmoticka rovnovaha
    0.93 * (mNaP * Vpw - mNaI * Viw) + 0.93 * (mKP * Vpw - mKI * Viw) + 0.93 * (mClP * Vpw - mClI * Viw) + mCaP * Vpw - mCaI * Viw + mMgP * Vpw - mMgI * Viw + 0.93 * (HCO3P - HCO3I) + 0.93 * (CO3P - CO3I) + 0.93 * (mPiP * Vpw - mPiI * Viw) + m0AlbP * Vpw - m0AlbI * Viw + m0imP * Vpw - m0imI * Viw = 0;
    0.93 * (mNaP * Vpw - m0NaE * Vew) + 0.93 * (mKP * Vpw - m0KE * Vew) + 0.93 * (mClP * Vpw - mClE * Vew) + 0.93 * (mPiP * Vpw - m0PiE * Vew) + m0imP * Vpw - m0imE * Vew + mCaP * Vpw + mMgP * Vpw + m0AlbP * Vpw - fiHb * m0Hb * Vew - m0DPG * Vew - m0ATP * Vew - m0GSH * Vew = 0;
    //2
    //ostatni
    //pH
    pHE = -log10(HE);
    pHP = -log10(HP);
    pHI = -log10(HI);
    //Z
    ZHb = 15.6 - 23 * ((10 ^ pHE - 6.69) / (1 + 10 ^ pHE - 6.69)) - 4 * ((10 ^ pHE - 7.89) / (1 + 10 ^ pHE - 7.89));
    ZDPG = (-3) - 1 * ((10 ^ pHE - 7.56) / (1 + 10 ^ pHE - 7.56)) - 1 * ((10 ^ pHE - 7.32) / (1 + 10 ^ pHE - 7.32));
    ZATP = (-3) - 1 * ((10 ^ pHE - 6.8) / (1 + 10 ^ pHE - 6.8));
    ZGSH = (-1) - 1 * ((10 ^ pHE - 8.54) / (1 + 10 ^ pHE - 8.54)) - 1 * ((10 ^ pHE - 9.42) / (1 + 10 ^ pHE - 9.42));
    ZPi = (-1) - (10 ^ pHP - 6.87) / (1 + 10 ^ pHP - 6.87);
    ZAlb = (-10.7) - 16 * ((10 ^ pHP - 7.42) / (1 + 10 ^ pHP - 7.42));
    fiHb = 1 + 0.115 * m0Hb / Vew + 0.0256 * (m0Hb / Vew) ^ 2;
    //karbonaty
    HCO3E = 0.026 * PaCO2 * 10 ^ (pHE - 6.11);
    CO3E = HCO3E * 10 ^ (pHE - 10.2);
    HCO3P = 0.0306 * PaCO2 * 10 ^ (pHP - 6.11);
    CO3P = HCO3P * 10 ^ (pHP - 10.2);
    HCO3I = 0.0326 * PaCO2 * 10 ^ (pHI - 6.11);
    CO3I = HCO3I * 10 ^ (pHI - 10.2);
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end IPE0;

  model IPE1_C
    parameter Real NaE = 10;
    parameter Real KE = 99;
    parameter Real ClE = 53.8;
    parameter Real Hb = 5.3;
    parameter Real DPG = 4.4;
    parameter Real ATP = 1.8;
    parameter Real GSH = 2.2;
    parameter Real imE = 95.9;
    parameter Real PiE = 0.67;
    //
    parameter Real NaP = 140;
    parameter Real NaI = 142;
    parameter Real KP = 4.1;
    parameter Real KI = 4.14;
    parameter Real CaP = 2.3;
    parameter Real CaI = 2.2;
    parameter Real MgP = 0.8;
    parameter Real MgI = 0.75;
    parameter Real ClP = 105;
    parameter Real ClI = 118;
    parameter Real PiP = 1.16;
    parameter Real PiI = 1.2;
    parameter Real AlbP = 0.65;
    parameter Real AlbI = 0.19;
    parameter Real imP = 21.6;
    parameter Real imI = 2.9;
    //
    parameter Real ZimE = 0.57;
    parameter Real ZimI = 1;
    parameter Real ZimP = -0.06;
    //
    parameter Real Vblood = 1;
    parameter Real Vint = 2;
    parameter Real PaCO2 = 40;
    //
    //
    parameter Real Vew0 = 0.44 * 0.73 * Vblood;
    parameter Real Vpw0 = (1 - 0.44) * 0.94 * Vblood;
    parameter Real Viw0 = Vint;
    //
    parameter Real m0NaE = NaE * Vew0;
    parameter Real m0KE = KE * Vew0;
    parameter Real m0ClE = ClE * Vew0;
    parameter Real m0Hb = Hb * Vew0;
    parameter Real m0DPG = DPG * Vew0;
    parameter Real m0ATP = ATP * Vew0;
    parameter Real m0GSH = GSH * Vew0;
    parameter Real m0imE = imE * Vew0;
    parameter Real m0PiE = PiE * Vew0;
    //
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
    //celkovy mnozstvi
    parameter Real MCl = m0ClE + m0ClP + m0ClI;
    parameter Real MNa = m0NaP + m0NaI;
    parameter Real MK = m0KP + m0KI;
    parameter Real MCa = m0CaP + m0CaI;
    parameter Real MMg = m0MgP + m0MgI;
    parameter Real MPi = m0PiP + m0PiI;
    //mobilni ionty
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
    //13
    Real Vew(start = Vew0);
    Real Vpw(start = Vpw0);
    Real Viw(start = Viw0);
    //3
    Real HE(start = 5.67e-8);
    Real HP;
    Real HI(start = 2.58e-8);
    //3
    //ostatni
    //pH
    Real pHE(start = 7.2);
    Real pHP(start = 7.4);
    Real pHI(start = 7.39);
    //Z
    Real ZPi;
    Real ZAlb;
    Real ZHb;
    Real ZDPG;
    Real ZATP;
    Real ZGSH;
    Real fiHb;
    //karbonaty
    Real HCO3E;
    Real HCO3P;
    Real HCO3I;
    Real CO3E;
    Real CO3P;
    Real CO3I;
    //C
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
    //zachovani hmoty
    MCl = mClE + mClP + mClI;
    MNa = mNaP + mNaI;
    MK = mKP + mKI;
    MCa = mCaP + mCaI;
    MMg = mMgP + mMgI;
    MPi = mPiP + mPiI;
    //6
    Vew0 + Vpw0 + Viw0 = Vew + Vpw + Viw;
    //1
    //donan
    C_ClE / C_ClP * 0.73 = HP / HE;
    C_ClI / C_ClP * 0.73 = HP / HI;
    C_ClI / C_ClP = C_NaP / C_NaI;
    C_ClI / C_ClP = C_KP / C_KI;
    (C_ClI / C_ClP) ^ 2 = C_CaP / C_CaI;
    (C_ClI / C_ClP) ^ 2 = C_MgP / C_MgI;
    (C_ClI / C_ClP) ^ abs(ZPi) = C_PiI / C_PiP;
    //7
    //elektroneutralita
    mNaP + mKP + 2 * mCaP + 2 * mMgP - mClP - HCO3P - 2 * CO3P + ZPi * mPiP + ZAlb * m0AlbP + ZimP * m0imP = 0;
    mNaI + mKI + 2 * mCaI + 2 * mMgI - mClI - HCO3I - 2 * CO3I + ZPi * mPiI + ZAlb * m0AlbI + ZimI * m0imI = 0;
    m0NaE + m0KE - mClE - HCO3E - 2 * CO3E + ZHb * m0Hb + ZDPG * m0DPG + ZATP * m0ATP + ZGSH * m0GSH + ZimE * m0imE = 0;
    //3
    //osmoticka rovnovaha
    0.93 * (C_NaP - C_NaI) + 0.93 * (C_KP - C_KI) + 0.93 * (C_ClP - C_ClI) + C_CaP - C_CaI + C_MgP - C_MgI + 0.93 * (HCO3P - HCO3I) + 0.93 * (CO3P - CO3I) + 0.93 * (C_PiP - C_PiI) + C_AlbP - C_AlbI + C_imP - C_imI = 0;
    0.93 * (C_NaP - C_NaE) + 0.93 * (C_KP - C_KE) + 0.93 * (C_ClP - C_ClE) + 0.93 * (C_PiP - C_PiE) + C_imP - C_imE + C_CaP + C_MgP + C_AlbP - fiHb * C_Hb - C_DPG - C_ATP - C_GSH = 0;
    //2
    //ostatni
    //pH
    pHE = -log10(HE);
    pHP = -log10(HP);
    pHI = -log10(HI);
    //Z
    ZHb = 15.6 - 23 * ((10 ^ pHE - 6.69) / (1 + 10 ^ pHE - 6.69)) - 4 * ((10 ^ pHE - 7.89) / (1 + 10 ^ pHE - 7.89));
    ZDPG = (-3) - 1 * ((10 ^ pHE - 7.56) / (1 + 10 ^ pHE - 7.56)) - 1 * ((10 ^ pHE - 7.32) / (1 + 10 ^ pHE - 7.32));
    ZATP = (-3) - 1 * ((10 ^ pHE - 6.8) / (1 + 10 ^ pHE - 6.8));
    ZGSH = (-1) - 1 * ((10 ^ pHE - 8.54) / (1 + 10 ^ pHE - 8.54)) - 1 * ((10 ^ pHE - 9.42) / (1 + 10 ^ pHE - 9.42));
    ZPi = (-1) - (10 ^ pHP - 6.87) / (1 + 10 ^ pHP - 6.87);
    ZAlb = (-10.7) - 16 * ((10 ^ pHP - 7.42) / (1 + 10 ^ pHP - 7.42));
    fiHb = 1 + 0.115 * C_Hb + 0.0256 * C_Hb ^ 2;
    //karbonaty
    HCO3E = 0.026 * PaCO2 * 10 ^ (pHE - 6.11);
    CO3E = HCO3E * 10 ^ (pHE - 10.2);
    HCO3P = 0.0306 * PaCO2 * 10 ^ (pHP - 6.11);
    CO3P = HCO3P * 10 ^ (pHP - 10.2);
    HCO3I = 0.0326 * PaCO2 * 10 ^ (pHI - 6.11);
    CO3I = HCO3I * 10 ^ (pHI - 10.2);
    //C
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
  end IPE1_C;

  model old
    parameter Real pK1_Hb = 6.69;
    parameter Real pK2_Hb = 7.89;
    parameter Real pK1_DPG = 7.56;
    parameter Real pK2_DPG = 7.32;
    parameter Real pK1_ATP = 6.8;
    parameter Real pK1_GSH = 8.54;
    parameter Real pK2_GSH = 9.42;
    parameter Real pK1_Alb = 7.42;
    parameter Real pK1_Pi = 6.87;
    parameter Real pK1_carb = 6.11;
    parameter Real pK2_carb = 10.2;
    parameter Real paCO2e = 40;
    parameter Real paCO2p = 40;
    parameter Real paCO2i = 46;
    parameter Real seCO2 = 0.026;
    parameter Real spCO2 = 0.0306;
    parameter Real siCO2 = 0.0326;
    //
    Real Zp_Alb;
    Real Zp_Pi;
    Real Zi_Alb;
    Real Zi_Pi;
    Real Ze_Hb;
    Real Ze_DPG;
    Real Ze_ATP;
    Real Ze_GSH;
    Real fi_Hb;
    //
    //
    parameter Real Cp_Na = 140;
    parameter Real Cp_K = 4.1;
    parameter Real Cp_Ca = 2.3;
    parameter Real Cp_Mg = 0.8;
    parameter Real Cp_Cl = 105;
    parameter Real Cp_Pi = 1.16;
    parameter Real Cp_Alb = 0.65;
    //
    parameter Real Ci_Na = 142;
    parameter Real Ci_K = 4.14;
    parameter Real Ci_Ca = 2.2;
    parameter Real Ci_Mg = 0.75;
    parameter Real Ci_Cl = 118;
    parameter Real Ci_Pi = 1.2;
    parameter Real Ci_Alb = 0.19;
    //
    parameter Real Ce_Cl = 53.8;
    parameter Real Ce_Hb = 5.3;
    parameter Real Ce_DPG = 4.4;
    parameter Real Ce_ATP = 1.8;
    parameter Real Ce_GSH = 2.2;
    parameter Real Ce_Na = 10;
    parameter Real Ce_K = 99;
    parameter Real Ce_Pi = 0.67;
    //
    Real pHp(start = 7.4);
    parameter Real pHi(start = 7.39);
    parameter Real pHe(start = 7.22);
    //
    Real M_Na;
    Real M_K;
    Real M_Ca;
    Real M_Mg;
    Real M_Cl;
    Real M_Pi;
    parameter Real VWp = 0.56 * 0.94 * 5;
    parameter Real VWi = 10;
    parameter Real VWe = 0.44 * 0.73 * 5;
    Real VW;
    //
    Real Cp2_Na(start = 140);
    Real Cp2_K(start = 4.1);
    Real Cp2_Ca(start = 2.3);
    Real Cp2_Mg(start = 0.8);
    Real Cp2_Cl(start = 115);
    Real Cp2_HCO3(start = 24.2);
    Real Cp2_CO3;
    Real Cp2_Pi(start = 1.16);
    //Real Cp_H;
    //
    Real Ci2_Na(start = 142);
    Real Ci2_K(start = 4.14);
    Real Ci2_Ca(start = 2.2);
    Real Ci2_Mg(start = 0.75);
    Real Ci2_Cl(start = 118);
    Real Ci2_Pi(start = 1.2);
    //Real Ci_H;
    //
    Real Ce2_Cl(start = 53.8);
    //Real Ce_H;
    //
    Real VWp2(start = VWp);
    Real VWi2(start = VWi);
    Real VWe2(start = VWe);
    Real Cp2_Alb;
    Real Ci2_Alb;
    Real Ci2_HCO3;
    Real Ci2_CO3;
    Real Ce2_Na;
    Real Ce2_K;
    Real Ce2_HCO3;
    Real Ce2_CO3;
    Real Ce2_Pi;
    Real Ce2_Hb;
    Real Ce2_DPG;
    Real Ce2_ATP;
    Real Ce2_GSH;
  equation
    Ze_Hb = 15.6 - 23 * ((10 ^ pHe - pK1_Hb) / (1 + 10 ^ pHe - pK1_Hb)) - 4 * ((10 ^ pHe - pK2_Hb) / (1 + 10 ^ pHe - pK2_Hb));
    Ze_DPG = (-3) - 1 * ((10 ^ pHe - pK1_DPG) / (1 + 10 ^ pHe - pK1_DPG)) - 1 * ((10 ^ pHe - pK2_DPG) / (1 + 10 ^ pHe - pK2_DPG));
    Ze_ATP = (-3) - 1 * ((10 ^ pHe - pK1_ATP) / (1 + 10 ^ pHe - pK1_ATP));
    Ze_GSH = (-1) - 1 * ((10 ^ pHe - pK1_GSH) / (1 + 10 ^ pHe - pK1_GSH)) - 1 * ((10 ^ pHe - pK2_GSH) / (1 + 10 ^ pHe - pK2_GSH));
    Zp_Pi = (-1) - (10 ^ pHp - pK1_Pi) / (1 + 10 ^ pHp - pK1_Pi);
    Zp_Alb = (-10.7) - 16 * ((10 ^ pHp - pK1_Alb) / (1 + 10 ^ pHp - pK1_Alb));
    Zi_Pi = (-1) - (10 ^ pHi - pK1_Pi) / (1 + 10 ^ pHi - pK1_Pi);
    Zi_Alb = (-10.7) - 16 * ((10 ^ pHi - pK1_Alb) / (1 + 10 ^ pHi - pK1_Alb));
    fi_Hb = 1 + 0.115 * Ce2_Hb + 0.0256 * Ce2_Hb ^ 2;
    //
    M_Na = VWe * Ce_Na + VWp * Cp_Na + VWi * Ci_Na;
    M_K = VWe * Ce_K + VWp * Cp_K + VWi * Ci_K;
    M_Ca = VWp * Cp_Ca + VWi * Ci_Ca;
    M_Mg = VWp * Cp_Mg + VWi * Ci_Mg;
    M_Cl = VWe * Ce_Cl + VWp * Cp_Cl + VWi * Ci_Cl;
    M_Pi = VWe * Ce_Pi + VWp * Cp_Pi + VWi * Ci_Pi;
    VW = VWp + VWi + VWe;
    //
    M_Na = VWe2 * Ce_Na + VWp2 * Cp2_Na + VWi2 * Ci2_Na;
    M_K = VWe2 * Ce_K + VWp2 * Cp2_K + VWi2 * Ci2_K;
    M_Ca = VWp2 * Cp2_Ca + VWi2 * Ci2_Ca;
    M_Mg = VWp2 * Cp2_Mg + VWi2 * Ci2_Mg;
    M_Cl = VWe2 * Ce2_Cl + VWp2 * Cp2_Cl + VWi2 * Ci2_Cl;
    M_Pi = VWe2 * Ce_Pi + VWp2 * Cp2_Pi + VWi2 * Ci2_Pi;
    VW = VWp2 + VWi2 + VWe2;
    //
    Ci2_Cl / Cp2_Cl = Cp2_Na / Ci2_Na;
    Ci2_Cl / Cp2_Cl = Cp2_K / Ci2_K;
    (Ci2_Cl / Cp2_Cl) ^ 2 = Cp2_Ca / Ci2_Ca;
    (Ci2_Cl / Cp2_Cl) ^ 2 = Cp2_Mg / Ci2_Mg;
    (Ci2_Cl / Cp2_Cl) ^ abs(Zp_Pi) = Ci2_Pi / Cp2_Pi;
    //(Ci2_Cl / Cp2_Cl)*0.73 = Cp_H / Ci_H;
    //(Ce2_Cl/Cp2_Cl)*0.73=Cp_H/Ce_H;
    //
    Cp2_Na + Cp2_K + 2 * Cp2_Ca + 2 * Cp2_Mg - Cp2_Cl - Cp2_HCO3 - 2 * Cp2_CO3 + Zp_Pi * Cp2_Pi + Zp_Alb * Cp_Alb + 21.6 * (-0.06) = 0;
    Ci2_Na + Ci2_K + 2 * Ci2_Ca + 2 * Ci2_Mg - Ci2_Cl - Ci2_HCO3 - 2 * Ci2_CO3 + Zi_Pi * Ci2_Pi + Zi_Alb * Ci_Alb + 2.9 * 1 = 0;
    Ce_Na + Ce_K - Ce2_Cl - Ce2_HCO3 - 2 * Ce2_CO3 + Ze_Hb * Ce_Hb + Ze_DPG * Ce_DPG + Ze_ATP * Ce_ATP + Ze_GSH * Ce_GSH + 95.9 * 0.57 = 0;
    0.93 * (Cp2_Na - Ce2_Na) + 0.93 * (Cp2_K - Ce2_K) + 0.93 * (Cp2_Cl - Ce2_Cl) + Cp2_Ca - 0 + Cp2_Mg - 0 + 0.93 * (Cp2_HCO3 - Ce2_HCO3) + 0.93 * (Cp2_CO3 - Ce2_CO3) + Cp2_Pi - Ce2_Pi + Cp2_Alb - 0 + fi_Hb * (0 - Ce2_Hb) + 0 - Ce2_DPG + 0 - Ce2_ATP + 0 - Ce2_GSH + 0.4 * 21.6 * VWp / VWp2 - 95.9 * VWe / VWe2 = 0;
    0.93 * (Cp2_Na - Ci2_Na) + 0.93 * (Cp2_K - Ci2_K) + Cp2_Mg - Ci2_Mg + Cp2_Ca - Ci2_Ca + 0.93 * (Cp2_Cl - Ci2_Cl) + 0.93 * (Cp2_HCO3 - Ci2_HCO3) + 0.93 * (Cp2_CO3 - Ci2_CO3) + 0.93 * (Cp2_Pi - Ci2_Pi) + Cp2_Alb - Ci2_Alb + 0.4 * 21.6 * VWp / VWp2 - 4 * 2.9 * VWi / VWi2 = 0;
    //
    Cp2_Alb = Cp_Alb * VWp / VWp2;
    Ci2_Alb = Ci_Alb * VWi / VWi2;
    Ce2_Na = Ce_Na * VWe / VWe2;
    Ce2_K = Ce_K * VWe / VWe2;
    Ce2_Pi = Ce_Pi * VWe / VWe2;
    Ce2_Hb = Ce_Hb * VWe / VWe2;
    Ce2_DPG = Ce_DPG * VWe / VWe2;
    Ce2_ATP = Ce_ATP * VWe / VWe2;
    Ce2_GSH = Ce_GSH * VWe / VWe2;
    //
    Cp2_CO3 = Cp2_HCO3 * 10 ^ (pHp - pK2_carb);
    Cp2_HCO3 = spCO2 * paCO2p * 10 ^ (pHp - pK1_carb);
    Ci2_CO3 = Ci2_HCO3 * 10 ^ (pHi - pK2_carb);
    Ci2_HCO3 = spCO2 * paCO2i * 10 ^ (pHi - pK1_carb);
    Ce2_CO3 = Ci2_HCO3 * 10 ^ (pHe - pK2_carb);
    Ce2_HCO3 = spCO2 * paCO2i * 10 ^ (pHe - pK1_carb);
    //pHp = -log10(Cp_H);
    //pHi = -log10(Ci_H);
    //pHe = -log10(Ce_H);
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end old;

  model IPE2_CbezPH
    parameter Real NaE = 10;
    parameter Real KE = 99;
    parameter Real ClE = 53.8;
    parameter Real Hb = 5.3;
    parameter Real DPG = 4.4;
    parameter Real ATP = 1.8;
    parameter Real GSH = 2.2;
    parameter Real imE = 95.9;
    parameter Real PiE = 0.67;
    //
    parameter Real NaP = 140;
    parameter Real NaI = 142;
    parameter Real KP = 4.1;
    parameter Real KI = 4.14;
    parameter Real CaP = 2.3;
    parameter Real CaI = 2.2;
    parameter Real MgP = 0.8;
    parameter Real MgI = 0.75;
    parameter Real ClP = 105;
    parameter Real ClI = 118;
    parameter Real PiP = 1.16;
    parameter Real PiI = 1.2;
    parameter Real AlbP = 0.65;
    parameter Real AlbI = 0.19;
    parameter Real imP = 21.6;
    parameter Real imI = 2.9;
    //
    parameter Real ZimE = 0.57;
    parameter Real ZimI = 1;
    parameter Real ZimP = -0.06;
    //
    parameter Real Vblood = 1;
    parameter Real Vint = 2;
    parameter Real PaCO2 = 40;
    //
    //
    parameter Real Vew0 = 0.44 * 0.73 * Vblood;
    parameter Real Vpw0 = (1 - 0.44) * 0.94 * Vblood;
    parameter Real Viw0 = Vint;
    //
    parameter Real m0NaE = NaE * Vew0;
    parameter Real m0KE = KE * Vew0;
    parameter Real m0ClE = ClE * Vew0;
    parameter Real m0Hb = Hb * Vew0;
    parameter Real m0DPG = DPG * Vew0;
    parameter Real m0ATP = ATP * Vew0;
    parameter Real m0GSH = GSH * Vew0;
    parameter Real m0imE = imE * Vew0;
    parameter Real m0PiE = PiE * Vew0;
    //
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
    //celkovy mnozstvi
    parameter Real MCl = m0ClE + m0ClP + m0ClI;
    parameter Real MNa = m0NaP + m0NaI;
    parameter Real MK = m0KP + m0KI;
    parameter Real MCa = m0CaP + m0CaI;
    parameter Real MMg = m0MgP + m0MgI;
    parameter Real MPi = m0PiP + m0PiI;
    //mobilni ionty
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
    //13
    Real Vew(start = Vew0);
    Real Vpw(start = Vpw0);
    Real Viw(start = Viw0);
    //3
    //Real HE(start = 5.67e-8);
    //Real HP;
    //Real HI(start = 2.58e-8);
    //3
    //ostatni
    //pH
    Real pHE(start = 7.2);
    parameter Real pHP(start = 7.4);
    parameter Real pHI(start = 7.39);
    //Z
    Real ZPi;
    Real ZAlb;
    Real ZHb;
    Real ZDPG;
    Real ZATP;
    Real ZGSH;
    Real fiHb;
    //karbonaty
    Real HCO3E;
    Real HCO3P;
    Real HCO3I;
    Real CO3E;
    Real CO3P;
    Real CO3I;
    //C
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
    //zachovani hmoty
    MCl = mClE + mClP + mClI;
    MNa = mNaP + mNaI;
    MK = mKP + mKI;
    MCa = mCaP + mCaI;
    MMg = mMgP + mMgI;
    MPi = mPiP + mPiI;
    //6
    Vew0 + Vpw0 + Viw0 = Vew + Vpw + Viw;
    //1
    //donan
    //C_ClE / C_ClP * 0.73 = HP / HE;
    //C_ClI / C_ClP * 0.73 = HP / HI;
    C_ClI / C_ClP = C_NaP / C_NaI;
    C_ClI / C_ClP = C_KP / C_KI;
    (C_ClI / C_ClP) ^ 2 = C_CaP / C_CaI;
    (C_ClI / C_ClP) ^ 2 = C_MgP / C_MgI;
    (C_ClI / C_ClP) ^ abs(ZPi) = C_PiI / C_PiP;
    //7
    //elektroneutralita
    mNaP + mKP + 2 * mCaP + 2 * mMgP - mClP - HCO3P * Vpw - 2 * CO3P * Vpw + ZPi * mPiP + ZAlb * m0AlbP + ZimP * imP = 0;
    mNaI + mKI + 2 * mCaI + 2 * mMgI - mClI - HCO3I * Viw - 2 * CO3I * Viw + ZPi * mPiI + ZAlb * m0AlbI + ZimI * imI = 0;
    m0NaE + m0KE - mClE - HCO3E * Vew - 2 * CO3E * Vew + ZHb * m0Hb + ZDPG * m0DPG + ZATP * m0ATP + ZGSH * m0GSH + ZimE * imE = 0;
    //3
    //osmoticka rovnovaha
    0.93 * (C_NaP - C_NaI) + 0.93 * (C_KP - C_KI) + 0.93 * (C_ClP - C_ClI) + C_CaP - C_CaI + C_MgP - C_MgI + 0.93 * (HCO3P - HCO3I) + 0.93 * (CO3P - CO3I) + 0.93 * (C_PiP - C_PiI) + C_AlbP - C_AlbI + C_imP - C_imI = 0;
    0.93 * (C_NaP - C_NaE) + 0.93 * (C_KP - C_KE) + 0.93 * (C_ClP - C_ClE) + 0.93 * (C_PiP - C_PiE) + C_imP - C_imE + C_CaP + C_MgP + C_AlbP - fiHb * C_Hb - C_DPG - C_ATP - C_GSH = 0;
    //2
    //ostatni
    //pH
    //pHE = -log10(HE);
    //pHP = -log10(HP);
    //pHI = -log10(HI);
    //Z
    ZHb = 15.6 - 23 * ((10 ^ pHE - 6.69) / (1 + 10 ^ pHE - 6.69)) - 4 * ((10 ^ pHE - 7.89) / (1 + 10 ^ pHE - 7.89));
    ZDPG = (-3) - 1 * ((10 ^ pHE - 7.56) / (1 + 10 ^ pHE - 7.56)) - 1 * ((10 ^ pHE - 7.32) / (1 + 10 ^ pHE - 7.32));
    ZATP = (-3) - 1 * ((10 ^ pHE - 6.8) / (1 + 10 ^ pHE - 6.8));
    ZGSH = (-1) - 1 * ((10 ^ pHE - 8.54) / (1 + 10 ^ pHE - 8.54)) - 1 * ((10 ^ pHE - 9.42) / (1 + 10 ^ pHE - 9.42));
    ZPi = (-1) - (10 ^ pHP - 6.87) / (1 + 10 ^ pHP - 6.87);
    ZAlb = (-10.7) - 16 * ((10 ^ pHP - 7.42) / (1 + 10 ^ pHP - 7.42));
    fiHb = 1 + 0.115 * C_Hb + 0.0256 * C_Hb ^ 2;
    //karbonaty
    HCO3E = 0.026 * PaCO2 * 10 ^ (pHE - 6.11);
    CO3E = HCO3E * 10 ^ (pHE - 10.2);
    HCO3P = 0.0306 * PaCO2 * 10 ^ (pHP - 6.11);
    CO3P = HCO3P * 10 ^ (pHP - 10.2);
    HCO3I = 0.0326 * PaCO2 * 10 ^ (pHI - 6.11);
    CO3I = HCO3I * 10 ^ (pHI - 10.2);
    //C
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
  end IPE2_CbezPH;

  model IPE3_bezPH
    parameter Real NaE = 10;
    parameter Real KE = 99;
    parameter Real ClE = 53.8;
    parameter Real Hb = 5.3;
    parameter Real DPG = 4.4;
    parameter Real ATP = 1.8;
    parameter Real GSH = 2.2;
    parameter Real imE = 95.9;
    parameter Real PiE = 0.67;
    //
    parameter Real NaP = 140;
    parameter Real NaI = 142;
    parameter Real KP = 4.1;
    parameter Real KI = 4.14;
    parameter Real CaP = 2.3;
    parameter Real CaI = 2.2;
    parameter Real MgP = 0.8;
    parameter Real MgI = 0.75;
    parameter Real ClP = 105;
    parameter Real ClI = 118;
    parameter Real PiP = 1.16;
    parameter Real PiI = 1.2;
    parameter Real AlbP = 0.65;
    parameter Real AlbI = 0.19;
    parameter Real imP = 21.6;
    parameter Real imI = 2.9;
    //
    parameter Real ZimE = 0.57;
    parameter Real ZimI = 1;
    parameter Real ZimP = -0.06;
    //
    parameter Real Vblood = 1;
    parameter Real Vint = 2;
    parameter Real PaCO2 = 40;
    //
    //
    parameter Real Vew0 = 0.44 * 0.73 * Vblood;
    parameter Real Vpw0 = (1 - 0.44) * 0.94 * Vblood;
    parameter Real Viw0 = Vint;
    //
    parameter Real m0NaE = NaE * Vew0;
    parameter Real m0KE = KE * Vew0;
    parameter Real m0ClE = ClE * Vew0;
    parameter Real m0Hb = Hb * Vew0;
    parameter Real m0DPG = DPG * Vew0;
    parameter Real m0ATP = ATP * Vew0;
    parameter Real m0GSH = GSH * Vew0;
    parameter Real m0imE = imE * Vew0;
    parameter Real m0PiE = PiE * Vew0;
    //
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
    //celkovy mnozstvi
    parameter Real MCl = m0ClE + m0ClP + m0ClI;
    parameter Real MNa = m0NaP + m0NaI;
    parameter Real MK = m0KP + m0KI;
    parameter Real MCa = m0CaP + m0CaI;
    parameter Real MMg = m0MgP + m0MgI;
    parameter Real MPi = m0PiP + m0PiI;
    //mobilni ionty
    Real mClE;
    Real mClP(start = m0ClP);
    Real mClI;
    Real mNaP;
    Real mNaI;
    Real mKP(start = m0KP);
    Real mKI;
    Real mCaP;
    Real mCaI(start = m0CaI);
    Real mMgP;
    Real mMgI;
    Real mPiP(start = m0PiP);
    Real mPiI;
    //13
    Real Vew;
    Real Vpw(start = Vpw0);
    Real Viw(start = Viw0);
    //3
    //Real HE(start = 5.67e-8);
    //Real HP;
    //Real HI(start = 2.58e-8);
    //3
    //ostatni
    //pH
    Real pHE;
    parameter Real pHP(start = 7.4);
    parameter Real pHI(start = 7.39);
    //Z
    Real ZPi;
    Real ZAlb;
    Real ZHb;
    Real ZDPG;
    Real ZATP;
    Real ZGSH;
    Real fiHb;
    //karbonaty
    Real HCO3E;
    Real HCO3P;
    Real HCO3I;
    Real CO3E;
    Real CO3P;
    Real CO3I;
  equation
    //zachovani hmoty
    MCl = mClE + mClP + mClI;
    MNa = mNaP + mNaI;
    MK = mKP + mKI;
    MCa = mCaP + mCaI;
    MMg = mMgP + mMgI;
    MPi = mPiP + mPiI;
    //6
    Vew0 + Vpw0 + Viw0 = Vew + Vpw + Viw;
    //1
    //donan
    //mClE * Vew / mClP * Vpw * 0.73 = HP / HE;
    //mClI * Viw / mClP * Vpw * 0.73 = HP / HI;
    mClI * Viw / mClP * Vpw = mNaP * Vpw / mNaI * Viw;
    mClI * Viw / mClP * Vpw = mKP * Vpw / mKI * Viw;
    (mClI * Viw / mClP * Vpw) ^ 2 = mCaP * Vpw / mCaI * Viw;
    (mClI * Viw / mClP * Vpw) ^ 2 = mMgP * Vpw / mMgI * Viw;
    (mClI * Viw / mClP * Vpw) ^ abs(ZPi) = mPiI * Viw / mPiP * Vpw;
    //7
    //elektroneutralita
    mNaP + mKP + 2 * mCaP + 2 * mMgP - mClP - HCO3P - 2 * CO3P + ZPi * mPiP + ZAlb * m0AlbP + ZimP * m0imP = 0;
    mNaI + mKI + 2 * mCaI + 2 * mMgI - mClI - HCO3I - 2 * CO3I + ZPi * mPiI + ZAlb * m0AlbI + ZimI * m0imI = 0;
    m0NaE + m0KE - mClE - HCO3E - 2 * CO3E + ZHb * m0Hb + ZDPG * m0DPG + ZATP * m0ATP + ZGSH * m0GSH + ZimE * m0imE = 0;
    //3
    //osmoticka rovnovaha
    0.93 * (mNaP * Vpw - mNaI * Viw) + 0.93 * (mKP * Vpw - mKI * Viw) + 0.93 * (mClP * Vpw - mClI * Viw) + mCaP * Vpw - mCaI * Viw + mMgP * Vpw - mMgI * Viw + 0.93 * (HCO3P - HCO3I) + 0.93 * (CO3P - CO3I) + 0.93 * (mPiP * Vpw - mPiI * Viw) + m0AlbP * Vpw - m0AlbI * Viw + m0imP * Vpw - m0imI * Viw = 0;
    0.93 * (mNaP * Vpw - m0NaE * Vew) + 0.93 * (mKP * Vpw - m0KE * Vew) + 0.93 * (mClP * Vpw - mClE * Vew) + 0.93 * (mPiP * Vpw - m0PiE * Vew) + m0imP * Vpw - m0imE * Vew + mCaP * Vpw + mMgP * Vpw + m0AlbP * Vpw - fiHb * m0Hb * Vew - m0DPG * Vew - m0ATP * Vew - m0GSH * Vew = 0;
    //2
    //ostatni
    //pH
    //pHE = -log10(HE);
    //pHP = -log10(HP);
    //pHI = -log10(HI);
    //Z
    ZHb = 15.6 - 23 * ((10 ^ pHE - 6.69) / (1 + 10 ^ pHE - 6.69)) - 4 * ((10 ^ pHE - 7.89) / (1 + 10 ^ pHE - 7.89));
    ZDPG = (-3) - 1 * ((10 ^ pHE - 7.56) / (1 + 10 ^ pHE - 7.56)) - 1 * ((10 ^ pHE - 7.32) / (1 + 10 ^ pHE - 7.32));
    ZATP = (-3) - 1 * ((10 ^ pHE - 6.8) / (1 + 10 ^ pHE - 6.8));
    ZGSH = (-1) - 1 * ((10 ^ pHE - 8.54) / (1 + 10 ^ pHE - 8.54)) - 1 * ((10 ^ pHE - 9.42) / (1 + 10 ^ pHE - 9.42));
    ZPi = (-1) - (10 ^ pHP - 6.87) / (1 + 10 ^ pHP - 6.87);
    ZAlb = (-10.7) - 16 * ((10 ^ pHP - 7.42) / (1 + 10 ^ pHP - 7.42));
    fiHb = 1 + 0.115 * m0Hb / Vew + 0.0256 * (m0Hb / Vew) ^ 2;
    //karbonaty
    HCO3E = 0.026 * PaCO2 * 10 ^ (pHE - 6.11);
    CO3E = HCO3E * 10 ^ (pHE - 10.2);
    HCO3P = 0.0306 * PaCO2 * 10 ^ (pHP - 6.11);
    CO3P = HCO3P * 10 ^ (pHP - 10.2);
    HCO3I = 0.0326 * PaCO2 * 10 ^ (pHI - 6.11);
    CO3I = HCO3I * 10 ^ (pHI - 10.2);
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end IPE3_bezPH;

  model IPE4_CCel
    parameter Real NaE = 10;
    parameter Real KE = 99;
    parameter Real ClE = 53.8;
    parameter Real Hb = 5.3;
    parameter Real DPG = 4.4;
    parameter Real ATP = 1.8;
    parameter Real GSH = 2.2;
    parameter Real imE = 95.9;
    parameter Real PiE = 0.67;
    //
    parameter Real NaP = 140;
    parameter Real NaI = 142;
    parameter Real KP = 4.1;
    parameter Real KI = 4.14;
    parameter Real CaP = 2.3;
    parameter Real CaI = 2.2;
    parameter Real MgP = 0.8;
    parameter Real MgI = 0.75;
    parameter Real ClP = 105;
    parameter Real ClI = 118;
    parameter Real PiP = 1.16;
    parameter Real PiI = 1.2;
    parameter Real AlbP = 0.65;
    parameter Real AlbI = 0.19;
    parameter Real imP = 8.5;
    parameter Real imI = 13;
    //
    parameter Real ZimE = 0.57;
    parameter Real ZimI = 0.2;
    parameter Real ZimP = -2.3;
    //
    parameter Real Vblood = 1;
    parameter Real Vint = 2;
    parameter Real PaCO2 = 40;
    //
    //
    parameter Real Vew0 = 0.44 * 0.73 * Vblood;
    parameter Real Vpw0 = (1 - 0.44) * 0.94 * Vblood;
    parameter Real Viw0 = Vint;
    //
    parameter Real m0NaE = NaE * Vew0;
    parameter Real m0KE = KE * Vew0;
    parameter Real m0ClE = ClE * Vew0;
    parameter Real m0Hb = Hb * Vew0;
    parameter Real m0DPG = DPG * Vew0;
    parameter Real m0ATP = ATP * Vew0;
    parameter Real m0GSH = GSH * Vew0;
    parameter Real m0imE = imE * Vew0;
    parameter Real m0PiE = PiE * Vew0;
    //
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
    //celkovy mnozstvi
    parameter Real MCl = m0ClE + m0ClP + m0ClI;
    parameter Real MNa = m0NaP + m0NaI;
    parameter Real MK = m0KP + m0KI;
    parameter Real MCa = m0CaP + m0CaI;
    parameter Real MMg = m0MgP + m0MgI;
    parameter Real MPi = m0PiP + m0PiI;
    //mobilni ionty
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
    //13
    Real Vew(start = Vew0);
    Real Vpw(start = Vpw0);
    Real Viw(start = Viw0);
    //3
    //Real HE(start = 5.67e-8);
    //Real HP;
    //Real HI(start = 2.58e-8);
    //3
    //ostatni
    //pH
    Real pHE(start = 7.2);
    parameter Real pHP(start = 7.4);
    parameter Real pHI(start = 7.39);
    //Z
    Real ZPi;
    Real ZAlb;
    Real ZHb;
    Real ZDPG;
    Real ZATP;
    Real ZGSH;
    Real fiHb;
    //karbonaty
    Real HCO3E;
    Real HCO3P;
    Real HCO3I;
    Real CO3E;
    Real CO3P;
    Real CO3I;
    //C
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
    //zachovani hmoty
    MCl = mClE + mClP + mClI;
    MNa = mNaP + mNaI;
    MK = mKP + mKI;
    MCa = mCaP + mCaI;
    MMg = mMgP + mMgI;
    MPi = mPiP + mPiI;
    //6
    Vew0 + Vpw0 + Viw0 = Vew + Vpw + Viw;
    //1
    //donan
    //C_ClE / C_ClP * 0.73 = HP / HE;
    //C_ClI / C_ClP * 0.73 = HP / HI;
    C_ClI / C_ClP = C_NaP / C_NaI;
    C_ClI / C_ClP = C_KP / C_KI;
    (C_ClI / C_ClP) ^ 2 = C_CaP / C_CaI;
    (C_ClI / C_ClP) ^ 2 = C_MgP / C_MgI;
    (C_ClI / C_ClP) ^ abs(ZPi) = C_PiI / C_PiP;
    //7
    //elektroneutralita
    C_NaP + C_KP + 2 * C_CaP + 2 * C_MgP - C_ClP - HCO3P - 2 * CO3P + ZPi * C_PiP + ZAlb * C_AlbP + ZimP * imP = 0;
    C_NaI + C_KI + 2 * C_CaI + 2 * C_MgI - C_ClI - HCO3I - 2 * CO3I + ZPi * C_PiI + ZAlb * C_AlbI + ZimI * imI = 0;
    C_NaE + C_KE - C_ClE - HCO3E - 2 * CO3E + ZHb * C_Hb + ZDPG * C_DPG + ZATP * C_ATP + ZGSH * C_GSH + ZimE * imE = 0;
    //3
    //osmoticka rovnovaha
    0.93 * (C_NaP - C_NaI) + 0.93 * (C_KP - C_KI) + 0.93 * (C_ClP - C_ClI) + C_CaP - C_CaI + C_MgP - C_MgI + 0.93 * (HCO3P - HCO3I) + 0.93 * (CO3P - CO3I) + 0.93 * (C_PiP - C_PiI) + C_AlbP - C_AlbI + C_imP - C_imI = 0;
    0.93 * (C_NaP - C_NaE) + 0.93 * (C_KP - C_KE) + 0.93 * (C_ClP - C_ClE) + 0.93 * (C_PiP - C_PiE) + C_imP - C_imE + C_CaP + C_MgP + C_AlbP - fiHb * C_Hb - C_DPG - C_ATP - C_GSH = 0;
    //2
    //ostatni
    //pH
    //pHE = -log10(HE);
    //pHP = -log10(HP);
    //pHI = -log10(HI);
    //Z
    ZHb = 15.6 - 23 * ((10 ^ pHE - 6.69) / (1 + 10 ^ pHE - 6.69)) - 4 * ((10 ^ pHE - 7.89) / (1 + 10 ^ pHE - 7.89));
    ZDPG = (-3) - 1 * ((10 ^ pHE - 7.56) / (1 + 10 ^ pHE - 7.56)) - 1 * ((10 ^ pHE - 7.32) / (1 + 10 ^ pHE - 7.32));
    ZATP = (-3) - 1 * ((10 ^ pHE - 6.8) / (1 + 10 ^ pHE - 6.8));
    ZGSH = (-1) - 1 * ((10 ^ pHE - 8.54) / (1 + 10 ^ pHE - 8.54)) - 1 * ((10 ^ pHE - 9.42) / (1 + 10 ^ pHE - 9.42));
    ZPi = (-1) - (10 ^ pHP - 6.87) / (1 + 10 ^ pHP - 6.87);
    ZAlb = (-10.7) - 16 * ((10 ^ pHP - 7.42) / (1 + 10 ^ pHP - 7.42));
    fiHb = 1 + 0.115 * C_Hb + 0.0256 * C_Hb ^ 2;
    //karbonaty
    HCO3E = 0.026 * PaCO2 * 10 ^ (pHE - 6.11);
    CO3E = HCO3E * 10 ^ (pHE - 10.2);
    HCO3P = 0.0306 * PaCO2 * 10 ^ (pHP - 6.11);
    CO3P = HCO3P * 10 ^ (pHP - 10.2);
    HCO3I = 0.0326 * PaCO2 * 10 ^ (pHI - 6.11);
    CO3I = HCO3I * 10 ^ (pHI - 10.2);
    //C
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
  end IPE4_CCel;

  model IPE5_pH
    parameter Real NaE = 10;
    parameter Real KE = 99;
    parameter Real ClE = 53.8;
    parameter Real Hb = 5.3;
    parameter Real DPG = 4.4;
    parameter Real ATP = 1.8;
    parameter Real GSH = 2.2;
    parameter Real imE = 95.9;
    parameter Real PiE = 0.67;
    //
    parameter Real NaP = 140;
    parameter Real NaI = 142;
    parameter Real KP = 4.1;
    parameter Real KI = 4.14;
    parameter Real CaP = 2.3;
    parameter Real CaI = 2.2;
    parameter Real MgP = 0.8;
    parameter Real MgI = 0.75;
    parameter Real ClP = 105;
    parameter Real ClI = 118;
    parameter Real PiP = 1.16;
    parameter Real PiI = 1.2;
    parameter Real AlbP = 0.65;
    parameter Real AlbI = 0.19;
    parameter Real imP = 20;
    parameter Real imI = 20;
    //
    parameter Real ZimE = 0.57;
    parameter Real ZimI = 0.35;
    parameter Real ZimP = -0.6;
    //
    parameter Real Vblood = 1;
    parameter Real Vint = 2;
    parameter Real PaCO2 = 40;
    //
    //
    parameter Real Vew0 = 0.44 * 0.73 * Vblood;
    parameter Real Vpw0 = (1 - 0.44) * 0.94 * Vblood;
    parameter Real Viw0 = Vint;
    //
    parameter Real m0NaE = NaE * Vew0;
    parameter Real m0KE = KE * Vew0;
    parameter Real m0ClE = ClE * Vew0;
    parameter Real m0Hb = Hb * Vew0;
    parameter Real m0DPG = DPG * Vew0;
    parameter Real m0ATP = ATP * Vew0;
    parameter Real m0GSH = GSH * Vew0;
    parameter Real m0imE = imE * Vew0;
    parameter Real m0PiE = PiE * Vew0;
    //
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
    //celkovy mnozstvi
    parameter Real MCl = m0ClE + m0ClP + m0ClI;
    parameter Real MNa = m0NaP + m0NaI;
    parameter Real MK = m0KP + m0KI;
    parameter Real MCa = m0CaP + m0CaI;
    parameter Real MMg = m0MgP + m0MgI;
    parameter Real MPi = m0PiP + m0PiI;
    //mobilni ionty
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
    //13
    Real Vew(start = Vew0);
    Real Vpw(start = Vpw0);
    Real Viw(start = Viw0);
    //3
    //Real HE(start = 5.67e-8);
    //Real HP;
    //Real HI(start = 2.58e-8);
    //3
    //ostatni
    //pH
    Real pHE(start = 7.2);
    Real pHP(start = 7.4);
    Real pHI(start = 7.39);
    //Z
    Real ZPi;
    Real ZAlb;
    Real ZHb;
    Real ZDPG;
    Real ZATP;
    Real ZGSH;
    Real fiHb;
    //karbonaty
    Real HCO3E;
    Real HCO3P;
    Real HCO3I;
    Real CO3E;
    Real CO3P;
    Real CO3I;
    //C
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
    //
    Real BE;
    Real SIDp;
    Real SIDe;
    Real SIDi;
    Real SIDp2;
    Real SID;
    Real fH;
    Real fB;
  equation
    //zachovani hmoty
    MCl = mClE + mClP + mClI;
    MNa = mNaP + mNaI;
    MK = mKP + mKI;
    MCa = mCaP + mCaI;
    MMg = mMgP + mMgI;
    MPi = mPiP + mPiI;
    //6
    Vew0 + Vpw0 + Viw0 = Vew + Vpw + Viw;
    //1
    //donan
    //C_ClE / C_ClP * 0.73 = pHP / pHE;
    C_ClE / C_ClP = HCO3E / HCO3P;
    //C_ClI / C_ClP * 0.73 = pHP / pHI;
    C_ClI / C_ClP = HCO3I / HCO3P;
    C_ClI / C_ClP = C_NaP / C_NaI;
    C_ClI / C_ClP = C_KP / C_KI;
    (C_ClI / C_ClP) ^ 2 = C_CaP / C_CaI;
    (C_ClI / C_ClP) ^ 2 = C_MgP / C_MgI;
    (C_ClI / C_ClP) ^ abs(ZPi) = C_PiI / C_PiP;
    //7
    //elektroneutralita
    C_NaP + C_KP + 2 * C_CaP + 2 * C_MgP - C_ClP - HCO3P - 2 * CO3P + ZPi * C_PiP + ZAlb * C_AlbP + ZimP * imP = 0;
    C_NaI + C_KI + 2 * C_CaI + 2 * C_MgI - C_ClI - HCO3I - 2 * CO3I + ZPi * C_PiI + ZAlb * C_AlbI + ZimI * imI = 0;
    C_NaE + C_KE - C_ClE - HCO3E - 2 * CO3E + ZHb * C_Hb + ZDPG * C_DPG + ZATP * C_ATP + ZGSH * C_GSH + ZimE * imE = 0;
    //3
    //osmoticka rovnovaha
    0.93 * (C_NaP - C_NaI) + 0.93 * (C_KP - C_KI) + 0.93 * (C_ClP - C_ClI) + C_CaP - C_CaI + C_MgP - C_MgI + 0.93 * (HCO3P - HCO3I) + 0.93 * (CO3P - CO3I) + 0.93 * (C_PiP - C_PiI) + C_AlbP - C_AlbI + C_imP - C_imI = 0;
    0.93 * (C_NaP - C_NaE) + 0.93 * (C_KP - C_KE) + 0.93 * (C_ClP - C_ClE) + 0.93 * (C_PiP - C_PiE) + C_imP - C_imE + C_CaP + C_MgP + C_AlbP - fiHb * C_Hb - C_DPG - C_ATP - C_GSH = 0;
    //2
    //ostatni
    //pH
    //pHE = -log10(HE);
    //pHP = -log10(HP);
    //pHI = -log10(HI);
    //Z
    ZHb = 15.6 - 23 * ((10 ^ pHE - 6.69) / (1 + 10 ^ pHE - 6.69)) - 4 * ((10 ^ pHE - 7.89) / (1 + 10 ^ pHE - 7.89));
    ZDPG = (-3) - 1 * ((10 ^ pHE - 7.56) / (1 + 10 ^ pHE - 7.56)) - 1 * ((10 ^ pHE - 7.32) / (1 + 10 ^ pHE - 7.32));
    ZATP = (-3) - 1 * ((10 ^ pHE - 6.8) / (1 + 10 ^ pHE - 6.8));
    ZGSH = (-1) - 1 * ((10 ^ pHE - 8.54) / (1 + 10 ^ pHE - 8.54)) - 1 * ((10 ^ pHE - 9.42) / (1 + 10 ^ pHE - 9.42));
    ZPi = (-1) - (10 ^ pHP - 6.87) / (1 + 10 ^ pHP - 6.87);
    ZAlb = (-10.7) - 16 * ((10 ^ pHP - 7.42) / (1 + 10 ^ pHP - 7.42));
    fiHb = 1 + 0.115 * C_Hb + 0.0256 * C_Hb ^ 2;
    //karbonaty
    HCO3E = 0.026 * PaCO2 * 10 ^ (pHE - 6.11);
    CO3E = HCO3E * 10 ^ (pHE - 10.2);
    HCO3P = 0.0306 * PaCO2 * 10 ^ (pHP - 6.11);
    CO3P = HCO3P * 10 ^ (pHP - 10.2);
    HCO3I = 0.0326 * PaCO2 * 10 ^ (pHI - 6.11);
    CO3I = HCO3I * 10 ^ (pHI - 10.2);
    //C
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
    //
    BE = (1 - 0.023 * C_Hb) * (HCO3P - 24.4 + (2.3 * C_Hb + 7.7) * (pHP - 7.4));
    SIDp = C_NaP + C_KP + 2 * C_CaP + 2 * C_MgP - C_ClP;
    SIDi = C_NaI + C_KI + 2 * C_CaI + 2 * C_MgI - C_ClI;
    SIDe = C_NaE + C_KE - C_ClP;
    SIDp2 = -((-HCO3P) - 2 * CO3P + ZPi * C_PiP + ZAlb * C_AlbP);
    fH = (Vew + Vew / 0.73 * (1 - 0.73)) / (Vew + Vew / 0.73 * (1 - 0.73) + Vpw + Vpw / 0.94 * (1 - 0.94));
    fB = Vblood / (Vblood + Vint);
    SID = (1 - (1 - HCO3E / HCO3P) * fH * fB) * HCO3P + (1 - fH * fB) * (C_AlbP * (8 * pHP - 41) + C_PiP * (0.3 * pHP - 0.4)) + C_Hb * fB * (10.2 * pHP - 73.6) + C_DPG * fH * fB * (0.7 * pHP - 0.5);
    //  SID=(1-(1-(HCO3E/HCO3P))*((Vew+(Vew/0.73*(1-0.73)))/((Vew+(Vew/0.73*(1-0.73))))+(Vpw+(Vpw/0.94*(1-0.94))*(Vblood/(Vblood+Vint)))*HCO3P+(1-((Vew+(Vew/0.73*(1-0.73)))/((Vew+(Vew/0.73*(1-0.73))))*(Vblood/(Vblood+Vint)))
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end IPE5_pH;

  model IPE6
    parameter Real NaE = 10;
    parameter Real KE = 99;
    parameter Real ClE = 53.8;
    parameter Real Hb = 5.3;
    parameter Real DPG = 4.4;
    parameter Real ATP = 1.8;
    parameter Real GSH = 2.2;
    parameter Real imE = 95.9;
    parameter Real PiE = 0.67;
    //
    parameter Real NaP = 140;
    parameter Real NaI = 142;
    parameter Real KP = 4.1;
    parameter Real KI = 4.14;
    parameter Real CaP = 2.3;
    parameter Real CaI = 2.2;
    parameter Real MgP = 0.8;
    parameter Real MgI = 0.75;
    parameter Real ClP = 105;
    parameter Real ClI = 118;
    parameter Real PiP = 1.16;
    parameter Real PiI = 1.2;
    parameter Real AlbP = 0.65;
    parameter Real AlbI = 0.19;
    parameter Real imP = 20;
    parameter Real imI = 20;
    //
    parameter Real ZimE = 0.57;
    parameter Real ZimI = 0.35;
    parameter Real ZimP = -0.6;
    //
    parameter Real Vblood = 1;
    parameter Real Vint = 2;
    parameter Real PaCO2 = 40;
    parameter Real PaCO2int = 46;
    //
    //
    parameter Real Vew0 = 0.44 * 0.73 * Vblood;
    parameter Real Vpw0 = (1 - 0.44) * 0.94 * Vblood;
    parameter Real Viw0 = Vint;
    //
    parameter Real m0NaE = NaE * Vew0;
    parameter Real m0KE = KE * Vew0;
    parameter Real m0ClE = ClE * Vew0;
    parameter Real m0Hb = Hb * Vew0;
    parameter Real m0DPG = DPG * Vew0;
    parameter Real m0ATP = ATP * Vew0;
    parameter Real m0GSH = GSH * Vew0;
    parameter Real m0imE = imE * Vew0;
    parameter Real m0PiE = PiE * Vew0;
    //
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
    //celkovy mnozstvi
    parameter Real MCl = m0ClE + m0ClP + m0ClI;
    parameter Real MNa = m0NaP + m0NaI;
    parameter Real MK = m0KP + m0KI;
    parameter Real MCa = m0CaP + m0CaI;
    parameter Real MMg = m0MgP + m0MgI;
    parameter Real MPi = m0PiP + m0PiI;
    //mobilni ionty
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
    //13
    Real Vew(start = Vew0);
    Real Vpw(start = Vpw0);
    Real Viw(start = Viw0);
    //3
    Real HCO3E;
    Real HCO3P;
    Real HCO3I;
    //3
    //ostatni
    //pH
    Real pHE(start = 7.22);
    Real pHP(start = 7.4);
    Real pHI(start = 7.39);
    //Z
    Real ZPi;
    Real ZAlb;
    Real ZHb;
    Real ZDPG;
    Real ZATP;
    Real ZGSH;
    Real fiHb;
    //karbonaty
    Real CO3E;
    Real CO3P;
    Real CO3I;
    //C
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
    //
    Real BE;
    Real SIDp;
    Real SIDe;
    Real SIDi;
    Real SIDp2;
    Real SID;
    Real fH;
    Real fB;
  equation
    //zachovani hmoty
    MCl = mClE + mClP + mClI;
    MNa = mNaP + mNaI;
    MK = mKP + mKI;
    MCa = mCaP + mCaI;
    MMg = mMgP + mMgI;
    MPi = mPiP + mPiI;
    //6
    Vew0 + Vpw0 + Viw0 = Vew + Vpw + Viw;
    //1
    //donan
    C_ClE / C_ClP = 0.92 * (HCO3E / HCO3P);
    C_ClI / C_ClP = 0.92 * (HCO3I / HCO3P);
    C_ClI / C_ClP = C_NaP / C_NaI;
    C_ClI / C_ClP = C_KP / C_KI;
    (C_ClI / C_ClP) ^ 2 = C_CaP / C_CaI;
    (C_ClI / C_ClP) ^ 2 = C_MgP / C_MgI;
    (C_ClI / C_ClP) ^ abs(ZPi) = C_PiI / C_PiP;
    //7
    //elektroneutralita
    C_NaP + C_KP + 2 * C_CaP + 2 * C_MgP - C_ClP - HCO3P - 2 * CO3P + ZPi * C_PiP + ZAlb * C_AlbP + ZimP * imP = 0;
    C_NaI + C_KI + 2 * C_CaI + 2 * C_MgI - C_ClI - HCO3I - 2 * CO3I + ZPi * C_PiI + ZAlb * C_AlbI + ZimI * imI = 0;
    C_NaE + C_KE - C_ClE - HCO3E - 2 * CO3E + ZHb * C_Hb + ZDPG * C_DPG + ZATP * C_ATP + ZGSH * C_GSH + ZimE * imE = 0;
    //3
    //osmoticka rovnovaha
    0.93 * (C_NaP - C_NaI) + 0.93 * (C_KP - C_KI) + 0.93 * (C_ClP - C_ClI) + C_CaP - C_CaI + C_MgP - C_MgI + 0.93 * (HCO3P - HCO3I) + 0.93 * (CO3P - CO3I) + 0.93 * (C_PiP - C_PiI) + C_AlbP - C_AlbI + C_imP - C_imI = 0;
    0.93 * (C_NaP - C_NaE) + 0.93 * (C_KP - C_KE) + 0.93 * (C_ClP - C_ClE) + 0.93 * (C_PiP - C_PiE) + C_imP - C_imE + C_CaP + C_MgP + C_AlbP - fiHb * C_Hb - C_DPG - C_ATP - C_GSH = 0;
    //2
    //ostatni
    //Z
    ZHb = 15.6 - 23 * ((10 ^ pHE - 6.69) / (1 + 10 ^ pHE - 6.69)) - 4 * ((10 ^ pHE - 7.89) / (1 + 10 ^ pHE - 7.89));
    ZDPG = (-3) - 1 * ((10 ^ pHE - 7.56) / (1 + 10 ^ pHE - 7.56)) - 1 * ((10 ^ pHE - 7.32) / (1 + 10 ^ pHE - 7.32));
    ZATP = (-3) - 1 * ((10 ^ pHE - 6.8) / (1 + 10 ^ pHE - 6.8));
    ZGSH = (-1) - 1 * ((10 ^ pHE - 8.54) / (1 + 10 ^ pHE - 8.54)) - 1 * ((10 ^ pHE - 9.42) / (1 + 10 ^ pHE - 9.42));
    ZPi = (-1) - (10 ^ pHP - 6.87) / (1 + 10 ^ pHP - 6.87);
    ZAlb = (-10.7) - 16 * ((10 ^ pHP - 7.42) / (1 + 10 ^ pHP - 7.42));
    fiHb = 1 + 0.115 * C_Hb + 0.0256 * C_Hb ^ 2;
    //karbonaty a pH
    HCO3E = 0.026 * PaCO2 * 10 ^ (pHE - 6.11);
    CO3E = HCO3E * 10 ^ (pHE - 10.2);
    HCO3P = 0.0306 * PaCO2 * 10 ^ (pHP - 6.11);
    CO3P = HCO3P * 10 ^ (pHP - 10.2);
    HCO3I = 0.0326 * PaCO2int * 10 ^ (pHI - 6.11);
    CO3I = HCO3I * 10 ^ (pHI - 10.2);
    //C
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
    //
    BE = (1 - 0.023 * C_Hb) * (HCO3P - 24.4 + (2.3 * C_Hb + 7.7) * (pHP - 7.4));
    SIDp = C_NaP + C_KP + 2 * C_CaP + 2 * C_MgP - C_ClP;
    SIDi = C_NaI + C_KI + 2 * C_CaI + 2 * C_MgI - C_ClI;
    SIDe = C_NaE + C_KE - C_ClP;
    SIDp2 = -((-HCO3P) - 2 * CO3P + ZPi * C_PiP + ZAlb * C_AlbP);
    fH = (Vew + Vew / 0.73 * (1 - 0.73)) / (Vew + Vew / 0.73 * (1 - 0.73) + Vpw + Vpw / 0.94 * (1 - 0.94));
    fB = Vblood / (Vblood + Vint);
    SID = (1 - (1 - HCO3E / HCO3P) * fH * fB) * HCO3P + (1 - fH * fB) * (C_AlbP * (8 * pHP - 41) + C_PiP * (0.3 * pHP - 0.4)) + C_Hb * fB * (10.2 * pHP - 73.6) + C_DPG * fH * fB * (0.7 * pHP - 0.5);
    //  SID=(1-(1-(HCO3E/HCO3P))*((Vew+(Vew/0.73*(1-0.73)))/((Vew+(Vew/0.73*(1-0.73))))+(Vpw+(Vpw/0.94*(1-0.94))*(Vblood/(Vblood+Vint)))*HCO3P+(1-((Vew+(Vew/0.73*(1-0.73)))/((Vew+(Vew/0.73*(1-0.73))))*(Vblood/(Vblood+Vint)))
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end IPE6;

  model IPE8
    parameter Real NaE = 10;
    parameter Real KE = 99;
    parameter Real ClE = 53.8;
    parameter Real Hb = 5.3;
    parameter Real DPG = 4.4;
    parameter Real ATP = 1.8;
    parameter Real GSH = 2.2;
    parameter Real imE = 95.9;
    parameter Real PiE = 0.67;
    //
    parameter Real NaP = 140;
    parameter Real NaI = 142;
    parameter Real KP = 4.1;
    parameter Real KI = 4.14;
    parameter Real CaP = 2.3;
    parameter Real CaI = 2.2;
    parameter Real MgP = 0.8;
    parameter Real MgI = 0.75;
    parameter Real ClP = 105;
    parameter Real ClI = 118;
    parameter Real PiP = 1.16;
    parameter Real PiI = 1.2;
    parameter Real AlbP = 0.65;
    parameter Real AlbI = 0.19;
    parameter Real imP = 20;
    parameter Real imI = 20;
    //
    parameter Real ZimE = 0.57;
    parameter Real ZimI = 0.35;
    parameter Real ZimP = -0.6;
    //
    parameter Real Vblood = 1;
    parameter Real Vint = 2;
    parameter Real PaCO2 = 40;
    parameter Real PaCO2int = 46;
    //
    //
    parameter Real Vew0 = 0.44 * 0.73 * Vblood;
    parameter Real Vpw0 = (1 - 0.44) * 0.94 * Vblood;
    parameter Real Viw0 = Vint;
    //
    parameter Real m0NaE = NaE * Vew0;
    parameter Real m0KE = KE * Vew0;
    parameter Real m0ClE = ClE * Vew0;
    parameter Real m0Hb = Hb * Vew0;
    parameter Real m0DPG = DPG * Vew0;
    parameter Real m0ATP = ATP * Vew0;
    parameter Real m0GSH = GSH * Vew0;
    parameter Real m0imE = imE * Vew0;
    parameter Real m0PiE = PiE * Vew0;
    //
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
    //celkovy mnozstvi
    parameter Real MCl = m0ClE + m0ClP + m0ClI;
    parameter Real MNa = m0NaP + m0NaI;
    parameter Real MK = m0KP + m0KI;
    parameter Real MCa = m0CaP + m0CaI;
    parameter Real MMg = m0MgP + m0MgI;
    parameter Real MPi = m0PiP + m0PiI;
    //mobilni ionty
    Real mClE;
    Real mClP;
    Real mClI;
    Real mNaP;
    Real mNaI;
    Real mKP;
    Real mKI;
    Real mCaP;
    Real mCaI;
    Real mMgP;
    Real mMgI;
    Real mPiP;
    Real mPiI;
    //13
    Real Vew;
    Real Vpw;
    Real Viw;
    //3
    Real HCO3E;
    Real HCO3P;
    Real HCO3I;
    //3
    //ostatni
    //pH
    Real pHE(start = 6.4);
    Real pHP(start = 6.4);
    Real pHI;
    //Z
    Real ZPi;
    Real ZAlb;
    Real ZHb;
    Real ZDPG;
    Real ZATP;
    Real ZGSH;
    Real fiHb;
    //karbonaty
    Real CO3E;
    Real CO3P;
    Real CO3I;
    //C
    Real C_NaE;
    Real C_KE;
    Real C_ClE;
    Real C_Hb;
    Real C_DPG;
    Real C_ATP;
    Real C_GSH;
    Real C_imE;
    Real C_PiE;
    //
    Real C_NaP;
    Real C_NaI;
    Real C_KP;
    Real C_KI;
    Real C_CaP;
    Real C_CaI;
    Real C_MgP;
    Real C_MgI;
    Real C_ClP;
    Real C_ClI;
    Real C_PiP;
    Real C_PiI;
    Real C_AlbP;
    Real C_AlbI;
    Real C_imP;
    Real C_imI;
    //
    Real BE;
    Real SIDp;
    Real SIDe;
    Real SIDi;
    Real SIDp2;
    Real SID;
    Real fH;
    Real fB;
  equation
    //zachovani hmoty
    MCl = mClE + mClP + mClI;
    MNa = mNaP + mNaI;
    MK = mKP + mKI;
    MCa = mCaP + mCaI;
    MMg = mMgP + mMgI;
    MPi = mPiP + mPiI;
    //6
    Vew0 + Vpw0 + Viw0 = Vew + Vpw + Viw;
    //1
    //donan
    C_ClE / C_ClP = HCO3E / HCO3P;
    C_ClI / C_ClP = HCO3I / HCO3P;
    C_ClI / C_ClP = C_NaP / C_NaI;
    C_ClI / C_ClP = C_KP / C_KI;
    (C_ClI / C_ClP) ^ 2 = C_CaP / C_CaI;
    (C_ClI / C_ClP) ^ 2 = C_MgP / C_MgI;
    (C_ClI / C_ClP) ^ abs(ZPi) = C_PiI / C_PiP;
    //7
    //elektroneutralita
    C_NaP + C_KP + 2 * C_CaP + 2 * C_MgP - C_ClP - HCO3P - 2 * CO3P + ZPi * C_PiP + ZAlb * C_AlbP + ZimP * imP = 0;
    C_NaI + C_KI + 2 * C_CaI + 2 * C_MgI - C_ClI - HCO3I - 2 * CO3I + ZPi * C_PiI + ZAlb * C_AlbI + ZimI * imI = 0;
    C_NaE + C_KE - C_ClE - HCO3E - 2 * CO3E + ZHb * C_Hb + ZDPG * C_DPG + ZATP * C_ATP + ZGSH * C_GSH + ZimE * imE = 0;
    //3
    //osmoticka rovnovaha
    0.93 * (C_NaP - C_NaI) + 0.93 * (C_KP - C_KI) + 0.93 * (C_ClP - C_ClI) + C_CaP - C_CaI + C_MgP - C_MgI + 0.93 * (HCO3P - HCO3I) + 0.93 * (CO3P - CO3I) + 0.93 * (C_PiP - C_PiI) + C_AlbP - C_AlbI + C_imP - C_imI = 0;
    0.93 * (C_NaP - C_NaE) + 0.93 * (C_KP - C_KE) + 0.93 * (C_ClP - C_ClE) + 0.93 * (C_PiP - C_PiE) + C_imP - C_imE + C_CaP + C_MgP + C_AlbP - fiHb * C_Hb - C_DPG - C_ATP - C_GSH = 0;
    //2
    //ostatni
    //Z
    ZHb = 15.6 - 23 * ((10 ^ pHE - 6.69) / (1 + 10 ^ pHE - 6.69)) - 4 * ((10 ^ pHE - 7.89) / (1 + 10 ^ pHE - 7.89));
    ZDPG = (-3) - 1 * ((10 ^ pHE - 7.56) / (1 + 10 ^ pHE - 7.56)) - 1 * ((10 ^ pHE - 7.32) / (1 + 10 ^ pHE - 7.32));
    ZATP = (-3) - 1 * ((10 ^ pHE - 6.8) / (1 + 10 ^ pHE - 6.8));
    ZGSH = (-1) - 1 * ((10 ^ pHE - 8.54) / (1 + 10 ^ pHE - 8.54)) - 1 * ((10 ^ pHE - 9.42) / (1 + 10 ^ pHE - 9.42));
    ZPi = (-1) - (10 ^ pHP - 6.87) / (1 + 10 ^ pHP - 6.87);
    ZAlb = (-10.7) - 16 * ((10 ^ pHP - 7.42) / (1 + 10 ^ pHP - 7.42));
    fiHb = 1 + 0.115 * C_Hb + 0.0256 * C_Hb ^ 2;
    //karbonaty a pH
    HCO3E = 0.026 * PaCO2 * 10 ^ (pHE - 6.11);
    CO3E = HCO3E * 10 ^ (pHE - 10.2);
    HCO3P = 0.0306 * PaCO2 * 10 ^ (pHP - 6.11);
    CO3P = HCO3P * 10 ^ (pHP - 10.2);
    HCO3I = 0.0326 * PaCO2int * 10 ^ (pHI - 6.11);
    CO3I = HCO3I * 10 ^ (pHI - 10.2);
    //C
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
    //
    BE = (1 - 0.023 * C_Hb) * (HCO3P - 24.4 + (2.3 * C_Hb + 7.7) * (pHP - 7.4));
    SIDp = C_NaP + C_KP + 2 * C_CaP + 2 * C_MgP - C_ClP;
    SIDi = C_NaI + C_KI + 2 * C_CaI + 2 * C_MgI - C_ClI;
    SIDe = C_NaE + C_KE - C_ClP;
    SIDp2 = -((-HCO3P) - 2 * CO3P + ZPi * C_PiP + ZAlb * C_AlbP);
    fH = (Vew + Vew / 0.73 * (1 - 0.73)) / (Vew + Vew / 0.73 * (1 - 0.73) + Vpw + Vpw / 0.94 * (1 - 0.94));
    fB = Vblood / (Vblood + Vint);
    SID = (1 - (1 - HCO3E / HCO3P) * fH * fB) * HCO3P + (1 - fH * fB) * (C_AlbP * (8 * pHP - 41) + C_PiP * (0.3 * pHP - 0.4)) + C_Hb * fB * (10.2 * pHP - 73.6) + C_DPG * fH * fB * (0.7 * pHP - 0.5);
    //  SID=(1-(1-(HCO3E/HCO3P))*((Vew+(Vew/0.73*(1-0.73)))/((Vew+(Vew/0.73*(1-0.73))))+(Vpw+(Vpw/0.94*(1-0.94))*(Vblood/(Vblood+Vint)))*HCO3P+(1-((Vew+(Vew/0.73*(1-0.73)))/((Vew+(Vew/0.73*(1-0.73))))*(Vblood/(Vblood+Vint)))
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end IPE8;

  model IPE9_vstupy
    Real NaE(start = 10);
    parameter Real KE = 99;
    parameter Real ClE = 55.3;
    parameter Real Hb = 5.3;
    parameter Real DPG = 4.4;
    parameter Real ATP = 1.8;
    parameter Real GSH = 2.2;
    parameter Real imE = 95.9;
    parameter Real PiE = 0.67;
    //
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
    //
    parameter Real ZimE = 0.02;
    parameter Real ZimI = 0.012;
    parameter Real ZimP = -0.2;
    //
    parameter Real Vblood = 1;
    parameter Real Vint = 2;
    parameter Real PaCO2 = 46;
    //
    //
    parameter Real Vew0 = 0.44 * 0.73 * Vblood;
    parameter Real Vpw0 = (1 - 0.44) * 0.94 * Vblood;
    parameter Real Viw0 = Vint;
    //
    Real m0NaE;
    parameter Real m0KE = KE * Vew0;
    parameter Real m0ClE = ClE * Vew0;
    parameter Real m0Hb = Hb * Vew0;
    parameter Real m0DPG = DPG * Vew0;
    parameter Real m0ATP = ATP * Vew0;
    parameter Real m0GSH = GSH * Vew0;
    parameter Real m0imE = imE * Vew0;
    parameter Real m0PiE = PiE * Vew0;
    //
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
    //celkovy mnozstvi
    parameter Real MCl = m0ClE + m0ClP + m0ClI;
    parameter Real MNa = m0NaP + m0NaI;
    parameter Real MK = m0KP + m0KI;
    parameter Real MCa = m0CaP + m0CaI;
    parameter Real MMg = m0MgP + m0MgI;
    parameter Real MPi = m0PiP + m0PiI;
    //mobilni ionty
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
    //13
    Real Vew(start = Vew0);
    Real Vpw(start = Vpw0);
    Real Viw(start = Viw0);
    //3
    Real HCO3E;
    Real HCO3P;
    Real HCO3I;
    //3
    //ostatni
    //pH
    parameter Real pHE(start = 7.22);
    Real pHP(start = 7.4);
    Real pHI(start = 7.39);
    //Z
    Real ZPi;
    Real ZAlb;
    Real ZHb;
    Real ZDPG;
    Real ZATP;
    Real ZGSH;
    Real fiHb;
    //karbonaty
    Real CO3E;
    Real CO3P;
    Real CO3I;
    //C
    Real C_NaE;
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
    //
    Real BE;
    Real SIDp;
    Real SIDe;
    Real SIDi;
    Real SIDp2;
    Real SID;
    Real fH;
    Real fB;
  equation
    m0NaE = NaE * Vew0;
    //zachovani hmoty
    MCl = mClE + mClP + mClI;
    MNa = mNaP + mNaI;
    MK = mKP + mKI;
    MCa = mCaP + mCaI;
    MMg = mMgP + mMgI;
    MPi = mPiP + mPiI;
    //6
    Vew0 + Vpw0 + Viw0 = Vew + Vpw + Viw;
    //1
    //donan
    C_ClE / C_ClP = 0.92 * (HCO3E / HCO3P);
    C_ClI / C_ClP = 0.92 * (HCO3I / HCO3P);
    //C_ClE / C_ClP = (HCO3E / HCO3P);
    //C_ClI / C_ClP = (HCO3I / HCO3P);
    C_ClI / C_ClP = C_NaP / C_NaI;
    C_ClI / C_ClP = C_KP / C_KI;
    (C_ClI / C_ClP) ^ 2 = C_CaP / C_CaI;
    (C_ClI / C_ClP) ^ 2 = C_MgP / C_MgI;
    (C_ClI / C_ClP) ^ abs(ZPi) = C_PiI / C_PiP;
    //7
    //elektroneutralita
    C_NaP + C_KP + 2 * C_CaP + 2 * C_MgP - C_ClP - HCO3P - 2 * CO3P + ZPi * C_PiP + ZAlb * C_AlbP + ZimP * imP = 0;
    C_NaI + C_KI + 2 * C_CaI + 2 * C_MgI - C_ClI - HCO3I - 2 * CO3I + ZPi * C_PiI + ZAlb * C_AlbI + ZimI * imI = 0;
    C_NaE + C_KE - C_ClE - HCO3E - 2 * CO3E + ZHb * C_Hb + ZDPG * C_DPG + ZATP * C_ATP + ZGSH * C_GSH + ZimE * imE = 0;
    //3
    //osmoticka rovnovaha
    0.93 * (C_NaP - C_NaI) + 0.93 * (C_KP - C_KI) + 0.93 * (C_ClP - C_ClI) + C_CaP - C_CaI + C_MgP - C_MgI + 0.93 * (HCO3P - HCO3I) + 0.93 * (CO3P - CO3I) + 0.93 * (C_PiP - C_PiI) + C_AlbP - C_AlbI + C_imP - C_imI = 0;
    0.93 * (C_NaP - C_NaE) + 0.93 * (C_KP - C_KE) + 0.93 * (C_ClP - C_ClE) + 0.93 * (C_PiP - C_PiE) + C_imP - C_imE + C_CaP + C_MgP + C_AlbP - fiHb * C_Hb - C_DPG - C_ATP - C_GSH = 0;
    //2
    //ostatni
    //Z
    ZHb = 15.6 - 23 * (10 ^ (pHE - 6.69) / (1 + 10 ^ (pHE - 6.69))) - 4 * (10 ^ (pHE - 7.89) / (1 + 10 ^ (pHE - 7.89))) + 1.5 * ((1 - 0.75) / 0.75);
    ZDPG = (-3) - 1 * (10 ^ (pHE - 7.56) / (1 + 10 ^ (pHE - 7.56))) - 1 * (10 ^ (pHE - 7.32) / (1 + 10 ^ (pHE - 7.32)));
    ZATP = (-3) - 1 * (10 ^ (pHE - 6.8) / (1 + 10 ^ (pHE - 6.8)));
    ZGSH = (-1) - 1 * (10 ^ (pHE - 8.54) / (1 + 10 ^ (pHE - 8.54))) - 1 * (10 ^ (pHE - 9.42) / (1 + 10 ^ (pHE - 9.42)));
    ZPi = (-1) - 10 ^ (pHP - 6.87) / (1 + 10 ^ (pHP - 6.87));
    ZAlb = (-10.7) - 16 * (10 ^ (pHP - 7.42) / (1 + 10 ^ (pHP - 7.42)));
    fiHb = 1 + 0.115 * C_Hb + 0.0256 * C_Hb ^ 2;
    //karbonaty a pH
    HCO3E = 0.026 * PaCO2 * 10 ^ (pHE - 6.11);
    CO3E = HCO3E * 10 ^ (pHE - 10.2);
    HCO3P = 0.0306 * PaCO2 * 10 ^ (pHP - 6.11);
    CO3P = HCO3P * 10 ^ (pHP - 10.2);
    HCO3I = 0.0326 * PaCO2 * 10 ^ (pHI - 6.11);
    CO3I = HCO3I * 10 ^ (pHI - 10.2);
    //C
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
    //
    BE = (1 - 0.023 * C_Hb) * (HCO3P - 24.4 + (2.3 * C_Hb + 7.7) * (pHP - 7.4));
    SIDp = C_NaP + C_KP + 2 * C_CaP + 2 * C_MgP - C_ClP;
    SIDi = C_NaI + C_KI + 2 * C_CaI + 2 * C_MgI - C_ClI;
    SIDe = C_NaE + C_KE - C_ClP;
    SIDp2 = -((-HCO3P) - 2 * CO3P + ZPi * C_PiP + ZAlb * C_AlbP);
    fH = (Vew + Vew / 0.73 * (1 - 0.73)) / (Vew + Vew / 0.73 * (1 - 0.73) + Vpw + Vpw / 0.94 * (1 - 0.94));
    fB = Vblood / (Vblood + Vint);
    SID = (1 - (1 - HCO3E / HCO3P) * fH * fB) * HCO3P + (1 - fH * fB) * (C_AlbP * (8 * pHP - 41) + C_PiP * (0.3 * pHP - 0.4)) + C_Hb * fB * (10.2 * pHP - 73.6) + C_DPG * fH * fB * (0.7 * pHP - 0.5);
    //  SID=(1-(1-(HCO3E/HCO3P))*((Vew+(Vew/0.73*(1-0.73)))/((Vew+(Vew/0.73*(1-0.73))))+(Vpw+(Vpw/0.94*(1-0.94))*(Vblood/(Vblood+Vint)))*HCO3P+(1-((Vew+(Vew/0.73*(1-0.73)))/((Vew+(Vew/0.73*(1-0.73))))*(Vblood/(Vblood+Vint)))
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end IPE9_vstupy;

  model IPE10_ClE
    parameter Real NaE = 10;
    parameter Real KE = 99;
    Real ClE(start = 55.3);
    parameter Real Hb = 5.3;
    parameter Real DPG = 4.4;
    parameter Real ATP = 1.8;
    parameter Real GSH = 2.2;
    parameter Real imE = 95.9;
    parameter Real PiE = 0.67;
    //
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
    //
    parameter Real ZimE = 0.02;
    parameter Real ZimI = 0.012;
    parameter Real ZimP = -0.2;
    //
    parameter Real Vblood = 1;
    parameter Real Vint = 2;
    parameter Real PaCO2 = 46;
    //
    //
    parameter Real Vew0 = 0.44 * 0.73 * Vblood;
    parameter Real Vpw0 = (1 - 0.44) * 0.94 * Vblood;
    parameter Real Viw0 = Vint;
    //
    parameter Real m0NaE = NaE * Vew0;
    parameter Real m0KE = KE * Vew0;
    Real m0ClE;
    parameter Real m0Hb = Hb * Vew0;
    parameter Real m0DPG = DPG * Vew0;
    parameter Real m0ATP = ATP * Vew0;
    parameter Real m0GSH = GSH * Vew0;
    parameter Real m0imE = imE * Vew0;
    parameter Real m0PiE = PiE * Vew0;
    //
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
    //celkovy mnozstvi
    Real MCl;
    parameter Real MNa = m0NaP + m0NaI;
    parameter Real MK = m0KP + m0KI;
    parameter Real MCa = m0CaP + m0CaI;
    parameter Real MMg = m0MgP + m0MgI;
    parameter Real MPi = m0PiP + m0PiI;
    //mobilni ionty
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
    //13
    Real Vew(start = Vew0);
    Real Vpw(start = Vpw0);
    Real Viw(start = Viw0);
    //3
    Real HCO3E;
    Real HCO3P;
    Real HCO3I;
    //3
    //ostatni
    //pH
    parameter Real pHE(start = 7.22);
    Real pHP(start = 7.4);
    Real pHI(start = 7.39);
    //Z
    Real ZPi;
    Real ZAlb;
    Real ZHb;
    Real ZDPG;
    Real ZATP;
    Real ZGSH;
    Real fiHb;
    //karbonaty
    Real CO3E;
    Real CO3P;
    Real CO3I;
    //C
    Real C_NaE(start = NaE);
    Real C_KE(start = KE);
    Real C_ClE;
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
    //
    Real BE;
    Real SIDp;
    Real SIDe;
    Real SIDi;
    Real SIDp2;
    Real SID;
    Real fH;
    Real fB;
  equation
    MCl = m0ClE + m0ClP + m0ClI;
    m0ClE = ClE * Vew0;
    //zachovani hmoty
    MCl = mClE + mClP + mClI;
    MNa = mNaP + mNaI;
    MK = mKP + mKI;
    MCa = mCaP + mCaI;
    MMg = mMgP + mMgI;
    MPi = mPiP + mPiI;
    //6
    Vew0 + Vpw0 + Viw0 = Vew + Vpw + Viw;
    //1
    //donan
    C_ClE / C_ClP = 0.92 * (HCO3E / HCO3P);
    C_ClI / C_ClP = 0.92 * (HCO3I / HCO3P);
    //C_ClE / C_ClP = (HCO3E / HCO3P);
    //C_ClI / C_ClP = (HCO3I / HCO3P);
    C_ClI / C_ClP = C_NaP / C_NaI;
    C_ClI / C_ClP = C_KP / C_KI;
    (C_ClI / C_ClP) ^ 2 = C_CaP / C_CaI;
    (C_ClI / C_ClP) ^ 2 = C_MgP / C_MgI;
    (C_ClI / C_ClP) ^ abs(ZPi) = C_PiI / C_PiP;
    //7
    //elektroneutralita
    C_NaP + C_KP + 2 * C_CaP + 2 * C_MgP - C_ClP - HCO3P - 2 * CO3P + ZPi * C_PiP + ZAlb * C_AlbP + ZimP * imP = 0;
    C_NaI + C_KI + 2 * C_CaI + 2 * C_MgI - C_ClI - HCO3I - 2 * CO3I + ZPi * C_PiI + ZAlb * C_AlbI + ZimI * imI = 0;
    C_NaE + C_KE - C_ClE - HCO3E - 2 * CO3E + ZHb * C_Hb + ZDPG * C_DPG + ZATP * C_ATP + ZGSH * C_GSH + ZimE * imE = 0;
    //3
    //osmoticka rovnovaha
    0.93 * (C_NaP - C_NaI) + 0.93 * (C_KP - C_KI) + 0.93 * (C_ClP - C_ClI) + C_CaP - C_CaI + C_MgP - C_MgI + 0.93 * (HCO3P - HCO3I) + 0.93 * (CO3P - CO3I) + 0.93 * (C_PiP - C_PiI) + C_AlbP - C_AlbI + C_imP - C_imI = 0;
    0.93 * (C_NaP - C_NaE) + 0.93 * (C_KP - C_KE) + 0.93 * (C_ClP - C_ClE) + 0.93 * (C_PiP - C_PiE) + C_imP - C_imE + C_CaP + C_MgP + C_AlbP - fiHb * C_Hb - C_DPG - C_ATP - C_GSH = 0;
    //2
    //ostatni
    //Z
    ZHb = 15.6 - 23 * (10 ^ (pHE - 6.69) / (1 + 10 ^ (pHE - 6.69))) - 4 * (10 ^ (pHE - 7.89) / (1 + 10 ^ (pHE - 7.89))) + 1.5 * ((1 - 0.75) / 0.75);
    ZDPG = (-3) - 1 * (10 ^ (pHE - 7.56) / (1 + 10 ^ (pHE - 7.56))) - 1 * (10 ^ (pHE - 7.32) / (1 + 10 ^ (pHE - 7.32)));
    ZATP = (-3) - 1 * (10 ^ (pHE - 6.8) / (1 + 10 ^ (pHE - 6.8)));
    ZGSH = (-1) - 1 * (10 ^ (pHE - 8.54) / (1 + 10 ^ (pHE - 8.54))) - 1 * (10 ^ (pHE - 9.42) / (1 + 10 ^ (pHE - 9.42)));
    ZPi = (-1) - 10 ^ (pHP - 6.87) / (1 + 10 ^ (pHP - 6.87));
    ZAlb = (-10.7) - 16 * (10 ^ (pHP - 7.42) / (1 + 10 ^ (pHP - 7.42)));
    fiHb = 1 + 0.115 * C_Hb + 0.0256 * C_Hb ^ 2;
    //karbonaty a pH
    HCO3E = 0.026 * PaCO2 * 10 ^ (pHE - 6.11);
    CO3E = HCO3E * 10 ^ (pHE - 10.2);
    HCO3P = 0.0306 * PaCO2 * 10 ^ (pHP - 6.11);
    CO3P = HCO3P * 10 ^ (pHP - 10.2);
    HCO3I = 0.0326 * PaCO2 * 10 ^ (pHI - 6.11);
    CO3I = HCO3I * 10 ^ (pHI - 10.2);
    //C
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
    //
    BE = (1 - 0.023 * C_Hb) * (HCO3P - 24.4 + (2.3 * C_Hb + 7.7) * (pHP - 7.4));
    SIDp = C_NaP + C_KP + 2 * C_CaP + 2 * C_MgP - C_ClP;
    SIDi = C_NaI + C_KI + 2 * C_CaI + 2 * C_MgI - C_ClI;
    SIDe = C_NaE + C_KE - C_ClP;
    SIDp2 = -((-HCO3P) - 2 * CO3P + ZPi * C_PiP + ZAlb * C_AlbP);
    fH = (Vew + Vew / 0.73 * (1 - 0.73)) / (Vew + Vew / 0.73 * (1 - 0.73) + Vpw + Vpw / 0.94 * (1 - 0.94));
    fB = Vblood / (Vblood + Vint);
    SID = (1 - (1 - HCO3E / HCO3P) * fH * fB) * HCO3P + (1 - fH * fB) * (C_AlbP * (8 * pHP - 41) + C_PiP * (0.3 * pHP - 0.4)) + C_Hb * fB * (10.2 * pHP - 73.6) + C_DPG * fH * fB * (0.7 * pHP - 0.5);
    //  SID=(1-(1-(HCO3E/HCO3P))*((Vew+(Vew/0.73*(1-0.73)))/((Vew+(Vew/0.73*(1-0.73))))+(Vpw+(Vpw/0.94*(1-0.94))*(Vblood/(Vblood+Vint)))*HCO3P+(1-((Vew+(Vew/0.73*(1-0.73)))/((Vew+(Vew/0.73*(1-0.73))))*(Vblood/(Vblood+Vint)))
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end IPE10_ClE;

  model IPE11_PaCO
    parameter Real NaE = 10;
    parameter Real KE = 99;
    parameter Real ClE = 55.3;
    parameter Real Hb = 5.3;
    parameter Real DPG = 4.4;
    parameter Real ATP = 1.8;
    parameter Real GSH = 2.2;
    parameter Real imE = 95.9;
    parameter Real PiE = 0.67;
    //
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
    //
    parameter Real ZimE = 0.02;
    parameter Real ZimI = 0.012;
    parameter Real ZimP = -0.2;
    //
    parameter Real Vblood = 1;
    parameter Real Vint = 2;
    Real PaCO2(start = 46);
    //
    //
    parameter Real Vew0 = 0.44 * 0.73 * Vblood;
    parameter Real Vpw0 = (1 - 0.44) * 0.94 * Vblood;
    parameter Real Viw0 = Vint;
    //
    parameter Real m0NaE = NaE * Vew0;
    parameter Real m0KE = KE * Vew0;
    parameter Real m0ClE = ClE * Vew0;
    parameter Real m0Hb = Hb * Vew0;
    parameter Real m0DPG = DPG * Vew0;
    parameter Real m0ATP = ATP * Vew0;
    parameter Real m0GSH = GSH * Vew0;
    parameter Real m0imE = imE * Vew0;
    parameter Real m0PiE = PiE * Vew0;
    //
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
    //celkovy mnozstvi
    parameter Real MCl = m0ClE + m0ClP + m0ClI;
    parameter Real MNa = m0NaP + m0NaI;
    parameter Real MK = m0KP + m0KI;
    parameter Real MCa = m0CaP + m0CaI;
    parameter Real MMg = m0MgP + m0MgI;
    parameter Real MPi = m0PiP + m0PiI;
    //mobilni ionty
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
    //13
    Real Vew(start = Vew0);
    Real Vpw(start = Vpw0);
    Real Viw(start = Viw0);
    //3
    Real HCO3E;
    Real HCO3P;
    Real HCO3I;
    //3
    //ostatni
    //pH
    parameter Real pHE(start = 7.22);
    Real pHP(start = 7.4);
    Real pHI(start = 7.39);
    //Z
    Real ZPi;
    Real ZAlb;
    Real ZHb;
    Real ZDPG;
    Real ZATP;
    Real ZGSH;
    Real fiHb;
    //karbonaty
    Real CO3E;
    Real CO3P;
    Real CO3I;
    //C
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
    //
    Real BE;
    Real SIDp;
    Real SIDe;
    Real SIDi;
    Real SIDp2;
    Real SID;
    Real fH;
    Real fB;
  equation
    //zachovani hmoty
    MCl = mClE + mClP + mClI;
    MNa = mNaP + mNaI;
    MK = mKP + mKI;
    MCa = mCaP + mCaI;
    MMg = mMgP + mMgI;
    MPi = mPiP + mPiI;
    //6
    Vew0 + Vpw0 + Viw0 = Vew + Vpw + Viw;
    //1
    //donan
    C_ClE / C_ClP = 0.92 * (HCO3E / HCO3P);
    C_ClI / C_ClP = 0.92 * (HCO3I / HCO3P);
    //C_ClE / C_ClP = (HCO3E / HCO3P);
    //C_ClI / C_ClP = (HCO3I / HCO3P);
    C_ClI / C_ClP = C_NaP / C_NaI;
    C_ClI / C_ClP = C_KP / C_KI;
    (C_ClI / C_ClP) ^ 2 = C_CaP / C_CaI;
    (C_ClI / C_ClP) ^ 2 = C_MgP / C_MgI;
    (C_ClI / C_ClP) ^ abs(ZPi) = C_PiI / C_PiP;
    //7
    //elektroneutralita
    C_NaP + C_KP + 2 * C_CaP + 2 * C_MgP - C_ClP - HCO3P - 2 * CO3P + ZPi * C_PiP + ZAlb * C_AlbP + ZimP * imP = 0;
    C_NaI + C_KI + 2 * C_CaI + 2 * C_MgI - C_ClI - HCO3I - 2 * CO3I + ZPi * C_PiI + ZAlb * C_AlbI + ZimI * imI = 0;
    C_NaE + C_KE - C_ClE - HCO3E - 2 * CO3E + ZHb * C_Hb + ZDPG * C_DPG + ZATP * C_ATP + ZGSH * C_GSH + ZimE * imE = 0;
    //3
    //osmoticka rovnovaha
    0.93 * (C_NaP - C_NaI) + 0.93 * (C_KP - C_KI) + 0.93 * (C_ClP - C_ClI) + C_CaP - C_CaI + C_MgP - C_MgI + 0.93 * (HCO3P - HCO3I) + 0.93 * (CO3P - CO3I) + 0.93 * (C_PiP - C_PiI) + C_AlbP - C_AlbI + C_imP - C_imI = 0;
    0.93 * (C_NaP - C_NaE) + 0.93 * (C_KP - C_KE) + 0.93 * (C_ClP - C_ClE) + 0.93 * (C_PiP - C_PiE) + C_imP - C_imE + C_CaP + C_MgP + C_AlbP - fiHb * C_Hb - C_DPG - C_ATP - C_GSH = 0;
    //2
    //ostatni
    //Z
    ZHb = 15.6 - 23 * (10 ^ (pHE - 6.69) / (1 + 10 ^ (pHE - 6.69))) - 4 * (10 ^ (pHE - 7.89) / (1 + 10 ^ (pHE - 7.89))) + 1.5 * ((1 - 0.75) / 0.75);
    ZDPG = (-3) - 1 * (10 ^ (pHE - 7.56) / (1 + 10 ^ (pHE - 7.56))) - 1 * (10 ^ (pHE - 7.32) / (1 + 10 ^ (pHE - 7.32)));
    ZATP = (-3) - 1 * (10 ^ (pHE - 6.8) / (1 + 10 ^ (pHE - 6.8)));
    ZGSH = (-1) - 1 * (10 ^ (pHE - 8.54) / (1 + 10 ^ (pHE - 8.54))) - 1 * (10 ^ (pHE - 9.42) / (1 + 10 ^ (pHE - 9.42)));
    ZPi = (-1) - 10 ^ (pHP - 6.87) / (1 + 10 ^ (pHP - 6.87));
    ZAlb = (-10.7) - 16 * (10 ^ (pHP - 7.42) / (1 + 10 ^ (pHP - 7.42)));
    fiHb = 1 + 0.115 * C_Hb + 0.0256 * C_Hb ^ 2;
    //karbonaty a pH
    HCO3E = 0.026 * PaCO2 * 10 ^ (pHE - 6.11);
    CO3E = HCO3E * 10 ^ (pHE - 10.2);
    HCO3P = 0.0306 * PaCO2 * 10 ^ (pHP - 6.11);
    CO3P = HCO3P * 10 ^ (pHP - 10.2);
    HCO3I = 0.0326 * PaCO2 * 10 ^ (pHI - 6.11);
    CO3I = HCO3I * 10 ^ (pHI - 10.2);
    //C
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
    //
    BE = (1 - 0.023 * C_Hb) * (HCO3P - 24.4 + (2.3 * C_Hb + 7.7) * (pHP - 7.4));
    SIDp = C_NaP + C_KP + 2 * C_CaP + 2 * C_MgP - C_ClP;
    SIDi = C_NaI + C_KI + 2 * C_CaI + 2 * C_MgI - C_ClI;
    SIDe = C_NaE + C_KE - C_ClP;
    SIDp2 = -((-HCO3P) - 2 * CO3P + ZPi * C_PiP + ZAlb * C_AlbP);
    fH = (Vew + Vew / 0.73 * (1 - 0.73)) / (Vew + Vew / 0.73 * (1 - 0.73) + Vpw + Vpw / 0.94 * (1 - 0.94));
    fB = Vblood / (Vblood + Vint);
    SID = (1 - (1 - HCO3E / HCO3P) * fH * fB) * HCO3P + (1 - fH * fB) * (C_AlbP * (8 * pHP - 41) + C_PiP * (0.3 * pHP - 0.4)) + C_Hb * fB * (10.2 * pHP - 73.6) + C_DPG * fH * fB * (0.7 * pHP - 0.5);
    //  SID=(1-(1-(HCO3E/HCO3P))*((Vew+(Vew/0.73*(1-0.73)))/((Vew+(Vew/0.73*(1-0.73))))+(Vpw+(Vpw/0.94*(1-0.94))*(Vblood/(Vblood+Vint)))*HCO3P+(1-((Vew+(Vew/0.73*(1-0.73)))/((Vew+(Vew/0.73*(1-0.73))))*(Vblood/(Vblood+Vint)))
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end IPE11_PaCO;

  model IPE13_BE

  //model IPE12_promenyPHE2
    //vychozi koncentrace iontu[mmol/l]
    //erytrocyty
    parameter Real NaE = 10;
    parameter Real KE = 99;
    parameter Real ClE = 55.3;
    parameter Real Hb = 5.3;
    parameter Real DPG = 4.4;
    parameter Real ATP = 1.8;
    parameter Real GSH = 2.2;
    parameter Real imE = 95.9;
    parameter Real PiE = 0.67;
    //plasma a intersticium
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
    //naboj im
    parameter Real ZimE = 0.02;
    parameter Real ZimI = 0.012;
    parameter Real ZimP = -0.2;
    //pocatecni objemy[l]
    parameter Real Vblood = 1;
    parameter Real Vint = 2;
    Real PaCO2(start = 10, unit = "torr");
    //
    //
    parameter Real hemat = 0.44;
    /*hematocrit*/
    parameter Real few = 0.73;
    /*frakce vody erytrocytu*/
    parameter Real fpw = 0.94;
    /*frakce vody plasmy*/
    parameter Real Vew0 = hemat * few * Vblood;
    parameter Real Vpw0 = (1 - hemat) * fpw * Vblood;
    parameter Real Viw0 = Vint;
    //
    parameter Real fi = 0.93;
    /*osmoticky koeficient*/
    parameter Real HbSat = 0.75;
    /*nasyceni hemoglobinu*/
    //
    //mnozstvi iontu [mmol]
    parameter Real m0NaE = NaE * Vew0;
    parameter Real m0KE = KE * Vew0;
    parameter Real m0ClE = ClE * Vew0;
    parameter Real m0Hb = Hb * Vew0;
    parameter Real m0DPG = DPG * Vew0;
    parameter Real m0ATP = ATP * Vew0;
    parameter Real m0GSH = GSH * Vew0;
    parameter Real m0imE = imE * Vew0;
    parameter Real m0PiE = PiE * Vew0;
    //
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
    //celkovy mnozstvi
    Real xCl;
    Real MCl;
    parameter Real MNa = m0NaP + m0NaI;
    parameter Real MK = m0KP + m0KI;
    parameter Real MCa = m0CaP + m0CaI;
    parameter Real MMg = m0MgP + m0MgI;
    parameter Real MPi = m0PiP + m0PiI;
    //mobilni ionty
    Real mClE(unit = "mmol");
    Real mClP(start = m0ClP, unit = "mmol");
    Real mClI(unit = "mmol");
    Real mNaP(unit = "mmol");
    Real mNaI(unit = "mmol");
    Real mKP(start = m0KP, unit = "mmol");
    Real mKI(start = m0KI);
    Real mCaP(unit = "mmol");
    Real mCaI(start = m0CaI, unit = "mmol");
    Real mMgP(start = m0MgP, unit = "mmol");
    Real mMgI(start = m0MgI, unit = "mmol");
    Real mPiP(start = m0PiP, unit = "mmol");
    Real mPiI(start = m0PiI, unit = "mmol");
    //13
    Real Vew(start = Vew0, unit = "l");
    Real Vpw(start = Vpw0, unit = "l");
    Real Viw(start = Viw0, unit = "l");
    //3
    Real HCO3E(unit = "mmol/l");
    Real HCO3P(unit = "mmol/l");
    Real HCO3I(unit = "mmol/l");
    //3
    //ostatni
    //pH
    Real pHE(start = 7.22);
    Real pHP(start = 7.4);
    Real pHI(start = 7.39);
    //pH zavisle valence
    Real ZPi;
    Real ZAlb;
    Real ZHb;
    Real ZDPG;
    Real ZATP;
    Real ZGSH;
    Real fiHb;
    //karbonaty
    Real CO3E(unit = "mmol/l");
    Real CO3P(unit = "mmol/l");
    Real CO3I(unit = "mmol/l");
    //C
    Real C_NaE(start = NaE, unit = "mmol/l");
    Real C_KE(start = KE, unit = "mmol/l");
    Real C_ClE(start = ClE, unit = "mmol/l");
    Real C_Hb(start = Hb, unit = "mmol/l");
    Real C_DPG(start = DPG, unit = "mmol/l");
    Real C_ATP(start = ATP, unit = "mmol/l");
    Real C_GSH(start = GSH, unit = "mmol/l");
    Real C_imE(start = imE, unit = "mmol/l");
    Real C_PiE(start = PiE, unit = "mmol/l");
    //
    Real C_NaP(start = NaP, unit = "mmol/l");
    Real C_NaI(start = NaI, unit = "mmol/l");
    Real C_KP(start = KP, unit = "mmol/l");
    Real C_KI(start = KI, unit = "mmol/l");
    Real C_CaP(start = CaP, unit = "mmol/l");
    Real C_CaI(start = CaI, unit = "mmol/l");
    Real C_MgP(start = MgP, unit = "mmol/l");
    Real C_MgI(start = MgI, unit = "mmol/l");
    Real C_ClP(start = ClP, unit = "mmol/l");
    Real C_ClI(start = ClI, unit = "mmol/l");
    Real C_PiP(start = PiP, unit = "mmol/l");
    Real C_PiI(start = PiI, unit = "mmol/l");
    Real C_AlbP(start = AlbP, unit = "mmol/l");
    Real C_AlbI(start = AlbI, unit = "mmol/l");
    Real C_imP(start = imP, unit = "mmol/l");
    Real C_imI(start = imI, unit = "mmol/l");
    //
    Real BE;
    Real SIDp;
    Real SIDe;
    Real SIDi;
    Real SIDp2;
    Real SID;
    Real fH;
    Real fB;
    Real rCl;
    Real rHCO3;
    Real hematocrit;
    Real BE2;
    Real BE3;
  equation
    PaCO2=10+(90*time);
    MCl = m0ClE + m0ClP + m0ClI+xCl;
    hematocrit = Vew / few / (Vpw / fpw + Vew / few);
    //pHE = 6.3 + time;
    rCl = C_ClE / C_ClP;
    rHCO3 = HCO3E / HCO3P;
    //zachovani hmoty
    MCl = mClE + mClP + mClI;
    MNa = mNaP + mNaI;
    MK = mKP + mKI;
    MCa = mCaP + mCaI;
    MMg = mMgP + mMgI;
    MPi = mPiP + mPiI;
    //6
    Vew0 + Vpw0 + Viw0 = Vew + Vpw + Viw;
    //1
    //donan
    C_ClE / C_ClP = 0.92 * (HCO3E / HCO3P);
    C_ClI / C_ClP = 0.92 * (HCO3I / HCO3P);
    //C_ClE / C_ClP = (HCO3E / HCO3P);
    //C_ClI / C_ClP = (HCO3I / HCO3P);
    C_ClI / C_ClP = C_NaP / C_NaI;
    C_ClI / C_ClP = C_KP / C_KI;
    (C_ClI / C_ClP) ^ 2 = C_CaP / C_CaI;
    (C_ClI / C_ClP) ^ 2 = C_MgP / C_MgI;
    (C_ClI / C_ClP) ^ abs(ZPi) = C_PiI / C_PiP;
    //7
    //elektroneutralita
    C_NaP + C_KP + 2 * C_CaP + 2 * C_MgP - C_ClP - HCO3P - 2 * CO3P + ZPi * C_PiP + ZAlb * C_AlbP + ZimP * imP = 0;
    C_NaI + C_KI + 2 * C_CaI + 2 * C_MgI - C_ClI - HCO3I - 2 * CO3I + ZPi * C_PiI + ZAlb * C_AlbI + ZimI * imI = 0;
    C_NaE + C_KE - C_ClE - HCO3E - 2 * CO3E + ZHb * C_Hb + ZDPG * C_DPG + ZATP * C_ATP + ZGSH * C_GSH + ZimE * imE = 0;
    //3
    //osmoticka rovnovaha
    fi * (C_NaP - C_NaI) + fi * (C_KP - C_KI) + fi * (C_ClP - C_ClI) + C_CaP - C_CaI + C_MgP - C_MgI + fi * (HCO3P - HCO3I) + fi * (CO3P - CO3I) + fi * (C_PiP - C_PiI) + C_AlbP - C_AlbI + C_imP - C_imI = 0;
    fi * (C_NaP - C_NaE) + fi * (C_KP - C_KE) + fi * (C_ClP - C_ClE) + fi * (C_PiP - C_PiE) + C_imP - C_imE + C_CaP + C_MgP + C_AlbP - fiHb * C_Hb - C_DPG - C_ATP - C_GSH = 0;
    //2
    //ostatni
    //Z
    ZHb = 15.6 - 23 * (10 ^ (pHE - 6.69) / (1 + 10 ^ (pHE - 6.69))) - 4 * (10 ^ (pHE - 7.89) / (1 + 10 ^ (pHE - 7.89))) + 1.5 * ((1 - HbSat) / HbSat);
    ZDPG = (-3) - 1 * (10 ^ (pHE - 7.56) / (1 + 10 ^ (pHE - 7.56))) - 1 * (10 ^ (pHE - 7.32) / (1 + 10 ^ (pHE - 7.32)));
    ZATP = (-3) - 1 * (10 ^ (pHE - 6.8) / (1 + 10 ^ (pHE - 6.8)));
    ZGSH = (-1) - 1 * (10 ^ (pHE - 8.54) / (1 + 10 ^ (pHE - 8.54))) - 1 * (10 ^ (pHE - 9.42) / (1 + 10 ^ (pHE - 9.42)));
    ZPi = (-1) - 10 ^ (pHP - 6.87) / (1 + 10 ^ (pHP - 6.87));
    ZAlb = (-10.7) - 16 * (10 ^ (pHP - 7.42) / (1 + 10 ^ (pHP - 7.42)));
    fiHb = 1 + 0.115 * C_Hb + 0.0256 * C_Hb ^ 2;
    //karbonaty a pH
    HCO3E = 0.026 * PaCO2 * 10 ^ (pHE - 6.11);
    CO3E = HCO3E * 10 ^ (pHE - 10.2);
    HCO3P = 0.0306 * PaCO2 * 10 ^ (pHP - 6.11);
    CO3P = HCO3P * 10 ^ (pHP - 10.2);
    HCO3I = 0.0326 * PaCO2 * 10 ^ (pHI - 6.11);
    CO3I = HCO3I * 10 ^ (pHI - 10.2);
    //C
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
    //
    BE = (1 - 0.023 * C_Hb) * (HCO3P - 24.4 + (2.3 * C_Hb + 7.7) * (pHP - 7.4));
    BE2 = (1 - 0.023 * 9) * (HCO3P - 24.4 + (2.3 * 9 + 7.7) * (pHP - 7.4));
    BE2=0;
    BE3 = 0.93 * (HCO3P - 24.4 + 14.8 * (pHP - 7.4));
    SIDp = C_NaP + C_KP + 2 * C_CaP + 2 * C_MgP - C_ClP;
    SIDi = C_NaI + C_KI + 2 * C_CaI + 2 * C_MgI - C_ClI;
    SIDe = C_NaE + C_KE - C_ClP;
    SIDp2 = -((-HCO3P) - 2 * CO3P + ZPi * C_PiP + ZAlb * C_AlbP);
    fH = (Vew + Vew / few * (1 - few)) / (Vew + Vew / few * (1 - few) + Vpw + Vpw / few * (1 - few));
    fB = Vblood / (Vblood + Vint);
    SID = (1 - (1 - HCO3E / HCO3P) * fH * fB) * HCO3P + (1 - fH * fB) * (C_AlbP * (8 * pHP - 41) + C_PiP * (0.3 * pHP - 0.4)) + C_Hb * fB * (10.2 * pHP - 73.6) + C_DPG * fH * fB * (0.7 * pHP - 0.5);
  //end IPE12_promenyPHE2;
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end IPE13_BE;

  //model IPE12_promenyPHE
  model IPE12_promenyPHE
    //vychozi koncentrace iontu[mmol/l]
    //erytrocyty
    parameter Real NaE = 10;
    parameter Real KE = 99;
    parameter Real ClE = 55.3;
    parameter Real Hb = 5.3;
    parameter Real DPG = 4.4;
    parameter Real ATP = 1.8;
    parameter Real GSH = 2.2;
    parameter Real imE = 95.9;
    parameter Real PiE = 0.67;
    //plasma a intersticium
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
    //naboj im
    parameter Real ZimE = 0.02;
    parameter Real ZimI = 0.012;
    parameter Real ZimP = -0.2;
    //pocatecni objemy[l]
    parameter Real Vblood = 1;
    parameter Real Vint = 2;
    Real PaCO2(start = 46, unit = "torr");
    //
    //
    parameter Real hemat = 0.44;
    /*hematocrit*/
    parameter Real few = 0.73;
    /*frakce vody erytrocytu*/
    parameter Real fpw = 0.94;
    /*frakce vody plasmy*/
    parameter Real Vew0 = hemat * few * Vblood;
    parameter Real Vpw0 = (1 - hemat) * fpw * Vblood;
    parameter Real Viw0 = Vint;
    //
    parameter Real fi = 0.93;
    /*osmoticky koeficient*/
    parameter Real HbSat = 0.75;
    /*nasyceni hemoglobinu*/
    //
    //mnozstvi iontu [mmol]
    parameter Real m0NaE = NaE * Vew0;
    parameter Real m0KE = KE * Vew0;
    parameter Real m0ClE = ClE * Vew0;
    parameter Real m0Hb = Hb * Vew0;
    parameter Real m0DPG = DPG * Vew0;
    parameter Real m0ATP = ATP * Vew0;
    parameter Real m0GSH = GSH * Vew0;
    parameter Real m0imE = imE * Vew0;
    parameter Real m0PiE = PiE * Vew0;
    //
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
    //celkovy mnozstvi
    parameter Real MCl = m0ClE + m0ClP + m0ClI;
    parameter Real MNa = m0NaP + m0NaI;
    parameter Real MK = m0KP + m0KI;
    parameter Real MCa = m0CaP + m0CaI;
    parameter Real MMg = m0MgP + m0MgI;
    parameter Real MPi = m0PiP + m0PiI;
    //mobilni ionty
    Real mClE(unit = "mmol");
    Real mClP(start = m0ClP, unit = "mmol");
    Real mClI(unit = "mmol");
    Real mNaP(unit = "mmol");
    Real mNaI(unit = "mmol");
    Real mKP(start = m0KP, unit = "mmol");
    Real mKI(start = m0KI);
    Real mCaP(unit = "mmol");
    Real mCaI(start = m0CaI, unit = "mmol");
    Real mMgP(start = m0MgP, unit = "mmol");
    Real mMgI(start = m0MgI, unit = "mmol");
    Real mPiP(start = m0PiP, unit = "mmol");
    Real mPiI(start = m0PiI, unit = "mmol");
    //13
    Real Vew(start = Vew0, unit = "l");
    Real Vpw(start = Vpw0, unit = "l");
    Real Viw(start = Viw0, unit = "l");
    //3
    Real HCO3E(unit = "mmol/l");
    Real HCO3P(unit = "mmol/l");
    Real HCO3I(unit = "mmol/l");
    //3
    //ostatni
    //pH
    Real pHE(start = 7.22);
    Real pHP(start = 7.4);
    Real pHI(start = 7.39);
    //pH zavisle valence
    Real ZPi;
    Real ZAlb;
    Real ZHb;
    Real ZDPG;
    Real ZATP;
    Real ZGSH;
    Real fiHb;
    //karbonaty
    Real CO3E(unit = "mmol/l");
    Real CO3P(unit = "mmol/l");
    Real CO3I(unit = "mmol/l");
    //C
    Real C_NaE(start = NaE, unit = "mmol/l");
    Real C_KE(start = KE, unit = "mmol/l");
    Real C_ClE(start = ClE, unit = "mmol/l");
    Real C_Hb(start = Hb, unit = "mmol/l");
    Real C_DPG(start = DPG, unit = "mmol/l");
    Real C_ATP(start = ATP, unit = "mmol/l");
    Real C_GSH(start = GSH, unit = "mmol/l");
    Real C_imE(start = imE, unit = "mmol/l");
    Real C_PiE(start = PiE, unit = "mmol/l");
    //
    Real C_NaP(start = NaP, unit = "mmol/l");
    Real C_NaI(start = NaI, unit = "mmol/l");
    Real C_KP(start = KP, unit = "mmol/l");
    Real C_KI(start = KI, unit = "mmol/l");
    Real C_CaP(start = CaP, unit = "mmol/l");
    Real C_CaI(start = CaI, unit = "mmol/l");
    Real C_MgP(start = MgP, unit = "mmol/l");
    Real C_MgI(start = MgI, unit = "mmol/l");
    Real C_ClP(start = ClP, unit = "mmol/l");
    Real C_ClI(start = ClI, unit = "mmol/l");
    Real C_PiP(start = PiP, unit = "mmol/l");
    Real C_PiI(start = PiI, unit = "mmol/l");
    Real C_AlbP(start = AlbP, unit = "mmol/l");
    Real C_AlbI(start = AlbI, unit = "mmol/l");
    Real C_imP(start = imP, unit = "mmol/l");
    Real C_imI(start = imI, unit = "mmol/l");
    //
    Real BE;
    Real SIDp;
    Real SIDe;
    Real SIDi;
    Real SIDp2;
    Real SID;
    Real fH;
    Real fB;
    Real rCl;
    Real rHCO3;
    Real hematocrit;
    Real BE2;
    Real BE3;
  equation
    hematocrit = Vew / few / (Vpw / fpw + Vew / few);
    pHE = 7 + time;
    rCl = C_ClE / C_ClP;
    rHCO3 = HCO3E / HCO3P;
    //zachovani hmoty
    MCl = mClE + mClP + mClI;
    MNa = mNaP + mNaI;
    MK = mKP + mKI;
    MCa = mCaP + mCaI;
    MMg = mMgP + mMgI;
    MPi = mPiP + mPiI;
    //6
    Vew0 + Vpw0 + Viw0 = Vew + Vpw + Viw;
    //1
    //donan
    C_ClE / C_ClP = 0.92 * (HCO3E / HCO3P);
    C_ClI / C_ClP = 0.92 * (HCO3I / HCO3P);
    //C_ClE / C_ClP = (HCO3E / HCO3P);
    //C_ClI / C_ClP = (HCO3I / HCO3P);
    C_ClI / C_ClP = C_NaP / C_NaI;
    C_ClI / C_ClP = C_KP / C_KI;
    (C_ClI / C_ClP) ^ 2 = C_CaP / C_CaI;
    (C_ClI / C_ClP) ^ 2 = C_MgP / C_MgI;
    (C_ClI / C_ClP) ^ abs(ZPi) = C_PiI / C_PiP;
    //7
    //elektroneutralita
    C_NaP + C_KP + 2 * C_CaP + 2 * C_MgP - C_ClP - HCO3P - 2 * CO3P + ZPi * C_PiP + ZAlb * C_AlbP + ZimP * imP = 0;
    C_NaI + C_KI + 2 * C_CaI + 2 * C_MgI - C_ClI - HCO3I - 2 * CO3I + ZPi * C_PiI + ZAlb * C_AlbI + ZimI * imI = 0;
    C_NaE + C_KE - C_ClE - HCO3E - 2 * CO3E + ZHb * C_Hb + ZDPG * C_DPG + ZATP * C_ATP + ZGSH * C_GSH + ZimE * imE = 0;
    //3
    //osmoticka rovnovaha
    fi * (C_NaP - C_NaI) + fi * (C_KP - C_KI) + fi * (C_ClP - C_ClI) + C_CaP - C_CaI + C_MgP - C_MgI + fi * (HCO3P - HCO3I) + fi * (CO3P - CO3I) + fi * (C_PiP - C_PiI) + C_AlbP - C_AlbI + C_imP - C_imI = 0;
    fi * (C_NaP - C_NaE) + fi * (C_KP - C_KE) + fi * (C_ClP - C_ClE) + fi * (C_PiP - C_PiE) + C_imP - C_imE + C_CaP + C_MgP + C_AlbP - fiHb * C_Hb - C_DPG - C_ATP - C_GSH = 0;
    //2
    //ostatni
    //Z
    ZHb = 15.6 - 23 * (10 ^ (pHE - 6.69) / (1 + 10 ^ (pHE - 6.69))) - 4 * (10 ^ (pHE - 7.89) / (1 + 10 ^ (pHE - 7.89))) + 1.5 * ((1 - HbSat) / HbSat);
    ZDPG = (-3) - 1 * (10 ^ (pHE - 7.56) / (1 + 10 ^ (pHE - 7.56))) - 1 * (10 ^ (pHE - 7.32) / (1 + 10 ^ (pHE - 7.32)));
    ZATP = (-3) - 1 * (10 ^ (pHE - 6.8) / (1 + 10 ^ (pHE - 6.8)));
    ZGSH = (-1) - 1 * (10 ^ (pHE - 8.54) / (1 + 10 ^ (pHE - 8.54))) - 1 * (10 ^ (pHE - 9.42) / (1 + 10 ^ (pHE - 9.42)));
    ZPi = (-1) - 10 ^ (pHP - 6.87) / (1 + 10 ^ (pHP - 6.87));
    ZAlb = (-10.7) - 16 * (10 ^ (pHP - 7.42) / (1 + 10 ^ (pHP - 7.42)));
    fiHb = 1 + 0.115 * C_Hb + 0.0256 * C_Hb ^ 2;
    //karbonaty a pH
    HCO3E = 0.026 * PaCO2 * 10 ^ (pHE - 6.11);
    CO3E = HCO3E * 10 ^ (pHE - 10.2);
    HCO3P = 0.0306 * PaCO2 * 10 ^ (pHP - 6.11);
    CO3P = HCO3P * 10 ^ (pHP - 10.2);
    HCO3I = 0.0326 * PaCO2 * 10 ^ (pHI - 6.11);
    CO3I = HCO3I * 10 ^ (pHI - 10.2);
    //C
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
    //
    BE = (1 - 0.023 * C_Hb) * (HCO3P - 24.4 + (2.3 * C_Hb + 7.7) * (pHP - 7.4));
    BE2 = (1 - 0.023 * 9) * (HCO3P - 24.4 + (2.3 * 9 + 7.7) * (pHP - 7.4));
    BE3 = 0.93 * (HCO3P - 24.4 + 14.8 * (pHP - 7.4));
    SIDp = C_NaP + C_KP + 2 * C_CaP + 2 * C_MgP - C_ClP;
    SIDi = C_NaI + C_KI + 2 * C_CaI + 2 * C_MgI - C_ClI;
    SIDe = C_NaE + C_KE - C_ClP;
    SIDp2 = -((-HCO3P) - 2 * CO3P + ZPi * C_PiP + ZAlb * C_AlbP);
    fH = (Vew + Vew / few * (1 - few)) / (Vew + Vew / few * (1 - few) + Vpw + Vpw / few * (1 - few));
    fB = Vblood / (Vblood + Vint);
    SID = (1 - (1 - HCO3E / HCO3P) * fH * fB) * HCO3P + (1 - fH * fB) * (C_AlbP * (8 * pHP - 41) + C_PiP * (0.3 * pHP - 0.4)) + C_Hb * fB * (10.2 * pHP - 73.6) + C_DPG * fH * fB * (0.7 * pHP - 0.5);
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end IPE12_promenyPHE;
  //end IPE12_promenyPHE;

  model IPE7_ven
  //default
    parameter Real NaE = 10;
    parameter Real KE = 99;
    parameter Real ClE = 55.3;
    parameter Real Hb = 5.3;
    parameter Real DPG = 4.4;
    parameter Real ATP = 1.8;
    parameter Real GSH = 2.2;
    parameter Real imE = 95.9;
    parameter Real PiE = 0.67;
    //
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
    //
    parameter Real ZimE = 0.02;
    parameter Real ZimI = 0.012;
    parameter Real ZimP = -0.2;
    //
    parameter Real Vblood = 1;
    parameter Real Vint = 2;
    parameter Real PaCO2 = 46;
    //
    //
    parameter Real Vew0 = 0.44 * 0.73 * Vblood;
    parameter Real Vpw0 = (1 - 0.44) * 0.94 * Vblood;
    parameter Real Viw0 = Vint;
    //
    parameter Real m0NaE = NaE * Vew0;
    parameter Real m0KE = KE * Vew0;
    parameter Real m0ClE = ClE * Vew0;
    parameter Real m0Hb = Hb * Vew0;
    parameter Real m0DPG = DPG * Vew0;
    parameter Real m0ATP = ATP * Vew0;
    parameter Real m0GSH = GSH * Vew0;
    parameter Real m0imE = imE * Vew0;
    parameter Real m0PiE = PiE * Vew0;
    //
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
    //celkovy mnozstvi
    parameter Real MCl = m0ClE + m0ClP + m0ClI;
    parameter Real MNa = m0NaP + m0NaI;
    parameter Real MK = m0KP + m0KI;
    parameter Real MCa = m0CaP + m0CaI;
    parameter Real MMg = m0MgP + m0MgI;
    parameter Real MPi = m0PiP + m0PiI;
    //mobilni ionty
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
    //13
    Real Vew(start = Vew0);
    Real Vpw(start = Vpw0);
    Real Viw(start = Viw0);
    //3
    Real HCO3E;
    Real HCO3P;
    Real HCO3I;
    //3
    //ostatni
    //pH
    Real pHE(start = 7.22);
    Real pHP(start = 7.4);
    Real pHI(start = 7.39);
    //Z
    Real ZPi;
    Real ZAlb;
    Real ZHb;
    Real ZDPG;
    Real ZATP;
    Real ZGSH;
    Real fiHb;
    //karbonaty
    Real CO3E;
    Real CO3P;
    Real CO3I;
    //C
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
    //
    Real BE;
    Real SIDp;
    Real SIDe;
    Real SIDi;
    Real SIDp2;
    Real SID;
    Real fH;
    Real fB;
  equation
    //zachovani hmoty
    MCl = mClE + mClP + mClI;
    MNa = mNaP + mNaI;
    MK = mKP + mKI;
    MCa = mCaP + mCaI;
    MMg = mMgP + mMgI;
    MPi = mPiP + mPiI;
    //6
    Vew0 + Vpw0 + Viw0 = Vew + Vpw + Viw;
    //1
    //donan
    C_ClE / C_ClP = 0.92 * (HCO3E / HCO3P);
    C_ClI / C_ClP = 0.92 * (HCO3I / HCO3P);
    //C_ClE / C_ClP = (HCO3E / HCO3P);
    //C_ClI / C_ClP = (HCO3I / HCO3P);
    C_ClI / C_ClP = C_NaP / C_NaI;
    C_ClI / C_ClP = C_KP / C_KI;
    (C_ClI / C_ClP) ^ 2 = C_CaP / C_CaI;
    (C_ClI / C_ClP) ^ 2 = C_MgP / C_MgI;
    (C_ClI / C_ClP) ^ abs(ZPi) = C_PiI / C_PiP;
    //7
    //elektroneutralita
    C_NaP + C_KP + 2 * C_CaP + 2 * C_MgP - C_ClP - HCO3P - 2 * CO3P + ZPi * C_PiP + ZAlb * C_AlbP + ZimP * imP = 0;
    C_NaI + C_KI + 2 * C_CaI + 2 * C_MgI - C_ClI - HCO3I - 2 * CO3I + ZPi * C_PiI + ZAlb * C_AlbI + ZimI * imI = 0;
    C_NaE + C_KE - C_ClE - HCO3E - 2 * CO3E + ZHb * C_Hb + ZDPG * C_DPG + ZATP * C_ATP + ZGSH * C_GSH + ZimE * imE = 0;
    //3
    //osmoticka rovnovaha
    0.93 * (C_NaP - C_NaI) + 0.93 * (C_KP - C_KI) + 0.93 * (C_ClP - C_ClI) + C_CaP - C_CaI + C_MgP - C_MgI + 0.93 * (HCO3P - HCO3I) + 0.93 * (CO3P - CO3I) + 0.93 * (C_PiP - C_PiI) + C_AlbP - C_AlbI + C_imP - C_imI = 0;
    0.93 * (C_NaP - C_NaE) + 0.93 * (C_KP - C_KE) + 0.93 * (C_ClP - C_ClE) + 0.93 * (C_PiP - C_PiE) + C_imP - C_imE + C_CaP + C_MgP + C_AlbP - fiHb * C_Hb - C_DPG - C_ATP - C_GSH = 0;
    //2
    //ostatni
    //Z
    ZHb = 15.6 - 23 * (10 ^ (pHE - 6.69) / (1 + 10 ^ (pHE - 6.69))) - 4 * (10 ^ (pHE - 7.89) / (1 + 10 ^ (pHE - 7.89))) + 1.5 * ((1 - 0.75) / 0.75);
    ZDPG = (-3) - 1 * (10 ^ (pHE - 7.56) / (1 + 10 ^ (pHE - 7.56))) - 1 * (10 ^ (pHE - 7.32) / (1 + 10 ^ (pHE - 7.32)));
    ZATP = (-3) - 1 * (10 ^ (pHE - 6.8) / (1 + 10 ^ (pHE - 6.8)));
    ZGSH = (-1) - 1 * (10 ^ (pHE - 8.54) / (1 + 10 ^ (pHE - 8.54))) - 1 * (10 ^ (pHE - 9.42) / (1 + 10 ^ (pHE - 9.42)));
    ZPi = (-1) - 10 ^ (pHP - 6.87) / (1 + 10 ^ (pHP - 6.87));
    ZAlb = (-10.7) - 16 * (10 ^ (pHP - 7.42) / (1 + 10 ^ (pHP - 7.42)));
    fiHb = 1 + 0.115 * C_Hb + 0.0256 * C_Hb ^ 2;
    //karbonaty a pH
    HCO3E = 0.026 * PaCO2 * 10 ^ (pHE - 6.11);
    CO3E = HCO3E * 10 ^ (pHE - 10.2);
    HCO3P = 0.0306 * PaCO2 * 10 ^ (pHP - 6.11);
    CO3P = HCO3P * 10 ^ (pHP - 10.2);
    HCO3I = 0.0326 * PaCO2 * 10 ^ (pHI - 6.11);
    CO3I = HCO3I * 10 ^ (pHI - 10.2);
    //C
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
    //
    BE = (1 - 0.023 * C_Hb) * (HCO3P - 24.4 + (2.3 * C_Hb + 7.7) * (pHP - 7.4));
    SIDp = C_NaP + C_KP + 2 * C_CaP + 2 * C_MgP - C_ClP;
    SIDi = C_NaI + C_KI + 2 * C_CaI + 2 * C_MgI - C_ClI;
    SIDe = C_NaE + C_KE - C_ClP;
    SIDp2 = -((-HCO3P) - 2 * CO3P + ZPi * C_PiP + ZAlb * C_AlbP);
    fH = (Vew + Vew / 0.73 * (1 - 0.73)) / (Vew + Vew / 0.73 * (1 - 0.73) + Vpw + Vpw / 0.94 * (1 - 0.94));
    fB = Vblood / (Vblood + Vint);
    SID = (1 - (1 - HCO3E / HCO3P) * fH * fB) * HCO3P + (1 - fH * fB) * (C_AlbP * (8 * pHP - 41) + C_PiP * (0.3 * pHP - 0.4)) + C_Hb * fB * (10.2 * pHP - 73.6) + C_DPG * fH * fB * (0.7 * pHP - 0.5);
    //  SID=(1-(1-(HCO3E/HCO3P))*((Vew+(Vew/0.73*(1-0.73)))/((Vew+(Vew/0.73*(1-0.73))))+(Vpw+(Vpw/0.94*(1-0.94))*(Vblood/(Vblood+Vint)))*HCO3P+(1-((Vew+(Vew/0.73*(1-0.73)))/((Vew+(Vew/0.73*(1-0.73))))*(Vblood/(Vblood+Vint)))
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end IPE7_ven;

  model IPE7_ven2
    //default parameters
    //concentration in erythroctytes
    parameter Real NaE(unit="mmol/l") = 10;
    parameter Real KE(unit="mmol/l") = 99;
    parameter Real ClE(unit="mmol/l") = 55.3;
    parameter Real Hb(unit="mmol/l") = 5.3;
    parameter Real DPG(unit="mmol/l") = 4.4;
    parameter Real ATP(unit="mmol/l") = 1.8;
    parameter Real GSH(unit="mmol/l") = 2.2;
    parameter Real imE(unit="mmol/l") = 20.2+74.4;
    //parameter Real imE = 95.2;
    parameter Real PiE(unit="mmol/l") = 0.67;
    //concentrations in plasma nad intersticium
    parameter Real NaP(unit="mmol/l") = 141;
    parameter Real NaI(unit="mmol/l") = 142;
    parameter Real KP(unit="mmol/l") = 4.2;
    parameter Real KI(unit="mmol/l") = 4.14;
    parameter Real CaP(unit="mmol/l") = 2.3;
    parameter Real CaI(unit="mmol/l") = 2.2;
    parameter Real MgP(unit="mmol/l") = 0.8;
    parameter Real MgI(unit="mmol/l") = 0.75;
    parameter Real ClP(unit="mmol/l") = 104;
    parameter Real ClI(unit="mmol/l") = 118;
    parameter Real PiP(unit="mmol/l") = 1.16;
    parameter Real PiI(unit="mmol/l") = 1.2;
    parameter Real AlbP(unit="mmol/l") = 0.65;
    parameter Real AlbI(unit="mmol/l") = 0.19;
    //parameter Real imP= 2.55;
    //parameter Real imI = 0.96;
    parameter Real imP(unit="mmol/l") = 0+21.2-7.5;
    parameter Real imI(unit="mmol/l") = 0.96+3.5+7.5;
    //charge on inpermeable solutes
    parameter Real ZimE = -9.2+9;
    parameter Real ZimI = 1.4-2;
    parameter Real ZimP = -5.3;
    //volumes and CO2 preassure
    parameter Real Vblood(unit="l") = 5;
    parameter Real Vint(unit="l") = 10;
    parameter Real PCO2(unit="torr") = 46;
    //
    //derived parameters
    //water volumes in compartments
    parameter Real Vew0(unit="l") = 0.44 * 0.73 * Vblood;
    parameter Real Vpw0(unit="l") = (1 - 0.44) * 0.94 * Vblood;
    parameter Real Viw0(unit="l") = Vint;
    //masses in erythrocytes
    parameter Real m0NaE(unit="mmol") = NaE * Vew0;
    parameter Real m0KE(unit="mmol") = KE * Vew0;
    parameter Real m0ClE(unit="mmol") = ClE * Vew0;
    parameter Real m0Hb(unit="mmol") = Hb * Vew0;
    parameter Real m0DPG(unit="mmol") = DPG * Vew0;
    parameter Real m0ATP(unit="mmol") = ATP * Vew0;
    parameter Real m0GSH(unit="mmol") = GSH * Vew0;
    parameter Real m0imE(unit="mmol") = imE * Vew0;
    parameter Real m0PiE(unit="mmol") = PiE * Vew0;
    //masses in plasma and intersticium
    parameter Real m0NaP(unit="mmol") = NaP * Vpw0;
    parameter Real m0NaI(unit="mmol") = NaI * Viw0;
    parameter Real m0KP(unit="mmol") = KP * Vpw0;
    parameter Real m0KI(unit="mmol") = KI * Viw0;
    parameter Real m0CaP(unit="mmol") = CaP * Vpw0;
    parameter Real m0CaI(unit="mmol") = CaI * Viw0;
    parameter Real m0MgP(unit="mmol") = MgP * Vpw0;
    parameter Real m0MgI(unit="mmol") = MgI * Viw0;
    parameter Real m0ClP(unit="mmol") = ClP * Vpw0;
    parameter Real m0ClI(unit="mmol") = ClI * Viw0;
    parameter Real m0PiP(unit="mmol") = PiP * Vpw0;
    parameter Real m0PiI(unit="mmol") = PiI * Viw0;
    parameter Real m0AlbP(unit="mmol") = AlbP * Vpw0;
    parameter Real m0AlbI(unit="mmol") = AlbI * Viw0;
    parameter Real m0imP(unit="mmol") = imP * Vpw0;
    parameter Real m0imI(unit="mmol") = imI * Viw0;
    //overall masses of mobile ions
    parameter Real MCl(unit="mmol") = m0ClE + m0ClP + m0ClI;
    parameter Real MNa(unit="mmol") = m0NaP + m0NaI;
    parameter Real MK(unit="mmol") = m0KP + m0KI;
    parameter Real MCa(unit="mmol") = m0CaP + m0CaI;
    parameter Real MMg(unit="mmol") = m0MgP + m0MgI;
    parameter Real MPi(unit="mmol") = m0PiP + m0PiI;
    //
    //masses of mobile ions - 13 unknowns
    Real mClE(unit="mmol");
    Real mClP(unit="mmol",start = m0ClP);
    Real mClI(unit="mmol");
    Real mNaP(unit="mmol");
    Real mNaI(unit="mmol");
    Real mKP(unit="mmol",start = m0KP);
    Real mKI(unit="mmol",start = m0KI);
    Real mCaP(unit="mmol");
    Real mCaI(unit="mmol",start = m0CaI);
    Real mMgP(unit="mmol",start = m0MgP);
    Real mMgI(unit="mmol",start = m0MgI);
    Real mPiP(unit="mmol",start = m0PiP);
    Real mPiI(unit="mmol",start = m0PiI);
    //
    //volumes of water - 3 unknowns
    Real Vew(unit="l",start = Vew0);
    Real Vpw(unit="l",start = Vpw0);
    Real Viw(unit="l",start = Viw0);
    //
    // concentrations of bicarbonates - 3 unknowns
    Real HCO3E(unit="mmol/l");
    Real HCO3P(unit="mmol/l");
    Real HCO3I(unit="mmol/l");
    //
    //other unknowns
    //pH
    Real pHE(start = 7.22);
    Real pHP(start = 7.4);
    Real pHI(start = 7.39);
    //pH dependatn chargers
    Real ZPi;
    Real ZAlb;
    Real ZHb;
    Real ZDPG;
    Real ZATP;
    Real ZGSH;
    Real fiHb;
    //carbonates
    Real CO3E(unit="mmol/l");
    Real CO3P(unit="mmol/l");
    Real CO3I(unit="mmol/l");
    //concentrations
    Real C_NaE(unit="mmol/l",start = NaE);
    Real C_KE(unit="mmol/l",start = KE);
    Real C_ClE(unit="mmol/l",start = ClE);
    Real C_Hb(unit="mmol/l",start = Hb);
    Real C_DPG(unit="mmol/l",start = DPG);
    Real C_ATP(unit="mmol/l",start = ATP);
    Real C_GSH(unit="mmol/l",start = GSH);
    Real C_imE(unit="mmol/l",start = imE);
    Real C_PiE(unit="mmol/l",start = PiE);
    //
    Real C_NaP(unit="mmol/l",start = NaP);
    Real C_NaI(unit="mmol/l",start = NaI);
    Real C_KP(unit="mmol/l",start = KP);
    Real C_KI(unit="mmol/l",start = KI);
    Real C_CaP(unit="mmol/l",start = CaP);
    Real C_CaI(unit="mmol/l",start = CaI);
    Real C_MgP(unit="mmol/l",start = MgP);
    Real C_MgI(unit="mmol/l",start = MgI);
    Real C_ClP(unit="mmol/l",start = ClP);
    Real C_ClI(unit="mmol/l",start = ClI);
    Real C_PiP(unit="mmol/l",start = PiP);
    Real C_PiI(unit="mmol/l",start = PiI);
    Real C_AlbP(unit="mmol/l",start = AlbP);
    Real C_AlbI(unit="mmol/l",start = AlbI);
    Real C_imP(unit="mmol/l",start = imP);
    Real C_imI(unit="mmol/l",start = imI);
    //osmolality
    Real Oe;
    Real Op;
    Real Oi;
    //
    Real BE;
    Real BEmono;
    Real SIDp;
    Real SIDe;
    Real SIDi;
    Real SIDp2;
    Real SID;
    Real fH;
    Real fB;
    Real rCl;
    Real rHCO3;
  equation
    //mass conservation - 6 equations
    MCl = mClE + mClP + mClI;
    MNa = mNaP + mNaI;
    MK = mKP + mKI;
    MCa = mCaP + mCaI;
    MMg = mMgP + mMgI;
    MPi = mPiP + mPiI;
    //volume conservation - 1 equation
    Vew0 + Vpw0 + Viw0 = Vew + Vpw + Viw;
    //
    //donnan equilibrium - 7 equations
    C_ClE / C_ClP = 0.92 * (HCO3E / HCO3P);
    C_ClI / C_ClP = 0.92 * (HCO3I / HCO3P);
    //C_ClE / C_ClP = (HCO3E / HCO3P);
    //C_ClI / C_ClP = (HCO3I / HCO3P);
    C_ClI / C_ClP = C_NaP / C_NaI;
    C_ClI / C_ClP = C_KP / C_KI;
    (C_ClI / C_ClP) ^ 2 = C_CaP / C_CaI;
    (C_ClI / C_ClP) ^ 2 = C_MgP / C_MgI;
    (C_ClI / C_ClP) ^ abs(ZPi) = C_PiI / C_PiP;
    //
    //electroneutrality - 3 equations
    C_NaP + C_KP + 2 * C_CaP + 2 * C_MgP - C_ClP - HCO3P - 2 * CO3P + ZPi * C_PiP + ZAlb * C_AlbP + ZimP = 0;
    C_NaI + C_KI + 2 * C_CaI + 2 * C_MgI - C_ClI - HCO3I - 2 * CO3I + ZPi * C_PiI + ZAlb * C_AlbI + ZimI = 0;
    C_NaE + C_KE - C_ClE - HCO3E - 2 * CO3E + ZHb * C_Hb + ZDPG * C_DPG + ZATP * C_ATP + ZGSH * C_GSH + ZimE = 0;
    //3
    //osmotic equilibrium - 2 equations
    Op=Oe;
    Op=Oi;
    //0.93 * (C_NaP - C_NaI) + 0.93 * (C_KP - C_KI) + 0.93 * (C_ClP - C_ClI) + C_CaP - C_CaI + C_MgP - C_MgI + 0.93 * (HCO3P - HCO3I) + 0.93 * (CO3P - CO3I) + 0.93 * (C_PiP - C_PiI) + C_AlbP - C_AlbI + C_imP - C_imI = 0;
    //0.93 * (C_NaP - C_NaE) + 0.93 * (C_KP - C_KE) + 0.93 * (C_ClP - C_ClE) + 0.93 * (C_PiP - C_PiE) + C_imP - C_imE + C_CaP + C_MgP + C_AlbP - fiHb * C_Hb - C_DPG - C_ATP - C_GSH = 0;
    //
    //other
    //Z
    ZHb = 15.6 - 23 * (10 ^ (pHE - 6.69) / (1 + 10 ^ (pHE - 6.69))) - 4 * (10 ^ (pHE - 7.89) / (1 + 10 ^ (pHE - 7.89))) + 1.5 * ((1 - 0.75) / 0.75);
    ZDPG = (-3) - 1 * (10 ^ (pHE - 7.56) / (1 + 10 ^ (pHE - 7.56))) - 1 * (10 ^ (pHE - 7.32) / (1 + 10 ^ (pHE - 7.32)));
    ZATP = (-3) - 1 * (10 ^ (pHE - 6.8) / (1 + 10 ^ (pHE - 6.8)));
    ZGSH = (-1) - 1 * (10 ^ (pHE - 8.54) / (1 + 10 ^ (pHE - 8.54))) - 1 * (10 ^ (pHE - 9.42) / (1 + 10 ^ (pHE - 9.42)));
    ZPi = (-1) - 10 ^ (pHP - 6.87) / (1 + 10 ^ (pHP - 6.87));
    ZAlb = (-10.7) - 16 * (10 ^ (pHP - 7.42) / (1 + 10 ^ (pHP - 7.42)));
    fiHb = 1 + 0.115 * C_Hb + 0.0256 * C_Hb ^ 2;
    //carbonates and pH
    HCO3E = 0.026 * PCO2 * 10 ^ (pHE - 6.11);
    CO3E = HCO3E * 10 ^ (pHE - 10.2);
    HCO3P = 0.0306 * PCO2 * 10 ^ (pHP - 6.11);
    CO3P = HCO3P * 10 ^ (pHP - 10.2);
    HCO3I = 0.0326 * PCO2 * 10 ^ (pHI - 6.11);
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
    //osmolality
    //Oe = 0.93 * C_NaE + 0.93 * C_KE + 0.93 * C_ClE + 0.93 * C_PiE + fiHb * C_Hb + C_DPG + C_ATP + C_GSH + C_imE + HCO3E + CO3E;
    //Op = 0.93 * C_NaP + 0.93 * C_KP + 0.93 * C_ClP + C_CaP + C_MgP + HCO3P + CO3P + 0.93 * C_PiP + C_AlbP + C_imP;
    //Oi = 0.93 * C_NaI + 0.93 * C_KI + 0.93 * C_ClI + C_CaI + C_MgI + HCO3I + CO3I + 0.93 * C_PiI + C_AlbI + C_imI;
    Oe = 0.93 * C_NaE + 0.93 * C_KE + 0.93 * C_ClE + 0.93 * C_PiE + fiHb * C_Hb + C_DPG + C_ATP + C_GSH + C_imE + HCO3E + CO3E;
    Op = 0.93 * C_NaP + 0.93 * C_KP + 0.93 * C_ClP + C_CaP + C_MgP + HCO3P + CO3P + 0.93 * C_PiP + C_AlbP + C_imP;
    Oi = 0.93 * C_NaI + 0.93 * C_KI + 0.93 * C_ClI + C_CaI + C_MgI + HCO3I + CO3I + 0.93 * C_PiI + C_AlbI + C_imI;
    //
    BE = (1 - 0.023 * C_Hb) * (HCO3P - 24.4 + (2.3 * C_Hb + 7.7) * (pHP - 7.4));
    BEmono = (1 - 0.023 * 9) * (HCO3P - 24.4 + (2.3 * 9 + 7.7) * (pHP - 7.4));
    SIDp = C_NaP + C_KP + 2 * C_CaP + 2 * C_MgP - C_ClP;
    SIDi = C_NaI + C_KI + 2 * C_CaI + 2 * C_MgI - C_ClI;
    SIDe = C_NaE + C_KE - C_ClP;
    SIDp2 = -((-HCO3P) - 2 * CO3P + ZPi * C_PiP + ZAlb * C_AlbP);
    fH = (Vew + Vew / 0.73 * (1 - 0.73)) / (Vew + Vew / 0.73 * (1 - 0.73) + Vpw + Vpw / 0.94 * (1 - 0.94));
    fB = Vblood / (Vblood + Vint);
    SID = (1 - (1 - HCO3E / HCO3P) * fH * fB) * HCO3P + (1 - fH * fB) * (C_AlbP * (8 * pHP - 41) + C_PiP * (0.3 * pHP - 0.4)) + C_Hb * fB * (10.2 * pHP - 73.6) + C_DPG * fH * fB * (0.7 * pHP - 0.5);
    rCl=C_ClE / C_ClP;
    rHCO3=HCO3E / HCO3P;
    //  SID=(1-(1-(HCO3E/HCO3P))*((Vew+(Vew/0.73*(1-0.73)))/((Vew+(Vew/0.73*(1-0.73))))+(Vpw+(Vpw/0.94*(1-0.94))*(Vblood/(Vblood+Vint)))*HCO3P+(1-((Vew+(Vew/0.73*(1-0.73)))/((Vew+(Vew/0.73*(1-0.73))))*(Vblood/(Vblood+Vint)))
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end IPE7_ven2;

  model IPE_metReg
    //default parameters
    //concentration in erythroctytes
    parameter Real NaE(unit="mmol/l") = 10;
    parameter Real KE(unit="mmol/l") = 99;
    parameter Real ClE(unit="mmol/l") = 55.3;
    parameter Real Hb(unit="mmol/l") = 5.3;
    parameter Real DPG(unit="mmol/l") = 4.4;
    parameter Real ATP(unit="mmol/l") = 1.8;
    parameter Real GSH(unit="mmol/l") = 2.2;
    parameter Real imE(unit="mmol/l") = 20.2+74.4;
    //parameter Real imE = 95.2;
    parameter Real PiE(unit="mmol/l") = 0.67;
    //concentrations in plasma nad intersticium
    parameter Real NaP(unit="mmol/l") = 141;
    parameter Real NaI(unit="mmol/l") = 142;
    parameter Real KP(unit="mmol/l") = 4.2;
    parameter Real KI(unit="mmol/l") = 4.14;
    parameter Real CaP(unit="mmol/l") = 2.3;
    parameter Real CaI(unit="mmol/l") = 2.2;
    parameter Real MgP(unit="mmol/l") = 0.8;
    parameter Real MgI(unit="mmol/l") = 0.75;
    parameter Real ClP(unit="mmol/l") = 104;
    parameter Real ClI(unit="mmol/l") = 118;
    parameter Real PiP(unit="mmol/l") = 1.16;
    parameter Real PiI(unit="mmol/l") = 1.2;
    parameter Real AlbP(unit="mmol/l") = 0.65;
    parameter Real AlbI(unit="mmol/l") = 0.19;
    //parameter Real imP= 2.55;
    //parameter Real imI = 0.96;
    parameter Real imP(unit="mmol/l") = 0+21.2-7.5;
    parameter Real imI(unit="mmol/l") = 0.96+3.5+7.5;
    //charge on inpermeable solutes
    parameter Real ZimE = -9.2+9;
    parameter Real ZimI = 1.4-2;
    parameter Real ZimP = -5.3;
    //volumes and CO2 preassure
    parameter Real Vblood(unit="l") = 1;
    parameter Real Vint(unit="l") = 2;
    parameter Real PCO2(unit="torr") = 46+0;
    //
    //derived parameters
    //water volumes in compartments
    parameter Real Vew0(unit="l") = 0.44 * 0.73 * Vblood;
    parameter Real Vpw0(unit="l") = (1 - 0.44) * 0.94 * Vblood;
    parameter Real Viw0(unit="l") = Vint;
    //masses in erythrocytes
    parameter Real m0NaE(unit="mmol") = NaE * Vew0;
    parameter Real m0KE(unit="mmol") = KE * Vew0;
    parameter Real m0ClE(unit="mmol") = ClE * Vew0;
    parameter Real m0Hb(unit="mmol") = Hb * Vew0;
    parameter Real m0DPG(unit="mmol") = DPG * Vew0;
    parameter Real m0ATP(unit="mmol") = ATP * Vew0;
    parameter Real m0GSH(unit="mmol") = GSH * Vew0;
    parameter Real m0imE(unit="mmol") = imE * Vew0;
    parameter Real m0PiE(unit="mmol") = PiE * Vew0;
    //masses in plasma and intersticium
    parameter Real m0NaP(unit="mmol") = NaP * Vpw0;
    parameter Real m0NaI(unit="mmol") = NaI * Viw0;
    parameter Real m0KP(unit="mmol") = KP * Vpw0;
    parameter Real m0KI(unit="mmol") = KI * Viw0;
    parameter Real m0CaP(unit="mmol") = CaP * Vpw0;
    parameter Real m0CaI(unit="mmol") = CaI * Viw0;
    parameter Real m0MgP(unit="mmol") = MgP * Vpw0;
    parameter Real m0MgI(unit="mmol") = MgI * Viw0;
    parameter Real m0ClP(unit="mmol") = ClP * Vpw0;
    parameter Real m0ClI(unit="mmol") = ClI * Viw0;
    parameter Real m0PiP(unit="mmol") = PiP * Vpw0;
    parameter Real m0PiI(unit="mmol") = PiI * Viw0;
    parameter Real m0AlbP(unit="mmol") = AlbP * Vpw0;
    parameter Real m0AlbI(unit="mmol") = AlbI * Viw0;
    parameter Real m0imP(unit="mmol") = imP * Vpw0;
    parameter Real m0imI(unit="mmol") = imI * Viw0;
    //overall masses of mobile ions
    parameter Real MCl(unit="mmol") = m0ClE + m0ClP + m0ClI;
    parameter Real MNa(unit="mmol") = m0NaP + m0NaI;
    parameter Real MK(unit="mmol") = m0KP + m0KI;
    parameter Real MCa(unit="mmol") = m0CaP + m0CaI;
    parameter Real MMg(unit="mmol") = m0MgP + m0MgI;
    parameter Real MPi(unit="mmol") = m0PiP + m0PiI;
    //
    parameter Real pH0=7.37;
    Real dpH;
    Real X(start=0);
    //
    //masses of mobile ions - 13 unknowns
    Real mClE(unit="mmol");
    Real mClP(unit="mmol",start = m0ClP);
    Real mClI(unit="mmol");
    Real mNaP(unit="mmol");
    Real mNaI(unit="mmol");
    Real mKP(unit="mmol",start = m0KP);
    Real mKI(unit="mmol",start = m0KI);
    Real mCaP(unit="mmol");
    Real mCaI(unit="mmol",start = m0CaI);
    Real mMgP(unit="mmol",start = m0MgP);
    Real mMgI(unit="mmol",start = m0MgI);
    Real mPiP(unit="mmol",start = m0PiP);
    Real mPiI(unit="mmol",start = m0PiI);
    //
    //volumes of water - 3 unknowns
    Real Vew(unit="l",start = Vew0);
    Real Vpw(unit="l",start = Vpw0);
    Real Viw(unit="l",start = Viw0);
    //
    //concentrations of bicarbonates - 3 unknowns
    Real HCO3E(unit="mmol/l");
    Real HCO3P(unit="mmol/l");
    Real HCO3I(unit="mmol/l");
    //
    //other unknowns
    //pH
    Real pHE(start = 7.22);
    Real pHP(start = 7.4);
    Real pHI(start = 7.39);
    //pH dependatn chargers
    Real ZPi;
    Real ZAlb;
    Real ZHb;
    Real ZDPG;
    Real ZATP;
    Real ZGSH;
    Real fiHb;
    //carbonates
    Real CO3E(unit="mmol/l");
    Real CO3P(unit="mmol/l");
    Real CO3I(unit="mmol/l");
    //concentrations
    Real C_NaE(unit="mmol/l",start = NaE);
    Real C_KE(unit="mmol/l",start = KE);
    Real C_ClE(unit="mmol/l",start = ClE);
    Real C_Hb(unit="mmol/l",start = Hb);
    Real C_DPG(unit="mmol/l",start = DPG);
    Real C_ATP(unit="mmol/l",start = ATP);
    Real C_GSH(unit="mmol/l",start = GSH);
    Real C_imE(unit="mmol/l",start = imE);
    Real C_PiE(unit="mmol/l",start = PiE);
    //
    Real C_NaP(unit="mmol/l",start = NaP);
    Real C_NaI(unit="mmol/l",start = NaI);
    Real C_KP(unit="mmol/l",start = KP);
    Real C_KI(unit="mmol/l",start = KI);
    Real C_CaP(unit="mmol/l",start = CaP);
    Real C_CaI(unit="mmol/l",start = CaI);
    Real C_MgP(unit="mmol/l",start = MgP);
    Real C_MgI(unit="mmol/l",start = MgI);
    Real C_ClP(unit="mmol/l",start = ClP);
    Real C_ClI(unit="mmol/l",start = ClI);
    Real C_PiP(unit="mmol/l",start = PiP);
    Real C_PiI(unit="mmol/l",start = PiI);
    Real C_AlbP(unit="mmol/l",start = AlbP);
    Real C_AlbI(unit="mmol/l",start = AlbI);
    Real C_imP(unit="mmol/l",start = imP);
    Real C_imI(unit="mmol/l",start = imI);
    //osmolality
    Real Oe;
    Real Op;
    Real Oi;
    //
    Real BE;
    Real SIDp;
    Real SIDe;
    Real SIDi;
    Real SIDp2;
    Real SID;
    Real fH;
    Real fB;
  equation
    //mass conservation - 6 equations
    MCl = mClE + mClP + mClI;
    MNa = mNaP + mNaI;
    MK = mKP + mKI;
    MCa = mCaP + mCaI;
    MMg = mMgP + mMgI;
    MPi = mPiP + mPiI;
    //volume conservation - 1 equation
    Vew0 + Vpw0 + Viw0 = Vew + Vpw + Viw;
    //
    //donnan equilibrium - 7 equations
    C_ClE / C_ClP = 0.92 * (HCO3E / HCO3P);
    C_ClI / C_ClP = 0.92 * (HCO3I / HCO3P);
    //C_ClE / C_ClP = (HCO3E / HCO3P);
    //C_ClI / C_ClP = (HCO3I / HCO3P);
    C_ClI / C_ClP = C_NaP / C_NaI;
    C_ClI / C_ClP = C_KP / C_KI;
    (C_ClI / C_ClP) ^ 2 = C_CaP / C_CaI;
    (C_ClI / C_ClP) ^ 2 = C_MgP / C_MgI;
    (C_ClI / C_ClP) ^ abs(ZPi) = C_PiI / C_PiP;
    //
    //electroneutrality - 3 equations
    C_NaP + C_KP + 2 * C_CaP + 2 * C_MgP - C_ClP - HCO3P - 2 * CO3P + ZPi * C_PiP + ZAlb * C_AlbP + ZimP + X = 0;
    C_NaI + C_KI + 2 * C_CaI + 2 * C_MgI - C_ClI - HCO3I - 2 * CO3I + ZPi * C_PiI + ZAlb * C_AlbI + ZimI = 0;
    C_NaE + C_KE - C_ClE - HCO3E - 2 * CO3E + ZHb * C_Hb + ZDPG * C_DPG + ZATP * C_ATP + ZGSH * C_GSH + ZimE = 0;
    //3
    //osmotic equilibrium - 2 equations
    Op=Oe;
    Op=Oi;
    //0.93 * (C_NaP - C_NaI) + 0.93 * (C_KP - C_KI) + 0.93 * (C_ClP - C_ClI) + C_CaP - C_CaI + C_MgP - C_MgI + 0.93 * (HCO3P - HCO3I) + 0.93 * (CO3P - CO3I) + 0.93 * (C_PiP - C_PiI) + C_AlbP - C_AlbI + C_imP - C_imI = 0;
    //0.93 * (C_NaP - C_NaE) + 0.93 * (C_KP - C_KE) + 0.93 * (C_ClP - C_ClE) + 0.93 * (C_PiP - C_PiE) + C_imP - C_imE + C_CaP + C_MgP + C_AlbP - fiHb * C_Hb - C_DPG - C_ATP - C_GSH = 0;
    //
    //other
    //Z
    ZHb = 15.6 - 23 * (10 ^ (pHE - 6.69) / (1 + 10 ^ (pHE - 6.69))) - 4 * (10 ^ (pHE - 7.89) / (1 + 10 ^ (pHE - 7.89))) + 1.5 * ((1 - 0.75) / 0.75);
    ZDPG = (-3) - 1 * (10 ^ (pHE - 7.56) / (1 + 10 ^ (pHE - 7.56))) - 1 * (10 ^ (pHE - 7.32) / (1 + 10 ^ (pHE - 7.32)));
    ZATP = (-3) - 1 * (10 ^ (pHE - 6.8) / (1 + 10 ^ (pHE - 6.8)));
    ZGSH = (-1) - 1 * (10 ^ (pHE - 8.54) / (1 + 10 ^ (pHE - 8.54))) - 1 * (10 ^ (pHE - 9.42) / (1 + 10 ^ (pHE - 9.42)));
    ZPi = (-1) - 10 ^ (pHP - 6.87) / (1 + 10 ^ (pHP - 6.87));
    ZAlb = (-10.7) - 16 * (10 ^ (pHP - 7.42) / (1 + 10 ^ (pHP - 7.42)));
    fiHb = 1 + 0.115 * C_Hb + 0.0256 * C_Hb ^ 2;
    //carbonates and pH
    HCO3E = 0.026 * PCO2 * 10 ^ (pHE - 6.11);
    CO3E = HCO3E * 10 ^ (pHE - 10.2);
    HCO3P = 0.0306 * PCO2 * 10 ^ (pHP - 6.11);
    CO3P = HCO3P * 10 ^ (pHP - 10.2);
    HCO3I = 0.0326 * PCO2 * 10 ^ (pHI - 6.11);
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
    //osmolality
    //Oe = 0.93 * C_NaE + 0.93 * C_KE + 0.93 * C_ClE + 0.93 * C_PiE + fiHb * C_Hb + C_DPG + C_ATP + C_GSH + C_imE + HCO3E + CO3E;
    //Op = 0.93 * C_NaP + 0.93 * C_KP + 0.93 * C_ClP + C_CaP + C_MgP + HCO3P + CO3P + 0.93 * C_PiP + C_AlbP + C_imP;
    //Oi = 0.93 * C_NaI + 0.93 * C_KI + 0.93 * C_ClI + C_CaI + C_MgI + HCO3I + CO3I + 0.93 * C_PiI + C_AlbI + C_imI;
    Oe = 0.93 * C_NaE + 0.93 * C_KE + 0.93 * C_ClE + 0.93 * C_PiE + fiHb * C_Hb + C_DPG + C_ATP + C_GSH + C_imE + HCO3E + CO3E;
    Op = 0.93 * C_NaP + 0.93 * C_KP + 0.93 * C_ClP + C_CaP + C_MgP + HCO3P + CO3P + 0.93 * C_PiP + C_AlbP + C_imP;
    Oi = 0.93 * C_NaI + 0.93 * C_KI + 0.93 * C_ClI + C_CaI + C_MgI + HCO3I + CO3I + 0.93 * C_PiI + C_AlbI + C_imI;
    //
    BE = (1 - 0.023 * C_Hb) * (HCO3P - 24.4 + (2.3 * C_Hb + 7.7) * (pHP - 7.4));
    SIDp = C_NaP + C_KP + 2 * C_CaP + 2 * C_MgP - C_ClP;
    SIDi = C_NaI + C_KI + 2 * C_CaI + 2 * C_MgI - C_ClI;
    SIDe = C_NaE + C_KE - C_ClP;
    SIDp2 = -((-HCO3P) - 2 * CO3P + ZPi * C_PiP + ZAlb * C_AlbP);
    fH = (Vew + Vew / 0.73 * (1 - 0.73)) / (Vew + Vew / 0.73 * (1 - 0.73) + Vpw + Vpw / 0.94 * (1 - 0.94));
    fB = Vblood / (Vblood + Vint);
    SID = (1 - (1 - HCO3E / HCO3P) * fH * fB) * HCO3P + (1 - fH * fB) * (C_AlbP * (8 * pHP - 41) + C_PiP * (0.3 * pHP - 0.4)) + C_Hb * fB * (10.2 * pHP - 73.6) + C_DPG * fH * fB * (0.7 * pHP - 0.5);
    //  SID=(1-(1-(HCO3E/HCO3P))*((Vew+(Vew/0.73*(1-0.73)))/((Vew+(Vew/0.73*(1-0.73))))+(Vpw+(Vpw/0.94*(1-0.94))*(Vblood/(Vblood+Vint)))*HCO3P+(1-((Vew+(Vew/0.73*(1-0.73)))/((Vew+(Vew/0.73*(1-0.73))))*(Vblood/(Vblood+Vint)))
    dpH=pH0-pHP;
    der(X)=dpH;
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end IPE_metReg;

  model IPE_respReg
    //default parameters
    //concentration in erythroctytes
    parameter Real NaE(unit="mmol/l") = 10;
    parameter Real KE(unit="mmol/l") = 99;
    parameter Real ClE(unit="mmol/l") = 55.3;
    parameter Real Hb(unit="mmol/l") = 5.3;
    parameter Real DPG(unit="mmol/l") = 4.4;
    parameter Real ATP(unit="mmol/l") = 1.8;
    parameter Real GSH(unit="mmol/l") = 2.2;
    parameter Real imE(unit="mmol/l") = 20.2+74.4;
    //parameter Real imE = 95.2;
    parameter Real PiE(unit="mmol/l") = 0.67;
    //concentrations in plasma nad intersticium
    parameter Real NaP(unit="mmol/l") = 141;
    parameter Real NaI(unit="mmol/l") = 142;
    parameter Real KP(unit="mmol/l") = 4.2;
    parameter Real KI(unit="mmol/l") = 4.14;
    parameter Real CaP(unit="mmol/l") = 2.3;
    parameter Real CaI(unit="mmol/l") = 2.2;
    parameter Real MgP(unit="mmol/l") = 0.8;
    parameter Real MgI(unit="mmol/l") = 0.75;
    parameter Real ClP(unit="mmol/l") = 104;
    parameter Real ClI(unit="mmol/l") = 118;
    parameter Real PiP(unit="mmol/l") = 1.16;
    parameter Real PiI(unit="mmol/l") = 1.2;
    parameter Real AlbP(unit="mmol/l") = 0.65;
    parameter Real AlbI(unit="mmol/l") = 0.19;
    //parameter Real imP= 2.55;
    //parameter Real imI = 0.96;
    parameter Real imP(unit="mmol/l") = 0+21.2-7.5;
    parameter Real imI(unit="mmol/l") = 0.96+3.5+7.5;
    //charge on inpermeable solutes
    parameter Real ZimE = -9.2+9;
    parameter Real ZimI = 1.4-2;
    parameter Real ZimP = -5.3;
    //volumes and CO2 preassure
    parameter Real Vblood(unit="l") = 1;
    parameter Real Vint(unit="l") = 2;
    Real PCO2(unit="torr",start=46);
    //
    //derived parameters
    //water volumes in compartments
    parameter Real Vew0(unit="l") = 0.44 * 0.73 * Vblood;
    parameter Real Vpw0(unit="l") = (1 - 0.44) * 0.94 * Vblood;
    parameter Real Viw0(unit="l") = Vint;
    //masses in erythrocytes
    parameter Real m0NaE(unit="mmol") = NaE * Vew0;
    parameter Real m0KE(unit="mmol") = KE * Vew0;
    parameter Real m0ClE(unit="mmol") = ClE * Vew0;
    parameter Real m0Hb(unit="mmol") = Hb * Vew0;
    parameter Real m0DPG(unit="mmol") = DPG * Vew0;
    parameter Real m0ATP(unit="mmol") = ATP * Vew0;
    parameter Real m0GSH(unit="mmol") = GSH * Vew0;
    parameter Real m0imE(unit="mmol") = imE * Vew0;
    parameter Real m0PiE(unit="mmol") = PiE * Vew0;
    //masses in plasma and intersticium
    parameter Real m0NaP(unit="mmol") = NaP * Vpw0;
    parameter Real m0NaI(unit="mmol") = NaI * Viw0;
    parameter Real m0KP(unit="mmol") = KP * Vpw0;
    parameter Real m0KI(unit="mmol") = KI * Viw0;
    parameter Real m0CaP(unit="mmol") = CaP * Vpw0;
    parameter Real m0CaI(unit="mmol") = CaI * Viw0;
    parameter Real m0MgP(unit="mmol") = MgP * Vpw0;
    parameter Real m0MgI(unit="mmol") = MgI * Viw0;
    parameter Real m0ClP(unit="mmol") = ClP * Vpw0;
    parameter Real m0ClI(unit="mmol") = ClI * Viw0;
    parameter Real m0PiP(unit="mmol") = PiP * Vpw0;
    parameter Real m0PiI(unit="mmol") = PiI * Viw0;
    parameter Real m0AlbP(unit="mmol") = AlbP * Vpw0;
    parameter Real m0AlbI(unit="mmol") = AlbI * Viw0;
    parameter Real m0imP(unit="mmol") = imP * Vpw0;
    parameter Real m0imI(unit="mmol") = imI * Viw0;
    //overall masses of mobile ions
    parameter Real MCl(unit="mmol") = m0ClE + m0ClP + m0ClI;
    parameter Real MNa(unit="mmol") = m0NaP + m0NaI;
    parameter Real MK(unit="mmol") = m0KP + m0KI;
    parameter Real MCa(unit="mmol") = m0CaP + m0CaI;
    parameter Real MMg(unit="mmol") = m0MgP + m0MgI;
    parameter Real MPi(unit="mmol") = m0PiP + m0PiI;
    //
    parameter Real pH0=7.37;
    Real dpH;
    parameter Real X=0;

    //
    //masses of mobile ions - 13 unknowns
    Real mClE(unit="mmol");
    Real mClP(unit="mmol",start = m0ClP);
    Real mClI(unit="mmol");
    Real mNaP(unit="mmol");
    Real mNaI(unit="mmol");
    Real mKP(unit="mmol",start = m0KP);
    Real mKI(unit="mmol",start = m0KI);
    Real mCaP(unit="mmol");
    Real mCaI(unit="mmol",start = m0CaI);
    Real mMgP(unit="mmol",start = m0MgP);
    Real mMgI(unit="mmol",start = m0MgI);
    Real mPiP(unit="mmol",start = m0PiP);
    Real mPiI(unit="mmol",start = m0PiI);
    //
    //volumes of water - 3 unknowns
    Real Vew(unit="l",start = Vew0);
    Real Vpw(unit="l",start = Vpw0);
    Real Viw(unit="l",start = Viw0);
    //
    //concentrations of bicarbonates - 3 unknowns
    Real HCO3E(unit="mmol/l");
    Real HCO3P(unit="mmol/l");
    Real HCO3I(unit="mmol/l");
    //
    //other unknowns
    //pH
    Real pHE(start = 7.22);
    Real pHP(start = 7.4);
    Real pHI(start = 7.39);
    //pH dependatn chargers
    Real ZPi;
    Real ZAlb;
    Real ZHb;
    Real ZDPG;
    Real ZATP;
    Real ZGSH;
    Real fiHb;
    //carbonates
    Real CO3E(unit="mmol/l");
    Real CO3P(unit="mmol/l");
    Real CO3I(unit="mmol/l");
    //concentrations
    Real C_NaE(unit="mmol/l",start = NaE);
    Real C_KE(unit="mmol/l",start = KE);
    Real C_ClE(unit="mmol/l",start = ClE);
    Real C_Hb(unit="mmol/l",start = Hb);
    Real C_DPG(unit="mmol/l",start = DPG);
    Real C_ATP(unit="mmol/l",start = ATP);
    Real C_GSH(unit="mmol/l",start = GSH);
    Real C_imE(unit="mmol/l",start = imE);
    Real C_PiE(unit="mmol/l",start = PiE);
    //
    Real C_NaP(unit="mmol/l",start = NaP);
    Real C_NaI(unit="mmol/l",start = NaI);
    Real C_KP(unit="mmol/l",start = KP);
    Real C_KI(unit="mmol/l",start = KI);
    Real C_CaP(unit="mmol/l",start = CaP);
    Real C_CaI(unit="mmol/l",start = CaI);
    Real C_MgP(unit="mmol/l",start = MgP);
    Real C_MgI(unit="mmol/l",start = MgI);
    Real C_ClP(unit="mmol/l",start = ClP);
    Real C_ClI(unit="mmol/l",start = ClI);
    Real C_PiP(unit="mmol/l",start = PiP);
    Real C_PiI(unit="mmol/l",start = PiI);
    Real C_AlbP(unit="mmol/l",start = AlbP);
    Real C_AlbI(unit="mmol/l",start = AlbI);
    Real C_imP(unit="mmol/l",start = imP);
    Real C_imI(unit="mmol/l",start = imI);
    //osmolality
    Real Oe;
    Real Op;
    Real Oi;
    //
    Real BE;
    Real SIDp;
    Real SIDe;
    Real SIDi;
    Real SIDp2;
    Real SID;
    Real fH;
    Real fB;
  equation
    //mass conservation - 6 equations
    MCl = mClE + mClP + mClI;
    MNa = mNaP + mNaI;
    MK = mKP + mKI;
    MCa = mCaP + mCaI;
    MMg = mMgP + mMgI;
    MPi = mPiP + mPiI;
    //volume conservation - 1 equation
    Vew0 + Vpw0 + Viw0 = Vew + Vpw + Viw;
    //
    //donnan equilibrium - 7 equations
    C_ClE / C_ClP = 0.92 * (HCO3E / HCO3P);
    C_ClI / C_ClP = 0.92 * (HCO3I / HCO3P);
    //C_ClE / C_ClP = (HCO3E / HCO3P);
    //C_ClI / C_ClP = (HCO3I / HCO3P);
    C_ClI / C_ClP = C_NaP / C_NaI;
    C_ClI / C_ClP = C_KP / C_KI;
    (C_ClI / C_ClP) ^ 2 = C_CaP / C_CaI;
    (C_ClI / C_ClP) ^ 2 = C_MgP / C_MgI;
    (C_ClI / C_ClP) ^ abs(ZPi) = C_PiI / C_PiP;
    //
    //electroneutrality - 3 equations
    C_NaP + C_KP + 2 * C_CaP + 2 * C_MgP - C_ClP - HCO3P - 2 * CO3P + ZPi * C_PiP + ZAlb * C_AlbP + ZimP + X = 0;
    C_NaI + C_KI + 2 * C_CaI + 2 * C_MgI - C_ClI - HCO3I - 2 * CO3I + ZPi * C_PiI + ZAlb * C_AlbI + ZimI = 0;
    C_NaE + C_KE - C_ClE - HCO3E - 2 * CO3E + ZHb * C_Hb + ZDPG * C_DPG + ZATP * C_ATP + ZGSH * C_GSH + ZimE = 0;
    //3
    //osmotic equilibrium - 2 equations
    Op=Oe;
    Op=Oi;
    //0.93 * (C_NaP - C_NaI) + 0.93 * (C_KP - C_KI) + 0.93 * (C_ClP - C_ClI) + C_CaP - C_CaI + C_MgP - C_MgI + 0.93 * (HCO3P - HCO3I) + 0.93 * (CO3P - CO3I) + 0.93 * (C_PiP - C_PiI) + C_AlbP - C_AlbI + C_imP - C_imI = 0;
    //0.93 * (C_NaP - C_NaE) + 0.93 * (C_KP - C_KE) + 0.93 * (C_ClP - C_ClE) + 0.93 * (C_PiP - C_PiE) + C_imP - C_imE + C_CaP + C_MgP + C_AlbP - fiHb * C_Hb - C_DPG - C_ATP - C_GSH = 0;
    //
    //other
    //Z
    ZHb = 15.6 - 23 * (10 ^ (pHE - 6.69) / (1 + 10 ^ (pHE - 6.69))) - 4 * (10 ^ (pHE - 7.89) / (1 + 10 ^ (pHE - 7.89))) + 1.5 * ((1 - 0.75) / 0.75);
    ZDPG = (-3) - 1 * (10 ^ (pHE - 7.56) / (1 + 10 ^ (pHE - 7.56))) - 1 * (10 ^ (pHE - 7.32) / (1 + 10 ^ (pHE - 7.32)));
    ZATP = (-3) - 1 * (10 ^ (pHE - 6.8) / (1 + 10 ^ (pHE - 6.8)));
    ZGSH = (-1) - 1 * (10 ^ (pHE - 8.54) / (1 + 10 ^ (pHE - 8.54))) - 1 * (10 ^ (pHE - 9.42) / (1 + 10 ^ (pHE - 9.42)));
    ZPi = (-1) - 10 ^ (pHP - 6.87) / (1 + 10 ^ (pHP - 6.87));
    ZAlb = (-10.7) - 16 * (10 ^ (pHP - 7.42) / (1 + 10 ^ (pHP - 7.42)));
    fiHb = 1 + 0.115 * C_Hb + 0.0256 * C_Hb ^ 2;
    //carbonates and pH
    HCO3E = 0.026 * PCO2 * 10 ^ (pHE - 6.11);
    CO3E = HCO3E * 10 ^ (pHE - 10.2);
    HCO3P = 0.0306 * PCO2 * 10 ^ (pHP - 6.11);
    CO3P = HCO3P * 10 ^ (pHP - 10.2);
    HCO3I = 0.0326 * PCO2 * 10 ^ (pHI - 6.11);
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
    //osmolality
    //Oe = 0.93 * C_NaE + 0.93 * C_KE + 0.93 * C_ClE + 0.93 * C_PiE + fiHb * C_Hb + C_DPG + C_ATP + C_GSH + C_imE + HCO3E + CO3E;
    //Op = 0.93 * C_NaP + 0.93 * C_KP + 0.93 * C_ClP + C_CaP + C_MgP + HCO3P + CO3P + 0.93 * C_PiP + C_AlbP + C_imP;
    //Oi = 0.93 * C_NaI + 0.93 * C_KI + 0.93 * C_ClI + C_CaI + C_MgI + HCO3I + CO3I + 0.93 * C_PiI + C_AlbI + C_imI;
    Oe = 0.93 * C_NaE + 0.93 * C_KE + 0.93 * C_ClE + 0.93 * C_PiE + fiHb * C_Hb + C_DPG + C_ATP + C_GSH + C_imE + HCO3E + CO3E;
    Op = 0.93 * C_NaP + 0.93 * C_KP + 0.93 * C_ClP + C_CaP + C_MgP + HCO3P + CO3P + 0.93 * C_PiP + C_AlbP + C_imP;
    Oi = 0.93 * C_NaI + 0.93 * C_KI + 0.93 * C_ClI + C_CaI + C_MgI + HCO3I + CO3I + 0.93 * C_PiI + C_AlbI + C_imI;
    //
    BE = (1 - 0.023 * C_Hb) * (HCO3P - 24.4 + (2.3 * C_Hb + 7.7) * (pHP - 7.4));
    SIDp = C_NaP + C_KP + 2 * C_CaP + 2 * C_MgP - C_ClP;
    SIDi = C_NaI + C_KI + 2 * C_CaI + 2 * C_MgI - C_ClI;
    SIDe = C_NaE + C_KE - C_ClP;
    SIDp2 = -((-HCO3P) - 2 * CO3P + ZPi * C_PiP + ZAlb * C_AlbP);
    fH = (Vew + Vew / 0.73 * (1 - 0.73)) / (Vew + Vew / 0.73 * (1 - 0.73) + Vpw + Vpw / 0.94 * (1 - 0.94));
    fB = Vblood / (Vblood + Vint);
    SID = (1 - (1 - HCO3E / HCO3P) * fH * fB) * HCO3P + (1 - fH * fB) * (C_AlbP * (8 * pHP - 41) + C_PiP * (0.3 * pHP - 0.4)) + C_Hb * fB * (10.2 * pHP - 73.6) + C_DPG * fH * fB * (0.7 * pHP - 0.5);
    //  SID=(1-(1-(HCO3E/HCO3P))*((Vew+(Vew/0.73*(1-0.73)))/((Vew+(Vew/0.73*(1-0.73))))+(Vpw+(Vpw/0.94*(1-0.94))*(Vblood/(Vblood+Vint)))*HCO3P+(1-((Vew+(Vew/0.73*(1-0.73)))/((Vew+(Vew/0.73*(1-0.73))))*(Vblood/(Vblood+Vint)))
    dpH=pH0-pHP;
    -der(PCO2)=dpH;
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end IPE_respReg;

  model IPE7_ven2_pokusy
    //default parameters
    //concentration in erythroctytes
    parameter Real NaE(unit="mmol/l") = 10/0.73;
    parameter Real KE(unit="mmol/l") = 99/0.73;
    parameter Real ClE(unit="mmol/l") = 55.3/0.73;
    parameter Real Hb(unit="mmol/l") = 5.3/0.73;
    parameter Real DPG(unit="mmol/l") = 4.4/0.73;
    parameter Real ATP(unit="mmol/l") = 1.8/0.73;
    parameter Real GSH(unit="mmol/l") = 2.2/0.73;
    parameter Real imE(unit="mmol/l") = (20.2+75+10)/0.73;
    //parameter Real imE = 95.2;
    parameter Real PiE(unit="mmol/l") = 0.67/0.73;
    //concentrations in plasma nad intersticium
    parameter Real NaP(unit="mmol/l") = 141/0.94;
    parameter Real NaI(unit="mmol/l") = 142;
    parameter Real KP(unit="mmol/l") = 4.2/0.94;
    parameter Real KI(unit="mmol/l") = 4.14;
    parameter Real CaP(unit="mmol/l") = 2.3/0.94;
    parameter Real CaI(unit="mmol/l") = 2.2;
    parameter Real MgP(unit="mmol/l") = 0.8/0.94;
    parameter Real MgI(unit="mmol/l") = 0.75;
    parameter Real ClP(unit="mmol/l") = 104/0.94;
    parameter Real ClI(unit="mmol/l") = 118;
    parameter Real PiP(unit="mmol/l") = 1.16/0.94;
    parameter Real PiI(unit="mmol/l") = 1.2;
    parameter Real AlbP(unit="mmol/l") = 0.65/0.94;
    parameter Real AlbI(unit="mmol/l") = 0.19;
    //parameter Real imP= 2.55;
    //parameter Real imI = 0.96;
    parameter Real imP(unit="mmol/l") = (0+21.2+1)/0.94;
    parameter Real imI(unit="mmol/l") = 0.96+3.5-0.55;
    //charge on inpermeable solutes
    parameter Real ZimE = -22.5;
    parameter Real ZimI = 0;
    parameter Real ZimP = 0.2;
    //volumes and CO2 preassure
    parameter Real Vblood(unit="l") = 5;
    parameter Real Vint(unit="l") = 10;
    parameter Real PCO2(unit="torr",start = 46);
    //
    //derived parameters
    //water volumes in compartments
    parameter Real Vew0(unit="l") = 0.44 * 0.73 * Vblood;
    parameter Real Vpw0(unit="l") = (1 - 0.44) * 0.94 * Vblood;
    parameter Real Viw0(unit="l") = Vint;
    //masses in erythrocytes
    parameter Real m0NaE(unit="mmol") = NaE * Vew0;
    parameter Real m0KE(unit="mmol") = KE * Vew0;
    parameter Real m0ClE(unit="mmol") = ClE * Vew0;
    parameter Real m0Hb(unit="mmol") = Hb * Vew0;
    parameter Real m0DPG(unit="mmol") = DPG * Vew0;
    parameter Real m0ATP(unit="mmol") = ATP * Vew0;
    parameter Real m0GSH(unit="mmol") = GSH * Vew0;
    parameter Real m0imE(unit="mmol") = imE * Vew0;
    parameter Real m0PiE(unit="mmol") = PiE * Vew0;
    //masses in plasma and intersticium
    parameter Real m0NaP(unit="mmol") = NaP * Vpw0;
    parameter Real m0NaI(unit="mmol") = NaI * Viw0;
    parameter Real m0KP(unit="mmol") = KP * Vpw0;
    parameter Real m0KI(unit="mmol") = KI * Viw0;
    parameter Real m0CaP(unit="mmol") = CaP * Vpw0;
    parameter Real m0CaI(unit="mmol") = CaI * Viw0;
    parameter Real m0MgP(unit="mmol") = MgP * Vpw0;
    parameter Real m0MgI(unit="mmol") = MgI * Viw0;
    parameter Real m0ClP(unit="mmol") = ClP * Vpw0;
    parameter Real m0ClI(unit="mmol") = ClI * Viw0;
    parameter Real m0PiP(unit="mmol") = PiP * Vpw0;
    parameter Real m0PiI(unit="mmol") = PiI * Viw0;
    parameter Real m0AlbP(unit="mmol") = AlbP * Vpw0;
    parameter Real m0AlbI(unit="mmol") = AlbI * Viw0;
    parameter Real m0imP(unit="mmol") = imP * Vpw0;
    parameter Real m0imI(unit="mmol") = imI * Viw0;
    //overall masses of mobile ions
    parameter Real MCl(unit="mmol") = m0ClE + m0ClP + m0ClI;
    parameter Real MNa(unit="mmol") = m0NaP + m0NaI;
    parameter Real MK(unit="mmol") = m0KP + m0KI;
    parameter Real MCa(unit="mmol") = m0CaP + m0CaI;
    parameter Real MMg(unit="mmol") = m0MgP + m0MgI;
    parameter Real MPi(unit="mmol") = m0PiP + m0PiI;
    //
    //masses of mobile ions - 13 unknowns
    Real mClE(unit="mmol");
    Real mClP(unit="mmol",start = m0ClP);
    Real mClI(unit="mmol");
    Real mNaP(unit="mmol");
    Real mNaI(unit="mmol");
    Real mKP(unit="mmol",start = m0KP);
    Real mKI(unit="mmol",start = m0KI);
    Real mCaP(unit="mmol");
    Real mCaI(unit="mmol",start = m0CaI);
    Real mMgP(unit="mmol",start = m0MgP);
    Real mMgI(unit="mmol",start = m0MgI);
    Real mPiP(unit="mmol",start = m0PiP);
    Real mPiI(unit="mmol",start = m0PiI);
    //
    //volumes of water - 3 unknowns
    Real Vew(unit="l",start = Vew0);
    Real Vpw(unit="l",start = Vpw0);
    Real Viw(unit="l",start = Viw0);
    //
    // concentrations of bicarbonates - 3 unknowns
    Real HCO3E(unit="mmol/l");
    Real HCO3P(unit="mmol/l");
    Real HCO3I(unit="mmol/l");
    //
    //other unknowns
    //pH
    Real pHE(start = 7.22);
    Real pHP(start = 7.4);
    Real pHI(start = 7.39);
    //pH dependatn chargers
    Real ZPi;
    Real ZAlb;
    Real ZHb;
    Real ZDPG;
    Real ZATP;
    Real ZGSH;
    Real fiHb;
    //carbonates
    Real CO3E(unit="mmol/l");
    Real CO3P(unit="mmol/l");
    Real CO3I(unit="mmol/l");
    //concentrations
    Real C_NaE(unit="mmol/l",start = NaE);
    Real C_KE(unit="mmol/l",start = KE);
    Real C_ClE(unit="mmol/l",start = ClE);
    Real C_Hb(unit="mmol/l",start = Hb);
    Real C_DPG(unit="mmol/l",start = DPG);
    Real C_ATP(unit="mmol/l",start = ATP);
    Real C_GSH(unit="mmol/l",start = GSH);
    Real C_imE(unit="mmol/l",start = imE);
    Real C_PiE(unit="mmol/l",start = PiE);
    //
    Real C_NaP(unit="mmol/l",start = NaP);
    Real C_NaI(unit="mmol/l",start = NaI);
    Real C_KP(unit="mmol/l",start = KP);
    Real C_KI(unit="mmol/l",start = KI);
    Real C_CaP(unit="mmol/l",start = CaP);
    Real C_CaI(unit="mmol/l",start = CaI);
    Real C_MgP(unit="mmol/l",start = MgP);
    Real C_MgI(unit="mmol/l",start = MgI);
    Real C_ClP(unit="mmol/l",start = ClP);
    Real C_ClI(unit="mmol/l",start = ClI);
    Real C_PiP(unit="mmol/l",start = PiP);
    Real C_PiI(unit="mmol/l",start = PiI);
    Real C_AlbP(unit="mmol/l",start = AlbP);
    Real C_AlbI(unit="mmol/l",start = AlbI);
    Real C_imP(unit="mmol/l",start = imP);
    Real C_imI(unit="mmol/l",start = imI);
    //osmolality
    Real Oe;
    Real Op;
    Real Oi;
    //
    Real BE;
    Real BEmono;
    Real SIDp;
    Real SIDe;
    Real SIDi;
    Real SIDp2;
    Real SID;
    Real fH;
    Real fB;
    Real rCl;
    Real rHCO3;
    parameter Real XCl=0;
    parameter Real XNa=0;
    parameter Real XK=0;
    parameter Real XCa=0;
    parameter Real XMg=0;
    parameter Real XVw=0;
  equation
    //pHP=6.5+time;
    //mass conservation - 6 equations
    MCl = mClE + mClP + mClI - XCl;
    MNa = mNaP + mNaI - XNa;
    MK = mKP + mKI - XK;
    MCa = mCaP + mCaI - XCa;
    MMg = mMgP + mMgI - XMg;
    MPi = mPiP + mPiI;
    //volume conservation - 1 equation
    Vew0 + Vpw0 + Viw0 + XVw = Vew + Vpw + Viw;
    //
    //donnan equilibrium - 7 equations
    C_ClE / C_ClP = 0.92 * (HCO3E / HCO3P);
    C_ClI / C_ClP = 0.92 * (HCO3I / HCO3P);
    //0.92*(C_ClE / C_ClP) = (HCO3E / HCO3P);
    //0.92*(C_ClI / C_ClP) = (HCO3I / HCO3P);
    C_ClI / C_ClP = C_NaP / C_NaI;
    C_ClI / C_ClP = C_KP / C_KI;
    (C_ClI / C_ClP) ^ 2 = C_CaP / C_CaI;
    (C_ClI / C_ClP) ^ 2 = C_MgP / C_MgI;
    (C_ClI / C_ClP) ^ abs(ZPi) = C_PiI / C_PiP;
    //
    //electroneutrality - 3 equations
    C_NaP + C_KP + 2 * C_CaP + 2 * C_MgP - C_ClP - HCO3P - 2 * CO3P + ZPi * C_PiP + ZAlb * C_AlbP + ZimP = 0;
    C_NaI + C_KI + 2 * C_CaI + 2 * C_MgI - C_ClI - HCO3I - 2 * CO3I + ZPi * C_PiI + ZAlb * C_AlbI + ZimI = 0;
    C_NaE + C_KE - C_ClE - HCO3E - 2 * CO3E + ZHb * C_Hb + ZDPG * C_DPG + ZATP * C_ATP + ZGSH * C_GSH + ZimE = 0;
    //3
    //osmotic equilibrium - 2 equations
    Op=Oe;
    Op=Oi;
    //0.93 * (C_NaP - C_NaI) + 0.93 * (C_KP - C_KI) + 0.93 * (C_ClP - C_ClI) + C_CaP - C_CaI + C_MgP - C_MgI + 0.93 * (HCO3P - HCO3I) + 0.93 * (CO3P - CO3I) + 0.93 * (C_PiP - C_PiI) + C_AlbP - C_AlbI + C_imP - C_imI = 0;
    //0.93 * (C_NaP - C_NaE) + 0.93 * (C_KP - C_KE) + 0.93 * (C_ClP - C_ClE) + 0.93 * (C_PiP - C_PiE) + C_imP - C_imE + C_CaP + C_MgP + C_AlbP - fiHb * C_Hb - C_DPG - C_ATP - C_GSH = 0;
    //
    //other
    //Z
    ZHb = 15.6 - 23 * (10 ^ (pHE - 6.69) / (1 + 10 ^ (pHE - 6.69))) - 4 * (10 ^ (pHE - 7.89) / (1 + 10 ^ (pHE - 7.89))) + 1.5 * ((1 - 0.75) / 0.75);
    ZDPG = (-3) - 1 * (10 ^ (pHE - 7.56) / (1 + 10 ^ (pHE - 7.56))) - 1 * (10 ^ (pHE - 7.32) / (1 + 10 ^ (pHE - 7.32)));
    ZATP = (-3) - 1 * (10 ^ (pHE - 6.8) / (1 + 10 ^ (pHE - 6.8)));
    ZGSH = (-1) - 1 * (10 ^ (pHE - 8.54) / (1 + 10 ^ (pHE - 8.54))) - 1 * (10 ^ (pHE - 9.42) / (1 + 10 ^ (pHE - 9.42)));
    ZPi = (-1) - 10 ^ (pHP - 6.87) / (1 + 10 ^ (pHP - 6.87));
    ZAlb = (-10.7) - 16 * (10 ^ (pHP - 7.42) / (1 + 10 ^ (pHP - 7.42)));
    fiHb = 1 + 0.115 * C_Hb + 0.0256 * C_Hb ^ 2;
    //carbonates and pH
    HCO3E = 0.026 * PCO2 * 10 ^ (pHE - 6.11);
    CO3E = HCO3E * 10 ^ (pHE - 10.2);
    HCO3P = 0.0306 * PCO2 * 10 ^ (pHP - 6.11);
    CO3P = HCO3P * 10 ^ (pHP - 10.2);
    HCO3I = 0.0326 * PCO2 * 10 ^ (pHI - 6.11);
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
    //osmolality
    //Oe = 0.93 * C_NaE + 0.93 * C_KE + 0.93 * C_ClE + 0.93 * C_PiE + fiHb * C_Hb + C_DPG + C_ATP + C_GSH + C_imE + HCO3E + CO3E;
    //Op = 0.93 * C_NaP + 0.93 * C_KP + 0.93 * C_ClP + C_CaP + C_MgP + HCO3P + CO3P + 0.93 * C_PiP + C_AlbP + C_imP;
    //Oi = 0.93 * C_NaI + 0.93 * C_KI + 0.93 * C_ClI + C_CaI + C_MgI + HCO3I + CO3I + 0.93 * C_PiI + C_AlbI + C_imI;
    Oe = (0.93 * C_NaE + 0.93 * C_KE + 0.93 * C_ClE + 0.93 * C_PiE + fiHb * C_Hb + C_DPG + C_ATP + C_GSH + C_imE + HCO3E + CO3E)*0.73;
    Op = (0.93 * C_NaP + 0.93 * C_KP + 0.93 * C_ClP + C_CaP + C_MgP + HCO3P + CO3P + 0.93 * C_PiP + C_AlbP + C_imP)*0.94;
    Oi = 0.93 * C_NaI + 0.93 * C_KI + 0.93 * C_ClI + C_CaI + C_MgI + HCO3I + CO3I + 0.93 * C_PiI + C_AlbI + C_imI;
    //
    BE = (1 - 0.023 * C_Hb) * (HCO3P - 24.4 + (2.3 * C_Hb + 7.7) * (pHP - 7.4));
    BEmono = (1 - 0.023 * 9) * (HCO3P - 24.4 + (2.3 * 9 + 7.7) * (pHP - 7.4));
    SIDp = C_NaP + C_KP + 2 * C_CaP + 2 * C_MgP - C_ClP;
    SIDi = C_NaI + C_KI + 2 * C_CaI + 2 * C_MgI - C_ClI;
    SIDe = C_NaE + C_KE - C_ClP;
    SIDp2 = -((-HCO3P) - 2 * CO3P + ZPi * C_PiP + ZAlb * C_AlbP);
    //fH = (Vew + Vew / 0.73 * (1 - 0.73)) / (Vew + Vew / 0.73 * (1 - 0.73) + Vpw + Vpw / 0.94 * (1 - 0.94));
    fH = (Vew/0.73)/(Vew/0.73+Vpw/0.94);
    fB = Vblood / (Vblood + Vint);
    SID = (1 - (1 - HCO3E / HCO3P) * fH * fB) * HCO3P + (1 - fH * fB) * (C_AlbP * (8 * pHP - 41) + C_PiP * (0.3 * pHP - 0.4)) + C_Hb * fB * (10.2 * pHP - 73.6) + C_DPG * fH * fB * (0.7 * pHP - 0.5);
    rCl=(C_ClE/0.73) / C_ClP;
    rHCO3=HCO3E / HCO3P;
    //  SID=(1-(1-(HCO3E/HCO3P))*((Vew+(Vew/0.73*(1-0.73)))/((Vew+(Vew/0.73*(1-0.73))))+(Vpw+(Vpw/0.94*(1-0.94))*(Vblood/(Vblood+Vint)))*HCO3P+(1-((Vew+(Vew/0.73*(1-0.73)))/((Vew+(Vew/0.73*(1-0.73))))*(Vblood/(Vblood+Vint)))
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end IPE7_ven2_pokusy;

  model IPE
    //default parameters
    //concentration in erythroctytes
    parameter Real NaE(unit="mmol/l") = 10/0.73;
    parameter Real KE(unit="mmol/l") = 99/0.73;
    parameter Real ClE(unit="mmol/l") = 55.3/0.73;
    parameter Real Hb(unit="mmol/l") = 5.3/0.73;
    parameter Real DPG(unit="mmol/l") = 4.4/0.73;
    parameter Real ATP(unit="mmol/l") = 1.8/0.73;
    parameter Real GSH(unit="mmol/l") = 2.2/0.73;
    parameter Real imE(unit="mmol/l") = 105.2/0.73;
    parameter Real PiE(unit="mmol/l") = 0.67/0.73;
    //concentrations in plasma nad intersticium
    parameter Real NaP(unit="mmol/l") = 141/0.94;
    parameter Real NaI(unit="mmol/l") = 142;
    parameter Real KP(unit="mmol/l") = 4.2/0.94;
    parameter Real KI(unit="mmol/l") = 4.14;
    parameter Real CaP(unit="mmol/l") = 2.3/0.94;
    parameter Real CaI(unit="mmol/l") = 2.2;
    parameter Real MgP(unit="mmol/l") = 0.8/0.94;
    parameter Real MgI(unit="mmol/l") = 0.75;
    parameter Real ClP(unit="mmol/l") = 104/0.94;
    parameter Real ClI(unit="mmol/l") = 118;
    parameter Real PiP(unit="mmol/l") = 1.16/0.94;
    parameter Real PiI(unit="mmol/l") = 1.2;
    parameter Real AlbP(unit="mmol/l") = 0.65/0.94;
    parameter Real AlbI(unit="mmol/l") = 0.19;
    parameter Real imP(unit="mmol/l") = 22.2/0.94;
    parameter Real imI(unit="mmol/l") = 3.91;
    //charge on inpermeable solutes
    parameter Real ZimE = -22.5;
    parameter Real ZimI = 0;
    parameter Real ZimP = 0.2;
    //volumes and CO2 preassure
    parameter Real Vblood(unit="l") = 5;
    parameter Real Vint(unit="l") = 10;
    parameter Real PCO2(unit="torr") = 46;
    //
    //derived parameters
    //water volumes in compartments
    parameter Real Vew0(unit="l") = 0.44 * 0.73 * Vblood;
    parameter Real Vpw0(unit="l") = (1 - 0.44) * 0.94 * Vblood;
    parameter Real Viw0(unit="l") = Vint;
    //masses in erythrocytes
    parameter Real m0NaE(unit="mmol") = NaE * Vew0;
    parameter Real m0KE(unit="mmol") = KE * Vew0;
    parameter Real m0ClE(unit="mmol") = ClE * Vew0;
    parameter Real m0Hb(unit="mmol") = Hb * Vew0;
    parameter Real m0DPG(unit="mmol") = DPG * Vew0;
    parameter Real m0ATP(unit="mmol") = ATP * Vew0;
    parameter Real m0GSH(unit="mmol") = GSH * Vew0;
    parameter Real m0imE(unit="mmol") = imE * Vew0;
    parameter Real m0PiE(unit="mmol") = PiE * Vew0;
    //masses in plasma and intersticium
    parameter Real m0NaP(unit="mmol") = NaP * Vpw0;
    parameter Real m0NaI(unit="mmol") = NaI * Viw0;
    parameter Real m0KP(unit="mmol") = KP * Vpw0;
    parameter Real m0KI(unit="mmol") = KI * Viw0;
    parameter Real m0CaP(unit="mmol") = CaP * Vpw0;
    parameter Real m0CaI(unit="mmol") = CaI * Viw0;
    parameter Real m0MgP(unit="mmol") = MgP * Vpw0;
    parameter Real m0MgI(unit="mmol") = MgI * Viw0;
    parameter Real m0ClP(unit="mmol") = ClP * Vpw0;
    parameter Real m0ClI(unit="mmol") = ClI * Viw0;
    parameter Real m0PiP(unit="mmol") = PiP * Vpw0;
    parameter Real m0PiI(unit="mmol") = PiI * Viw0;
    parameter Real m0AlbP(unit="mmol") = AlbP * Vpw0;
    parameter Real m0AlbI(unit="mmol") = AlbI * Viw0;
    parameter Real m0imP(unit="mmol") = imP * Vpw0;
    parameter Real m0imI(unit="mmol") = imI * Viw0;
    //overall masses of mobile ions
    parameter Real MCl(unit="mmol") = m0ClE + m0ClP + m0ClI;
    parameter Real MNa(unit="mmol") = m0NaP + m0NaI;
    parameter Real MK(unit="mmol") = m0KP + m0KI;
    parameter Real MCa(unit="mmol") = m0CaP + m0CaI;
    parameter Real MMg(unit="mmol") = m0MgP + m0MgI;
    parameter Real MPi(unit="mmol") = m0PiP + m0PiI;
    //
    //masses of mobile ions - 13 unknowns
    Real mClE(unit="mmol");
    Real mClP(unit="mmol",start = m0ClP);
    Real mClI(unit="mmol");
    Real mNaP(unit="mmol");
    Real mNaI(unit="mmol");
    Real mKP(unit="mmol",start = m0KP);
    Real mKI(unit="mmol",start = m0KI);
    Real mCaP(unit="mmol");
    Real mCaI(unit="mmol",start = m0CaI);
    Real mMgP(unit="mmol",start = m0MgP);
    Real mMgI(unit="mmol",start = m0MgI);
    Real mPiP(unit="mmol",start = m0PiP);
    Real mPiI(unit="mmol",start = m0PiI);
    //
    //volumes of water - 3 unknowns
    Real Vew(unit="l",start = Vew0);
    Real Vpw(unit="l",start = Vpw0);
    Real Viw(unit="l",start = Viw0);
    //
    // concentrations of bicarbonates - 3 unknowns
    Real HCO3E(unit="mmol/l");
    Real HCO3P(unit="mmol/l");
    Real HCO3I(unit="mmol/l");
    //
    //other unknowns
    //pH
    Real pHE(start = 7.22);
    Real pHP(start = 7.4);
    Real pHI(start = 7.39);
    //pH dependatn chargers
    Real ZPi;
    Real ZAlb;
    Real ZHb;
    Real ZDPG;
    Real ZATP;
    Real ZGSH;
    Real fiHb;
    //carbonates
    Real CO3E(unit="mmol/l");
    Real CO3P(unit="mmol/l");
    Real CO3I(unit="mmol/l");
    //concentrations
    Real C_NaE(unit="mmol/l",start = NaE);
    Real C_KE(unit="mmol/l",start = KE);
    Real C_ClE(unit="mmol/l",start = ClE);
    Real C_Hb(unit="mmol/l",start = Hb);
    Real C_DPG(unit="mmol/l",start = DPG);
    Real C_ATP(unit="mmol/l",start = ATP);
    Real C_GSH(unit="mmol/l",start = GSH);
    Real C_imE(unit="mmol/l",start = imE);
    Real C_PiE(unit="mmol/l",start = PiE);
    //
    Real C_NaP(unit="mmol/l",start = NaP);
    Real C_NaI(unit="mmol/l",start = NaI);
    Real C_KP(unit="mmol/l",start = KP);
    Real C_KI(unit="mmol/l",start = KI);
    Real C_CaP(unit="mmol/l",start = CaP);
    Real C_CaI(unit="mmol/l",start = CaI);
    Real C_MgP(unit="mmol/l",start = MgP);
    Real C_MgI(unit="mmol/l",start = MgI);
    Real C_ClP(unit="mmol/l",start = ClP);
    Real C_ClI(unit="mmol/l",start = ClI);
    Real C_PiP(unit="mmol/l",start = PiP);
    Real C_PiI(unit="mmol/l",start = PiI);
    Real C_AlbP(unit="mmol/l",start = AlbP);
    Real C_AlbI(unit="mmol/l",start = AlbI);
    Real C_imP(unit="mmol/l",start = imP);
    Real C_imI(unit="mmol/l",start = imI);
    //osmolality
    Real Oe;
    Real Op;
    Real Oi;
    //
    //Real BE;
    Real BE;
    //Real SIDp;
    //Real SIDe;
    //Real SIDi;
    //Real SIDp2;
    Real SID;
    Real fH;
    Real fB;
    Real rCl;
    Real rHCO3;
    parameter Real XCl=0;
    parameter Real XNa=0;
    parameter Real XK=0;
    parameter Real XCa=0;
    parameter Real XMg=0;
    parameter Real XVw=0;
  equation
    //mass conservation - 6 equations
    MCl = mClE + mClP + mClI - XCl;
    MNa = mNaP + mNaI - XNa;
    MK = mKP + mKI - XK;
    MCa = mCaP + mCaI - XCa;
    MMg = mMgP + mMgI - XMg;
    MPi = mPiP + mPiI;
    //volume conservation - 1 equation
    Vew0 + Vpw0 + Viw0 + XVw = Vew + Vpw + Viw;
    //
    //donnan equilibrium - 7 equations
    C_ClE / C_ClP = 0.92 * (HCO3E / HCO3P);
    C_ClI / C_ClP = 0.92 * (HCO3I / HCO3P);
    C_ClI / C_ClP = C_NaP / C_NaI;
    C_ClI / C_ClP = C_KP / C_KI;
    (C_ClI / C_ClP) ^ 2 = C_CaP / C_CaI;
    (C_ClI / C_ClP) ^ 2 = C_MgP / C_MgI;
    (C_ClI / C_ClP) ^ abs(ZPi) = C_PiI / C_PiP;
    //
    //electroneutrality - 3 equations
    C_NaP + C_KP + 2 * C_CaP + 2 * C_MgP - C_ClP - HCO3P - 2 * CO3P + ZPi * C_PiP + ZAlb * C_AlbP + ZimP = 0;
    C_NaI + C_KI + 2 * C_CaI + 2 * C_MgI - C_ClI - HCO3I - 2 * CO3I + ZPi * C_PiI + ZAlb * C_AlbI + ZimI = 0;
    C_NaE + C_KE - C_ClE - HCO3E - 2 * CO3E + ZHb * C_Hb + ZDPG * C_DPG + ZATP * C_ATP + ZGSH * C_GSH + ZimE = 0;
    //3
    //osmotic equilibrium - 2 equations
    Op=Oe;
    Op=Oi;
    //0.93 * (C_NaP - C_NaI) + 0.93 * (C_KP - C_KI) + 0.93 * (C_ClP - C_ClI) + C_CaP - C_CaI + C_MgP - C_MgI + 0.93 * (HCO3P - HCO3I) + 0.93 * (CO3P - CO3I) + 0.93 * (C_PiP - C_PiI) + C_AlbP - C_AlbI + C_imP - C_imI = 0;
    //0.93 * (C_NaP - C_NaE) + 0.93 * (C_KP - C_KE) + 0.93 * (C_ClP - C_ClE) + 0.93 * (C_PiP - C_PiE) + C_imP - C_imE + C_CaP + C_MgP + C_AlbP - fiHb * C_Hb - C_DPG - C_ATP - C_GSH = 0;
    //
    //other
    //Z
    ZHb = 15.6 - 23 * (10 ^ (pHE - 6.69) / (1 + 10 ^ (pHE - 6.69))) - 4 * (10 ^ (pHE - 7.89) / (1 + 10 ^ (pHE - 7.89))) + 1.5 * ((1 - 0.75) / 0.75);
    ZDPG = (-3) - 1 * (10 ^ (pHE - 7.56) / (1 + 10 ^ (pHE - 7.56))) - 1 * (10 ^ (pHE - 7.32) / (1 + 10 ^ (pHE - 7.32)));
    ZATP = (-3) - 1 * (10 ^ (pHE - 6.8) / (1 + 10 ^ (pHE - 6.8)));
    ZGSH = (-1) - 1 * (10 ^ (pHE - 8.54) / (1 + 10 ^ (pHE - 8.54))) - 1 * (10 ^ (pHE - 9.42) / (1 + 10 ^ (pHE - 9.42)));
    ZPi = (-1) - 10 ^ (pHP - 6.87) / (1 + 10 ^ (pHP - 6.87));
    ZAlb = (-10.7) - 16 * (10 ^ (pHP - 7.42) / (1 + 10 ^ (pHP - 7.42)));
    fiHb = 1 + 0.115 * C_Hb + 0.0256 * C_Hb ^ 2;
    //carbonates and pH
    HCO3E = 0.026 * PCO2 * 10 ^ (pHE - 6.11);
    CO3E = HCO3E * 10 ^ (pHE - 10.2);
    HCO3P = 0.0306 * PCO2 * 10 ^ (pHP - 6.11);
    CO3P = HCO3P * 10 ^ (pHP - 10.2);
    HCO3I = 0.0326 * PCO2 * 10 ^ (pHI - 6.11);
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
    //osmolality
    //Oe = 0.93 * C_NaE + 0.93 * C_KE + 0.93 * C_ClE + 0.93 * C_PiE + fiHb * C_Hb + C_DPG + C_ATP + C_GSH + C_imE + HCO3E + CO3E;
    //Op = 0.93 * C_NaP + 0.93 * C_KP + 0.93 * C_ClP + C_CaP + C_MgP + HCO3P + CO3P + 0.93 * C_PiP + C_AlbP + C_imP;
    //Oi = 0.93 * C_NaI + 0.93 * C_KI + 0.93 * C_ClI + C_CaI + C_MgI + HCO3I + CO3I + 0.93 * C_PiI + C_AlbI + C_imI;
    Oe = (0.93 * C_NaE + 0.93 * C_KE + 0.93 * C_ClE + 0.93 * C_PiE + fiHb * C_Hb + C_DPG + C_ATP + C_GSH + C_imE + HCO3E + CO3E)*0.73;
    Op = (0.93 * C_NaP + 0.93 * C_KP + 0.93 * C_ClP + C_CaP + C_MgP + HCO3P + CO3P + 0.93 * C_PiP + C_AlbP + C_imP)*0.94;
    Oi = 0.93 * C_NaI + 0.93 * C_KI + 0.93 * C_ClI + C_CaI + C_MgI + HCO3I + CO3I + 0.93 * C_PiI + C_AlbI + C_imI;
    //
    //BE = (1 - 0.023 * C_Hb) * (HCO3P - 24.4 + (2.3 * C_Hb + 7.7) * (pHP - 7.4));
    BE = (1 - 0.023 * 9) * (HCO3P - 24.4 + (2.3 * 9 + 7.7) * (pHP - 7.4));
    //SIDp = C_NaP + C_KP + 2 * C_CaP + 2 * C_MgP - C_ClP;
    //SIDi = C_NaI + C_KI + 2 * C_CaI + 2 * C_MgI - C_ClI;
    //SIDe = C_NaE + C_KE - C_ClP;
    //SIDp2 = -((-HCO3P) - 2 * CO3P + ZPi * C_PiP + ZAlb * C_AlbP);
    fH = (Vew + Vew / 0.73 * (1 - 0.73)) / (Vew + Vew / 0.73 * (1 - 0.73) + Vpw + Vpw / 0.94 * (1 - 0.94));
    fB = Vblood / (Vblood + Vint);
    SID = (1 - (1 - HCO3E / HCO3P) * fH * fB) * HCO3P + (1 - fH * fB) * (C_AlbP * (8 * pHP - 41) + C_PiP * (0.3 * pHP - 0.4)) + C_Hb * fB * (10.2 * pHP - 73.6) + C_DPG * fH * fB * (0.7 * pHP - 0.5);
    rCl=C_ClE / C_ClP;
    rHCO3=HCO3E / HCO3P;
    //  SID=(1-(1-(HCO3E/HCO3P))*((Vew+(Vew/0.73*(1-0.73)))/((Vew+(Vew/0.73*(1-0.73))))+(Vpw+(Vpw/0.94*(1-0.94))*(Vblood/(Vblood+Vint)))*HCO3P+(1-((Vew+(Vew/0.73*(1-0.73)))/((Vew+(Vew/0.73*(1-0.73))))*(Vblood/(Vblood+Vint)))
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end IPE;

  model IPE_metabolicReg
    //default parameters
    //concentration in erythroctytes
    parameter Real NaE(unit="mmol/l") = 10/0.73;
    parameter Real KE(unit="mmol/l") = 99/0.73;
    parameter Real ClE(unit="mmol/l") = 55.3/0.73;
    parameter Real Hb(unit="mmol/l") = 5.3/0.73;
    parameter Real DPG(unit="mmol/l") = 4.4/0.73;
    parameter Real ATP(unit="mmol/l") = 1.8/0.73;
    parameter Real GSH(unit="mmol/l") = 2.2/0.73;
    parameter Real imE(unit="mmol/l") = 105.2/0.73;
    parameter Real PiE(unit="mmol/l") = 0.67/0.73;
    //concentrations in plasma nad intersticium
    parameter Real NaP(unit="mmol/l") = 141/0.94;
    parameter Real NaI(unit="mmol/l") = 142;
    parameter Real KP(unit="mmol/l") = 4.2/0.94;
    parameter Real KI(unit="mmol/l") = 4.14;
    parameter Real CaP(unit="mmol/l") = 2.3/0.94;
    parameter Real CaI(unit="mmol/l") = 2.2;
    parameter Real MgP(unit="mmol/l") = 0.8/0.94;
    parameter Real MgI(unit="mmol/l") = 0.75;
    parameter Real ClP(unit="mmol/l") = 104/0.94;
    parameter Real ClI(unit="mmol/l") = 118;
    parameter Real PiP(unit="mmol/l") = 1.16/0.94;
    parameter Real PiI(unit="mmol/l") = 1.2;
    parameter Real AlbP(unit="mmol/l") = 0.65/0.94;
    parameter Real AlbI(unit="mmol/l") = 0.19;
    parameter Real imP(unit="mmol/l") = 22.2/0.94;
    parameter Real imI(unit="mmol/l") = 3.91;
    //charge on inpermeable solutes
    parameter Real ZimE = -22.5;
    parameter Real ZimI = 0;
    parameter Real ZimP = 0.2;
    //volumes and CO2 preassure
    parameter Real Vblood(unit="l") = 5;
    parameter Real Vint(unit="l") = 10;
    parameter Real PCO2(unit="torr") = 46;
    //
    //derived parameters
    //water volumes in compartments
    parameter Real Vew0(unit="l") = 0.44 * 0.73 * Vblood;
    parameter Real Vpw0(unit="l") = (1 - 0.44) * 0.94 * Vblood;
    parameter Real Viw0(unit="l") = Vint;
    //masses in erythrocytes
    parameter Real m0NaE(unit="mmol") = NaE * Vew0;
    parameter Real m0KE(unit="mmol") = KE * Vew0;
    parameter Real m0ClE(unit="mmol") = ClE * Vew0;
    parameter Real m0Hb(unit="mmol") = Hb * Vew0;
    parameter Real m0DPG(unit="mmol") = DPG * Vew0;
    parameter Real m0ATP(unit="mmol") = ATP * Vew0;
    parameter Real m0GSH(unit="mmol") = GSH * Vew0;
    parameter Real m0imE(unit="mmol") = imE * Vew0;
    parameter Real m0PiE(unit="mmol") = PiE * Vew0;
    //masses in plasma and intersticium
    parameter Real m0NaP(unit="mmol") = NaP * Vpw0;
    parameter Real m0NaI(unit="mmol") = NaI * Viw0;
    parameter Real m0KP(unit="mmol") = KP * Vpw0;
    parameter Real m0KI(unit="mmol") = KI * Viw0;
    parameter Real m0CaP(unit="mmol") = CaP * Vpw0;
    parameter Real m0CaI(unit="mmol") = CaI * Viw0;
    parameter Real m0MgP(unit="mmol") = MgP * Vpw0;
    parameter Real m0MgI(unit="mmol") = MgI * Viw0;
    parameter Real m0ClP(unit="mmol") = ClP * Vpw0;
    parameter Real m0ClI(unit="mmol") = ClI * Viw0;
    parameter Real m0PiP(unit="mmol") = PiP * Vpw0;
    parameter Real m0PiI(unit="mmol") = PiI * Viw0;
    parameter Real m0AlbP(unit="mmol") = AlbP * Vpw0;
    parameter Real m0AlbI(unit="mmol") = AlbI * Viw0;
    parameter Real m0imP(unit="mmol") = imP * Vpw0;
    parameter Real m0imI(unit="mmol") = imI * Viw0;
    //overall masses of mobile ions
    parameter Real MCl(unit="mmol") = m0ClE + m0ClP + m0ClI;
    parameter Real MNa(unit="mmol") = m0NaP + m0NaI;
    parameter Real MK(unit="mmol") = m0KP + m0KI;
    parameter Real MCa(unit="mmol") = m0CaP + m0CaI;
    parameter Real MMg(unit="mmol") = m0MgP + m0MgI;
    parameter Real MPi(unit="mmol") = m0PiP + m0PiI;
    //
    parameter Real pH0=7.37;
    Real dpH;
    Real X(start=0);
    //
    //masses of mobile ions - 13 unknowns
    Real mClE(unit="mmol");
    Real mClP(unit="mmol",start = m0ClP);
    Real mClI(unit="mmol");
    Real mNaP(unit="mmol");
    Real mNaI(unit="mmol");
    Real mKP(unit="mmol",start = m0KP);
    Real mKI(unit="mmol",start = m0KI);
    Real mCaP(unit="mmol");
    Real mCaI(unit="mmol",start = m0CaI);
    Real mMgP(unit="mmol",start = m0MgP);
    Real mMgI(unit="mmol",start = m0MgI);
    Real mPiP(unit="mmol",start = m0PiP);
    Real mPiI(unit="mmol",start = m0PiI);
    //
    //volumes of water - 3 unknowns
    Real Vew(unit="l",start = Vew0);
    Real Vpw(unit="l",start = Vpw0);
    Real Viw(unit="l",start = Viw0);
    //
    // concentrations of bicarbonates - 3 unknowns
    Real HCO3E(unit="mmol/l");
    Real HCO3P(unit="mmol/l");
    Real HCO3I(unit="mmol/l");
    //
    //other unknowns
    //pH
    Real pHE(start = 7.22);
    Real pHP(start = 7.4);
    Real pHI(start = 7.39);
    //pH dependatn chargers
    Real ZPi;
    Real ZAlb;
    Real ZHb;
    Real ZDPG;
    Real ZATP;
    Real ZGSH;
    Real fiHb;
    //carbonates
    Real CO3E(unit="mmol/l");
    Real CO3P(unit="mmol/l");
    Real CO3I(unit="mmol/l");
    //concentrations
    Real C_NaE(unit="mmol/l",start = NaE);
    Real C_KE(unit="mmol/l",start = KE);
    Real C_ClE(unit="mmol/l",start = ClE);
    Real C_Hb(unit="mmol/l",start = Hb);
    Real C_DPG(unit="mmol/l",start = DPG);
    Real C_ATP(unit="mmol/l",start = ATP);
    Real C_GSH(unit="mmol/l",start = GSH);
    Real C_imE(unit="mmol/l",start = imE);
    Real C_PiE(unit="mmol/l",start = PiE);
    //
    Real C_NaP(unit="mmol/l",start = NaP);
    Real C_NaI(unit="mmol/l",start = NaI);
    Real C_KP(unit="mmol/l",start = KP);
    Real C_KI(unit="mmol/l",start = KI);
    Real C_CaP(unit="mmol/l",start = CaP);
    Real C_CaI(unit="mmol/l",start = CaI);
    Real C_MgP(unit="mmol/l",start = MgP);
    Real C_MgI(unit="mmol/l",start = MgI);
    Real C_ClP(unit="mmol/l",start = ClP);
    Real C_ClI(unit="mmol/l",start = ClI);
    Real C_PiP(unit="mmol/l",start = PiP);
    Real C_PiI(unit="mmol/l",start = PiI);
    Real C_AlbP(unit="mmol/l",start = AlbP);
    Real C_AlbI(unit="mmol/l",start = AlbI);
    Real C_imP(unit="mmol/l",start = imP);
    Real C_imI(unit="mmol/l",start = imI);
    //osmolality
    Real Oe;
    Real Op;
    Real Oi;
    //
    //Real BE;
    Real BE;
    //Real SIDp;
    //Real SIDe;
    //Real SIDi;
    //Real SIDp2;
    Real SID;
    Real fH;
    Real fB;
    Real rCl;
    Real rHCO3;
    parameter Real XCl=0;
    parameter Real XNa=0;
    parameter Real XK=0;
    parameter Real XCa=0;
    parameter Real XMg=0;
    parameter Real XVw=0;
  equation
    //mass conservation - 6 equations
    MCl = mClE + mClP + mClI - XCl;
    MNa = mNaP + mNaI - XNa;
    MK = mKP + mKI - XK;
    MCa = mCaP + mCaI - XCa;
    MMg = mMgP + mMgI - XMg;
    MPi = mPiP + mPiI;
    //volume conservation - 1 equation
    Vew0 + Vpw0 + Viw0 + XVw = Vew + Vpw + Viw;
    //
    //donnan equilibrium - 7 equations
    C_ClE / C_ClP = 0.92 * (HCO3E / HCO3P);
    C_ClI / C_ClP = 0.92 * (HCO3I / HCO3P);
    C_ClI / C_ClP = C_NaP / C_NaI;
    C_ClI / C_ClP = C_KP / C_KI;
    (C_ClI / C_ClP) ^ 2 = C_CaP / C_CaI;
    (C_ClI / C_ClP) ^ 2 = C_MgP / C_MgI;
    (C_ClI / C_ClP) ^ abs(ZPi) = C_PiI / C_PiP;
    //
    //electroneutrality - 3 equations
    C_NaP + C_KP + 2 * C_CaP + 2 * C_MgP - C_ClP - HCO3P - 2 * CO3P + ZPi * C_PiP + ZAlb * C_AlbP + ZimP + X = 0;
    C_NaI + C_KI + 2 * C_CaI + 2 * C_MgI - C_ClI - HCO3I - 2 * CO3I + ZPi * C_PiI + ZAlb * C_AlbI + ZimI = 0;
    C_NaE + C_KE - C_ClE - HCO3E - 2 * CO3E + ZHb * C_Hb + ZDPG * C_DPG + ZATP * C_ATP + ZGSH * C_GSH + ZimE = 0;
    //3
    //osmotic equilibrium - 2 equations
    Op=Oe;
    Op=Oi;
    //0.93 * (C_NaP - C_NaI) + 0.93 * (C_KP - C_KI) + 0.93 * (C_ClP - C_ClI) + C_CaP - C_CaI + C_MgP - C_MgI + 0.93 * (HCO3P - HCO3I) + 0.93 * (CO3P - CO3I) + 0.93 * (C_PiP - C_PiI) + C_AlbP - C_AlbI + C_imP - C_imI = 0;
    //0.93 * (C_NaP - C_NaE) + 0.93 * (C_KP - C_KE) + 0.93 * (C_ClP - C_ClE) + 0.93 * (C_PiP - C_PiE) + C_imP - C_imE + C_CaP + C_MgP + C_AlbP - fiHb * C_Hb - C_DPG - C_ATP - C_GSH = 0;
    //
    //other
    //Z
    ZHb = 15.6 - 23 * (10 ^ (pHE - 6.69) / (1 + 10 ^ (pHE - 6.69))) - 4 * (10 ^ (pHE - 7.89) / (1 + 10 ^ (pHE - 7.89))) + 1.5 * ((1 - 0.75) / 0.75);
    ZDPG = (-3) - 1 * (10 ^ (pHE - 7.56) / (1 + 10 ^ (pHE - 7.56))) - 1 * (10 ^ (pHE - 7.32) / (1 + 10 ^ (pHE - 7.32)));
    ZATP = (-3) - 1 * (10 ^ (pHE - 6.8) / (1 + 10 ^ (pHE - 6.8)));
    ZGSH = (-1) - 1 * (10 ^ (pHE - 8.54) / (1 + 10 ^ (pHE - 8.54))) - 1 * (10 ^ (pHE - 9.42) / (1 + 10 ^ (pHE - 9.42)));
    ZPi = (-1) - 10 ^ (pHP - 6.87) / (1 + 10 ^ (pHP - 6.87));
    ZAlb = (-10.7) - 16 * (10 ^ (pHP - 7.42) / (1 + 10 ^ (pHP - 7.42)));
    fiHb = 1 + 0.115 * C_Hb + 0.0256 * C_Hb ^ 2;
    //carbonates and pH
    HCO3E = 0.026 * PCO2 * 10 ^ (pHE - 6.11);
    CO3E = HCO3E * 10 ^ (pHE - 10.2);
    HCO3P = 0.0306 * PCO2 * 10 ^ (pHP - 6.11);
    CO3P = HCO3P * 10 ^ (pHP - 10.2);
    HCO3I = 0.0326 * PCO2 * 10 ^ (pHI - 6.11);
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
    //osmolality
    //Oe = 0.93 * C_NaE + 0.93 * C_KE + 0.93 * C_ClE + 0.93 * C_PiE + fiHb * C_Hb + C_DPG + C_ATP + C_GSH + C_imE + HCO3E + CO3E;
    //Op = 0.93 * C_NaP + 0.93 * C_KP + 0.93 * C_ClP + C_CaP + C_MgP + HCO3P + CO3P + 0.93 * C_PiP + C_AlbP + C_imP;
    //Oi = 0.93 * C_NaI + 0.93 * C_KI + 0.93 * C_ClI + C_CaI + C_MgI + HCO3I + CO3I + 0.93 * C_PiI + C_AlbI + C_imI;
    Oe = (0.93 * C_NaE + 0.93 * C_KE + 0.93 * C_ClE + 0.93 * C_PiE + fiHb * C_Hb + C_DPG + C_ATP + C_GSH + C_imE + HCO3E + CO3E)*0.73;
    Op = (0.93 * C_NaP + 0.93 * C_KP + 0.93 * C_ClP + C_CaP + C_MgP + HCO3P + CO3P + 0.93 * C_PiP + C_AlbP + C_imP)*0.94;
    Oi = 0.93 * C_NaI + 0.93 * C_KI + 0.93 * C_ClI + C_CaI + C_MgI + HCO3I + CO3I + 0.93 * C_PiI + C_AlbI + C_imI;
    //
    //BE = (1 - 0.023 * C_Hb) * (HCO3P - 24.4 + (2.3 * C_Hb + 7.7) * (pHP - 7.4));
    BE = (1 - 0.023 * 9) * (HCO3P - 24.4 + (2.3 * 9 + 7.7) * (pHP - 7.4));
    //SIDp = C_NaP + C_KP + 2 * C_CaP + 2 * C_MgP - C_ClP;
    //SIDi = C_NaI + C_KI + 2 * C_CaI + 2 * C_MgI - C_ClI;
    //SIDe = C_NaE + C_KE - C_ClP;
    //SIDp2 = -((-HCO3P) - 2 * CO3P + ZPi * C_PiP + ZAlb * C_AlbP);
    fH = (Vew + Vew / 0.73 * (1 - 0.73)) / (Vew + Vew / 0.73 * (1 - 0.73) + Vpw + Vpw / 0.94 * (1 - 0.94));
    fB = Vblood / (Vblood + Vint);
    SID = (1 - (1 - HCO3E / HCO3P) * fH * fB) * HCO3P + (1 - fH * fB) * (C_AlbP * (8 * pHP - 41) + C_PiP * (0.3 * pHP - 0.4)) + C_Hb * fB * (10.2 * pHP - 73.6) + C_DPG * fH * fB * (0.7 * pHP - 0.5);
    rCl=C_ClE / C_ClP;
    rHCO3=HCO3E / HCO3P;
    //  SID=(1-(1-(HCO3E/HCO3P))*((Vew+(Vew/0.73*(1-0.73)))/((Vew+(Vew/0.73*(1-0.73))))+(Vpw+(Vpw/0.94*(1-0.94))*(Vblood/(Vblood+Vint)))*HCO3P+(1-((Vew+(Vew/0.73*(1-0.73)))/((Vew+(Vew/0.73*(1-0.73))))*(Vblood/(Vblood+Vint)))
    //
    dpH=pH0-pHP;
    der(X)=dpH;
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end IPE_metabolicReg;

  model IPE_respiratoryReg
    //default parameters
    //concentration in erythroctytes
    parameter Real NaE(unit="mmol/l") = 10/0.73;
    parameter Real KE(unit="mmol/l") = 99/0.73;
    parameter Real ClE(unit="mmol/l") = 55.3/0.73;
    parameter Real Hb(unit="mmol/l") = 5.3/0.73;
    parameter Real DPG(unit="mmol/l") = 4.4/0.73;
    parameter Real ATP(unit="mmol/l") = 1.8/0.73;
    parameter Real GSH(unit="mmol/l") = 2.2/0.73;
    parameter Real imE(unit="mmol/l") = 105.2/0.73;
    parameter Real PiE(unit="mmol/l") = 0.67/0.73;
    //concentrations in plasma nad intersticium
    parameter Real NaP(unit="mmol/l") = 141/0.94;
    parameter Real NaI(unit="mmol/l") = 142;
    parameter Real KP(unit="mmol/l") = 4.2/0.94;
    parameter Real KI(unit="mmol/l") = 4.14;
    parameter Real CaP(unit="mmol/l") = 2.3/0.94;
    parameter Real CaI(unit="mmol/l") = 2.2;
    parameter Real MgP(unit="mmol/l") = 0.8/0.94;
    parameter Real MgI(unit="mmol/l") = 0.75;
    parameter Real ClP(unit="mmol/l") = 104/0.94;
    parameter Real ClI(unit="mmol/l") = 118;
    parameter Real PiP(unit="mmol/l") = 1.16/0.94;
    parameter Real PiI(unit="mmol/l") = 1.2;
    parameter Real AlbP(unit="mmol/l") = 0.65/0.94;
    parameter Real AlbI(unit="mmol/l") = 0.19;
    parameter Real imP(unit="mmol/l") = 22.2/0.94;
    parameter Real imI(unit="mmol/l") = 3.91;
    //charge on inpermeable solutes
    parameter Real ZimE = -22.5;
    parameter Real ZimI = 0;
    parameter Real ZimP = 0.2;
    //volumes and CO2 preassure
    parameter Real Vblood(unit="l") = 5;
    parameter Real Vint(unit="l") = 10;
    Real PCO2(unit="torr",start = 46);
    //
    //derived parameters
    //water volumes in compartments
    parameter Real Vew0(unit="l") = 0.44 * 0.73 * Vblood;
    parameter Real Vpw0(unit="l") = (1 - 0.44) * 0.94 * Vblood;
    parameter Real Viw0(unit="l") = Vint;
    //masses in erythrocytes
    parameter Real m0NaE(unit="mmol") = NaE * Vew0;
    parameter Real m0KE(unit="mmol") = KE * Vew0;
    parameter Real m0ClE(unit="mmol") = ClE * Vew0;
    parameter Real m0Hb(unit="mmol") = Hb * Vew0;
    parameter Real m0DPG(unit="mmol") = DPG * Vew0;
    parameter Real m0ATP(unit="mmol") = ATP * Vew0;
    parameter Real m0GSH(unit="mmol") = GSH * Vew0;
    parameter Real m0imE(unit="mmol") = imE * Vew0;
    parameter Real m0PiE(unit="mmol") = PiE * Vew0;
    //masses in plasma and intersticium
    parameter Real m0NaP(unit="mmol") = NaP * Vpw0;
    parameter Real m0NaI(unit="mmol") = NaI * Viw0;
    parameter Real m0KP(unit="mmol") = KP * Vpw0;
    parameter Real m0KI(unit="mmol") = KI * Viw0;
    parameter Real m0CaP(unit="mmol") = CaP * Vpw0;
    parameter Real m0CaI(unit="mmol") = CaI * Viw0;
    parameter Real m0MgP(unit="mmol") = MgP * Vpw0;
    parameter Real m0MgI(unit="mmol") = MgI * Viw0;
    parameter Real m0ClP(unit="mmol") = ClP * Vpw0;
    parameter Real m0ClI(unit="mmol") = ClI * Viw0;
    parameter Real m0PiP(unit="mmol") = PiP * Vpw0;
    parameter Real m0PiI(unit="mmol") = PiI * Viw0;
    parameter Real m0AlbP(unit="mmol") = AlbP * Vpw0;
    parameter Real m0AlbI(unit="mmol") = AlbI * Viw0;
    parameter Real m0imP(unit="mmol") = imP * Vpw0;
    parameter Real m0imI(unit="mmol") = imI * Viw0;
    //overall masses of mobile ions
    parameter Real MCl(unit="mmol") = m0ClE + m0ClP + m0ClI;
    parameter Real MNa(unit="mmol") = m0NaP + m0NaI;
    parameter Real MK(unit="mmol") = m0KP + m0KI;
    parameter Real MCa(unit="mmol") = m0CaP + m0CaI;
    parameter Real MMg(unit="mmol") = m0MgP + m0MgI;
    parameter Real MPi(unit="mmol") = m0PiP + m0PiI;
    //
    parameter Real pH0=7.37;
    Real dpH;
    parameter Real X=0;
    //
    //masses of mobile ions - 13 unknowns
    Real mClE(unit="mmol");
    Real mClP(unit="mmol",start = m0ClP);
    Real mClI(unit="mmol");
    Real mNaP(unit="mmol");
    Real mNaI(unit="mmol");
    Real mKP(unit="mmol",start = m0KP);
    Real mKI(unit="mmol",start = m0KI);
    Real mCaP(unit="mmol");
    Real mCaI(unit="mmol",start = m0CaI);
    Real mMgP(unit="mmol",start = m0MgP);
    Real mMgI(unit="mmol",start = m0MgI);
    Real mPiP(unit="mmol",start = m0PiP);
    Real mPiI(unit="mmol",start = m0PiI);
    //
    //volumes of water - 3 unknowns
    Real Vew(unit="l",start = Vew0);
    Real Vpw(unit="l",start = Vpw0);
    Real Viw(unit="l",start = Viw0);
    //
    // concentrations of bicarbonates - 3 unknowns
    Real HCO3E(unit="mmol/l");
    Real HCO3P(unit="mmol/l");
    Real HCO3I(unit="mmol/l");
    //
    //other unknowns
    //pH
    Real pHE(start = 7.22);
    Real pHP(start = 7.4);
    Real pHI(start = 7.39);
    //pH dependatn chargers
    Real ZPi;
    Real ZAlb;
    Real ZHb;
    Real ZDPG;
    Real ZATP;
    Real ZGSH;
    Real fiHb;
    //carbonates
    Real CO3E(unit="mmol/l");
    Real CO3P(unit="mmol/l");
    Real CO3I(unit="mmol/l");
    //concentrations
    Real C_NaE(unit="mmol/l",start = NaE);
    Real C_KE(unit="mmol/l",start = KE);
    Real C_ClE(unit="mmol/l",start = ClE);
    Real C_Hb(unit="mmol/l",start = Hb);
    Real C_DPG(unit="mmol/l",start = DPG);
    Real C_ATP(unit="mmol/l",start = ATP);
    Real C_GSH(unit="mmol/l",start = GSH);
    Real C_imE(unit="mmol/l",start = imE);
    Real C_PiE(unit="mmol/l",start = PiE);
    //
    Real C_NaP(unit="mmol/l",start = NaP);
    Real C_NaI(unit="mmol/l",start = NaI);
    Real C_KP(unit="mmol/l",start = KP);
    Real C_KI(unit="mmol/l",start = KI);
    Real C_CaP(unit="mmol/l",start = CaP);
    Real C_CaI(unit="mmol/l",start = CaI);
    Real C_MgP(unit="mmol/l",start = MgP);
    Real C_MgI(unit="mmol/l",start = MgI);
    Real C_ClP(unit="mmol/l",start = ClP);
    Real C_ClI(unit="mmol/l",start = ClI);
    Real C_PiP(unit="mmol/l",start = PiP);
    Real C_PiI(unit="mmol/l",start = PiI);
    Real C_AlbP(unit="mmol/l",start = AlbP);
    Real C_AlbI(unit="mmol/l",start = AlbI);
    Real C_imP(unit="mmol/l",start = imP);
    Real C_imI(unit="mmol/l",start = imI);
    //osmolality
    Real Oe;
    Real Op;
    Real Oi;
    //
    //Real BE;
    Real BE;
    //Real SIDp;
    //Real SIDe;
    //Real SIDi;
    //Real SIDp2;
    Real SID;
    Real fH;
    Real fB;
    Real rCl;
    Real rHCO3;
    parameter Real XCl=0;
    parameter Real XNa=0;
    parameter Real XK=0;
    parameter Real XCa=0;
    parameter Real XMg=0;
    parameter Real XVw=0;
  equation
    //mass conservation - 6 equations
    MCl = mClE + mClP + mClI - XCl;
    MNa = mNaP + mNaI - XNa;
    MK = mKP + mKI - XK;
    MCa = mCaP + mCaI - XCa;
    MMg = mMgP + mMgI - XMg;
    MPi = mPiP + mPiI;
    //volume conservation - 1 equation
    Vew0 + Vpw0 + Viw0 + XVw = Vew + Vpw + Viw;
    //
    //donnan equilibrium - 7 equations
    C_ClE / C_ClP = 0.92 * (HCO3E / HCO3P);
    C_ClI / C_ClP = 0.92 * (HCO3I / HCO3P);
    C_ClI / C_ClP = C_NaP / C_NaI;
    C_ClI / C_ClP = C_KP / C_KI;
    (C_ClI / C_ClP) ^ 2 = C_CaP / C_CaI;
    (C_ClI / C_ClP) ^ 2 = C_MgP / C_MgI;
    (C_ClI / C_ClP) ^ abs(ZPi) = C_PiI / C_PiP;
    //
    //electroneutrality - 3 equations
    C_NaP + C_KP + 2 * C_CaP + 2 * C_MgP - C_ClP - HCO3P - 2 * CO3P + ZPi * C_PiP + ZAlb * C_AlbP + ZimP + X = 0;
    C_NaI + C_KI + 2 * C_CaI + 2 * C_MgI - C_ClI - HCO3I - 2 * CO3I + ZPi * C_PiI + ZAlb * C_AlbI + ZimI = 0;
    C_NaE + C_KE - C_ClE - HCO3E - 2 * CO3E + ZHb * C_Hb + ZDPG * C_DPG + ZATP * C_ATP + ZGSH * C_GSH + ZimE = 0;
    //3
    //osmotic equilibrium - 2 equations
    Op=Oe;
    Op=Oi;
    //0.93 * (C_NaP - C_NaI) + 0.93 * (C_KP - C_KI) + 0.93 * (C_ClP - C_ClI) + C_CaP - C_CaI + C_MgP - C_MgI + 0.93 * (HCO3P - HCO3I) + 0.93 * (CO3P - CO3I) + 0.93 * (C_PiP - C_PiI) + C_AlbP - C_AlbI + C_imP - C_imI = 0;
    //0.93 * (C_NaP - C_NaE) + 0.93 * (C_KP - C_KE) + 0.93 * (C_ClP - C_ClE) + 0.93 * (C_PiP - C_PiE) + C_imP - C_imE + C_CaP + C_MgP + C_AlbP - fiHb * C_Hb - C_DPG - C_ATP - C_GSH = 0;
    //
    //other
    //Z
    ZHb = 15.6 - 23 * (10 ^ (pHE - 6.69) / (1 + 10 ^ (pHE - 6.69))) - 4 * (10 ^ (pHE - 7.89) / (1 + 10 ^ (pHE - 7.89))) + 1.5 * ((1 - 0.75) / 0.75);
    ZDPG = (-3) - 1 * (10 ^ (pHE - 7.56) / (1 + 10 ^ (pHE - 7.56))) - 1 * (10 ^ (pHE - 7.32) / (1 + 10 ^ (pHE - 7.32)));
    ZATP = (-3) - 1 * (10 ^ (pHE - 6.8) / (1 + 10 ^ (pHE - 6.8)));
    ZGSH = (-1) - 1 * (10 ^ (pHE - 8.54) / (1 + 10 ^ (pHE - 8.54))) - 1 * (10 ^ (pHE - 9.42) / (1 + 10 ^ (pHE - 9.42)));
    ZPi = (-1) - 10 ^ (pHP - 6.87) / (1 + 10 ^ (pHP - 6.87));
    ZAlb = (-10.7) - 16 * (10 ^ (pHP - 7.42) / (1 + 10 ^ (pHP - 7.42)));
    fiHb = 1 + 0.115 * C_Hb + 0.0256 * C_Hb ^ 2;
    //carbonates and pH
    HCO3E = 0.026 * PCO2 * 10 ^ (pHE - 6.11);
    CO3E = HCO3E * 10 ^ (pHE - 10.2);
    HCO3P = 0.0306 * PCO2 * 10 ^ (pHP - 6.11);
    CO3P = HCO3P * 10 ^ (pHP - 10.2);
    HCO3I = 0.0326 * PCO2 * 10 ^ (pHI - 6.11);
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
    //osmolality
    //Oe = 0.93 * C_NaE + 0.93 * C_KE + 0.93 * C_ClE + 0.93 * C_PiE + fiHb * C_Hb + C_DPG + C_ATP + C_GSH + C_imE + HCO3E + CO3E;
    //Op = 0.93 * C_NaP + 0.93 * C_KP + 0.93 * C_ClP + C_CaP + C_MgP + HCO3P + CO3P + 0.93 * C_PiP + C_AlbP + C_imP;
    //Oi = 0.93 * C_NaI + 0.93 * C_KI + 0.93 * C_ClI + C_CaI + C_MgI + HCO3I + CO3I + 0.93 * C_PiI + C_AlbI + C_imI;
    Oe = (0.93 * C_NaE + 0.93 * C_KE + 0.93 * C_ClE + 0.93 * C_PiE + fiHb * C_Hb + C_DPG + C_ATP + C_GSH + C_imE + HCO3E + CO3E)*0.73;
    Op = (0.93 * C_NaP + 0.93 * C_KP + 0.93 * C_ClP + C_CaP + C_MgP + HCO3P + CO3P + 0.93 * C_PiP + C_AlbP + C_imP)*0.94;
    Oi = 0.93 * C_NaI + 0.93 * C_KI + 0.93 * C_ClI + C_CaI + C_MgI + HCO3I + CO3I + 0.93 * C_PiI + C_AlbI + C_imI;
    //
    //BE = (1 - 0.023 * C_Hb) * (HCO3P - 24.4 + (2.3 * C_Hb + 7.7) * (pHP - 7.4));
    BE = (1 - 0.023 * 9) * (HCO3P - 24.4 + (2.3 * 9 + 7.7) * (pHP - 7.4));
    //SIDp = C_NaP + C_KP + 2 * C_CaP + 2 * C_MgP - C_ClP;
    //SIDi = C_NaI + C_KI + 2 * C_CaI + 2 * C_MgI - C_ClI;
    //SIDe = C_NaE + C_KE - C_ClP;
    //SIDp2 = -((-HCO3P) - 2 * CO3P + ZPi * C_PiP + ZAlb * C_AlbP);
    fH = (Vew + Vew / 0.73 * (1 - 0.73)) / (Vew + Vew / 0.73 * (1 - 0.73) + Vpw + Vpw / 0.94 * (1 - 0.94));
    fB = Vblood / (Vblood + Vint);
    SID = (1 - (1 - HCO3E / HCO3P) * fH * fB) * HCO3P + (1 - fH * fB) * (C_AlbP * (8 * pHP - 41) + C_PiP * (0.3 * pHP - 0.4)) + C_Hb * fB * (10.2 * pHP - 73.6) + C_DPG * fH * fB * (0.7 * pHP - 0.5);
    rCl=C_ClE / C_ClP;
    rHCO3=HCO3E / HCO3P;
    //  SID=(1-(1-(HCO3E/HCO3P))*((Vew+(Vew/0.73*(1-0.73)))/((Vew+(Vew/0.73*(1-0.73))))+(Vpw+(Vpw/0.94*(1-0.94))*(Vblood/(Vblood+Vint)))*HCO3P+(1-((Vew+(Vew/0.73*(1-0.73)))/((Vew+(Vew/0.73*(1-0.73))))*(Vblood/(Vblood+Vint)))
    dpH=pH0-pHP;
    -der(PCO2)=dpH;
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end IPE_respiratoryReg;
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})),
    uses(Modelica(version="3.2.1")));
end IPE_rovnice;
