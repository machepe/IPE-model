within ;
package IPE_rovnice

  //model IPE12_promenyPHE
  //end IPE12_promenyPHE;

  partial model Part
    //default parameters
    //concentration in erythroctytes
    parameter Real NaE(unit="mmol/l") = 10/0.73;
    parameter Real KE(unit="mmol/l") = 99/0.73;
    parameter Real ClE(unit="mmol/l") = 55.3/0.73;
    parameter Real Hb(unit="mmol/l") = 5.3/0.73;
    parameter Real DPG(unit="mmol/l") = 4.4/0.73;
    parameter Real ATP(unit="mmol/l") = 1.8/0.73;
    parameter Real GSH(unit="mmol/l") = 2.2/0.73;
    //parameter Real imE(unit="mmol/l") = 17.5/0.73;
    parameter Real imE(unit="mmol/l") = 24.9/0.73;
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
    //parameter Real imP(unit="mmol/l") = 6.4/0.94;
    //parameter Real imI(unit="mmol/l") = 6.0;
    parameter Real imP(unit="mmol/l") = 6/0.94;
    parameter Real imI(unit="mmol/l") = 6.36;
    //charge on inpermeable solutes
    //parameter Real ZimE = -8.4;
    //parameter Real ZimI = -0.7;
    //parameter Real ZimP = -6.3;
    parameter Real ZimE = -9.2;
    parameter Real ZimI = 1.4;
    parameter Real ZimP = -5.3;
    //volumes and CO2 preassure
    parameter Real Vblood(unit="l") = 5;
    parameter Real Vint(unit="l") = 10;
    Real PCO2(unit="torr", start = 46);
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
    Real ZPi = (-1) - 10 ^ (pHP - 6.87) / (1 + 10 ^ (pHP - 6.87));
    Real ZAlb = (-10.7) - 16 * (10 ^ (pHP - 7.42) / (1 + 10 ^ (pHP - 7.42)));
    Real ZHb = 15.6 - 23 * (10 ^ (pHE - 6.69) / (1 + 10 ^ (pHE - 6.69))) - 4 * (10 ^ (pHE - 7.89) / (1 + 10 ^ (pHE - 7.89))) + 1.5 * ((1 - 0.75) / 0.75);
    Real ZDPG = (-3) - 1 * (10 ^ (pHE - 7.56) / (1 + 10 ^ (pHE - 7.56))) - 1 * (10 ^ (pHE - 7.32) / (1 + 10 ^ (pHE - 7.32)));
    Real ZATP = (-3) - 1 * (10 ^ (pHE - 6.8) / (1 + 10 ^ (pHE - 6.8)));
    Real ZGSH = (-1) - 1 * (10 ^ (pHE - 8.54) / (1 + 10 ^ (pHE - 8.54))) - 1 * (10 ^ (pHE - 9.42) / (1 + 10 ^ (pHE - 9.42)));
    Real fiHb = 1 + 0.115 * C_Hb + 0.0256 * C_Hb ^ 2;
    //carbonates
    Real CO3E(unit="mmol/l") = HCO3E * 10 ^ (pHE - 10.2);
    Real CO3P(unit="mmol/l") = HCO3P * 10 ^ (pHP - 10.2);
    Real CO3I(unit="mmol/l") = HCO3I * 10 ^ (pHI - 10.2);
    //concentrations
    Real C_NaE(unit="mmol/l",start = NaE) = m0NaE / Vew;
    Real C_KE(unit="mmol/l",start = KE) = m0KE / Vew;
    Real C_ClE(unit="mmol/l",start = ClE) = mClE / Vew;
    Real C_Hb(unit="mmol/l",start = Hb) = m0Hb / Vew;
    Real C_DPG(unit="mmol/l",start = DPG) = m0DPG / Vew;
    Real C_ATP(unit="mmol/l",start = ATP) = m0ATP / Vew;
    Real C_GSH(unit="mmol/l",start = GSH) = m0GSH / Vew;
    Real C_imE(unit="mmol/l",start = imE) = m0imE / Vew;
    Real C_PiE(unit="mmol/l",start = PiE) = m0PiE / Vew;
    //
    Real C_NaP(unit="mmol/l",start = NaP) = mNaP / Vpw;
    Real C_NaI(unit="mmol/l",start = NaI) = mNaI / Viw;
    Real C_KP(unit="mmol/l",start = KP) = mKP / Vpw;
    Real C_KI(unit="mmol/l",start = KI) = mKI / Viw;
    Real C_CaP(unit="mmol/l",start = CaP) = mCaP / Vpw;
    Real C_CaI(unit="mmol/l",start = CaI) = mCaI / Viw;
    Real C_MgP(unit="mmol/l",start = MgP) = mMgP / Vpw;
    Real C_MgI(unit="mmol/l",start = MgI) = mMgI / Viw;
    Real C_ClP(unit="mmol/l",start = ClP) = mClP / Vpw;
    Real C_ClI(unit="mmol/l",start = ClI) = mClI / Viw;
    Real C_PiP(unit="mmol/l",start = PiP) = mPiP / Vpw;
    Real C_PiI(unit="mmol/l",start = PiI) = mPiI / Viw;
    Real C_AlbP(unit="mmol/l",start = AlbP) = m0AlbP / Vpw;
    Real C_AlbI(unit="mmol/l",start = AlbI) = m0AlbI / Viw;
    Real C_imP(unit="mmol/l",start = imP) = m0imP / Vpw;
    Real C_imI(unit="mmol/l",start = imI) = m0imI / Viw;
    //osmolality
    Real Oe = (0.93 * C_NaE + 0.93 * C_KE + 0.93 * C_ClE + 0.93 * C_PiE + fiHb * C_Hb + C_DPG + C_ATP + C_GSH + C_imE + HCO3E + CO3E);//*0.73;
    Real Op = (0.93 * C_NaP + 0.93 * C_KP + 0.93 * C_ClP + C_CaP + C_MgP + HCO3P + CO3P + 0.93 * C_PiP + C_AlbP + C_imP);// *0.94;
    Real Oi = 0.93 * C_NaI + 0.93 * C_KI + 0.93 * C_ClI + C_CaI + C_MgI + HCO3I + CO3I + 0.93 * C_PiI + C_AlbI + C_imI;
    //electric charge
    Real Qe = (C_NaE + C_KE - C_ClE - HCO3E - 2 * CO3E + ZHb * C_Hb + ZDPG * C_DPG + ZATP * C_ATP + ZGSH * C_GSH + ZimE)*Vew;
    Real Qp = (C_NaP + C_KP + 2 * C_CaP + 2 * C_MgP - C_ClP - HCO3P - 2 * CO3P + ZPi * C_PiP + ZAlb * C_AlbP + ZimP)*Vpw+X;
    Real X(unit="mEq");
    Real Qi = (C_NaI + C_KI + 2 * C_CaI + 2 * C_MgI - C_ClI - HCO3I - 2 * CO3I + ZPi * C_PiI + ZAlb * C_AlbI + ZimI)*Viw;
    //
    Real BE;
    Real SBE;
    Real SID;
    Real fH = (Vew + Vew / 0.73 * (1 - 0.73)) / (Vew + Vew / 0.73 * (1 - 0.73) + Vpw + Vpw / 0.94 * (1 - 0.94));
    Real fB = Vblood / (Vblood + Vint);
    Real rCl = C_ClE / C_ClP;
    Real rHCO3 = HCO3E / HCO3P;
    //addition of species
    Real XCl(unit="mmol");
    Real XNa(unit="mmol");
    Real XK(unit="mmol");
    Real XCa(unit="mmol");
    Real XMg(unit="mmol");
    Real XVw(unit="l");

    Real a;
    Real HE(start=10^(-(a-0.17))); //(start=10^(-7.2));
    Real HP(start=10^(-a));//(start=10^(-7.37));
    Real HI(start=10^(-(a+0.02))); //(start=10^(-7.39));

  equation
    pHE=-log10(HE);
    pHP=-log10(HP);
    pHI=-log10(HI);
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
    C_ClE / C_ClP = HP / HE;
    C_ClI / C_ClP = HP / HI;
    C_ClI / C_ClP = C_NaP / C_NaI;
    C_ClI / C_ClP = C_KP / C_KI;
    (C_ClI / C_ClP) ^ 2 = C_CaP / C_CaI;
    (C_ClI / C_ClP) ^ 2 = C_MgP / C_MgI;
    (C_ClI / C_ClP) ^ abs(ZPi) = C_PiI / C_PiP;
    //
    //electroneutrality - 3 equations
    Qe = 0;
    Qp = 0;
    Qi = 0;
      //osmotic equilibrium - 2 equations
    Op=Oe;
    Op=Oi;
    //
    //carbonates and pH
    HCO3E = 0.026 * PCO2 * 10 ^ (pHE - 6.11);
    HCO3P = 0.0306 * PCO2 * 10 ^ (pHP - 6.11);
    HCO3I = 0.0326 * PCO2 * 10 ^ (pHI - 6.11);
    //
    BE = (1 - 0.023 * 9) * (HCO3P - 24.4 + (2.3 * 9 + 7.7) * (pHP - 7.4));
    SBE = (1 - 0.023 * 3) * (HCO3P - 24.4 + (2.3 * 3 + 7.7) * (pHP - 7.4));
    SID = (1 - (1 - HCO3E / HCO3P) * fH * fB) * HCO3P + (1 - fH * fB) * (C_AlbP * (8 * pHP - 41) + C_PiP * (0.3 * pHP - 0.4)) + C_Hb * fB * (10.2 * pHP - 73.6) + C_DPG * fH * fB * (0.7 * pHP - 0.5);
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end Part;

  model Default
    extends Part;
  equation
    a=7.17;
    pHP=7.17;
    PCO2 = 78;
    X = 0;
    //XCl=0;
    XNa=0;
    XK=0;
    XCa=0;
    XMg=0;
    XVw=0;
  end Default;

  model PCOchange
    extends Part;
  equation
    a=7.8;
    PCO2=20+100*time;
    X = 0;
    XCl=0;
    XNa=0;
    XK=0;
    XCa=0;
    XMg=0;
    XVw=0;
  end PCOchange;

  model Exp_ClAdd
    extends Part;
  equation
    a=7.37;
    PCO2 = 46;
    X = 0;
    XCl=0+300*time;
    XNa=0;
    XK=0;
    XCa=0;
    XMg=0;
    XVw=0;
  end Exp_ClAdd;

  model Exp_water
    extends Part;
  equation
    a=7.32;
    PCO2 = 46;
    X = 0;
    XCl=0;
    XNa=0;
    XK=0;
    XCa=0;
    XMg=0;
    XVw=2-4*time;
  end Exp_water;

  model respiratoryRegulation
    extends Part;
    parameter Real pH0=7.37;
    Real dpH;
  initial equation
    PCO2=46;
  equation
    a=7.7;
    dpH=pH0-pHP;
    -der(PCO2)=(dpH*1000);
    X = 0;
    XCl=0;
    XNa=250;
    XK=0;
    XCa=0;
    XMg=0;
    XVw=0;
  end respiratoryRegulation;

  model metabolicRegulation
    extends Part;
    parameter Real pH0=7.37;
    Real dpH;
  initial equation
    X=0;
  equation
    dpH = pH0 - pHP;
    der(X) = (dpH*10000);
    PCO2 = 80;
    XCl=0;
    XNa=0;
    XK=0;
    XCa=0;
    XMg=0;
    XVw=0;
  end metabolicRegulation;

  model blood
    //default parameters
    //concentration in erythroctytes
    parameter Real NaE(unit="mmol/l") = 10/0.73;
    parameter Real KE(unit="mmol/l") = 99/0.73;
    parameter Real ClE(unit="mmol/l") = 53.8/0.73;
    parameter Real Hb(unit="mmol/l") = 5.3/0.73;
    parameter Real DPG(unit="mmol/l") = 4.4/0.73;
    parameter Real ATP(unit="mmol/l") = 1.8/0.73;
    parameter Real GSH(unit="mmol/l") = 2.2/0.73;
    parameter Real imE(unit="mmol/l") = 20.2/0.73;
    parameter Real PiE(unit="mmol/l") = 0.67/0.73;
    //concentrations in plasma nad intersticium
    parameter Real NaP(unit="mmol/l") = 140/0.94;
    parameter Real KP(unit="mmol/l") = 4.1/0.94;
    parameter Real CaP(unit="mmol/l") = 2.3/0.94;
    parameter Real MgP(unit="mmol/l") = 0.8/0.94;
    parameter Real ClP(unit="mmol/l") = 105/0.94;
    parameter Real PiP(unit="mmol/l") = 1.16/0.94;
    parameter Real AlbP(unit="mmol/l") = 0.65/0.94;
    parameter Real imP(unit="mmol/l") = 6/0.94;
    //charge on inpermeable solutes
    parameter Real ZimE = -9.2;
    parameter Real ZimP = -5.3;
    //volumes and CO2 preassure
    parameter Real Vblood(unit="l") = 5;
    Real PCO2(unit="torr");// = 46;
    //
    //derived parameters
    //water volumes in compartments
    parameter Real Vew0(unit="l") = 0.44 * 0.73 * Vblood;
    parameter Real Vpw0(unit="l") = (1 - 0.44) * 0.94 * Vblood;
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
    parameter Real m0KP(unit="mmol") = KP * Vpw0;
    parameter Real m0CaP(unit="mmol") = CaP * Vpw0;
    parameter Real m0MgP(unit="mmol") = MgP * Vpw0;
    parameter Real m0ClP(unit="mmol") = ClP * Vpw0;
    parameter Real m0PiP(unit="mmol") = PiP * Vpw0;
    parameter Real m0AlbP(unit="mmol") = AlbP * Vpw0;
    parameter Real m0imP(unit="mmol") = imP * Vpw0;
    //overall masses of mobile ions
    parameter Real MCl(unit="mmol") = m0ClE + m0ClP;
    //
    //masses of mobile ions - 13 unknowns
    Real mClE(unit="mmol");
    Real mClP(unit="mmol",start = m0ClP);
    //
    //volumes of water - 3 unknowns
    Real Vew(unit="l",start = Vew0);
    Real Vpw(unit="l",start = Vpw0);
    //
    // concentrations of bicarbonates - 3 unknowns
    Real HCO3E(unit="mmol/l");
    Real HCO3P(unit="mmol/l");
    //
    //other unknowns
    //pH
    Real pHE(start = 7.22);
    Real pHP(start = 7.4);
    //pH dependatn chargers
    Real ZPi = (-1) - 10 ^ (pHP - 6.87) / (1 + 10 ^ (pHP - 6.87));
    Real ZAlb = (-10.7) - 16 * (10 ^ (pHP - 7.42) / (1 + 10 ^ (pHP - 7.42)));
    Real ZHb = 15.6 - 23 * (10 ^ (pHE - 6.69) / (1 + 10 ^ (pHE - 6.69))) - 4 * (10 ^ (pHE - 7.89) / (1 + 10 ^ (pHE - 7.89))) + 1.5 * ((1 - 0.75) / 0.75);
    Real ZDPG = (-3) - 1 * (10 ^ (pHE - 7.56) / (1 + 10 ^ (pHE - 7.56))) - 1 * (10 ^ (pHE - 7.32) / (1 + 10 ^ (pHE - 7.32)));
    Real ZATP = (-3) - 1 * (10 ^ (pHE - 6.8) / (1 + 10 ^ (pHE - 6.8)));
    Real ZGSH = (-1) - 1 * (10 ^ (pHE - 8.54) / (1 + 10 ^ (pHE - 8.54))) - 1 * (10 ^ (pHE - 9.42) / (1 + 10 ^ (pHE - 9.42)));
    Real fiHb = 1 + 0.115 * C_Hb + 0.0256 * C_Hb ^ 2;
    //carbonates
    Real CO3E(unit="mmol/l") = HCO3E * 10 ^ (pHE - 10.2);
    Real CO3P(unit="mmol/l") = HCO3P * 10 ^ (pHP - 10.2);
    //concentrations
    Real C_NaE(unit="mmol/l",start = NaE) = m0NaE / Vew;
    Real C_KE(unit="mmol/l",start = KE) = m0KE / Vew;
    Real C_ClE(unit="mmol/l",start = ClE) = mClE / Vew;
    Real C_Hb(unit="mmol/l",start = Hb) = m0Hb / Vew;
    Real C_DPG(unit="mmol/l",start = DPG) = m0DPG / Vew;
    Real C_ATP(unit="mmol/l",start = ATP) = m0ATP / Vew;
    Real C_GSH(unit="mmol/l",start = GSH) = m0GSH / Vew;
    Real C_imE(unit="mmol/l",start = imE) = m0imE / Vew;
    Real C_PiE(unit="mmol/l",start = PiE) = m0PiE / Vew;
    //
    Real C_NaP(unit="mmol/l",start = NaP) = m0NaP / Vpw;
    Real C_KP(unit="mmol/l",start = KP) = m0KP / Vpw;
    Real C_CaP(unit="mmol/l",start = CaP) = m0CaP / Vpw;
    Real C_MgP(unit="mmol/l",start = MgP) = m0MgP / Vpw;
    Real C_ClP(unit="mmol/l",start = ClP) = mClP / Vpw;
    Real C_PiP(unit="mmol/l",start = PiP) = m0PiP / Vpw;
    Real C_AlbP(unit="mmol/l",start = AlbP) = m0AlbP / Vpw;
    Real C_imP(unit="mmol/l",start = imP) = m0imP / Vpw;
    //osmolality
    Real Oe = (0.93 * C_NaE + 0.93 * C_KE + 0.93 * C_ClE + 0.93 * C_PiE + fiHb * C_Hb + C_DPG + C_ATP + C_GSH + C_imE + HCO3E + CO3E);//*0.73;
    Real Op = (0.93 * C_NaP + 0.93 * C_KP + 0.93 * C_ClP + C_CaP + C_MgP + HCO3P + CO3P + 0.93 * C_PiP + C_AlbP + C_imP);// *0.94;
    //electric charge
    Real Qe = (C_NaE + C_KE - C_ClE - HCO3E - 2 * CO3E + ZHb * C_Hb + ZDPG * C_DPG + ZATP * C_ATP + ZGSH * C_GSH + ZimE)*Vew;
    Real Qp = (C_NaP + C_KP + 2 * C_CaP + 2 * C_MgP - C_ClP - HCO3P - 2 * CO3P + ZPi * C_PiP + ZAlb * C_AlbP + ZimP)*Vpw+X;
    parameter Real X(unit="mEq")=0;
    //
    Real BE;
    //Real SID;
    Real fH = (Vew + Vew / 0.73 * (1 - 0.73)) / (Vew + Vew / 0.73 * (1 - 0.73) + Vpw + Vpw / 0.94 * (1 - 0.94));
    Real rCl = C_ClE / C_ClP;
    Real rHCO3 = HCO3E / HCO3P;
    //addition of species
    Real XCl(unit="mmol");//= 0;

    Real HE(start=10^(-7.2));
    Real HP(start=10^(-7.37));

  equation
    pHP=6.3+1.7*time;
    //pHP=7.4;
    pHE=-log10(HE);
    pHP=-log10(HP);
    //mass conservation - 6 equations
    MCl = mClE + mClP - XCl;
    //volume conservation - 1 equation
    Vew0 + Vpw0 = Vew + Vpw;
    //
    //donnan equilibrium - 7 equations
    C_ClE / C_ClP = HP / HE;
    //
    //electroneutrality - 3 equations
    Qe = 0;
    Qp = 0;
      //osmotic equilibrium - 2 equations
    Op=Oe;
    //
    //carbonates and pH
    HCO3E = 0.026 * PCO2 * 10 ^ (pHE - 6.11);
    HCO3P = 0.0306 * PCO2 * 10 ^ (pHP - 6.11);
    //
    BE = (1 - 0.023 * 9) * (HCO3P - 24.4 + (2.3 * 9 + 7.7) * (pHP - 7.4));
    BE=0;
    //SID = (1 - (1 - HCO3E / HCO3P) * fH * fB) * HCO3P + (1 - fH * fB) * (C_AlbP * (8 * pHP - 41) + C_PiP * (0.3 * pHP - 0.4)) + C_Hb * fB * (10.2 * pHP - 73.6) + C_DPG * fH * fB * (0.7 * pHP - 0.5);
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end blood;

  model Exp_PCO2_SBE0
    extends Part;
  equation
    a=6.8;
    pHP=6.8+time;
    X = 0;
    XCl=0;
    //XNa=0;
    SBE=0;
    XK=0;
    XCa=0;
    XMg=0;
    XVw=0;
  end Exp_PCO2_SBE0;

  model Exp_PCO2_SBE15
    extends Part;
  equation
    a=6.8;
    pHP=6.8+time;
    X = 0;
    XCl=0;
    //XNa=0;
    SBE=15;
    XK=0;
    XCa=0;
    XMg=0;
    XVw=0;
  end Exp_PCO2_SBE15;

  model Exp_PCO2_SBEminus15
    extends Part;
  equation
    a=6.8;
    pHP=6.8+time;
    X = 0;
    XCl=0;
    //XNa=0;
    SBE=-15;
    XK=0;
    XCa=0;
    XMg=0;
    XVw=0;
  end Exp_PCO2_SBEminus15;
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})),
    uses(Modelica(version="3.2.1")));
end IPE_rovnice;
