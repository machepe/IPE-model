within ;
package Models
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

  package IPE_EquationBased

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
      a=7.37;
      pHP=7.37;
      PCO2 = 46;
      X = 0;
      //XCl=0;
      XNa=0;
      XK=0;
      XCa=0;
      XMg=0;
      XVw=0;
    end Default;

    model Exp_PCOchange
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
    end Exp_PCOchange;

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
      a=7.17;
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
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end IPE_EquationBased;

  package IPE_ComponentBased

    model Model
      Chemical.Components.Substance Water_E(substanceData = Chemical.Examples.Substances.Water_liquid,
          amountOfSubstance_start=5*55.13*0.44*1*0.73)                                                                                                    annotation(Placement(transformation(extent = {{-294, 48}, {-274, 68}})));
      Chemical.Components.Substance Water_P(substanceData = Chemical.Examples.Substances.Water_liquid,
          amountOfSubstance_start=(5*55.13*0.56*1*0.94))                                                                                                  annotation(Placement(transformation(extent = {{-72, 50}, {-52, 70}})));
      Chemical.Components.Substance Water_I(substanceData = Chemical.Examples.Substances.Water_liquid,
          amountOfSubstance_start=5*55.13*2)                                                                                                annotation(Placement(transformation(extent = {{164, 52}, {144, 72}})));
      Chemical.Components.Substance CO2_E(substanceData = Chemical.Examples.Substances.CarbonDioxide_aqueous, redeclare
          package stateOfMatter =
            Chemical.Interfaces.Incompressible,
        amountOfSubstance_start=(5*1.2*0.32e-3)/0.73)                                                                                                     annotation(Placement(transformation(extent = {{-296, 122}, {-276, 142}})));
      Chemical.Components.Substance CO2_P(substanceData = Chemical.Examples.Substances.CarbonDioxide_aqueous,
          amountOfSubstance_start=(5*1.407*0.53e-3)/0.94)                                                                                                annotation(Placement(transformation(extent = {{-74, 122}, {-54, 142}})));
      Chemical.Components.Substance CO2_I(substanceData = Chemical.Examples.Substances.CarbonDioxide_aqueous,
          amountOfSubstance_start=5*1.5*2e-3)                                                                                                     annotation(Placement(transformation(extent = {{164, 122}, {144, 142}})));
      Chemical.Components.Substance HCO3_E(substanceData = Chemical.Examples.Substances.Bicarbonate_aqueous,
          amountOfSubstance_start=(5*15.1*0.32e-3)/0.7)                                                                                                annotation(Placement(transformation(extent = {{-228, 76}, {-208, 96}})));
      Chemical.Components.Substance H_E(substanceData = Chemical.Examples.Substances.Proton_aqueous,
          amountOfSubstance_start=(5*0.32/0.73)*10^(-7.2))                                                                                         annotation(Placement(transformation(extent = {{-160, 30}, {-140, 50}})));
      Chemical.Components.Reaction reaction(nS = 2, nP = 2, s = {1, 1}, p = {1, 1}) annotation(Placement(transformation(extent = {{-266, 62}, {-246, 82}})));
      Chemical.Components.Reaction reaction1(nS = 1, s = {1}, nP = 2, p = {1, 1}) annotation(Placement(transformation(extent = {{-204, 30}, {-184, 50}})));
      Chemical.Components.Substance CO3_E(substanceData = Chemical.Examples.Substances.Carbonate_aqueous,
          amountOfSubstance_start=(5*0.015*0.32e-3)/0.73)                                                                                            annotation(Placement(transformation(extent = {{-160, 94}, {-140, 114}})));
      Chemical.Components.Substance H2PO4_E(substanceData = Chemical.Examples.Substances.DihydrogenPhosphate_aqueous,
          amountOfSubstance_start=(5*0.33*0.32e-3)/0.73)                                                                                                     annotation(Placement(transformation(extent = {{-240, -12}, {-220, 8}})));
      Chemical.Components.Substance HPO4_E(substanceData = Chemical.Examples.Substances.HydrogenPhosphate_aqueous,
          amountOfSubstance_start=(5*0.33*0.32e-3)/0.73)                                                                                                     annotation(Placement(transformation(extent = {{-160, 8}, {-140, 28}})));
      Chemical.Components.Reaction reaction2(nP = 2, p = {1, 1}, nS = 1, s = {1}) annotation(Placement(transformation(extent = {{-204, 2}, {-184, 22}})));
      Chemical.Components.Substance Na_E(substanceData = Chemical.Examples.Substances.Sodium_aqueous,
          amountOfSubstance_start=(5*10*0.32e-3)/0.73)                                                                                        annotation(Placement(transformation(extent = {{-186, -56}, {-166, -36}})));
      Chemical.Components.Substance K_E(substanceData = Chemical.Examples.Substances.Potassium_aqueous,
          amountOfSubstance_start=(5*99*0.32e-3)/0.73)                                                                                          annotation(Placement(transformation(extent = {{-186, -82}, {-166, -62}})));
      Chemical.Components.Substance Cl_E(substanceData = Chemical.Examples.Substances.Chloride_aqueous,
          amountOfSubstance_start=(5*55.3*0.32e-3)/0.73)                                                                                          annotation(Placement(transformation(extent = {{-158, -156}, {-138, -136}})));
      Chemical.Components.Substance DPG(
          substanceData(
          MolarWeight=0.266,
          z=-3.7,
          density=1000), amountOfSubstance_start=(5*4.4*0.32e-3)/0.73)                                                       annotation(Placement(transformation(extent = {{-224, -108}, {-204, -88}})));
      //(amountOfSubstance_start=4.4*0.32e-3)
      Chemical.Components.Substance GSH(substanceData(MolarWeight = 0.2, z = -1, density = 1000),
          amountOfSubstance_start=(5*2.2*0.32e-3)/0.73)                                                                                    annotation(Placement(transformation(extent = {{-224, -132}, {-204, -112}})));
      //(amountOfSubstance_start=2.2*0.32e-3)
      Chemical.Components.Substance ATP(
          substanceData(
          DfH_25degC=16700,
          DfG_25degC_1bar=30500,
          References={
              "http://www.wiley.com/college/pratt/0471393878/student/review/thermodynamics/7_relationship.html"},
          z=-3.7), amountOfSubstance_start=(5*1.8*0.32e-3)/0.73)                                                       annotation(Placement(transformation(extent = {{-224, -158}, {-204, -138}})));

      //(amountOfSubstance_start=1.8*0.32e-3)
      Chemical.Components.Substance Hb(
          substanceData(
          MolarWeight=64,
          z=-2.1,
          density=1500), amountOfSubstance_start=(5*5.3*0.32e-3)/0.73)                                                       annotation(Placement(transformation(extent = {{-224, -52}, {-204, -32}})));
      //(amountOfSubstance_start=5.3*0.32e-3)
      Chemical.Components.Substance HCO3_P(substanceData = Chemical.Examples.Substances.Bicarbonate_aqueous,
          amountOfSubstance_start=(5*26*0.53e-3)/0.94)                                                                                               annotation(Placement(transformation(extent = {{-4, 76}, {16, 96}})));
      Chemical.Components.Substance H_P(substanceData = Chemical.Examples.Substances.Proton_aqueous,
          amountOfSubstance_start=(5*0.53/0.94)*10^(-7.37))                                                                                         annotation(Placement(transformation(extent = {{-6, 32}, {14, 52}})));
      Chemical.Components.Reaction reaction3(nS = 1, s = {1}, nP = 2, p = {1, 1}) annotation(Placement(transformation(extent = {{30, 56}, {50, 76}})));
      Chemical.Components.Reaction reaction4(nS = 2, s = {1, 1}, nP = 2, p = {1, 1}) annotation(Placement(transformation(extent = {{-38, 66}, {-18, 86}})));
      Chemical.Components.Substance CO3_P(substanceData = Chemical.Examples.Substances.Carbonate_aqueous,
          amountOfSubstance_start=(5*0.04*0.53e-3)/0.94)                                                                                            annotation(Placement(transformation(extent = {{52, 94}, {72, 114}})));
      Chemical.Components.Substance H2PO4_P(substanceData = Chemical.Examples.Substances.DihydrogenPhosphate_aqueous,
          amountOfSubstance_start=(5*0.56*0.53e-3)/0.94)                                                                                                     annotation(Placement(transformation(extent = {{-72, -12}, {-52, 8}})));
      Chemical.Components.Substance HPO4_P(substanceData = Chemical.Examples.Substances.HydrogenPhosphate_aqueous,
          amountOfSubstance_start=(5*0.56*0.53e-3)/0.94)                                                                                                     annotation(Placement(transformation(extent = {{-6, 8}, {14, 28}})));
      Chemical.Components.Reaction reaction5(nS = 1, s = {1}, nP = 2, p = {1, 1}) annotation(Placement(transformation(extent = {{-40, 0}, {-20, 20}})));
      Chemical.Components.Substance Na_P(substanceData = Chemical.Examples.Substances.Sodium_aqueous,
          amountOfSubstance_start=(5*141*0.53e-3)/0.94)                                                                                        annotation(Placement(transformation(extent = {{50, -44}, {70, -24}})));
      Chemical.Components.Substance K_P(substanceData = Chemical.Examples.Substances.Potassium_aqueous,
          amountOfSubstance_start=(5*4.2*0.53e-3)/0.94)                                                                                          annotation(Placement(transformation(extent = {{50, -72}, {70, -52}})));
      Chemical.Components.Substance Cl_P(substanceData = Chemical.Examples.Substances.Chloride_aqueous,
          amountOfSubstance_start=(5*104*0.53e-3)/0.94)                                                                                          annotation(Placement(transformation(extent = {{-18, -156}, {2, -136}})));
      Chemical.Components.Substance Ca_P(substanceData = Chemical.Examples.Substances.Calcium_aqueous,
          amountOfSubstance_start=(5*2.3*0.53e-3)/0.94)                                                                                         annotation(Placement(transformation(extent = {{50, -100}, {70, -80}})));
      Chemical.Components.Substance Mg_P(substanceData = Chemical.Examples.Substances.Magnesium_aqueous,
          amountOfSubstance_start=(5*0.8*0.53e-3)/0.94)                                                                                           annotation(Placement(transformation(extent = {{50, -130}, {70, -110}})));
      Chemical.Components.Substance Alb_P(
          substanceData(
          MolarWeight=66.463,
          z=-18.2,
          density=1080), amountOfSubstance_start=(5*0.65*0.53e-3)/0.94)                                                      annotation(Placement(transformation(extent = {{-4, -34}, {16, -14}})));
      //(amountOfSubstance_start=0.65*0.53e-3)
      Chemical.Components.Substance HCO3_I(substanceData = Chemical.Examples.Substances.Bicarbonate_aqueous,
          amountOfSubstance_start=5*29.4*2e-3)                                                                                                     annotation(Placement(transformation(extent = {{226, 76}, {246, 96}})));
      Chemical.Components.Substance H_I(substanceData = Chemical.Examples.Substances.Proton_aqueous,
          amountOfSubstance_start=(5*2)*10^(-7.39))                                                                                              annotation(Placement(transformation(extent = {{226, 32}, {246, 52}})));
      Chemical.Components.Reaction reaction6(nS = 2, s = {1, 1}, nP = 2, p = {1, 1}) annotation(Placement(transformation(extent = {{190, 70}, {210, 90}})));
      Chemical.Components.Reaction reaction7(nS = 1, s = {1}, nP = 2, p = {1, 1}) annotation(Placement(transformation(extent = {{258, 56}, {278, 76}})));
      Chemical.Components.Substance CO3_I(substanceData = Chemical.Examples.Substances.Carbonate_aqueous,
          amountOfSubstance_start=5*0.048*2e-3)                                                                                                   annotation(Placement(transformation(extent = {{288, 94}, {308, 114}})));
      Chemical.Components.Substance H2PO4_I(substanceData = Chemical.Examples.Substances.DihydrogenPhosphate_aqueous,
          amountOfSubstance_start=5*0.6*2e-3)                                                                                                     annotation(Placement(transformation(extent = {{164, -12}, {144, 8}})));
      Chemical.Components.Substance HPO4_I(substanceData = Chemical.Examples.Substances.HydrogenPhosphate_aqueous,
          amountOfSubstance_start=5*0.6*2e-3)                                                                                                     annotation(Placement(transformation(extent = {{226, 10}, {246, 30}})));
      Chemical.Components.Reaction reaction8(nS = 1, s = {1}, nP = 2, p = {1, 1}) annotation(Placement(transformation(extent = {{190, -4}, {210, 16}})));
      Chemical.Components.Substance Na_I(substanceData = Chemical.Examples.Substances.Sodium_aqueous,
          amountOfSubstance_start=5*142*2e-3)                                                                                               annotation(Placement(transformation(extent = {{164, -44}, {144, -24}})));
      Chemical.Components.Substance K_I(substanceData = Chemical.Examples.Substances.Potassium_aqueous,
          amountOfSubstance_start=5*4.14*2e-3)                                                                                                 annotation(Placement(transformation(extent = {{164, -72}, {144, -52}})));
      Chemical.Components.Substance Cl_I(substanceData = Chemical.Examples.Substances.Chloride_aqueous,
          amountOfSubstance_start=5*118*2e-3)                                                                                                 annotation(Placement(transformation(extent = {{204, -154}, {224, -134}})));
      Chemical.Components.Substance Ca_I(substanceData = Chemical.Examples.Substances.Calcium_aqueous,
          amountOfSubstance_start=5*2.2*2e-3)                                                                                                annotation(Placement(transformation(extent={{164,
                -100},{144,-80}})));
      Chemical.Components.Substance Mg_I(substanceData = Chemical.Examples.Substances.Magnesium_aqueous,
          amountOfSubstance_start=5*0.75*2e-3)                                                                                                  annotation(Placement(transformation(extent = {{164, -128}, {144, -108}})));
      Chemical.Components.Substance Alb_I(
          substanceData(
          MolarWeight=66.463,
          z=-18.2,
          density=1080), amountOfSubstance_start=5*0.19*2e-3)                                                                annotation(Placement(transformation(extent = {{216, -36}, {236, -16}})));
      //(amountOfSubstance_start=0.19*2e-3)
      Chemical.Components.Membrane membrane annotation(Placement(transformation(extent = {{-118, 94}, {-98, 114}})));
      Chemical.Components.Membrane membrane1 annotation(Placement(transformation(extent = {{-118, 76}, {-98, 96}})));
      Chemical.Components.Membrane membrane2 annotation(Placement(transformation(extent = {{-118, 30}, {-98, 50}})));
      Chemical.Components.Membrane membrane3 annotation(Placement(transformation(extent = {{106, 10}, {126, 30}})));
      Chemical.Components.Membrane membrane4 annotation(Placement(transformation(extent = {{106, -12}, {126, 8}})));
      Chemical.Components.Membrane membrane5 annotation(Placement(transformation(extent = {{106, 32}, {126, 52}})));
      Chemical.Components.Membrane membrane6 annotation(Placement(transformation(extent = {{-120, -156}, {-100, -136}})));
      Chemical.Components.Membrane membrane7 annotation(Placement(transformation(extent = {{106, -72}, {126, -52}})));
      Chemical.Components.Membrane membrane8 annotation(Placement(transformation(extent = {{106, -100}, {126, -80}})));
      Chemical.Components.Membrane membrane9 annotation(Placement(transformation(extent = {{106, -44}, {126, -24}})));
      Chemical.Components.Membrane membrane10 annotation(Placement(transformation(extent = {{106, -128}, {126, -108}})));
      Chemical.Components.Membrane membrane11 annotation(Placement(transformation(extent = {{106, -154}, {126, -134}})));
      Chemical.Components.Membrane membrane12 annotation(Placement(transformation(extent = {{106, 94}, {126, 114}})));
      Chemical.Components.Membrane membrane13 annotation(Placement(transformation(extent = {{106, 76}, {126, 96}})));
    Chemical.Components.Solution erythrocyte annotation(Placement(visible = true, transformation(extent = {{-324, -176}, {-124, 164}}, rotation = 0)));
      Chemical.Components.Solution plasma annotation(Placement(transformation(extent = {{-94, -176}, {106, 164}})));
      Chemical.Components.Solution intersticium annotation(Placement(transformation(extent = {{132, -176}, {332, 164}})));
      Chemical.Components.Membrane membrane14 annotation(Placement(transformation(extent = {{-118, 50}, {-98, 70}})));
      Chemical.Components.Membrane membrane15 annotation(Placement(transformation(extent = {{106, 50}, {126, 70}})));
      Chemical.Components.Substance im_E(
          substanceData(z=-0.92), amountOfSubstance_start=(5*94.6*0.32e-3)/0.73)
        annotation (Placement(transformation(extent={{-278,-112},{-258,-92}})));
      Chemical.Components.Substance im_P(substanceData(z=-5.3),
          amountOfSubstance_start=(5*13.7*0.53e-3)/0.94)
        annotation (Placement(transformation(extent={{-52,-114},{-32,-94}})));
      Chemical.Components.Substance im_I(substanceData(z=-0.8),
          amountOfSubstance_start=5*11.96*2e-3)
        annotation (Placement(transformation(extent={{256,-130},{276,-110}})));
    equation
      connect(HCO3_E.solution, erythrocyte.solution) annotation(Line(points={{-224,76},
              {-170,76},{-170,-32},{-198,-32},{-198,-164},{-164,-164},{-164,
              -172.6}},                                                                                                    color = {127, 127, 0}));
      connect(H2PO4_E.solution, erythrocyte.solution) annotation(Line(points={{-236,
              -12},{-198,-12},{-198,-164},{-164,-164},{-164,-172.6}},                                                                                color = {127, 127, 0}));
      connect(Hb.solution, erythrocyte.solution) annotation(Line(points={{-220,
              -52},{-198,-52},{-198,-164},{-164,-164},{-164,-172.6}},                                                                           color = {127, 127, 0}));
      connect(DPG.solution, erythrocyte.solution) annotation(Line(points={{-220,
              -108},{-198,-108},{-198,-164},{-164,-164},{-164,-172.6}},                                                                            color = {127, 127, 0}));
      connect(GSH.solution, erythrocyte.solution) annotation(Line(points={{-220,
              -132},{-198,-132},{-198,-164},{-164,-164},{-164,-172.6}},                                                                            color = {127, 127, 0}));
      connect(ATP.solution, erythrocyte.solution) annotation(Line(points={{-220,
              -158},{-220,-164},{-164,-164},{-164,-172.6}},                                                                          color = {127, 127, 0}));
      connect(Water_E.solution, erythrocyte.solution) annotation(Line(points={{-290,48},
              {-296,48},{-296,-164},{-164,-164},{-164,-172.6}},                                                                                    color = {127, 127, 0}));
      connect(CO3_E.solution, erythrocyte.solution) annotation(Line(points={{-156,94},
              {-170,94},{-170,-32},{-198,-32},{-198,-164},{-164,-164},{-164,
              -172.6}},                                                                                                    color = {127, 127, 0}));
      connect(H_E.solution, erythrocyte.solution) annotation(Line(points={{-156,30},
              {-170,30},{-170,-32},{-198,-32},{-198,-164},{-164,-164},{-164,
              -172.6}},                                                                                                    color = {127, 127, 0}));
      connect(HPO4_E.solution, erythrocyte.solution) annotation(Line(points={{-156,8},
              {-170,8},{-170,-32},{-198,-32},{-198,-164},{-164,-164},{-164,-172.6}},                                                                                      color = {127, 127, 0}));
      connect(K_E.solution, erythrocyte.solution) annotation(Line(points={{-182,
              -82},{-198,-82},{-198,-164},{-164,-164},{-164,-172.6}},                                                                            color = {127, 127, 0}));
      connect(Na_E.solution, erythrocyte.solution) annotation(Line(points={{-182,
              -56},{-198,-56},{-198,-164},{-164,-164},{-164,-172.6}},                                                                             color = {127, 127, 0}));
      connect(Cl_E.solution, erythrocyte.solution) annotation(Line(points={{-154,
              -156},{-164,-156},{-164,-172.6}},                                                                         color = {127, 127, 0}));
      connect(CO2_E.solution, erythrocyte.solution) annotation(Line(points={{-292,
              122},{-296,122},{-296,-164},{-164,-164},{-164,-172.6}},                                                                              color = {127, 127, 0}));
      connect(CO2_P.solution,plasma. solution) annotation(Line(points={{-70,122},
              {-76,122},{-76,-172.6},{66,-172.6}},                                                                             color = {127, 127, 0}));
      connect(Water_P.solution,plasma. solution) annotation(Line(points={{-68,50},
              {-76,50},{-76,-172.6},{66,-172.6}},                                                                              color = {127, 127, 0}));
      connect(H2PO4_P.solution,plasma. solution) annotation(Line(points={{-68,-12},
              {-76,-12},{-76,-172.6},{66,-172.6}},                                                                               color = {127, 127, 0}));
      connect(Cl_P.solution,plasma. solution) annotation(Line(points = {{-14, -156}, {-14, -172.6}, {66, -172.6}}, color = {127, 127, 0}));
      connect(CO3_P.solution,plasma. solution) annotation(Line(points = {{56, 94}, {56, -20}, {40, -20}, {40, -172.6}, {66, -172.6}}, color = {127, 127, 0}));
      connect(HCO3_P.solution,plasma. solution) annotation(Line(points = {{0, 76}, {22, 76}, {56, 76}, {56, -20}, {40, -20}, {40, -172.6}, {66, -172.6}}, color = {127, 127, 0}));
      connect(Na_P.solution,plasma. solution) annotation(Line(points = {{54, -44}, {40, -44}, {40, -172.6}, {66, -172.6}}, color = {127, 127, 0}));
      connect(K_P.solution,plasma. solution) annotation(Line(points = {{54, -72}, {40, -72}, {40, -172.6}, {66, -172.6}}, color = {127, 127, 0}));
      connect(Ca_P.solution,plasma. solution) annotation(Line(points = {{54, -100}, {50, -100}, {40, -100}, {40, -172.6}, {66, -172.6}}, color = {127, 127, 0}));
      connect(Mg_P.solution,plasma. solution) annotation(Line(points = {{54, -130}, {50, -130}, {40, -130}, {40, -172.6}, {66, -172.6}}, color = {127, 127, 0}));
      connect(Alb_P.solution,plasma. solution) annotation(Line(points = {{0, -34}, {0, -34}, {40, -34}, {40, -172.6}, {66, -172.6}}, color = {127, 127, 0}));
      connect(CO2_I.solution, intersticium.solution) annotation(Line(points = {{160, 122}, {160, 118}, {180, 118}, {180, -172.6}, {292, -172.6}}, color = {127, 127, 0}));
      connect(CO3_I.solution, intersticium.solution) annotation(Line(points = {{292, 94}, {292, 94}, {292, -172.6}}, color = {127, 127, 0}));
      connect(HCO3_I.solution, intersticium.solution) annotation(Line(points = {{230, 76}, {292, 76}, {292, -172.6}}, color = {127, 127, 0}));
      connect(H_I.solution, intersticium.solution) annotation(Line(points = {{230, 32}, {180, 32}, {180, -172.6}, {292, -172.6}}, color = {127, 127, 0}));
      connect(HPO4_I.solution, intersticium.solution) annotation(Line(points = {{230, 10}, {228, 10}, {228, -12}, {180, -12}, {180, -172.6}, {292, -172.6}}, color = {127, 127, 0}));
      connect(Alb_I.solution, intersticium.solution) annotation(Line(points = {{220, -36}, {180, -36}, {180, -172.6}, {292, -172.6}}, color = {127, 127, 0}));
      connect(H2PO4_I.solution, intersticium.solution) annotation(Line(points = {{160, -12}, {180, -12}, {180, -172.6}, {292, -172.6}}, color = {127, 127, 0}));
      connect(Na_I.solution, intersticium.solution) annotation(Line(points = {{160, -44}, {180, -44}, {180, -172.6}, {292, -172.6}}, color = {127, 127, 0}));
      connect(K_I.solution, intersticium.solution) annotation(Line(points = {{160, -72}, {160, -70}, {180, -70}, {180, -172.6}, {292, -172.6}}, color = {127, 127, 0}));
      connect(Ca_I.solution, intersticium.solution) annotation(Line(points={{160,
              -100},{160,-100},{180,-100},{180,-172.6},{292,-172.6}},                                                                               color = {127, 127, 0}));
      connect(Mg_I.solution, intersticium.solution) annotation(Line(points = {{160, -128}, {160, -128}, {180, -128}, {180, -172.6}, {292, -172.6}}, color = {127, 127, 0}));
      connect(Water_I.solution, intersticium.solution) annotation(Line(points = {{160, 52}, {160, 50}, {180, 50}, {180, -172.6}, {292, -172.6}}, color = {127, 127, 0}));
      connect(HPO4_P.solution,plasma. solution) annotation(Line(points = {{-2, 8}, {22, 8}, {56, 8}, {56, -20}, {40, -20}, {40, -172.6}, {66, -172.6}}, color = {127, 127, 0}));
      connect(H_P.solution,plasma. solution) annotation(Line(points = {{-2, 32}, {20, 32}, {56, 32}, {56, -20}, {40, -20}, {40, -172.6}, {66, -172.6}}, color = {127, 127, 0}));
      connect(CO3_E.port_a, membrane.port_a) annotation(Line(points = {{-140, 104}, {-118, 104}}, color = {158, 66, 200}));
      connect(membrane.port_b, CO3_P.port_a) annotation(Line(points = {{-98, 104}, {-34, 104}, {72, 104}}, color = {158, 66, 200}));
      connect(HCO3_E.port_a, membrane1.port_a) annotation(Line(points = {{-208, 86}, {-118, 86}}, color = {158, 66, 200}));
      connect(membrane1.port_b, HCO3_P.port_a) annotation(Line(points = {{-98, 86}, {-64, 86}, {16, 86}}, color = {158, 66, 200}));
      connect(Water_E.port_a, membrane14.port_a) annotation(Line(points = {{-274, 58}, {-204, 58}, {-118, 58}, {-118, 60}}, color = {158, 66, 200}));
      connect(membrane14.port_b, Water_P.port_a) annotation(Line(points = {{-98, 60}, {-76, 60}, {-52, 60}}, color = {158, 66, 200}));
      connect(H_E.port_a, membrane2.port_a) annotation(Line(points = {{-140, 40}, {-132, 40}, {-118, 40}}, color = {158, 66, 200}));
      connect(membrane2.port_b, H_P.port_a) annotation(Line(points = {{-98, 40}, {-98, 42}, {14, 42}}, color = {158, 66, 200}));
      connect(Cl_E.port_a, membrane6.port_a) annotation(Line(points = {{-138, -146}, {-130, -146}, {-120, -146}}, color = {158, 66, 200}));
      connect(membrane6.port_b, Cl_P.port_a) annotation(Line(points = {{-100, -146}, {-76, -146}, {2, -146}}, color = {158, 66, 200}));
      connect(Cl_P.port_a, membrane11.port_a) annotation(Line(points = {{2, -146}, {106, -146}, {106, -144}}, color = {158, 66, 200}));
      connect(membrane11.port_b, Cl_I.port_a) annotation(Line(points = {{126, -144}, {158, -144}, {224, -144}}, color = {158, 66, 200}));
      connect(CO3_P.port_a, membrane12.port_a) annotation(Line(points = {{72, 104}, {88, 104}, {106, 104}}, color = {158, 66, 200}));
      connect(membrane12.port_b, CO3_I.port_a) annotation(Line(points = {{126, 104}, {126, 104}, {308, 104}}, color = {158, 66, 200}));
      connect(HCO3_P.port_a, membrane13.port_a) annotation(Line(points = {{16, 86}, {106, 86}}, color = {158, 66, 200}));
      connect(membrane13.port_b, HCO3_I.port_a) annotation(Line(points = {{126, 86}, {168, 86}, {246, 86}}, color = {158, 66, 200}));
      connect(H_P.port_a, membrane5.port_a) annotation(Line(points = {{14, 42}, {14, 42}, {106, 42}}, color = {158, 66, 200}));
      connect(membrane5.port_b, H_I.port_a) annotation(Line(points = {{126, 42}, {246, 42}}, color = {158, 66, 200}));
      connect(HPO4_P.port_a, membrane3.port_a) annotation(Line(points = {{14, 18}, {46, 18}, {106, 18}, {106, 20}}, color = {158, 66, 200}));
      connect(H2PO4_P.port_a, membrane4.port_a) annotation(Line(points = {{-52, -2}, {8, -2}, {106, -2}}, color = {158, 66, 200}));
      connect(membrane4.port_b, H2PO4_I.port_a) annotation(Line(points = {{126, -2}, {144, -2}}, color = {158, 66, 200}));
      connect(membrane3.port_b, HPO4_I.port_a) annotation(Line(points = {{126, 20}, {246, 20}}, color = {158, 66, 200}));
      connect(Na_P.port_a, membrane9.port_a) annotation(Line(points = {{70, -34}, {88, -34}, {106, -34}}, color = {158, 66, 200}));
      connect(membrane9.port_b, Na_I.port_a) annotation(Line(points = {{126, -34}, {144, -34}}, color = {158, 66, 200}));
      connect(K_P.port_a, membrane7.port_a) annotation(Line(points = {{70, -62}, {106, -62}}, color = {158, 66, 200}));
      connect(membrane7.port_b, K_I.port_a) annotation(Line(points = {{126, -62}, {132, -62}, {144, -62}}, color = {158, 66, 200}));
      connect(Ca_P.port_a, membrane8.port_a) annotation(Line(points = {{70, -90}, {88, -90}, {106, -90}}, color = {158, 66, 200}));
      connect(membrane8.port_b, Ca_I.port_a) annotation(Line(points={{126,-90},{
              136,-90},{144,-90}},                                                              color = {158, 66, 200}));
      connect(membrane10.port_b, Mg_I.port_a) annotation(Line(points = {{126, -118}, {144, -118}}, color = {158, 66, 200}));
      connect(membrane10.port_a, Mg_P.port_a) annotation(Line(points = {{106, -118}, {70, -118}, {70, -120}}, color = {158, 66, 200}));
      connect(CO2_E.port_a, reaction.substrates[1]) annotation(Line(points = {{-276, 132}, {-266, 132}, {-266, 70}}, color = {158, 66, 200}));
      connect(Water_E.port_a, reaction.substrates[2]) annotation(Line(points = {{-274, 58}, {-272, 58}, {-266, 58}, {-266, 74}}, color = {158, 66, 200}));
      connect(HCO3_E.port_a, reaction1.substrates[1]) annotation(Line(points = {{-208, 86}, {-208, 40}, {-204, 40}}, color = {158, 66, 200}));
      connect(reaction1.products[1], H_E.port_a) annotation(Line(points = {{-184, 38}, {-184, 40}, {-140, 40}}, color = {158, 66, 200}));
      connect(H2PO4_E.port_a, reaction2.substrates[1]) annotation(Line(points = {{-220, -2}, {-220, -2}, {-204, -2}, {-204, 12}}, color = {158, 66, 200}));
      connect(reaction2.products[1], HPO4_E.port_a) annotation(Line(points = {{-184, 10}, {-140, 10}, {-140, 18}}, color = {158, 66, 200}));
      connect(reaction2.products[2], H_E.port_a) annotation(Line(points = {{-184, 14}, {-178, 14}, {-178, 40}, {-140, 40}}, color = {158, 66, 200}));
      connect(Water_P.port_a, reaction4.substrates[1]) annotation(Line(points = {{-52, 60}, {-48, 60}, {-38, 60}, {-38, 74}}, color = {158, 66, 200}));
      connect(reaction4.substrates[2], CO2_P.port_a) annotation(Line(points = {{-38, 78}, {-38, 132}, {-54, 132}}, color = {158, 66, 200}));
      connect(reaction4.products[1], H_P.port_a) annotation(Line(points = {{-18, 74}, {-20, 74}, {-20, 48}, {-20, 42}, {14, 42}}, color = {158, 66, 200}));
      connect(reaction4.products[2], HCO3_P.port_a) annotation(Line(points = {{-18, 78}, {-18, 86}, {16, 86}}, color = {158, 66, 200}));
      connect(HCO3_P.port_a, reaction3.substrates[1]) annotation(Line(points = {{16, 86}, {30, 86}, {30, 84}, {30, 66}}, color = {158, 66, 200}));
      connect(reaction3.products[1], H_P.port_a) annotation(Line(points = {{50, 64}, {80, 64}, {80, 42}, {14, 42}}, color = {158, 66, 200}));
      connect(reaction3.products[2], CO3_P.port_a) annotation(Line(points = {{50, 68}, {62, 68}, {80, 68}, {80, 104}, {72, 104}}, color = {158, 66, 200}));
      connect(H2PO4_P.port_a, reaction5.substrates[1]) annotation(Line(points = {{-52, -2}, {-40, -2}, {-40, 10}}, color = {158, 66, 200}));
      connect(reaction5.products[1], HPO4_P.port_a) annotation(Line(points = {{-20, 8}, {-20, 8}, {14, 8}, {14, 18}}, color = {158, 66, 200}));
      connect(reaction5.products[2], H_P.port_a) annotation(Line(points = {{-20, 12}, {-20, 42}, {14, 42}}, color = {158, 66, 200}));
      connect(CO2_I.port_a, reaction6.substrates[1]) annotation(Line(points = {{144, 132}, {190, 132}, {190, 78}}, color = {158, 66, 200}));
      connect(membrane15.port_b, Water_I.port_a) annotation(Line(points = {{126, 60}, {144, 60}, {144, 62}}, color = {158, 66, 200}));
      connect(membrane15.port_a, Water_P.port_a) annotation(Line(points = {{106, 60}, {38, 60}, {-52, 60}}, color = {158, 66, 200}));
      connect(Water_I.port_a, reaction6.substrates[2]) annotation(Line(points = {{144, 62}, {154, 62}, {190, 62}, {190, 82}}, color = {158, 66, 200}));
      connect(reaction6.products[1], H_I.port_a) annotation(Line(points = {{210, 78}, {220, 78}, {220, 42}, {246, 42}}, color = {158, 66, 200}));
      connect(reaction6.products[2], HCO3_I.port_a) annotation(Line(points = {{210, 82}, {220, 82}, {220, 86}, {246, 86}}, color = {158, 66, 200}));
      connect(HCO3_I.port_a, reaction7.substrates[1]) annotation(Line(points = {{246, 86}, {258, 86}, {258, 66}}, color = {158, 66, 200}));
      connect(reaction7.products[1], H_I.port_a) annotation(Line(points = {{278, 64}, {278, 64}, {278, 42}, {246, 42}}, color = {158, 66, 200}));
      connect(reaction7.products[2], CO3_I.port_a) annotation(Line(points = {{278, 68}, {278, 68}, {278, 84}, {278, 104}, {308, 104}}, color = {158, 66, 200}));
      connect(H2PO4_I.port_a, reaction8.substrates[1]) annotation(Line(points = {{144, -2}, {162, -2}, {190, -2}, {190, 6}}, color = {158, 66, 200}));
      connect(reaction8.products[1], H_I.port_a) annotation(Line(points = {{210, 4}, {220, 4}, {220, 14}, {220, 42}, {246, 42}}, color = {158, 66, 200}));
      connect(reaction8.products[2], HPO4_I.port_a) annotation(Line(points = {{210, 8}, {210, 20}, {246, 20}}, color = {158, 66, 200}));
      connect(Cl_I.solution, intersticium.solution) annotation(Line(points = {{208, -154}, {208, -172.6}, {292, -172.6}}, color = {127, 127, 0}));
      connect(reaction.products[1], H_E.port_a) annotation(Line(points = {{-246, 70}, {-238, 70}, {-178, 70}, {-178, 40}, {-140, 40}}, color = {158, 66, 200}));
      connect(reaction.products[2], HCO3_E.port_a) annotation(Line(points = {{-246, 74}, {-246, 86}, {-208, 86}}, color = {158, 66, 200}));
      connect(reaction1.products[2], CO3_E.port_a) annotation(Line(points = {{-184, 42}, {-184, 42}, {-184, 64}, {-184, 104}, {-140, 104}}, color = {158, 66, 200}));
      connect(im_E.solution, erythrocyte.solution) annotation (Line(points={{-274,
              -112},{-274,-164},{-164,-164},{-164,-172.6}}, color={127,127,0}));
      connect(im_P.solution, plasma.solution) annotation (Line(points={{-48,-114},
              {-48,-172},{66,-172.6}}, color={127,127,0}));
      connect(im_I.solution, intersticium.solution) annotation (Line(points={{260,
              -130},{262,-130},{262,-172.6},{292,-172.6}}, color={127,127,0}));
      annotation(Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-400,
                -300},{400,300}})),                                                                           Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-400, -300}, {400, 300}})));
    end Model;

    model Exp_noReactions
      Chemical.Components.Substance Water_E(substanceData = Chemical.Examples.Substances.Water_liquid, amountOfSubstance_start = 55.13 * 0.44 * 1 * 0.73) annotation(Placement(transformation(extent = {{-294, 48}, {-274, 68}})));
      Chemical.Components.Substance Water_P(substanceData = Chemical.Examples.Substances.Water_liquid, amountOfSubstance_start = 55.13 * 0.56 * 1 * 0.94) annotation(Placement(transformation(extent = {{-72, 50}, {-52, 70}})));
      Chemical.Components.Substance Water_I(substanceData = Chemical.Examples.Substances.Water_liquid, amountOfSubstance_start = 55.13 * 2) annotation(Placement(transformation(extent = {{164, 52}, {144, 72}})));
      Chemical.Components.Substance CO2_E(substanceData = Chemical.Examples.Substances.CarbonDioxide_aqueous, redeclare
          package stateOfMatter =
            Chemical.Interfaces.Incompressible,                                                                                                    amountOfSubstance_start = 1.2 * 0.32e-3) annotation(Placement(transformation(extent = {{-296, 122}, {-276, 142}})));
      Chemical.Components.Substance CO2_P(substanceData = Chemical.Examples.Substances.CarbonDioxide_aqueous, amountOfSubstance_start = 1.407 * 0.53e-3) annotation(Placement(transformation(extent = {{-74, 122}, {-54, 142}})));
      Chemical.Components.Substance CO2_I(substanceData = Chemical.Examples.Substances.CarbonDioxide_aqueous, amountOfSubstance_start = 1.5 * 2e-3) annotation(Placement(transformation(extent = {{164, 122}, {144, 142}})));
      Chemical.Components.Substance HCO3_E(substanceData = Chemical.Examples.Substances.Bicarbonate_aqueous, amountOfSubstance_start = 15.1 * 0.32e-3) annotation(Placement(transformation(extent = {{-228, 76}, {-208, 96}})));
      Chemical.Components.Substance H_E(substanceData = Chemical.Examples.Substances.Proton_aqueous,
          amountOfSubstance_start=(0.32e-3)*10^(-7.2))                                                                                             annotation(Placement(transformation(extent = {{-160, 30}, {-140, 50}})));
      Chemical.Components.Substance CO3_E(substanceData = Chemical.Examples.Substances.Carbonate_aqueous, amountOfSubstance_start = 0.015 * 0.32e-3) annotation(Placement(transformation(extent = {{-160, 94}, {-140, 114}})));
      Chemical.Components.Substance H2PO4_E(substanceData = Chemical.Examples.Substances.DihydrogenPhosphate_aqueous, amountOfSubstance_start = 0.33 * 0.32e-3) annotation(Placement(transformation(extent = {{-240, -12}, {-220, 8}})));
      Chemical.Components.Substance HPO4_E(substanceData = Chemical.Examples.Substances.HydrogenPhosphate_aqueous, amountOfSubstance_start = 0.33 * 0.32e-3) annotation(Placement(transformation(extent = {{-160, 8}, {-140, 28}})));
      Chemical.Components.Substance Na_E(substanceData = Chemical.Examples.Substances.Sodium_aqueous, amountOfSubstance_start = 10 * 0.32e-3) annotation(Placement(transformation(extent = {{-186, -56}, {-166, -36}})));
      Chemical.Components.Substance K_E(substanceData = Chemical.Examples.Substances.Potassium_aqueous, amountOfSubstance_start = 99 * 0.32e-3) annotation(Placement(transformation(extent = {{-186, -82}, {-166, -62}})));
      Chemical.Components.Substance Cl_E(substanceData = Chemical.Examples.Substances.Chloride_aqueous, amountOfSubstance_start = 55.3 * 0.32e-3) annotation(Placement(transformation(extent = {{-158, -156}, {-138, -136}})));
      Chemical.Components.Substance DPG(amountOfSubstance_start = 4.4 * 0.32e-3,
          substanceData(
          MolarWeight=0.266,
          z=-3.7,
          density=1000))                                                                                                     annotation(Placement(transformation(extent = {{-224, -108}, {-204, -88}})));
      //(amountOfSubstance_start=4.4*0.32e-3)
      Chemical.Components.Substance GSH(substanceData(MolarWeight = 0.2, z = -1, density = 1000), amountOfSubstance_start = 2.2 * 0.32e-3) annotation(Placement(transformation(extent = {{-224, -132}, {-204, -112}})));
      //(amountOfSubstance_start=2.2*0.32e-3)
      Chemical.Components.Substance ATP(                                                                                                    amountOfSubstance_start = 1.8 * 0.32e-3,
          substanceData(
          DfH_25degC=16700,
          DfG_25degC_1bar=30500,
          References={
              "http://www.wiley.com/college/pratt/0471393878/student/review/thermodynamics/7_relationship.html"},
          z=-3.7))                                                                                                     annotation(Placement(transformation(extent = {{-224, -158}, {-204, -138}})));

      //(amountOfSubstance_start=1.8*0.32e-3)
      Chemical.Components.Substance Hb(                                                           amountOfSubstance_start = 5.3 * 0.32e-3,
          substanceData(
          MolarWeight=64,
          z=-2.1,
          density=1500))                                                                                                     annotation(Placement(transformation(extent = {{-224, -52}, {-204, -32}})));
      //(amountOfSubstance_start=5.3*0.32e-3)
      Chemical.Components.Substance HCO3_P(substanceData = Chemical.Examples.Substances.Bicarbonate_aqueous, amountOfSubstance_start = 26 * 0.53e-3) annotation(Placement(transformation(extent = {{-4, 76}, {16, 96}})));
      Chemical.Components.Substance H_P(substanceData = Chemical.Examples.Substances.Proton_aqueous,
          amountOfSubstance_start=(0.53e-3)*10^(-7.37))                                                                                             annotation(Placement(transformation(extent = {{-6, 32}, {14, 52}})));
      Chemical.Components.Substance CO3_P(substanceData = Chemical.Examples.Substances.Carbonate_aqueous, amountOfSubstance_start = 0.04 * 0.53e-3) annotation(Placement(transformation(extent = {{52, 94}, {72, 114}})));
      Chemical.Components.Substance H2PO4_P(substanceData = Chemical.Examples.Substances.DihydrogenPhosphate_aqueous, amountOfSubstance_start = 0.56 * 0.53e-3) annotation(Placement(transformation(extent = {{-72, -12}, {-52, 8}})));
      Chemical.Components.Substance HPO4_P(substanceData = Chemical.Examples.Substances.HydrogenPhosphate_aqueous, amountOfSubstance_start = 0.56 * 0.53e-3) annotation(Placement(transformation(extent = {{-6, 8}, {14, 28}})));
      Chemical.Components.Substance Na_P(substanceData = Chemical.Examples.Substances.Sodium_aqueous, amountOfSubstance_start = 141 * 0.53e-3) annotation(Placement(transformation(extent = {{50, -44}, {70, -24}})));
      Chemical.Components.Substance K_P(substanceData = Chemical.Examples.Substances.Potassium_aqueous, amountOfSubstance_start = 4.2 * 0.53e-3) annotation(Placement(transformation(extent = {{50, -72}, {70, -52}})));
      Chemical.Components.Substance Cl_P(substanceData = Chemical.Examples.Substances.Chloride_aqueous, amountOfSubstance_start = 104 * 0.53e-3) annotation(Placement(transformation(extent = {{-18, -156}, {2, -136}})));
      Chemical.Components.Substance Ca_P(substanceData = Chemical.Examples.Substances.Calcium_aqueous, amountOfSubstance_start = 2.3 * 0.53e-3) annotation(Placement(transformation(extent = {{50, -100}, {70, -80}})));
      Chemical.Components.Substance Mg_P(substanceData = Chemical.Examples.Substances.Magnesium_aqueous, amountOfSubstance_start = 0.8 * 0.53e-3) annotation(Placement(transformation(extent = {{50, -130}, {70, -110}})));
      Chemical.Components.Substance Alb_P(                                                               amountOfSubstance_start = 0.65 * 0.53e-3,
          substanceData(
          MolarWeight=66.463,
          z=-18.2,
          density=1080))                                                                                                     annotation(Placement(transformation(extent = {{-4, -34}, {16, -14}})));
      //(amountOfSubstance_start=0.65*0.53e-3)
      Chemical.Components.Substance HCO3_I(substanceData = Chemical.Examples.Substances.Bicarbonate_aqueous, amountOfSubstance_start = 29.4 * 2e-3) annotation(Placement(transformation(extent = {{226, 76}, {246, 96}})));
      Chemical.Components.Substance H_I(substanceData = Chemical.Examples.Substances.Proton_aqueous,
          amountOfSubstance_start=(2e-3)*10^(-7.39))                                                                                             annotation(Placement(transformation(extent = {{226, 32}, {246, 52}})));
      Chemical.Components.Substance CO3_I(substanceData = Chemical.Examples.Substances.Carbonate_aqueous, amountOfSubstance_start = 0.048 * 2e-3) annotation(Placement(transformation(extent = {{288, 94}, {308, 114}})));
      Chemical.Components.Substance H2PO4_I(substanceData = Chemical.Examples.Substances.DihydrogenPhosphate_aqueous, amountOfSubstance_start = 0.6 * 2e-3) annotation(Placement(transformation(extent = {{164, -12}, {144, 8}})));
      Chemical.Components.Substance HPO4_I(substanceData = Chemical.Examples.Substances.HydrogenPhosphate_aqueous, amountOfSubstance_start = 0.6 * 2e-3) annotation(Placement(transformation(extent = {{226, 10}, {246, 30}})));
      Chemical.Components.Substance Na_I(substanceData = Chemical.Examples.Substances.Sodium_aqueous, amountOfSubstance_start = 142 * 2e-3) annotation(Placement(transformation(extent = {{164, -44}, {144, -24}})));
      Chemical.Components.Substance K_I(substanceData = Chemical.Examples.Substances.Potassium_aqueous, amountOfSubstance_start = 4.14 * 2e-3) annotation(Placement(transformation(extent = {{164, -72}, {144, -52}})));
      Chemical.Components.Substance Cl_I(substanceData = Chemical.Examples.Substances.Chloride_aqueous, amountOfSubstance_start = 118 * 2e-3) annotation(Placement(transformation(extent = {{204, -154}, {224, -134}})));
      Chemical.Components.Substance Ca_I(substanceData = Chemical.Examples.Substances.Calcium_aqueous, amountOfSubstance_start = 2.2 * 2e-3) annotation(Placement(transformation(extent = {{164, -100}, {144, -80}})));
      Chemical.Components.Substance Mg_I(substanceData = Chemical.Examples.Substances.Magnesium_aqueous, amountOfSubstance_start = 0.75 * 2e-3) annotation(Placement(transformation(extent = {{164, -128}, {144, -108}})));
      Chemical.Components.Substance Alb_I(                                                              amountOfSubstance_start = 0.19 * 2e-3,
          substanceData(
          MolarWeight=66.463,
          z=-18.2,
          density=1080))                                                                                                     annotation(Placement(transformation(extent = {{216, -36}, {236, -16}})));
      //(amountOfSubstance_start=0.19*2e-3)
      Chemical.Components.Membrane membrane annotation(Placement(transformation(extent = {{-118, 94}, {-98, 114}})));
      Chemical.Components.Membrane membrane1 annotation(Placement(transformation(extent = {{-118, 76}, {-98, 96}})));
      Chemical.Components.Membrane membrane2 annotation(Placement(transformation(extent = {{-118, 30}, {-98, 50}})));
      Chemical.Components.Membrane membrane3 annotation(Placement(transformation(extent = {{106, 10}, {126, 30}})));
      Chemical.Components.Membrane membrane4 annotation(Placement(transformation(extent = {{106, -12}, {126, 8}})));
      Chemical.Components.Membrane membrane5 annotation(Placement(transformation(extent = {{106, 32}, {126, 52}})));
      Chemical.Components.Membrane membrane6 annotation(Placement(transformation(extent = {{-120, -156}, {-100, -136}})));
      Chemical.Components.Membrane membrane7 annotation(Placement(transformation(extent = {{106, -72}, {126, -52}})));
      Chemical.Components.Membrane membrane8 annotation(Placement(transformation(extent = {{106, -100}, {126, -80}})));
      Chemical.Components.Membrane membrane9 annotation(Placement(transformation(extent = {{106, -44}, {126, -24}})));
      Chemical.Components.Membrane membrane10 annotation(Placement(transformation(extent = {{106, -128}, {126, -108}})));
      Chemical.Components.Membrane membrane11 annotation(Placement(transformation(extent = {{106, -154}, {126, -134}})));
      Chemical.Components.Membrane membrane12 annotation(Placement(transformation(extent = {{106, 94}, {126, 114}})));
      Chemical.Components.Membrane membrane13 annotation(Placement(transformation(extent = {{106, 76}, {126, 96}})));
    Chemical.Components.Solution erythrocyte annotation(Placement(visible = true, transformation(extent = {{-324, -176}, {-124, 164}}, rotation = 0)));
      Chemical.Components.Solution plasma annotation(Placement(transformation(extent = {{-94, -176}, {106, 164}})));
      Chemical.Components.Solution intersticium annotation(Placement(transformation(extent = {{132, -176}, {332, 164}})));
      Chemical.Components.Membrane membrane14 annotation(Placement(transformation(extent = {{-118, 50}, {-98, 70}})));
      Chemical.Components.Membrane membrane15 annotation(Placement(transformation(extent = {{106, 50}, {126, 70}})));
      Chemical.Components.Substance im_E(amountOfSubstance_start=94.6*0.32e-3,
          substanceData(z=-0.92))
        annotation (Placement(transformation(extent={{-278,-112},{-258,-92}})));
      Chemical.Components.Substance im_P(substanceData(z=-5.3),
          amountOfSubstance_start=13.7*0.53e-3)
        annotation (Placement(transformation(extent={{-52,-114},{-32,-94}})));
      Chemical.Components.Substance im_I(substanceData(z=-0.8),
          amountOfSubstance_start=11.96*2e-3)
        annotation (Placement(transformation(extent={{256,-130},{276,-110}})));
    equation
      connect(HCO3_E.solution, erythrocyte.solution) annotation(Line(points={{-224,76},
              {-170,76},{-170,-32},{-198,-32},{-198,-164},{-164,-164},{-164,
              -172.6}},                                                                                                    color = {127, 127, 0}));
      connect(H2PO4_E.solution, erythrocyte.solution) annotation(Line(points={{-236,
              -12},{-198,-12},{-198,-164},{-164,-164},{-164,-172.6}},                                                                                color = {127, 127, 0}));
      connect(Hb.solution, erythrocyte.solution) annotation(Line(points={{-220,
              -52},{-198,-52},{-198,-164},{-164,-164},{-164,-172.6}},                                                                           color = {127, 127, 0}));
      connect(DPG.solution, erythrocyte.solution) annotation(Line(points={{-220,
              -108},{-198,-108},{-198,-164},{-164,-164},{-164,-172.6}},                                                                            color = {127, 127, 0}));
      connect(GSH.solution, erythrocyte.solution) annotation(Line(points={{-220,
              -132},{-198,-132},{-198,-164},{-164,-164},{-164,-172.6}},                                                                            color = {127, 127, 0}));
      connect(ATP.solution, erythrocyte.solution) annotation(Line(points={{-220,
              -158},{-220,-164},{-164,-164},{-164,-172.6}},                                                                          color = {127, 127, 0}));
      connect(Water_E.solution, erythrocyte.solution) annotation(Line(points={{-290,48},
              {-296,48},{-296,-164},{-164,-164},{-164,-172.6}},                                                                                    color = {127, 127, 0}));
      connect(CO3_E.solution, erythrocyte.solution) annotation(Line(points={{-156,94},
              {-170,94},{-170,-32},{-198,-32},{-198,-164},{-164,-164},{-164,
              -172.6}},                                                                                                    color = {127, 127, 0}));
      connect(H_E.solution, erythrocyte.solution) annotation(Line(points={{-156,30},
              {-170,30},{-170,-32},{-198,-32},{-198,-164},{-164,-164},{-164,
              -172.6}},                                                                                                    color = {127, 127, 0}));
      connect(HPO4_E.solution, erythrocyte.solution) annotation(Line(points={{-156,8},
              {-170,8},{-170,-32},{-198,-32},{-198,-164},{-164,-164},{-164,-172.6}},                                                                                      color = {127, 127, 0}));
      connect(K_E.solution, erythrocyte.solution) annotation(Line(points={{-182,
              -82},{-198,-82},{-198,-164},{-164,-164},{-164,-172.6}},                                                                            color = {127, 127, 0}));
      connect(Na_E.solution, erythrocyte.solution) annotation(Line(points={{-182,
              -56},{-198,-56},{-198,-164},{-164,-164},{-164,-172.6}},                                                                             color = {127, 127, 0}));
      connect(Cl_E.solution, erythrocyte.solution) annotation(Line(points={{-154,
              -156},{-164,-156},{-164,-172.6}},                                                                         color = {127, 127, 0}));
      connect(CO2_E.solution, erythrocyte.solution) annotation(Line(points={{-292,
              122},{-296,122},{-296,-164},{-164,-164},{-164,-172.6}},                                                                              color = {127, 127, 0}));
      connect(CO2_P.solution,plasma. solution) annotation(Line(points={{-70,122},
              {-76,122},{-76,-172.6},{66,-172.6}},                                                                             color = {127, 127, 0}));
      connect(Water_P.solution,plasma. solution) annotation(Line(points={{-68,50},
              {-76,50},{-76,-172.6},{66,-172.6}},                                                                              color = {127, 127, 0}));
      connect(H2PO4_P.solution,plasma. solution) annotation(Line(points={{-68,-12},
              {-76,-12},{-76,-172.6},{66,-172.6}},                                                                               color = {127, 127, 0}));
      connect(Cl_P.solution,plasma. solution) annotation(Line(points = {{-14, -156}, {-14, -172.6}, {66, -172.6}}, color = {127, 127, 0}));
      connect(CO3_P.solution,plasma. solution) annotation(Line(points = {{56, 94}, {56, -20}, {40, -20}, {40, -172.6}, {66, -172.6}}, color = {127, 127, 0}));
      connect(HCO3_P.solution,plasma. solution) annotation(Line(points = {{0, 76}, {22, 76}, {56, 76}, {56, -20}, {40, -20}, {40, -172.6}, {66, -172.6}}, color = {127, 127, 0}));
      connect(Na_P.solution,plasma. solution) annotation(Line(points = {{54, -44}, {40, -44}, {40, -172.6}, {66, -172.6}}, color = {127, 127, 0}));
      connect(K_P.solution,plasma. solution) annotation(Line(points = {{54, -72}, {40, -72}, {40, -172.6}, {66, -172.6}}, color = {127, 127, 0}));
      connect(Ca_P.solution,plasma. solution) annotation(Line(points = {{54, -100}, {50, -100}, {40, -100}, {40, -172.6}, {66, -172.6}}, color = {127, 127, 0}));
      connect(Mg_P.solution,plasma. solution) annotation(Line(points = {{54, -130}, {50, -130}, {40, -130}, {40, -172.6}, {66, -172.6}}, color = {127, 127, 0}));
      connect(Alb_P.solution,plasma. solution) annotation(Line(points = {{0, -34}, {0, -34}, {40, -34}, {40, -172.6}, {66, -172.6}}, color = {127, 127, 0}));
      connect(CO2_I.solution, intersticium.solution) annotation(Line(points = {{160, 122}, {160, 118}, {180, 118}, {180, -172.6}, {292, -172.6}}, color = {127, 127, 0}));
      connect(CO3_I.solution, intersticium.solution) annotation(Line(points = {{292, 94}, {292, 94}, {292, -172.6}}, color = {127, 127, 0}));
      connect(HCO3_I.solution, intersticium.solution) annotation(Line(points = {{230, 76}, {292, 76}, {292, -172.6}}, color = {127, 127, 0}));
      connect(H_I.solution, intersticium.solution) annotation(Line(points = {{230, 32}, {180, 32}, {180, -172.6}, {292, -172.6}}, color = {127, 127, 0}));
      connect(HPO4_I.solution, intersticium.solution) annotation(Line(points = {{230, 10}, {228, 10}, {228, -12}, {180, -12}, {180, -172.6}, {292, -172.6}}, color = {127, 127, 0}));
      connect(Alb_I.solution, intersticium.solution) annotation(Line(points = {{220, -36}, {180, -36}, {180, -172.6}, {292, -172.6}}, color = {127, 127, 0}));
      connect(H2PO4_I.solution, intersticium.solution) annotation(Line(points = {{160, -12}, {180, -12}, {180, -172.6}, {292, -172.6}}, color = {127, 127, 0}));
      connect(Na_I.solution, intersticium.solution) annotation(Line(points = {{160, -44}, {180, -44}, {180, -172.6}, {292, -172.6}}, color = {127, 127, 0}));
      connect(K_I.solution, intersticium.solution) annotation(Line(points = {{160, -72}, {160, -70}, {180, -70}, {180, -172.6}, {292, -172.6}}, color = {127, 127, 0}));
      connect(Ca_I.solution, intersticium.solution) annotation(Line(points = {{160, -100}, {160, -100}, {180, -100}, {180, -172.6}, {292, -172.6}}, color = {127, 127, 0}));
      connect(Mg_I.solution, intersticium.solution) annotation(Line(points = {{160, -128}, {160, -128}, {180, -128}, {180, -172.6}, {292, -172.6}}, color = {127, 127, 0}));
      connect(Water_I.solution, intersticium.solution) annotation(Line(points = {{160, 52}, {160, 50}, {180, 50}, {180, -172.6}, {292, -172.6}}, color = {127, 127, 0}));
      connect(HPO4_P.solution,plasma. solution) annotation(Line(points = {{-2, 8}, {22, 8}, {56, 8}, {56, -20}, {40, -20}, {40, -172.6}, {66, -172.6}}, color = {127, 127, 0}));
      connect(H_P.solution,plasma. solution) annotation(Line(points = {{-2, 32}, {20, 32}, {56, 32}, {56, -20}, {40, -20}, {40, -172.6}, {66, -172.6}}, color = {127, 127, 0}));
      connect(CO3_E.port_a, membrane.port_a) annotation(Line(points = {{-140, 104}, {-118, 104}}, color = {158, 66, 200}));
      connect(membrane.port_b, CO3_P.port_a) annotation(Line(points = {{-98, 104}, {-34, 104}, {72, 104}}, color = {158, 66, 200}));
      connect(HCO3_E.port_a, membrane1.port_a) annotation(Line(points = {{-208, 86}, {-118, 86}}, color = {158, 66, 200}));
      connect(membrane1.port_b, HCO3_P.port_a) annotation(Line(points = {{-98, 86}, {-64, 86}, {16, 86}}, color = {158, 66, 200}));
      connect(Water_E.port_a, membrane14.port_a) annotation(Line(points = {{-274, 58}, {-204, 58}, {-118, 58}, {-118, 60}}, color = {158, 66, 200}));
      connect(membrane14.port_b, Water_P.port_a) annotation(Line(points = {{-98, 60}, {-76, 60}, {-52, 60}}, color = {158, 66, 200}));
      connect(H_E.port_a, membrane2.port_a) annotation(Line(points = {{-140, 40}, {-132, 40}, {-118, 40}}, color = {158, 66, 200}));
      connect(membrane2.port_b, H_P.port_a) annotation(Line(points = {{-98, 40}, {-98, 42}, {14, 42}}, color = {158, 66, 200}));
      connect(Cl_E.port_a, membrane6.port_a) annotation(Line(points = {{-138, -146}, {-130, -146}, {-120, -146}}, color = {158, 66, 200}));
      connect(membrane6.port_b, Cl_P.port_a) annotation(Line(points = {{-100, -146}, {-76, -146}, {2, -146}}, color = {158, 66, 200}));
      connect(Cl_P.port_a, membrane11.port_a) annotation(Line(points = {{2, -146}, {106, -146}, {106, -144}}, color = {158, 66, 200}));
      connect(membrane11.port_b, Cl_I.port_a) annotation(Line(points = {{126, -144}, {158, -144}, {224, -144}}, color = {158, 66, 200}));
      connect(CO3_P.port_a, membrane12.port_a) annotation(Line(points = {{72, 104}, {88, 104}, {106, 104}}, color = {158, 66, 200}));
      connect(membrane12.port_b, CO3_I.port_a) annotation(Line(points = {{126, 104}, {126, 104}, {308, 104}}, color = {158, 66, 200}));
      connect(HCO3_P.port_a, membrane13.port_a) annotation(Line(points = {{16, 86}, {106, 86}}, color = {158, 66, 200}));
      connect(membrane13.port_b, HCO3_I.port_a) annotation(Line(points = {{126, 86}, {168, 86}, {246, 86}}, color = {158, 66, 200}));
      connect(H_P.port_a, membrane5.port_a) annotation(Line(points = {{14, 42}, {14, 42}, {106, 42}}, color = {158, 66, 200}));
      connect(membrane5.port_b, H_I.port_a) annotation(Line(points = {{126, 42}, {246, 42}}, color = {158, 66, 200}));
      connect(HPO4_P.port_a, membrane3.port_a) annotation(Line(points = {{14, 18}, {46, 18}, {106, 18}, {106, 20}}, color = {158, 66, 200}));
      connect(H2PO4_P.port_a, membrane4.port_a) annotation(Line(points = {{-52, -2}, {8, -2}, {106, -2}}, color = {158, 66, 200}));
      connect(membrane4.port_b, H2PO4_I.port_a) annotation(Line(points = {{126, -2}, {144, -2}}, color = {158, 66, 200}));
      connect(membrane3.port_b, HPO4_I.port_a) annotation(Line(points = {{126, 20}, {246, 20}}, color = {158, 66, 200}));
      connect(Na_P.port_a, membrane9.port_a) annotation(Line(points = {{70, -34}, {88, -34}, {106, -34}}, color = {158, 66, 200}));
      connect(membrane9.port_b, Na_I.port_a) annotation(Line(points = {{126, -34}, {144, -34}}, color = {158, 66, 200}));
      connect(K_P.port_a, membrane7.port_a) annotation(Line(points = {{70, -62}, {106, -62}}, color = {158, 66, 200}));
      connect(membrane7.port_b, K_I.port_a) annotation(Line(points = {{126, -62}, {132, -62}, {144, -62}}, color = {158, 66, 200}));
      connect(Ca_P.port_a, membrane8.port_a) annotation(Line(points = {{70, -90}, {88, -90}, {106, -90}}, color = {158, 66, 200}));
      connect(membrane8.port_b, Ca_I.port_a) annotation(Line(points = {{126, -90}, {144, -90}}, color = {158, 66, 200}));
      connect(membrane10.port_b, Mg_I.port_a) annotation(Line(points = {{126, -118}, {144, -118}}, color = {158, 66, 200}));
      connect(membrane10.port_a, Mg_P.port_a) annotation(Line(points = {{106, -118}, {70, -118}, {70, -120}}, color = {158, 66, 200}));
      connect(membrane15.port_b, Water_I.port_a) annotation(Line(points = {{126, 60}, {144, 60}, {144, 62}}, color = {158, 66, 200}));
      connect(membrane15.port_a, Water_P.port_a) annotation(Line(points = {{106, 60}, {38, 60}, {-52, 60}}, color = {158, 66, 200}));
      connect(Cl_I.solution, intersticium.solution) annotation(Line(points = {{208, -154}, {208, -172.6}, {292, -172.6}}, color = {127, 127, 0}));
      connect(im_E.solution, erythrocyte.solution) annotation (Line(points={{-274,
              -112},{-274,-164},{-164,-164},{-164,-172.6}}, color={127,127,0}));
      connect(im_P.solution, plasma.solution) annotation (Line(points={{-48,-114},
              {-48,-172},{66,-172.6}}, color={127,127,0}));
      connect(im_I.solution, intersticium.solution) annotation (Line(points={{260,
              -130},{262,-130},{262,-172.6},{292,-172.6}}, color={127,127,0}));
      annotation(Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-400,
                -300},{400,300}})),                                                                           Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-400, -300}, {400, 300}})));
    end Exp_noReactions;

    model Exp_HImmobile
      Chemical.Components.Substance Water_E(substanceData = Chemical.Examples.Substances.Water_liquid,
          amountOfSubstance_start=5*55.13*0.44*1*0.73)                                                                                                    annotation(Placement(transformation(extent = {{-294, 48}, {-274, 68}})));
      Chemical.Components.Substance Water_P(substanceData = Chemical.Examples.Substances.Water_liquid,
          amountOfSubstance_start=(5*55.13*0.56*1*0.94))                                                                                                  annotation(Placement(transformation(extent = {{-72, 50}, {-52, 70}})));
      Chemical.Components.Substance Water_I(substanceData = Chemical.Examples.Substances.Water_liquid,
          amountOfSubstance_start=5*55.13*2)                                                                                                annotation(Placement(transformation(extent = {{164, 52}, {144, 72}})));
      Chemical.Components.Substance CO2_E(substanceData = Chemical.Examples.Substances.CarbonDioxide_aqueous, redeclare
          package stateOfMatter =
            Chemical.Interfaces.Incompressible,
        amountOfSubstance_start=(5*1.2*0.32e-3)/0.73)                                                                                                     annotation(Placement(transformation(extent = {{-296, 122}, {-276, 142}})));
      Chemical.Components.Substance CO2_P(substanceData = Chemical.Examples.Substances.CarbonDioxide_aqueous,
          amountOfSubstance_start=(5*1.407*0.53e-3)/0.94)                                                                                                annotation(Placement(transformation(extent = {{-74, 122}, {-54, 142}})));
      Chemical.Components.Substance CO2_I(substanceData = Chemical.Examples.Substances.CarbonDioxide_aqueous,
          amountOfSubstance_start=5*1.5*2e-3)                                                                                                     annotation(Placement(transformation(extent = {{164, 122}, {144, 142}})));
      Chemical.Components.Substance HCO3_E(substanceData = Chemical.Examples.Substances.Bicarbonate_aqueous,
          amountOfSubstance_start=(5*15.1*0.32e-3)/0.7)                                                                                                annotation(Placement(transformation(extent = {{-228, 76}, {-208, 96}})));
      Chemical.Components.Substance H_E(substanceData = Chemical.Examples.Substances.Proton_aqueous,
          amountOfSubstance_start=(5*0.32/0.73)*10^(-7.2))                                                                                         annotation(Placement(transformation(extent = {{-160, 30}, {-140, 50}})));
      Chemical.Components.Reaction reaction(nS = 2, nP = 2, s = {1, 1}, p = {1, 1}) annotation(Placement(transformation(extent = {{-266, 62}, {-246, 82}})));
      Chemical.Components.Reaction reaction1(nS = 1, s = {1}, nP = 2, p = {1, 1}) annotation(Placement(transformation(extent = {{-204, 30}, {-184, 50}})));
      Chemical.Components.Substance CO3_E(substanceData = Chemical.Examples.Substances.Carbonate_aqueous,
          amountOfSubstance_start=(5*0.015*0.32e-3)/0.73)                                                                                            annotation(Placement(transformation(extent = {{-160, 94}, {-140, 114}})));
      Chemical.Components.Substance H2PO4_E(substanceData = Chemical.Examples.Substances.DihydrogenPhosphate_aqueous,
          amountOfSubstance_start=(5*0.33*0.32e-3)/0.73)                                                                                                     annotation(Placement(transformation(extent = {{-240, -12}, {-220, 8}})));
      Chemical.Components.Substance HPO4_E(substanceData = Chemical.Examples.Substances.HydrogenPhosphate_aqueous,
          amountOfSubstance_start=(5*0.33*0.32e-3)/0.73)                                                                                                     annotation(Placement(transformation(extent = {{-160, 8}, {-140, 28}})));
      Chemical.Components.Reaction reaction2(nP = 2, p = {1, 1}, nS = 1, s = {1}) annotation(Placement(transformation(extent = {{-204, 2}, {-184, 22}})));
      Chemical.Components.Substance Na_E(substanceData = Chemical.Examples.Substances.Sodium_aqueous,
          amountOfSubstance_start=(5*10*0.32e-3)/0.73)                                                                                        annotation(Placement(transformation(extent = {{-186, -56}, {-166, -36}})));
      Chemical.Components.Substance K_E(substanceData = Chemical.Examples.Substances.Potassium_aqueous,
          amountOfSubstance_start=(5*99*0.32e-3)/0.73)                                                                                          annotation(Placement(transformation(extent = {{-186, -82}, {-166, -62}})));
      Chemical.Components.Substance Cl_E(substanceData = Chemical.Examples.Substances.Chloride_aqueous,
          amountOfSubstance_start=(5*55.3*0.32e-3)/0.73)                                                                                          annotation(Placement(transformation(extent = {{-158, -156}, {-138, -136}})));
      Chemical.Components.Substance DPG(
          substanceData(
          MolarWeight=0.266,
          z=-3.7,
          density=1000), amountOfSubstance_start=(5*4.4*0.32e-3)/0.73)                                                       annotation(Placement(transformation(extent = {{-224, -108}, {-204, -88}})));
      //(amountOfSubstance_start=4.4*0.32e-3)
      Chemical.Components.Substance GSH(substanceData(MolarWeight = 0.2, z = -1, density = 1000),
          amountOfSubstance_start=(5*2.2*0.32e-3)/0.73)                                                                                    annotation(Placement(transformation(extent = {{-224, -132}, {-204, -112}})));
      //(amountOfSubstance_start=2.2*0.32e-3)
      Chemical.Components.Substance ATP(
          substanceData(
          DfH_25degC=16700,
          DfG_25degC_1bar=30500,
          References={
              "http://www.wiley.com/college/pratt/0471393878/student/review/thermodynamics/7_relationship.html"},
          z=-3.7), amountOfSubstance_start=(5*1.8*0.32e-3)/0.73)                                                       annotation(Placement(transformation(extent = {{-224, -158}, {-204, -138}})));

      //(amountOfSubstance_start=1.8*0.32e-3)
      Chemical.Components.Substance Hb(
          substanceData(
          MolarWeight=64,
          z=-2.1,
          density=1500), amountOfSubstance_start=(5*5.3*0.32e-3)/0.73)                                                       annotation(Placement(transformation(extent = {{-224, -52}, {-204, -32}})));
      //(amountOfSubstance_start=5.3*0.32e-3)
      Chemical.Components.Substance HCO3_P(substanceData = Chemical.Examples.Substances.Bicarbonate_aqueous,
          amountOfSubstance_start=(5*26*0.53e-3)/0.94)                                                                                               annotation(Placement(transformation(extent = {{-4, 76}, {16, 96}})));
      Chemical.Components.Substance H_P(substanceData = Chemical.Examples.Substances.Proton_aqueous,
          amountOfSubstance_start=(5*0.53/0.94)*10^(-7.37))                                                                                         annotation(Placement(transformation(extent = {{-6, 32}, {14, 52}})));
      Chemical.Components.Reaction reaction3(nS = 1, s = {1}, nP = 2, p = {1, 1}) annotation(Placement(transformation(extent = {{30, 56}, {50, 76}})));
      Chemical.Components.Reaction reaction4(nS = 2, s = {1, 1}, nP = 2, p = {1, 1}) annotation(Placement(transformation(extent = {{-38, 66}, {-18, 86}})));
      Chemical.Components.Substance CO3_P(substanceData = Chemical.Examples.Substances.Carbonate_aqueous,
          amountOfSubstance_start=(5*0.04*0.53e-3)/0.94)                                                                                            annotation(Placement(transformation(extent = {{52, 94}, {72, 114}})));
      Chemical.Components.Substance H2PO4_P(substanceData = Chemical.Examples.Substances.DihydrogenPhosphate_aqueous,
          amountOfSubstance_start=(5*0.56*0.53e-3)/0.94)                                                                                                     annotation(Placement(transformation(extent = {{-72, -12}, {-52, 8}})));
      Chemical.Components.Substance HPO4_P(substanceData = Chemical.Examples.Substances.HydrogenPhosphate_aqueous,
          amountOfSubstance_start=(5*0.56*0.53e-3)/0.94)                                                                                                     annotation(Placement(transformation(extent = {{-6, 8}, {14, 28}})));
      Chemical.Components.Reaction reaction5(nS = 1, s = {1}, nP = 2, p = {1, 1}) annotation(Placement(transformation(extent = {{-40, 0}, {-20, 20}})));
      Chemical.Components.Substance Na_P(substanceData = Chemical.Examples.Substances.Sodium_aqueous,
          amountOfSubstance_start=(5*141*0.53e-3)/0.94)                                                                                        annotation(Placement(transformation(extent = {{50, -44}, {70, -24}})));
      Chemical.Components.Substance K_P(substanceData = Chemical.Examples.Substances.Potassium_aqueous,
          amountOfSubstance_start=(5*4.2*0.53e-3)/0.94)                                                                                          annotation(Placement(transformation(extent = {{50, -72}, {70, -52}})));
      Chemical.Components.Substance Cl_P(substanceData = Chemical.Examples.Substances.Chloride_aqueous,
          amountOfSubstance_start=(5*104*0.53e-3)/0.94)                                                                                          annotation(Placement(transformation(extent = {{-18, -156}, {2, -136}})));
      Chemical.Components.Substance Ca_P(substanceData = Chemical.Examples.Substances.Calcium_aqueous,
          amountOfSubstance_start=(5*2.3*0.53e-3)/0.94)                                                                                         annotation(Placement(transformation(extent = {{50, -100}, {70, -80}})));
      Chemical.Components.Substance Mg_P(substanceData = Chemical.Examples.Substances.Magnesium_aqueous,
          amountOfSubstance_start=(5*0.8*0.53e-3)/0.94)                                                                                           annotation(Placement(transformation(extent = {{50, -130}, {70, -110}})));
      Chemical.Components.Substance Alb_P(
          substanceData(
          MolarWeight=66.463,
          z=-18.2,
          density=1080), amountOfSubstance_start=(5*0.65*0.53e-3)/0.94)                                                      annotation(Placement(transformation(extent = {{-4, -34}, {16, -14}})));
      //(amountOfSubstance_start=0.65*0.53e-3)
      Chemical.Components.Substance HCO3_I(substanceData = Chemical.Examples.Substances.Bicarbonate_aqueous,
          amountOfSubstance_start=5*29.4*2e-3)                                                                                                     annotation(Placement(transformation(extent = {{226, 76}, {246, 96}})));
      Chemical.Components.Substance H_I(substanceData = Chemical.Examples.Substances.Proton_aqueous,
          amountOfSubstance_start=(5*2)*10^(-7.39))                                                                                              annotation(Placement(transformation(extent = {{226, 32}, {246, 52}})));
      Chemical.Components.Reaction reaction6(nS = 2, s = {1, 1}, nP = 2, p = {1, 1}) annotation(Placement(transformation(extent = {{190, 70}, {210, 90}})));
      Chemical.Components.Reaction reaction7(nS = 1, s = {1}, nP = 2, p = {1, 1}) annotation(Placement(transformation(extent = {{258, 56}, {278, 76}})));
      Chemical.Components.Substance CO3_I(substanceData = Chemical.Examples.Substances.Carbonate_aqueous,
          amountOfSubstance_start=5*0.048*2e-3)                                                                                                   annotation(Placement(transformation(extent = {{288, 94}, {308, 114}})));
      Chemical.Components.Substance H2PO4_I(substanceData = Chemical.Examples.Substances.DihydrogenPhosphate_aqueous,
          amountOfSubstance_start=5*0.6*2e-3)                                                                                                     annotation(Placement(transformation(extent = {{164, -12}, {144, 8}})));
      Chemical.Components.Substance HPO4_I(substanceData = Chemical.Examples.Substances.HydrogenPhosphate_aqueous,
          amountOfSubstance_start=5*0.6*2e-3)                                                                                                     annotation(Placement(transformation(extent = {{226, 10}, {246, 30}})));
      Chemical.Components.Reaction reaction8(nS = 1, s = {1}, nP = 2, p = {1, 1}) annotation(Placement(transformation(extent = {{190, -4}, {210, 16}})));
      Chemical.Components.Substance Na_I(substanceData = Chemical.Examples.Substances.Sodium_aqueous,
          amountOfSubstance_start=5*142*2e-3)                                                                                               annotation(Placement(transformation(extent = {{164, -44}, {144, -24}})));
      Chemical.Components.Substance K_I(substanceData = Chemical.Examples.Substances.Potassium_aqueous,
          amountOfSubstance_start=5*4.14*2e-3)                                                                                                 annotation(Placement(transformation(extent = {{164, -72}, {144, -52}})));
      Chemical.Components.Substance Cl_I(substanceData = Chemical.Examples.Substances.Chloride_aqueous,
          amountOfSubstance_start=5*118*2e-3)                                                                                                 annotation(Placement(transformation(extent = {{204, -154}, {224, -134}})));
      Chemical.Components.Substance Ca_I(substanceData = Chemical.Examples.Substances.Calcium_aqueous,
          amountOfSubstance_start=5*2.2*2e-3)                                                                                                annotation(Placement(transformation(extent={{164,
                -100},{144,-80}})));
      Chemical.Components.Substance Mg_I(substanceData = Chemical.Examples.Substances.Magnesium_aqueous,
          amountOfSubstance_start=5*0.75*2e-3)                                                                                                  annotation(Placement(transformation(extent = {{164, -128}, {144, -108}})));
      Chemical.Components.Substance Alb_I(
          substanceData(
          MolarWeight=66.463,
          z=-18.2,
          density=1080), amountOfSubstance_start=5*0.19*2e-3)                                                                annotation(Placement(transformation(extent = {{216, -36}, {236, -16}})));
      //(amountOfSubstance_start=0.19*2e-3)
      Chemical.Components.Membrane membrane annotation(Placement(transformation(extent = {{-118, 94}, {-98, 114}})));
      Chemical.Components.Membrane membrane1 annotation(Placement(transformation(extent = {{-118, 76}, {-98, 96}})));
      Chemical.Components.Membrane membrane3 annotation(Placement(transformation(extent = {{106, 10}, {126, 30}})));
      Chemical.Components.Membrane membrane4 annotation(Placement(transformation(extent = {{106, -12}, {126, 8}})));
      Chemical.Components.Membrane membrane6 annotation(Placement(transformation(extent = {{-120, -156}, {-100, -136}})));
      Chemical.Components.Membrane membrane7 annotation(Placement(transformation(extent = {{106, -72}, {126, -52}})));
      Chemical.Components.Membrane membrane8 annotation(Placement(transformation(extent = {{106, -100}, {126, -80}})));
      Chemical.Components.Membrane membrane9 annotation(Placement(transformation(extent = {{106, -44}, {126, -24}})));
      Chemical.Components.Membrane membrane10 annotation(Placement(transformation(extent = {{106, -128}, {126, -108}})));
      Chemical.Components.Membrane membrane11 annotation(Placement(transformation(extent = {{106, -154}, {126, -134}})));
      Chemical.Components.Membrane membrane12 annotation(Placement(transformation(extent = {{106, 94}, {126, 114}})));
      Chemical.Components.Membrane membrane13 annotation(Placement(transformation(extent = {{106, 76}, {126, 96}})));
    Chemical.Components.Solution erythrocyte annotation(Placement(visible = true, transformation(extent = {{-324, -176}, {-124, 164}}, rotation = 0)));
      Chemical.Components.Solution plasma annotation(Placement(transformation(extent = {{-94, -176}, {106, 164}})));
      Chemical.Components.Solution intersticium annotation(Placement(transformation(extent = {{132, -176}, {332, 164}})));
      Chemical.Components.Membrane membrane14 annotation(Placement(transformation(extent = {{-118, 50}, {-98, 70}})));
      Chemical.Components.Membrane membrane15 annotation(Placement(transformation(extent = {{106, 50}, {126, 70}})));
      Chemical.Components.Substance im_E(
          substanceData(z=-0.92), amountOfSubstance_start=(5*94.6*0.32e-3)/0.73)
        annotation (Placement(transformation(extent={{-278,-112},{-258,-92}})));
      Chemical.Components.Substance im_P(substanceData(z=-5.3),
          amountOfSubstance_start=(5*13.7*0.53e-3)/0.94)
        annotation (Placement(transformation(extent={{-52,-114},{-32,-94}})));
      Chemical.Components.Substance im_I(substanceData(z=-0.8),
          amountOfSubstance_start=5*11.96*2e-3)
        annotation (Placement(transformation(extent={{256,-130},{276,-110}})));
    equation
      connect(HCO3_E.solution, erythrocyte.solution) annotation(Line(points={{-224,76},
              {-170,76},{-170,-32},{-198,-32},{-198,-164},{-164,-164},{-164,
              -172.6}},                                                                                                    color = {127, 127, 0}));
      connect(H2PO4_E.solution, erythrocyte.solution) annotation(Line(points={{-236,
              -12},{-198,-12},{-198,-164},{-164,-164},{-164,-172.6}},                                                                                color = {127, 127, 0}));
      connect(Hb.solution, erythrocyte.solution) annotation(Line(points={{-220,
              -52},{-198,-52},{-198,-164},{-164,-164},{-164,-172.6}},                                                                           color = {127, 127, 0}));
      connect(DPG.solution, erythrocyte.solution) annotation(Line(points={{-220,
              -108},{-198,-108},{-198,-164},{-164,-164},{-164,-172.6}},                                                                            color = {127, 127, 0}));
      connect(GSH.solution, erythrocyte.solution) annotation(Line(points={{-220,
              -132},{-198,-132},{-198,-164},{-164,-164},{-164,-172.6}},                                                                            color = {127, 127, 0}));
      connect(ATP.solution, erythrocyte.solution) annotation(Line(points={{-220,
              -158},{-220,-164},{-164,-164},{-164,-172.6}},                                                                          color = {127, 127, 0}));
      connect(Water_E.solution, erythrocyte.solution) annotation(Line(points={{-290,48},
              {-296,48},{-296,-164},{-164,-164},{-164,-172.6}},                                                                                    color = {127, 127, 0}));
      connect(CO3_E.solution, erythrocyte.solution) annotation(Line(points={{-156,94},
              {-170,94},{-170,-32},{-198,-32},{-198,-164},{-164,-164},{-164,
              -172.6}},                                                                                                    color = {127, 127, 0}));
      connect(H_E.solution, erythrocyte.solution) annotation(Line(points={{-156,30},
              {-170,30},{-170,-32},{-198,-32},{-198,-164},{-164,-164},{-164,
              -172.6}},                                                                                                    color = {127, 127, 0}));
      connect(HPO4_E.solution, erythrocyte.solution) annotation(Line(points={{-156,8},
              {-170,8},{-170,-32},{-198,-32},{-198,-164},{-164,-164},{-164,-172.6}},                                                                                      color = {127, 127, 0}));
      connect(K_E.solution, erythrocyte.solution) annotation(Line(points={{-182,
              -82},{-198,-82},{-198,-164},{-164,-164},{-164,-172.6}},                                                                            color = {127, 127, 0}));
      connect(Na_E.solution, erythrocyte.solution) annotation(Line(points={{-182,
              -56},{-198,-56},{-198,-164},{-164,-164},{-164,-172.6}},                                                                             color = {127, 127, 0}));
      connect(Cl_E.solution, erythrocyte.solution) annotation(Line(points={{-154,
              -156},{-164,-156},{-164,-172.6}},                                                                         color = {127, 127, 0}));
      connect(CO2_E.solution, erythrocyte.solution) annotation(Line(points={{-292,
              122},{-296,122},{-296,-164},{-164,-164},{-164,-172.6}},                                                                              color = {127, 127, 0}));
      connect(CO2_P.solution,plasma. solution) annotation(Line(points={{-70,122},
              {-76,122},{-76,-172.6},{66,-172.6}},                                                                             color = {127, 127, 0}));
      connect(Water_P.solution,plasma. solution) annotation(Line(points={{-68,50},
              {-76,50},{-76,-172.6},{66,-172.6}},                                                                              color = {127, 127, 0}));
      connect(H2PO4_P.solution,plasma. solution) annotation(Line(points={{-68,-12},
              {-76,-12},{-76,-172.6},{66,-172.6}},                                                                               color = {127, 127, 0}));
      connect(Cl_P.solution,plasma. solution) annotation(Line(points = {{-14, -156}, {-14, -172.6}, {66, -172.6}}, color = {127, 127, 0}));
      connect(CO3_P.solution,plasma. solution) annotation(Line(points = {{56, 94}, {56, -20}, {40, -20}, {40, -172.6}, {66, -172.6}}, color = {127, 127, 0}));
      connect(HCO3_P.solution,plasma. solution) annotation(Line(points = {{0, 76}, {22, 76}, {56, 76}, {56, -20}, {40, -20}, {40, -172.6}, {66, -172.6}}, color = {127, 127, 0}));
      connect(Na_P.solution,plasma. solution) annotation(Line(points = {{54, -44}, {40, -44}, {40, -172.6}, {66, -172.6}}, color = {127, 127, 0}));
      connect(K_P.solution,plasma. solution) annotation(Line(points = {{54, -72}, {40, -72}, {40, -172.6}, {66, -172.6}}, color = {127, 127, 0}));
      connect(Ca_P.solution,plasma. solution) annotation(Line(points = {{54, -100}, {50, -100}, {40, -100}, {40, -172.6}, {66, -172.6}}, color = {127, 127, 0}));
      connect(Mg_P.solution,plasma. solution) annotation(Line(points = {{54, -130}, {50, -130}, {40, -130}, {40, -172.6}, {66, -172.6}}, color = {127, 127, 0}));
      connect(Alb_P.solution,plasma. solution) annotation(Line(points = {{0, -34}, {0, -34}, {40, -34}, {40, -172.6}, {66, -172.6}}, color = {127, 127, 0}));
      connect(CO2_I.solution, intersticium.solution) annotation(Line(points = {{160, 122}, {160, 118}, {180, 118}, {180, -172.6}, {292, -172.6}}, color = {127, 127, 0}));
      connect(CO3_I.solution, intersticium.solution) annotation(Line(points = {{292, 94}, {292, 94}, {292, -172.6}}, color = {127, 127, 0}));
      connect(HCO3_I.solution, intersticium.solution) annotation(Line(points = {{230, 76}, {292, 76}, {292, -172.6}}, color = {127, 127, 0}));
      connect(H_I.solution, intersticium.solution) annotation(Line(points = {{230, 32}, {180, 32}, {180, -172.6}, {292, -172.6}}, color = {127, 127, 0}));
      connect(HPO4_I.solution, intersticium.solution) annotation(Line(points = {{230, 10}, {228, 10}, {228, -12}, {180, -12}, {180, -172.6}, {292, -172.6}}, color = {127, 127, 0}));
      connect(Alb_I.solution, intersticium.solution) annotation(Line(points = {{220, -36}, {180, -36}, {180, -172.6}, {292, -172.6}}, color = {127, 127, 0}));
      connect(H2PO4_I.solution, intersticium.solution) annotation(Line(points = {{160, -12}, {180, -12}, {180, -172.6}, {292, -172.6}}, color = {127, 127, 0}));
      connect(Na_I.solution, intersticium.solution) annotation(Line(points = {{160, -44}, {180, -44}, {180, -172.6}, {292, -172.6}}, color = {127, 127, 0}));
      connect(K_I.solution, intersticium.solution) annotation(Line(points = {{160, -72}, {160, -70}, {180, -70}, {180, -172.6}, {292, -172.6}}, color = {127, 127, 0}));
      connect(Ca_I.solution, intersticium.solution) annotation(Line(points={{160,
              -100},{160,-100},{180,-100},{180,-172.6},{292,-172.6}},                                                                               color = {127, 127, 0}));
      connect(Mg_I.solution, intersticium.solution) annotation(Line(points = {{160, -128}, {160, -128}, {180, -128}, {180, -172.6}, {292, -172.6}}, color = {127, 127, 0}));
      connect(Water_I.solution, intersticium.solution) annotation(Line(points = {{160, 52}, {160, 50}, {180, 50}, {180, -172.6}, {292, -172.6}}, color = {127, 127, 0}));
      connect(HPO4_P.solution,plasma. solution) annotation(Line(points = {{-2, 8}, {22, 8}, {56, 8}, {56, -20}, {40, -20}, {40, -172.6}, {66, -172.6}}, color = {127, 127, 0}));
      connect(H_P.solution,plasma. solution) annotation(Line(points = {{-2, 32}, {20, 32}, {56, 32}, {56, -20}, {40, -20}, {40, -172.6}, {66, -172.6}}, color = {127, 127, 0}));
      connect(CO3_E.port_a, membrane.port_a) annotation(Line(points = {{-140, 104}, {-118, 104}}, color = {158, 66, 200}));
      connect(membrane.port_b, CO3_P.port_a) annotation(Line(points = {{-98, 104}, {-34, 104}, {72, 104}}, color = {158, 66, 200}));
      connect(HCO3_E.port_a, membrane1.port_a) annotation(Line(points = {{-208, 86}, {-118, 86}}, color = {158, 66, 200}));
      connect(membrane1.port_b, HCO3_P.port_a) annotation(Line(points = {{-98, 86}, {-64, 86}, {16, 86}}, color = {158, 66, 200}));
      connect(Water_E.port_a, membrane14.port_a) annotation(Line(points = {{-274, 58}, {-204, 58}, {-118, 58}, {-118, 60}}, color = {158, 66, 200}));
      connect(membrane14.port_b, Water_P.port_a) annotation(Line(points = {{-98, 60}, {-76, 60}, {-52, 60}}, color = {158, 66, 200}));
      connect(Cl_E.port_a, membrane6.port_a) annotation(Line(points = {{-138, -146}, {-130, -146}, {-120, -146}}, color = {158, 66, 200}));
      connect(membrane6.port_b, Cl_P.port_a) annotation(Line(points = {{-100, -146}, {-76, -146}, {2, -146}}, color = {158, 66, 200}));
      connect(Cl_P.port_a, membrane11.port_a) annotation(Line(points = {{2, -146}, {106, -146}, {106, -144}}, color = {158, 66, 200}));
      connect(membrane11.port_b, Cl_I.port_a) annotation(Line(points = {{126, -144}, {158, -144}, {224, -144}}, color = {158, 66, 200}));
      connect(CO3_P.port_a, membrane12.port_a) annotation(Line(points = {{72, 104}, {88, 104}, {106, 104}}, color = {158, 66, 200}));
      connect(membrane12.port_b, CO3_I.port_a) annotation(Line(points = {{126, 104}, {126, 104}, {308, 104}}, color = {158, 66, 200}));
      connect(HCO3_P.port_a, membrane13.port_a) annotation(Line(points = {{16, 86}, {106, 86}}, color = {158, 66, 200}));
      connect(membrane13.port_b, HCO3_I.port_a) annotation(Line(points = {{126, 86}, {168, 86}, {246, 86}}, color = {158, 66, 200}));
      connect(HPO4_P.port_a, membrane3.port_a) annotation(Line(points = {{14, 18}, {46, 18}, {106, 18}, {106, 20}}, color = {158, 66, 200}));
      connect(H2PO4_P.port_a, membrane4.port_a) annotation(Line(points = {{-52, -2}, {8, -2}, {106, -2}}, color = {158, 66, 200}));
      connect(membrane4.port_b, H2PO4_I.port_a) annotation(Line(points = {{126, -2}, {144, -2}}, color = {158, 66, 200}));
      connect(membrane3.port_b, HPO4_I.port_a) annotation(Line(points = {{126, 20}, {246, 20}}, color = {158, 66, 200}));
      connect(Na_P.port_a, membrane9.port_a) annotation(Line(points = {{70, -34}, {88, -34}, {106, -34}}, color = {158, 66, 200}));
      connect(membrane9.port_b, Na_I.port_a) annotation(Line(points = {{126, -34}, {144, -34}}, color = {158, 66, 200}));
      connect(K_P.port_a, membrane7.port_a) annotation(Line(points = {{70, -62}, {106, -62}}, color = {158, 66, 200}));
      connect(membrane7.port_b, K_I.port_a) annotation(Line(points = {{126, -62}, {132, -62}, {144, -62}}, color = {158, 66, 200}));
      connect(Ca_P.port_a, membrane8.port_a) annotation(Line(points = {{70, -90}, {88, -90}, {106, -90}}, color = {158, 66, 200}));
      connect(membrane8.port_b, Ca_I.port_a) annotation(Line(points={{126,-90},{
              136,-90},{144,-90}},                                                              color = {158, 66, 200}));
      connect(membrane10.port_b, Mg_I.port_a) annotation(Line(points = {{126, -118}, {144, -118}}, color = {158, 66, 200}));
      connect(membrane10.port_a, Mg_P.port_a) annotation(Line(points = {{106, -118}, {70, -118}, {70, -120}}, color = {158, 66, 200}));
      connect(CO2_E.port_a, reaction.substrates[1]) annotation(Line(points = {{-276, 132}, {-266, 132}, {-266, 70}}, color = {158, 66, 200}));
      connect(Water_E.port_a, reaction.substrates[2]) annotation(Line(points = {{-274, 58}, {-272, 58}, {-266, 58}, {-266, 74}}, color = {158, 66, 200}));
      connect(HCO3_E.port_a, reaction1.substrates[1]) annotation(Line(points = {{-208, 86}, {-208, 40}, {-204, 40}}, color = {158, 66, 200}));
      connect(reaction1.products[1], H_E.port_a) annotation(Line(points = {{-184, 38}, {-184, 40}, {-140, 40}}, color = {158, 66, 200}));
      connect(H2PO4_E.port_a, reaction2.substrates[1]) annotation(Line(points = {{-220, -2}, {-220, -2}, {-204, -2}, {-204, 12}}, color = {158, 66, 200}));
      connect(reaction2.products[1], HPO4_E.port_a) annotation(Line(points = {{-184, 10}, {-140, 10}, {-140, 18}}, color = {158, 66, 200}));
      connect(reaction2.products[2], H_E.port_a) annotation(Line(points = {{-184, 14}, {-178, 14}, {-178, 40}, {-140, 40}}, color = {158, 66, 200}));
      connect(Water_P.port_a, reaction4.substrates[1]) annotation(Line(points = {{-52, 60}, {-48, 60}, {-38, 60}, {-38, 74}}, color = {158, 66, 200}));
      connect(reaction4.substrates[2], CO2_P.port_a) annotation(Line(points = {{-38, 78}, {-38, 132}, {-54, 132}}, color = {158, 66, 200}));
      connect(reaction4.products[1], H_P.port_a) annotation(Line(points = {{-18, 74}, {-20, 74}, {-20, 48}, {-20, 42}, {14, 42}}, color = {158, 66, 200}));
      connect(reaction4.products[2], HCO3_P.port_a) annotation(Line(points = {{-18, 78}, {-18, 86}, {16, 86}}, color = {158, 66, 200}));
      connect(HCO3_P.port_a, reaction3.substrates[1]) annotation(Line(points = {{16, 86}, {30, 86}, {30, 84}, {30, 66}}, color = {158, 66, 200}));
      connect(reaction3.products[1], H_P.port_a) annotation(Line(points = {{50, 64}, {80, 64}, {80, 42}, {14, 42}}, color = {158, 66, 200}));
      connect(reaction3.products[2], CO3_P.port_a) annotation(Line(points = {{50, 68}, {62, 68}, {80, 68}, {80, 104}, {72, 104}}, color = {158, 66, 200}));
      connect(H2PO4_P.port_a, reaction5.substrates[1]) annotation(Line(points = {{-52, -2}, {-40, -2}, {-40, 10}}, color = {158, 66, 200}));
      connect(reaction5.products[1], HPO4_P.port_a) annotation(Line(points = {{-20, 8}, {-20, 8}, {14, 8}, {14, 18}}, color = {158, 66, 200}));
      connect(reaction5.products[2], H_P.port_a) annotation(Line(points = {{-20, 12}, {-20, 42}, {14, 42}}, color = {158, 66, 200}));
      connect(CO2_I.port_a, reaction6.substrates[1]) annotation(Line(points = {{144, 132}, {190, 132}, {190, 78}}, color = {158, 66, 200}));
      connect(membrane15.port_b, Water_I.port_a) annotation(Line(points = {{126, 60}, {144, 60}, {144, 62}}, color = {158, 66, 200}));
      connect(membrane15.port_a, Water_P.port_a) annotation(Line(points = {{106, 60}, {38, 60}, {-52, 60}}, color = {158, 66, 200}));
      connect(Water_I.port_a, reaction6.substrates[2]) annotation(Line(points = {{144, 62}, {154, 62}, {190, 62}, {190, 82}}, color = {158, 66, 200}));
      connect(reaction6.products[1], H_I.port_a) annotation(Line(points = {{210, 78}, {220, 78}, {220, 42}, {246, 42}}, color = {158, 66, 200}));
      connect(reaction6.products[2], HCO3_I.port_a) annotation(Line(points = {{210, 82}, {220, 82}, {220, 86}, {246, 86}}, color = {158, 66, 200}));
      connect(HCO3_I.port_a, reaction7.substrates[1]) annotation(Line(points = {{246, 86}, {258, 86}, {258, 66}}, color = {158, 66, 200}));
      connect(reaction7.products[1], H_I.port_a) annotation(Line(points = {{278, 64}, {278, 64}, {278, 42}, {246, 42}}, color = {158, 66, 200}));
      connect(reaction7.products[2], CO3_I.port_a) annotation(Line(points = {{278, 68}, {278, 68}, {278, 84}, {278, 104}, {308, 104}}, color = {158, 66, 200}));
      connect(H2PO4_I.port_a, reaction8.substrates[1]) annotation(Line(points = {{144, -2}, {162, -2}, {190, -2}, {190, 6}}, color = {158, 66, 200}));
      connect(reaction8.products[1], H_I.port_a) annotation(Line(points = {{210, 4}, {220, 4}, {220, 14}, {220, 42}, {246, 42}}, color = {158, 66, 200}));
      connect(reaction8.products[2], HPO4_I.port_a) annotation(Line(points = {{210, 8}, {210, 20}, {246, 20}}, color = {158, 66, 200}));
      connect(Cl_I.solution, intersticium.solution) annotation(Line(points = {{208, -154}, {208, -172.6}, {292, -172.6}}, color = {127, 127, 0}));
      connect(reaction.products[1], H_E.port_a) annotation(Line(points = {{-246, 70}, {-238, 70}, {-178, 70}, {-178, 40}, {-140, 40}}, color = {158, 66, 200}));
      connect(reaction.products[2], HCO3_E.port_a) annotation(Line(points = {{-246, 74}, {-246, 86}, {-208, 86}}, color = {158, 66, 200}));
      connect(reaction1.products[2], CO3_E.port_a) annotation(Line(points = {{-184, 42}, {-184, 42}, {-184, 64}, {-184, 104}, {-140, 104}}, color = {158, 66, 200}));
      connect(im_E.solution, erythrocyte.solution) annotation (Line(points={{-274,
              -112},{-274,-164},{-164,-164},{-164,-172.6}}, color={127,127,0}));
      connect(im_P.solution, plasma.solution) annotation (Line(points={{-48,-114},
              {-48,-172},{66,-172.6}}, color={127,127,0}));
      connect(im_I.solution, intersticium.solution) annotation (Line(points={{260,
              -130},{262,-130},{262,-172.6},{292,-172.6}}, color={127,127,0}));
      annotation(Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-400,
                -300},{400,300}})),                                                                           Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-400, -300}, {400, 300}})));
    end Exp_HImmobile;

    model Exp_bicarbImmobile
      Chemical.Components.Substance Water_E(substanceData = Chemical.Examples.Substances.Water_liquid,
          amountOfSubstance_start=5*55.13*0.44*1*0.73)                                                                                                    annotation(Placement(transformation(extent = {{-294, 48}, {-274, 68}})));
      Chemical.Components.Substance Water_P(substanceData = Chemical.Examples.Substances.Water_liquid,
          amountOfSubstance_start=(5*55.13*0.56*1*0.94))                                                                                                  annotation(Placement(transformation(extent = {{-72, 50}, {-52, 70}})));
      Chemical.Components.Substance Water_I(substanceData = Chemical.Examples.Substances.Water_liquid,
          amountOfSubstance_start=5*55.13*2)                                                                                                annotation(Placement(transformation(extent = {{164, 52}, {144, 72}})));
      Chemical.Components.Substance CO2_E(substanceData = Chemical.Examples.Substances.CarbonDioxide_aqueous, redeclare
          package stateOfMatter =
            Chemical.Interfaces.Incompressible,
        amountOfSubstance_start=(5*1.2*0.32e-3)/0.73)                                                                                                     annotation(Placement(transformation(extent = {{-296, 122}, {-276, 142}})));
      Chemical.Components.Substance CO2_P(substanceData = Chemical.Examples.Substances.CarbonDioxide_aqueous,
          amountOfSubstance_start=(5*1.407*0.53e-3)/0.94)                                                                                                annotation(Placement(transformation(extent = {{-74, 122}, {-54, 142}})));
      Chemical.Components.Substance CO2_I(substanceData = Chemical.Examples.Substances.CarbonDioxide_aqueous,
          amountOfSubstance_start=5*1.5*2e-3)                                                                                                     annotation(Placement(transformation(extent = {{164, 122}, {144, 142}})));
      Chemical.Components.Substance HCO3_E(substanceData = Chemical.Examples.Substances.Bicarbonate_aqueous,
          amountOfSubstance_start=(5*15.1*0.32e-3)/0.7)                                                                                                annotation(Placement(transformation(extent = {{-228, 76}, {-208, 96}})));
      Chemical.Components.Substance H_E(substanceData = Chemical.Examples.Substances.Proton_aqueous,
          amountOfSubstance_start=(5*0.32/0.73)*10^(-7.2))                                                                                         annotation(Placement(transformation(extent = {{-160, 30}, {-140, 50}})));
      Chemical.Components.Reaction reaction(nS = 2, nP = 2, s = {1, 1}, p = {1, 1}) annotation(Placement(transformation(extent = {{-266, 62}, {-246, 82}})));
      Chemical.Components.Reaction reaction1(nS = 1, s = {1}, nP = 2, p = {1, 1}) annotation(Placement(transformation(extent = {{-204, 30}, {-184, 50}})));
      Chemical.Components.Substance CO3_E(substanceData = Chemical.Examples.Substances.Carbonate_aqueous,
          amountOfSubstance_start=(5*0.015*0.32e-3)/0.73)                                                                                            annotation(Placement(transformation(extent = {{-160, 94}, {-140, 114}})));
      Chemical.Components.Substance H2PO4_E(substanceData = Chemical.Examples.Substances.DihydrogenPhosphate_aqueous,
          amountOfSubstance_start=(5*0.33*0.32e-3)/0.73)                                                                                                     annotation(Placement(transformation(extent = {{-240, -12}, {-220, 8}})));
      Chemical.Components.Substance HPO4_E(substanceData = Chemical.Examples.Substances.HydrogenPhosphate_aqueous,
          amountOfSubstance_start=(5*0.33*0.32e-3)/0.73)                                                                                                     annotation(Placement(transformation(extent = {{-160, 8}, {-140, 28}})));
      Chemical.Components.Reaction reaction2(nP = 2, p = {1, 1}, nS = 1, s = {1}) annotation(Placement(transformation(extent = {{-204, 2}, {-184, 22}})));
      Chemical.Components.Substance Na_E(substanceData = Chemical.Examples.Substances.Sodium_aqueous,
          amountOfSubstance_start=(5*10*0.32e-3)/0.73)                                                                                        annotation(Placement(transformation(extent = {{-186, -56}, {-166, -36}})));
      Chemical.Components.Substance K_E(substanceData = Chemical.Examples.Substances.Potassium_aqueous,
          amountOfSubstance_start=(5*99*0.32e-3)/0.73)                                                                                          annotation(Placement(transformation(extent = {{-186, -82}, {-166, -62}})));
      Chemical.Components.Substance Cl_E(substanceData = Chemical.Examples.Substances.Chloride_aqueous,
          amountOfSubstance_start=(5*55.3*0.32e-3)/0.73)                                                                                          annotation(Placement(transformation(extent = {{-158, -156}, {-138, -136}})));
      Chemical.Components.Substance DPG(
          substanceData(
          MolarWeight=0.266,
          z=-3.7,
          density=1000), amountOfSubstance_start=(5*4.4*0.32e-3)/0.73)                                                       annotation(Placement(transformation(extent = {{-224, -108}, {-204, -88}})));
      //(amountOfSubstance_start=4.4*0.32e-3)
      Chemical.Components.Substance GSH(substanceData(MolarWeight = 0.2, z = -1, density = 1000),
          amountOfSubstance_start=(5*2.2*0.32e-3)/0.73)                                                                                    annotation(Placement(transformation(extent = {{-224, -132}, {-204, -112}})));
      //(amountOfSubstance_start=2.2*0.32e-3)
      Chemical.Components.Substance ATP(
          substanceData(
          DfH_25degC=16700,
          DfG_25degC_1bar=30500,
          References={
              "http://www.wiley.com/college/pratt/0471393878/student/review/thermodynamics/7_relationship.html"},
          z=-3.7), amountOfSubstance_start=(5*1.8*0.32e-3)/0.73)                                                       annotation(Placement(transformation(extent = {{-224, -158}, {-204, -138}})));

      //(amountOfSubstance_start=1.8*0.32e-3)
      Chemical.Components.Substance Hb(
          substanceData(
          MolarWeight=64,
          z=-2.1,
          density=1500), amountOfSubstance_start=(5*5.3*0.32e-3)/0.73)                                                       annotation(Placement(transformation(extent = {{-224, -52}, {-204, -32}})));
      //(amountOfSubstance_start=5.3*0.32e-3)
      Chemical.Components.Substance HCO3_P(substanceData = Chemical.Examples.Substances.Bicarbonate_aqueous,
          amountOfSubstance_start=(5*26*0.53e-3)/0.94)                                                                                               annotation(Placement(transformation(extent = {{-4, 76}, {16, 96}})));
      Chemical.Components.Substance H_P(substanceData = Chemical.Examples.Substances.Proton_aqueous,
          amountOfSubstance_start=(5*0.53/0.94)*10^(-7.37))                                                                                         annotation(Placement(transformation(extent = {{-6, 32}, {14, 52}})));
      Chemical.Components.Reaction reaction3(nS = 1, s = {1}, nP = 2, p = {1, 1}) annotation(Placement(transformation(extent = {{30, 56}, {50, 76}})));
      Chemical.Components.Reaction reaction4(nS = 2, s = {1, 1}, nP = 2, p = {1, 1}) annotation(Placement(transformation(extent = {{-38, 66}, {-18, 86}})));
      Chemical.Components.Substance CO3_P(substanceData = Chemical.Examples.Substances.Carbonate_aqueous,
          amountOfSubstance_start=(5*0.04*0.53e-3)/0.94)                                                                                            annotation(Placement(transformation(extent = {{52, 94}, {72, 114}})));
      Chemical.Components.Substance H2PO4_P(substanceData = Chemical.Examples.Substances.DihydrogenPhosphate_aqueous,
          amountOfSubstance_start=(5*0.56*0.53e-3)/0.94)                                                                                                     annotation(Placement(transformation(extent = {{-72, -12}, {-52, 8}})));
      Chemical.Components.Substance HPO4_P(substanceData = Chemical.Examples.Substances.HydrogenPhosphate_aqueous,
          amountOfSubstance_start=(5*0.56*0.53e-3)/0.94)                                                                                                     annotation(Placement(transformation(extent = {{-6, 8}, {14, 28}})));
      Chemical.Components.Reaction reaction5(nS = 1, s = {1}, nP = 2, p = {1, 1}) annotation(Placement(transformation(extent = {{-40, 0}, {-20, 20}})));
      Chemical.Components.Substance Na_P(substanceData = Chemical.Examples.Substances.Sodium_aqueous,
          amountOfSubstance_start=(5*141*0.53e-3)/0.94)                                                                                        annotation(Placement(transformation(extent = {{50, -44}, {70, -24}})));
      Chemical.Components.Substance K_P(substanceData = Chemical.Examples.Substances.Potassium_aqueous,
          amountOfSubstance_start=(5*4.2*0.53e-3)/0.94)                                                                                          annotation(Placement(transformation(extent = {{50, -72}, {70, -52}})));
      Chemical.Components.Substance Cl_P(substanceData = Chemical.Examples.Substances.Chloride_aqueous,
          amountOfSubstance_start=(5*104*0.53e-3)/0.94)                                                                                          annotation(Placement(transformation(extent = {{-18, -156}, {2, -136}})));
      Chemical.Components.Substance Ca_P(substanceData = Chemical.Examples.Substances.Calcium_aqueous,
          amountOfSubstance_start=(5*2.3*0.53e-3)/0.94)                                                                                         annotation(Placement(transformation(extent = {{50, -100}, {70, -80}})));
      Chemical.Components.Substance Mg_P(substanceData = Chemical.Examples.Substances.Magnesium_aqueous,
          amountOfSubstance_start=(5*0.8*0.53e-3)/0.94)                                                                                           annotation(Placement(transformation(extent = {{50, -130}, {70, -110}})));
      Chemical.Components.Substance Alb_P(
          substanceData(
          MolarWeight=66.463,
          z=-18.2,
          density=1080), amountOfSubstance_start=(5*0.65*0.53e-3)/0.94)                                                      annotation(Placement(transformation(extent = {{-4, -34}, {16, -14}})));
      //(amountOfSubstance_start=0.65*0.53e-3)
      Chemical.Components.Substance HCO3_I(substanceData = Chemical.Examples.Substances.Bicarbonate_aqueous,
          amountOfSubstance_start=5*29.4*2e-3)                                                                                                     annotation(Placement(transformation(extent = {{226, 76}, {246, 96}})));
      Chemical.Components.Substance H_I(substanceData = Chemical.Examples.Substances.Proton_aqueous,
          amountOfSubstance_start=(5*2)*10^(-7.39))                                                                                              annotation(Placement(transformation(extent = {{226, 32}, {246, 52}})));
      Chemical.Components.Reaction reaction6(nS = 2, s = {1, 1}, nP = 2, p = {1, 1}) annotation(Placement(transformation(extent = {{190, 70}, {210, 90}})));
      Chemical.Components.Reaction reaction7(nS = 1, s = {1}, nP = 2, p = {1, 1}) annotation(Placement(transformation(extent = {{258, 56}, {278, 76}})));
      Chemical.Components.Substance CO3_I(substanceData = Chemical.Examples.Substances.Carbonate_aqueous,
          amountOfSubstance_start=5*0.048*2e-3)                                                                                                   annotation(Placement(transformation(extent = {{288, 94}, {308, 114}})));
      Chemical.Components.Substance H2PO4_I(substanceData = Chemical.Examples.Substances.DihydrogenPhosphate_aqueous,
          amountOfSubstance_start=5*0.6*2e-3)                                                                                                     annotation(Placement(transformation(extent = {{164, -12}, {144, 8}})));
      Chemical.Components.Substance HPO4_I(substanceData = Chemical.Examples.Substances.HydrogenPhosphate_aqueous,
          amountOfSubstance_start=5*0.6*2e-3)                                                                                                     annotation(Placement(transformation(extent = {{226, 10}, {246, 30}})));
      Chemical.Components.Reaction reaction8(nS = 1, s = {1}, nP = 2, p = {1, 1}) annotation(Placement(transformation(extent = {{190, -4}, {210, 16}})));
      Chemical.Components.Substance Na_I(substanceData = Chemical.Examples.Substances.Sodium_aqueous,
          amountOfSubstance_start=5*142*2e-3)                                                                                               annotation(Placement(transformation(extent = {{164, -44}, {144, -24}})));
      Chemical.Components.Substance K_I(substanceData = Chemical.Examples.Substances.Potassium_aqueous,
          amountOfSubstance_start=5*4.14*2e-3)                                                                                                 annotation(Placement(transformation(extent = {{164, -72}, {144, -52}})));
      Chemical.Components.Substance Cl_I(substanceData = Chemical.Examples.Substances.Chloride_aqueous,
          amountOfSubstance_start=5*118*2e-3)                                                                                                 annotation(Placement(transformation(extent = {{204, -154}, {224, -134}})));
      Chemical.Components.Substance Ca_I(substanceData = Chemical.Examples.Substances.Calcium_aqueous,
          amountOfSubstance_start=5*2.2*2e-3)                                                                                                annotation(Placement(transformation(extent={{164,
                -100},{144,-80}})));
      Chemical.Components.Substance Mg_I(substanceData = Chemical.Examples.Substances.Magnesium_aqueous,
          amountOfSubstance_start=5*0.75*2e-3)                                                                                                  annotation(Placement(transformation(extent = {{164, -128}, {144, -108}})));
      Chemical.Components.Substance Alb_I(
          substanceData(
          MolarWeight=66.463,
          z=-18.2,
          density=1080), amountOfSubstance_start=5*0.19*2e-3)                                                                annotation(Placement(transformation(extent = {{216, -36}, {236, -16}})));
      //(amountOfSubstance_start=0.19*2e-3)
      Chemical.Components.Membrane membrane2 annotation(Placement(transformation(extent = {{-118, 30}, {-98, 50}})));
      Chemical.Components.Membrane membrane3 annotation(Placement(transformation(extent = {{106, 10}, {126, 30}})));
      Chemical.Components.Membrane membrane4 annotation(Placement(transformation(extent = {{106, -12}, {126, 8}})));
      Chemical.Components.Membrane membrane5 annotation(Placement(transformation(extent = {{106, 32}, {126, 52}})));
      Chemical.Components.Membrane membrane6 annotation(Placement(transformation(extent = {{-120, -156}, {-100, -136}})));
      Chemical.Components.Membrane membrane7 annotation(Placement(transformation(extent = {{106, -72}, {126, -52}})));
      Chemical.Components.Membrane membrane8 annotation(Placement(transformation(extent = {{106, -100}, {126, -80}})));
      Chemical.Components.Membrane membrane9 annotation(Placement(transformation(extent = {{106, -44}, {126, -24}})));
      Chemical.Components.Membrane membrane10 annotation(Placement(transformation(extent = {{106, -128}, {126, -108}})));
      Chemical.Components.Membrane membrane11 annotation(Placement(transformation(extent = {{106, -154}, {126, -134}})));
    Chemical.Components.Solution erythrocyte annotation(Placement(visible = true, transformation(extent = {{-324, -176}, {-124, 164}}, rotation = 0)));
      Chemical.Components.Solution plasma annotation(Placement(transformation(extent = {{-94, -176}, {106, 164}})));
      Chemical.Components.Solution intersticium annotation(Placement(transformation(extent = {{132, -176}, {332, 164}})));
      Chemical.Components.Membrane membrane14 annotation(Placement(transformation(extent = {{-118, 50}, {-98, 70}})));
      Chemical.Components.Membrane membrane15 annotation(Placement(transformation(extent = {{106, 50}, {126, 70}})));
      Chemical.Components.Substance im_E(
          substanceData(z=-0.92), amountOfSubstance_start=(5*94.6*0.32e-3)/0.73)
        annotation (Placement(transformation(extent={{-278,-112},{-258,-92}})));
      Chemical.Components.Substance im_P(substanceData(z=-5.3),
          amountOfSubstance_start=(5*13.7*0.53e-3)/0.94)
        annotation (Placement(transformation(extent={{-52,-114},{-32,-94}})));
      Chemical.Components.Substance im_I(substanceData(z=-0.8),
          amountOfSubstance_start=5*11.96*2e-3)
        annotation (Placement(transformation(extent={{256,-130},{276,-110}})));
    equation
      connect(HCO3_E.solution, erythrocyte.solution) annotation(Line(points={{-224,76},
              {-170,76},{-170,-32},{-198,-32},{-198,-164},{-164,-164},{-164,
              -172.6}},                                                                                                    color = {127, 127, 0}));
      connect(H2PO4_E.solution, erythrocyte.solution) annotation(Line(points={{-236,
              -12},{-198,-12},{-198,-164},{-164,-164},{-164,-172.6}},                                                                                color = {127, 127, 0}));
      connect(Hb.solution, erythrocyte.solution) annotation(Line(points={{-220,
              -52},{-198,-52},{-198,-164},{-164,-164},{-164,-172.6}},                                                                           color = {127, 127, 0}));
      connect(DPG.solution, erythrocyte.solution) annotation(Line(points={{-220,
              -108},{-198,-108},{-198,-164},{-164,-164},{-164,-172.6}},                                                                            color = {127, 127, 0}));
      connect(GSH.solution, erythrocyte.solution) annotation(Line(points={{-220,
              -132},{-198,-132},{-198,-164},{-164,-164},{-164,-172.6}},                                                                            color = {127, 127, 0}));
      connect(ATP.solution, erythrocyte.solution) annotation(Line(points={{-220,
              -158},{-220,-164},{-164,-164},{-164,-172.6}},                                                                          color = {127, 127, 0}));
      connect(Water_E.solution, erythrocyte.solution) annotation(Line(points={{-290,48},
              {-296,48},{-296,-164},{-164,-164},{-164,-172.6}},                                                                                    color = {127, 127, 0}));
      connect(CO3_E.solution, erythrocyte.solution) annotation(Line(points={{-156,94},
              {-170,94},{-170,-32},{-198,-32},{-198,-164},{-164,-164},{-164,
              -172.6}},                                                                                                    color = {127, 127, 0}));
      connect(H_E.solution, erythrocyte.solution) annotation(Line(points={{-156,30},
              {-170,30},{-170,-32},{-198,-32},{-198,-164},{-164,-164},{-164,
              -172.6}},                                                                                                    color = {127, 127, 0}));
      connect(HPO4_E.solution, erythrocyte.solution) annotation(Line(points={{-156,8},
              {-170,8},{-170,-32},{-198,-32},{-198,-164},{-164,-164},{-164,-172.6}},                                                                                      color = {127, 127, 0}));
      connect(K_E.solution, erythrocyte.solution) annotation(Line(points={{-182,
              -82},{-198,-82},{-198,-164},{-164,-164},{-164,-172.6}},                                                                            color = {127, 127, 0}));
      connect(Na_E.solution, erythrocyte.solution) annotation(Line(points={{-182,
              -56},{-198,-56},{-198,-164},{-164,-164},{-164,-172.6}},                                                                             color = {127, 127, 0}));
      connect(Cl_E.solution, erythrocyte.solution) annotation(Line(points={{-154,
              -156},{-164,-156},{-164,-172.6}},                                                                         color = {127, 127, 0}));
      connect(CO2_E.solution, erythrocyte.solution) annotation(Line(points={{-292,
              122},{-296,122},{-296,-164},{-164,-164},{-164,-172.6}},                                                                              color = {127, 127, 0}));
      connect(CO2_P.solution,plasma. solution) annotation(Line(points={{-70,122},
              {-76,122},{-76,-172.6},{66,-172.6}},                                                                             color = {127, 127, 0}));
      connect(Water_P.solution,plasma. solution) annotation(Line(points={{-68,50},
              {-76,50},{-76,-172.6},{66,-172.6}},                                                                              color = {127, 127, 0}));
      connect(H2PO4_P.solution,plasma. solution) annotation(Line(points={{-68,-12},
              {-76,-12},{-76,-172.6},{66,-172.6}},                                                                               color = {127, 127, 0}));
      connect(Cl_P.solution,plasma. solution) annotation(Line(points = {{-14, -156}, {-14, -172.6}, {66, -172.6}}, color = {127, 127, 0}));
      connect(CO3_P.solution,plasma. solution) annotation(Line(points = {{56, 94}, {56, -20}, {40, -20}, {40, -172.6}, {66, -172.6}}, color = {127, 127, 0}));
      connect(HCO3_P.solution,plasma. solution) annotation(Line(points = {{0, 76}, {22, 76}, {56, 76}, {56, -20}, {40, -20}, {40, -172.6}, {66, -172.6}}, color = {127, 127, 0}));
      connect(Na_P.solution,plasma. solution) annotation(Line(points = {{54, -44}, {40, -44}, {40, -172.6}, {66, -172.6}}, color = {127, 127, 0}));
      connect(K_P.solution,plasma. solution) annotation(Line(points = {{54, -72}, {40, -72}, {40, -172.6}, {66, -172.6}}, color = {127, 127, 0}));
      connect(Ca_P.solution,plasma. solution) annotation(Line(points = {{54, -100}, {50, -100}, {40, -100}, {40, -172.6}, {66, -172.6}}, color = {127, 127, 0}));
      connect(Mg_P.solution,plasma. solution) annotation(Line(points = {{54, -130}, {50, -130}, {40, -130}, {40, -172.6}, {66, -172.6}}, color = {127, 127, 0}));
      connect(Alb_P.solution,plasma. solution) annotation(Line(points = {{0, -34}, {0, -34}, {40, -34}, {40, -172.6}, {66, -172.6}}, color = {127, 127, 0}));
      connect(CO2_I.solution, intersticium.solution) annotation(Line(points = {{160, 122}, {160, 118}, {180, 118}, {180, -172.6}, {292, -172.6}}, color = {127, 127, 0}));
      connect(CO3_I.solution, intersticium.solution) annotation(Line(points = {{292, 94}, {292, 94}, {292, -172.6}}, color = {127, 127, 0}));
      connect(HCO3_I.solution, intersticium.solution) annotation(Line(points = {{230, 76}, {292, 76}, {292, -172.6}}, color = {127, 127, 0}));
      connect(H_I.solution, intersticium.solution) annotation(Line(points = {{230, 32}, {180, 32}, {180, -172.6}, {292, -172.6}}, color = {127, 127, 0}));
      connect(HPO4_I.solution, intersticium.solution) annotation(Line(points = {{230, 10}, {228, 10}, {228, -12}, {180, -12}, {180, -172.6}, {292, -172.6}}, color = {127, 127, 0}));
      connect(Alb_I.solution, intersticium.solution) annotation(Line(points = {{220, -36}, {180, -36}, {180, -172.6}, {292, -172.6}}, color = {127, 127, 0}));
      connect(H2PO4_I.solution, intersticium.solution) annotation(Line(points = {{160, -12}, {180, -12}, {180, -172.6}, {292, -172.6}}, color = {127, 127, 0}));
      connect(Na_I.solution, intersticium.solution) annotation(Line(points = {{160, -44}, {180, -44}, {180, -172.6}, {292, -172.6}}, color = {127, 127, 0}));
      connect(K_I.solution, intersticium.solution) annotation(Line(points = {{160, -72}, {160, -70}, {180, -70}, {180, -172.6}, {292, -172.6}}, color = {127, 127, 0}));
      connect(Ca_I.solution, intersticium.solution) annotation(Line(points={{160,
              -100},{160,-100},{180,-100},{180,-172.6},{292,-172.6}},                                                                               color = {127, 127, 0}));
      connect(Mg_I.solution, intersticium.solution) annotation(Line(points = {{160, -128}, {160, -128}, {180, -128}, {180, -172.6}, {292, -172.6}}, color = {127, 127, 0}));
      connect(Water_I.solution, intersticium.solution) annotation(Line(points = {{160, 52}, {160, 50}, {180, 50}, {180, -172.6}, {292, -172.6}}, color = {127, 127, 0}));
      connect(HPO4_P.solution,plasma. solution) annotation(Line(points = {{-2, 8}, {22, 8}, {56, 8}, {56, -20}, {40, -20}, {40, -172.6}, {66, -172.6}}, color = {127, 127, 0}));
      connect(H_P.solution,plasma. solution) annotation(Line(points = {{-2, 32}, {20, 32}, {56, 32}, {56, -20}, {40, -20}, {40, -172.6}, {66, -172.6}}, color = {127, 127, 0}));
      connect(Water_E.port_a, membrane14.port_a) annotation(Line(points = {{-274, 58}, {-204, 58}, {-118, 58}, {-118, 60}}, color = {158, 66, 200}));
      connect(membrane14.port_b, Water_P.port_a) annotation(Line(points = {{-98, 60}, {-76, 60}, {-52, 60}}, color = {158, 66, 200}));
      connect(H_E.port_a, membrane2.port_a) annotation(Line(points = {{-140, 40}, {-132, 40}, {-118, 40}}, color = {158, 66, 200}));
      connect(membrane2.port_b, H_P.port_a) annotation(Line(points = {{-98, 40}, {-98, 42}, {14, 42}}, color = {158, 66, 200}));
      connect(Cl_E.port_a, membrane6.port_a) annotation(Line(points = {{-138, -146}, {-130, -146}, {-120, -146}}, color = {158, 66, 200}));
      connect(membrane6.port_b, Cl_P.port_a) annotation(Line(points = {{-100, -146}, {-76, -146}, {2, -146}}, color = {158, 66, 200}));
      connect(Cl_P.port_a, membrane11.port_a) annotation(Line(points = {{2, -146}, {106, -146}, {106, -144}}, color = {158, 66, 200}));
      connect(membrane11.port_b, Cl_I.port_a) annotation(Line(points = {{126, -144}, {158, -144}, {224, -144}}, color = {158, 66, 200}));
      connect(H_P.port_a, membrane5.port_a) annotation(Line(points = {{14, 42}, {14, 42}, {106, 42}}, color = {158, 66, 200}));
      connect(membrane5.port_b, H_I.port_a) annotation(Line(points = {{126, 42}, {246, 42}}, color = {158, 66, 200}));
      connect(HPO4_P.port_a, membrane3.port_a) annotation(Line(points = {{14, 18}, {46, 18}, {106, 18}, {106, 20}}, color = {158, 66, 200}));
      connect(H2PO4_P.port_a, membrane4.port_a) annotation(Line(points = {{-52, -2}, {8, -2}, {106, -2}}, color = {158, 66, 200}));
      connect(membrane4.port_b, H2PO4_I.port_a) annotation(Line(points = {{126, -2}, {144, -2}}, color = {158, 66, 200}));
      connect(membrane3.port_b, HPO4_I.port_a) annotation(Line(points = {{126, 20}, {246, 20}}, color = {158, 66, 200}));
      connect(Na_P.port_a, membrane9.port_a) annotation(Line(points = {{70, -34}, {88, -34}, {106, -34}}, color = {158, 66, 200}));
      connect(membrane9.port_b, Na_I.port_a) annotation(Line(points = {{126, -34}, {144, -34}}, color = {158, 66, 200}));
      connect(K_P.port_a, membrane7.port_a) annotation(Line(points = {{70, -62}, {106, -62}}, color = {158, 66, 200}));
      connect(membrane7.port_b, K_I.port_a) annotation(Line(points = {{126, -62}, {132, -62}, {144, -62}}, color = {158, 66, 200}));
      connect(Ca_P.port_a, membrane8.port_a) annotation(Line(points = {{70, -90}, {88, -90}, {106, -90}}, color = {158, 66, 200}));
      connect(membrane8.port_b, Ca_I.port_a) annotation(Line(points={{126,-90},{
              136,-90},{144,-90}},                                                              color = {158, 66, 200}));
      connect(membrane10.port_b, Mg_I.port_a) annotation(Line(points = {{126, -118}, {144, -118}}, color = {158, 66, 200}));
      connect(membrane10.port_a, Mg_P.port_a) annotation(Line(points = {{106, -118}, {70, -118}, {70, -120}}, color = {158, 66, 200}));
      connect(CO2_E.port_a, reaction.substrates[1]) annotation(Line(points = {{-276, 132}, {-266, 132}, {-266, 70}}, color = {158, 66, 200}));
      connect(Water_E.port_a, reaction.substrates[2]) annotation(Line(points = {{-274, 58}, {-272, 58}, {-266, 58}, {-266, 74}}, color = {158, 66, 200}));
      connect(HCO3_E.port_a, reaction1.substrates[1]) annotation(Line(points = {{-208, 86}, {-208, 40}, {-204, 40}}, color = {158, 66, 200}));
      connect(reaction1.products[1], H_E.port_a) annotation(Line(points = {{-184, 38}, {-184, 40}, {-140, 40}}, color = {158, 66, 200}));
      connect(H2PO4_E.port_a, reaction2.substrates[1]) annotation(Line(points = {{-220, -2}, {-220, -2}, {-204, -2}, {-204, 12}}, color = {158, 66, 200}));
      connect(reaction2.products[1], HPO4_E.port_a) annotation(Line(points = {{-184, 10}, {-140, 10}, {-140, 18}}, color = {158, 66, 200}));
      connect(reaction2.products[2], H_E.port_a) annotation(Line(points = {{-184, 14}, {-178, 14}, {-178, 40}, {-140, 40}}, color = {158, 66, 200}));
      connect(Water_P.port_a, reaction4.substrates[1]) annotation(Line(points = {{-52, 60}, {-48, 60}, {-38, 60}, {-38, 74}}, color = {158, 66, 200}));
      connect(reaction4.substrates[2], CO2_P.port_a) annotation(Line(points = {{-38, 78}, {-38, 132}, {-54, 132}}, color = {158, 66, 200}));
      connect(reaction4.products[1], H_P.port_a) annotation(Line(points = {{-18, 74}, {-20, 74}, {-20, 48}, {-20, 42}, {14, 42}}, color = {158, 66, 200}));
      connect(reaction4.products[2], HCO3_P.port_a) annotation(Line(points = {{-18, 78}, {-18, 86}, {16, 86}}, color = {158, 66, 200}));
      connect(HCO3_P.port_a, reaction3.substrates[1]) annotation(Line(points = {{16, 86}, {30, 86}, {30, 84}, {30, 66}}, color = {158, 66, 200}));
      connect(reaction3.products[1], H_P.port_a) annotation(Line(points = {{50, 64}, {80, 64}, {80, 42}, {14, 42}}, color = {158, 66, 200}));
      connect(reaction3.products[2], CO3_P.port_a) annotation(Line(points = {{50, 68}, {62, 68}, {80, 68}, {80, 104}, {72, 104}}, color = {158, 66, 200}));
      connect(H2PO4_P.port_a, reaction5.substrates[1]) annotation(Line(points = {{-52, -2}, {-40, -2}, {-40, 10}}, color = {158, 66, 200}));
      connect(reaction5.products[1], HPO4_P.port_a) annotation(Line(points = {{-20, 8}, {-20, 8}, {14, 8}, {14, 18}}, color = {158, 66, 200}));
      connect(reaction5.products[2], H_P.port_a) annotation(Line(points = {{-20, 12}, {-20, 42}, {14, 42}}, color = {158, 66, 200}));
      connect(CO2_I.port_a, reaction6.substrates[1]) annotation(Line(points = {{144, 132}, {190, 132}, {190, 78}}, color = {158, 66, 200}));
      connect(membrane15.port_b, Water_I.port_a) annotation(Line(points = {{126, 60}, {144, 60}, {144, 62}}, color = {158, 66, 200}));
      connect(membrane15.port_a, Water_P.port_a) annotation(Line(points = {{106, 60}, {38, 60}, {-52, 60}}, color = {158, 66, 200}));
      connect(Water_I.port_a, reaction6.substrates[2]) annotation(Line(points = {{144, 62}, {154, 62}, {190, 62}, {190, 82}}, color = {158, 66, 200}));
      connect(reaction6.products[1], H_I.port_a) annotation(Line(points = {{210, 78}, {220, 78}, {220, 42}, {246, 42}}, color = {158, 66, 200}));
      connect(reaction6.products[2], HCO3_I.port_a) annotation(Line(points = {{210, 82}, {220, 82}, {220, 86}, {246, 86}}, color = {158, 66, 200}));
      connect(HCO3_I.port_a, reaction7.substrates[1]) annotation(Line(points = {{246, 86}, {258, 86}, {258, 66}}, color = {158, 66, 200}));
      connect(reaction7.products[1], H_I.port_a) annotation(Line(points = {{278, 64}, {278, 64}, {278, 42}, {246, 42}}, color = {158, 66, 200}));
      connect(reaction7.products[2], CO3_I.port_a) annotation(Line(points = {{278, 68}, {278, 68}, {278, 84}, {278, 104}, {308, 104}}, color = {158, 66, 200}));
      connect(H2PO4_I.port_a, reaction8.substrates[1]) annotation(Line(points = {{144, -2}, {162, -2}, {190, -2}, {190, 6}}, color = {158, 66, 200}));
      connect(reaction8.products[1], H_I.port_a) annotation(Line(points = {{210, 4}, {220, 4}, {220, 14}, {220, 42}, {246, 42}}, color = {158, 66, 200}));
      connect(reaction8.products[2], HPO4_I.port_a) annotation(Line(points = {{210, 8}, {210, 20}, {246, 20}}, color = {158, 66, 200}));
      connect(Cl_I.solution, intersticium.solution) annotation(Line(points = {{208, -154}, {208, -172.6}, {292, -172.6}}, color = {127, 127, 0}));
      connect(reaction.products[1], H_E.port_a) annotation(Line(points = {{-246, 70}, {-238, 70}, {-178, 70}, {-178, 40}, {-140, 40}}, color = {158, 66, 200}));
      connect(reaction.products[2], HCO3_E.port_a) annotation(Line(points = {{-246, 74}, {-246, 86}, {-208, 86}}, color = {158, 66, 200}));
      connect(reaction1.products[2], CO3_E.port_a) annotation(Line(points = {{-184, 42}, {-184, 42}, {-184, 64}, {-184, 104}, {-140, 104}}, color = {158, 66, 200}));
      connect(im_E.solution, erythrocyte.solution) annotation (Line(points={{-274,
              -112},{-274,-164},{-164,-164},{-164,-172.6}}, color={127,127,0}));
      connect(im_P.solution, plasma.solution) annotation (Line(points={{-48,-114},
              {-48,-172},{66,-172.6}}, color={127,127,0}));
      connect(im_I.solution, intersticium.solution) annotation (Line(points={{260,
              -130},{262,-130},{262,-172.6},{292,-172.6}}, color={127,127,0}));
      annotation(Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-400,
                -300},{400,300}})),                                                                           Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-400, -300}, {400, 300}})));
    end Exp_bicarbImmobile;
    annotation ();
  end IPE_ComponentBased;

  package CIPE

    model CIPE
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
      parameter Real a = 7.7;
      Real XNa=0;
      Real XCl=0;
    equation
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
      C_NaP + C_KP + 2 * C_CaMgP - C_ClP - HCO3P - 2 * CO3P + ZPiP * C_PiP + ZAlbP * C_AlbP + ZimP * (Vpw0 / Vpw) - C_LacP = 0;
      C_NaI + C_KI + 2 * C_CaMgI - C_ClI - HCO3I - 2 * CO3I + ZPiI * C_PiI + ZAlbI * C_AlbI + ZimI * (Viw0 / Viw) - C_LacI = 0;
      C_NaE + C_KE - C_ClE - HCO3E - 2 * CO3E + ZHb * C_Hb + ZDPG * C_DPG + ZATP * C_ATP + ZGSH * C_GSH + ZimE * C_imE + ZPiE * C_PiE - C_LacE = 0;
      C_NaC + C_KC - C_ClC - HCO3C - 2 * CO3C + ZimC * C_imC = 0;
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
    annotation ();
  end CIPE;
  annotation (uses(Chemical(version="1.1.0"), Modelica(version="3.2.1")));
end Models;
