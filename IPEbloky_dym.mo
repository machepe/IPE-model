within ;
package IPEbloky
  model bloky01
    Chemical.Components.Solution solution
      annotation (Placement(transformation(extent={{-168,44},{224,162}})));
    Chemical.Components.Substance Water_E(substanceData=Chemical.Examples.Substances.Water_liquid,
        amountOfSubstance_start=55.13*0.44*1*0.73)
      annotation (Placement(transformation(extent={{-124,64},{-104,84}})));
    Chemical.Components.Substance Water_P(substanceData=Chemical.Examples.Substances.Water_liquid,
        amountOfSubstance_start=55.13*0.56*1*0.94)
      annotation (Placement(transformation(extent={{-134,-46},{-114,-26}})));
    Chemical.Components.Substance Water_I(substanceData=Chemical.Examples.Substances.Water_liquid,
        amountOfSubstance_start=55.13*2)
      annotation (Placement(transformation(extent={{-122,-150},{-102,-130}})));
    Chemical.Components.Membrane membrane annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-108,18})));
    Chemical.Components.Membrane membrane1 annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-108,-82})));
    Chemical.Components.Substance CO2_E(substanceData=Chemical.Examples.Substances.CarbonDioxide_aqueous)
      annotation (Placement(transformation(extent={{-148,122},{-128,142}})));
    Chemical.Sources.ExternalIdealGasSubstance externalIdealGasSubstance1(
        PartialPressure=613200000)
      annotation (Placement(transformation(extent={{-218,-16},{-198,4}})));
    Chemical.Components.GasSolubility gasSolubility1 annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-178,-6})));
    Chemical.Components.Substance CO2_P(substanceData=Chemical.Examples.Substances.CarbonDioxide_aqueous)
      annotation (Placement(transformation(extent={{-152,-22},{-132,-2}})));
    Chemical.Components.Diffusion diffusion annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-142,18})));
    Chemical.Components.Diffusion diffusion1 annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-146,-86})));
    Chemical.Components.Substance CO2_I(substanceData=Chemical.Examples.Substances.CarbonDioxide_aqueous)
      annotation (Placement(transformation(extent={{-154,-134},{-134,-114}})));
    Chemical.Components.Substance HCO3_E(substanceData=Chemical.Examples.Substances.Bicarbonate_aqueous)
      annotation (Placement(transformation(extent={{-60,128},{-40,148}})));
    Chemical.Components.Substance H_E(substanceData=Chemical.Examples.Substances.Proton_aqueous)
      annotation (Placement(transformation(extent={{-60,70},{-40,90}})));
    Chemical.Components.Reaction reaction
      annotation (Placement(transformation(extent={{-102,106},{-82,126}})));
    Chemical.Components.Reaction reaction1
      annotation (Placement(transformation(extent={{-18,124},{2,144}})));
    Chemical.Components.Substance CO3(substanceData=Chemical.Examples.Substances.Carbonate_aqueous)
      annotation (Placement(transformation(extent={{20,128},{40,148}})));
    Chemical.Components.Substance substance
      annotation (Placement(transformation(extent={{0,0},{0,0}})));
    Chemical.Components.Substance substance1
      annotation (Placement(transformation(extent={{0,0},{0,0}})));
    annotation (Diagram(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-300,-300},{300,300}},
          grid={300,300})), Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-300,-300},{300,300}},
          grid={300,300})));
  end bloky01;

  model bloky02
    Chemical.Components.Substance Water_E(substanceData=Chemical.Examples.Substances.Water_liquid,
        amountOfSubstance_start=55.13*0.44*1*0.73)
      annotation (Placement(transformation(extent={{-296,34},{-276,54}})));
    Chemical.Components.Substance Water_P(substanceData=Chemical.Examples.Substances.Water_liquid,
        amountOfSubstance_start=55.13*0.56*1*0.94)
      annotation (Placement(transformation(extent={{-72,54},{-52,74}})));
    Chemical.Components.Substance Water_I(substanceData=Chemical.Examples.Substances.Water_liquid,
        amountOfSubstance_start=55.13*2)
      annotation (Placement(transformation(extent={{144,52},{164,72}})));
    Chemical.Components.Substance CO2_E(substanceData=Chemical.Examples.Substances.CarbonDioxide_aqueous,
        redeclare package stateOfMatter = Chemical.Interfaces.Incompressible)
      annotation (Placement(transformation(extent={{-296,122},{-276,142}})));
    Chemical.Sources.ExternalIdealGasSubstance externalIdealGasSubstance1(
        PartialPressure=613200000)
      annotation (Placement(transformation(extent={{-70,182},{-50,202}})));
    Chemical.Components.GasSolubility gasSolubility1 annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-58,158})));
    Chemical.Components.Substance CO2_P(substanceData=Chemical.Examples.Substances.CarbonDioxide_aqueous)
      annotation (Placement(transformation(extent={{-74,122},{-54,142}})));
    Chemical.Components.Substance CO2_I(substanceData=Chemical.Examples.Substances.CarbonDioxide_aqueous)
      annotation (Placement(transformation(extent={{144,122},{164,142}})));
    Chemical.Components.Substance HCO3_E(substanceData=Chemical.Examples.Substances.Bicarbonate_aqueous)
      annotation (Placement(transformation(extent={{-228,82},{-208,102}})));
    Chemical.Components.Substance H_E(substanceData=Chemical.Examples.Substances.Proton_aqueous)
      annotation (Placement(transformation(extent={{-160,30},{-140,50}})));
    Chemical.Components.Reaction reaction
      annotation (Placement(transformation(extent={{-266,58},{-246,78}})));
    Chemical.Components.Reaction reaction1
      annotation (Placement(transformation(extent={{-198,52},{-178,72}})));
    Chemical.Components.Substance CO3_E(substanceData=Chemical.Examples.Substances.Carbonate_aqueous)
      annotation (Placement(transformation(extent={{-160,94},{-140,114}})));
    Chemical.Components.Substance H2PO4_E(substanceData=Chemical.Examples.Substances.DihydrogenPhosphate_aqueous)
      annotation (Placement(transformation(extent={{-238,-12},{-218,8}})));
    Chemical.Components.Substance HPO4_E(substanceData=Chemical.Examples.Substances.HydrogenPhosphate_aqueous)
      annotation (Placement(transformation(extent={{-160,8},{-140,28}})));
    Chemical.Components.Reaction reaction2
      annotation (Placement(transformation(extent={{-198,2},{-178,22}})));
    Chemical.Components.Substance Na_E(substanceData=Chemical.Examples.Substances.Sodium_aqueous)
      annotation (Placement(transformation(extent={{-186,-54},{-166,-34}})));
    Chemical.Components.Substance K_E(substanceData=Chemical.Examples.Substances.Potassium_aqueous)
      annotation (Placement(transformation(extent={{-186,-80},{-166,-60}})));
    Chemical.Components.Substance Cl_E(substanceData=Chemical.Examples.Substances.Chloride_aqueous)
      annotation (Placement(transformation(extent={{-158,-154},{-138,-134}})));
    Chemical.Components.Substance other_E
      annotation (Placement(transformation(extent={{-224,-80},{-204,-60}})));
    Chemical.Components.Substance DPG
      annotation (Placement(transformation(extent={{-224,-106},{-204,-86}})));
    Chemical.Components.Substance GSH
      annotation (Placement(transformation(extent={{-224,-132},{-204,-112}})));
    Chemical.Components.Substance ATP
      annotation (Placement(transformation(extent={{-224,-158},{-204,-138}})));
    Chemical.Components.Substance Hb
      annotation (Placement(transformation(extent={{-224,-54},{-204,-34}})));
    Chemical.Components.Substance HCO3_P(substanceData=Chemical.Examples.Substances.Bicarbonate_aqueous)
      annotation (Placement(transformation(extent={{-4,82},{16,102}})));
    Chemical.Components.Substance H_P(substanceData=Chemical.Examples.Substances.Proton_aqueous)
      annotation (Placement(transformation(extent={{-6,32},{14,52}})));
    Chemical.Components.Reaction reaction3
      annotation (Placement(transformation(extent={{26,54},{46,74}})));
    Chemical.Components.Reaction reaction4
      annotation (Placement(transformation(extent={{-42,76},{-22,96}})));
    Chemical.Components.Substance CO3_P(substanceData=Chemical.Examples.Substances.Carbonate_aqueous)
      annotation (Placement(transformation(extent={{52,94},{72,114}})));
    Chemical.Components.Substance H2PO4_P(substanceData=Chemical.Examples.Substances.DihydrogenPhosphate_aqueous)
      annotation (Placement(transformation(extent={{-72,-12},{-52,8}})));
    Chemical.Components.Substance HPO4_P(substanceData=Chemical.Examples.Substances.HydrogenPhosphate_aqueous)
      annotation (Placement(transformation(extent={{-6,6},{14,26}})));
    Chemical.Components.Reaction reaction5
      annotation (Placement(transformation(extent={{-38,0},{-18,20}})));
    Chemical.Components.Substance Na_P(substanceData=Chemical.Examples.Substances.Sodium_aqueous)
      annotation (Placement(transformation(extent={{50,-44},{70,-24}})));
    Chemical.Components.Substance K_P(substanceData=Chemical.Examples.Substances.Potassium_aqueous)
      annotation (Placement(transformation(extent={{50,-72},{70,-52}})));
    Chemical.Components.Substance Cl_P(substanceData=Chemical.Examples.Substances.Chloride_aqueous)
      annotation (Placement(transformation(extent={{-18,-156},{2,-136}})));
    Chemical.Components.Substance Ca_P(substanceData=Chemical.Examples.Substances.Calcium_aqueous)
      annotation (Placement(transformation(extent={{50,-98},{70,-78}})));
    Chemical.Components.Substance Mg_P(substanceData=Chemical.Examples.Substances.Magnesium_aqueous)
      annotation (Placement(transformation(extent={{50,-124},{70,-104}})));
    Chemical.Components.Substance other_P
      annotation (Placement(transformation(extent={{-6,-64},{14,-44}})));
    Chemical.Components.Substance Alb_P
      annotation (Placement(transformation(extent={{-6,-36},{14,-16}})));
    Chemical.Components.Substance HCO3_I(substanceData=Chemical.Examples.Substances.Bicarbonate_aqueous)
      annotation (Placement(transformation(extent={{216,82},{236,102}})));
    Chemical.Components.Substance H_I(substanceData=Chemical.Examples.Substances.Proton_aqueous)
      annotation (Placement(transformation(extent={{216,32},{236,52}})));
    Chemical.Components.Reaction reaction6
      annotation (Placement(transformation(extent={{180,70},{200,90}})));
    Chemical.Components.Reaction reaction7
      annotation (Placement(transformation(extent={{250,66},{270,86}})));
    Chemical.Components.Substance CO3_I(substanceData=Chemical.Examples.Substances.Carbonate_aqueous)
      annotation (Placement(transformation(extent={{282,94},{302,114}})));
    Chemical.Components.Substance H2PO4_I(substanceData=Chemical.Examples.Substances.DihydrogenPhosphate_aqueous)
      annotation (Placement(transformation(extent={{144,-12},{164,8}})));
    Chemical.Components.Substance HPO4_I(substanceData=Chemical.Examples.Substances.HydrogenPhosphate_aqueous)
      annotation (Placement(transformation(extent={{216,4},{236,24}})));
    Chemical.Components.Reaction reaction8
      annotation (Placement(transformation(extent={{180,-4},{200,16}})));
    Chemical.Components.Substance Na_I(substanceData=Chemical.Examples.Substances.Sodium_aqueous)
      annotation (Placement(transformation(extent={{144,-44},{164,-24}})));
    Chemical.Components.Substance K_I(substanceData=Chemical.Examples.Substances.Potassium_aqueous)
      annotation (Placement(transformation(extent={{144,-72},{164,-52}})));
    Chemical.Components.Substance Cl_I(substanceData=Chemical.Examples.Substances.Chloride_aqueous)
      annotation (Placement(transformation(extent={{204,-160},{224,-140}})));
    Chemical.Components.Substance Ca_I(substanceData=Chemical.Examples.Substances.Calcium_aqueous)
      annotation (Placement(transformation(extent={{144,-98},{164,-78}})));
    Chemical.Components.Substance Mg_I(substanceData=Chemical.Examples.Substances.Magnesium_aqueous)
      annotation (Placement(transformation(extent={{144,-124},{164,-104}})));
    Chemical.Components.Substance other_I
      annotation (Placement(transformation(extent={{206,-64},{226,-44}})));
    Chemical.Components.Substance Alb_I
      annotation (Placement(transformation(extent={{206,-36},{226,-16}})));
    Chemical.Components.Diffusion diffusion annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-110,132})));
    Chemical.Components.Diffusion diffusion1
      annotation (Placement(transformation(extent={{104,118},{124,138}})));
    Chemical.Components.Membrane membrane
      annotation (Placement(transformation(extent={{-118,96},{-98,116}})));
    Chemical.Components.Membrane membrane1
      annotation (Placement(transformation(extent={{-118,76},{-98,96}})));
    Chemical.Components.Membrane membrane2
      annotation (Placement(transformation(extent={{-120,30},{-100,50}})));
    Chemical.Components.Membrane membrane3
      annotation (Placement(transformation(extent={{106,10},{126,30}})));
    Chemical.Components.Membrane membrane4
      annotation (Placement(transformation(extent={{106,-10},{126,10}})));
    Chemical.Components.Membrane membrane5
      annotation (Placement(transformation(extent={{106,30},{126,50}})));
    Chemical.Components.Membrane membrane6
      annotation (Placement(transformation(extent={{-120,-154},{-100,-134}})));
    Chemical.Components.Membrane membrane7
      annotation (Placement(transformation(extent={{106,-72},{126,-52}})));
    Chemical.Components.Membrane membrane8
      annotation (Placement(transformation(extent={{106,-100},{126,-80}})));
    Chemical.Components.Membrane membrane9
      annotation (Placement(transformation(extent={{106,-42},{126,-22}})));
    Chemical.Components.Membrane membrane10
      annotation (Placement(transformation(extent={{106,-128},{126,-108}})));
    Chemical.Components.Membrane membrane11
      annotation (Placement(transformation(extent={{106,-160},{126,-140}})));
    Chemical.Components.Membrane membrane12
      annotation (Placement(transformation(extent={{106,96},{126,116}})));
    Chemical.Components.Membrane membrane13
      annotation (Placement(transformation(extent={{106,76},{126,96}})));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
              -100,-100},{100,100}})));
  end bloky02;

  model bloky03_kade
    Chemical.Components.Substance Water_E(substanceData = Chemical.Examples.Substances.Water_liquid, amountOfSubstance_start = 55.13 * 0.44 * 1 * 0.73) annotation(Placement(transformation(extent = {{-294, 48}, {-274, 68}})));
    Chemical.Components.Substance Water_P(substanceData = Chemical.Examples.Substances.Water_liquid, amountOfSubstance_start = 55.13 * 0.56 * 1 * 0.94) annotation(Placement(transformation(extent = {{-72, 50}, {-52, 70}})));
    Chemical.Components.Substance Water_I(substanceData = Chemical.Examples.Substances.Water_liquid, amountOfSubstance_start = 55.13 * 2) annotation(Placement(transformation(extent = {{164, 52}, {144, 72}})));
    Chemical.Components.Substance CO2_E(substanceData = Chemical.Examples.Substances.CarbonDioxide_aqueous, redeclare
        package stateOfMatter =
          Chemical.Interfaces.Incompressible,                                                                                                    amountOfSubstance_start = 1.2 * 0.32e-3) annotation(Placement(transformation(extent = {{-296, 122}, {-276, 142}})));
    Chemical.Sources.ExternalIdealGasSubstance externalIdealGasSubstance1(PartialPressure = 6132, TotalPressure = 101325, Temperature = 310.15) annotation(Placement(transformation(extent = {{-98, 178}, {-78, 198}})));
    Chemical.Components.GasSolubility gasSolubility1 annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {-58, 188})));
    Chemical.Components.Substance CO2_P(substanceData = Chemical.Examples.Substances.CarbonDioxide_aqueous, amountOfSubstance_start = 1.407 * 0.53e-3) annotation(Placement(transformation(extent = {{-74, 122}, {-54, 142}})));
    Chemical.Components.Substance CO2_I(substanceData = Chemical.Examples.Substances.CarbonDioxide_aqueous, amountOfSubstance_start = 1.5 * 2e-3) annotation(Placement(transformation(extent = {{164, 122}, {144, 142}})));
    Chemical.Components.Substance HCO3_E(substanceData = Chemical.Examples.Substances.Bicarbonate_aqueous, amountOfSubstance_start = 15.1 * 0.32e-3) annotation(Placement(transformation(extent = {{-228, 76}, {-208, 96}})));
    Chemical.Components.Substance H_E(substanceData = Chemical.Examples.Substances.Proton_aqueous, amountOfSubstance_start = 0.32 * 10 ^ (-7.2)) annotation(Placement(transformation(extent = {{-160, 30}, {-140, 50}})));
    Chemical.Components.Reaction reaction(nS = 2, nP = 2, s = {1, 1}, p = {1, 1}) annotation(Placement(transformation(extent = {{-266, 62}, {-246, 82}})));
    Chemical.Components.Reaction reaction1(nS = 1, s = {1}, nP = 2, p = {1, 1}) annotation(Placement(transformation(extent = {{-204, 30}, {-184, 50}})));
    Chemical.Components.Substance CO3_E(substanceData = Chemical.Examples.Substances.Carbonate_aqueous, amountOfSubstance_start = 0.015 * 0.32e-3) annotation(Placement(transformation(extent = {{-160, 94}, {-140, 114}})));
    Chemical.Components.Substance H2PO4_E(substanceData = Chemical.Examples.Substances.DihydrogenPhosphate_aqueous, amountOfSubstance_start = 0.33 * 0.32e-3) annotation(Placement(transformation(extent = {{-240, -12}, {-220, 8}})));
    Chemical.Components.Substance HPO4_E(substanceData = Chemical.Examples.Substances.HydrogenPhosphate_aqueous, amountOfSubstance_start = 0.33 * 0.32e-3) annotation(Placement(transformation(extent = {{-160, 8}, {-140, 28}})));
    Chemical.Components.Reaction reaction2(nP = 2, p = {1, 1}, nS = 1, s = {1}) annotation(Placement(transformation(extent = {{-204, 2}, {-184, 22}})));
    Chemical.Components.Substance Na_E(substanceData = Chemical.Examples.Substances.Sodium_aqueous, amountOfSubstance_start = 10 * 0.32e-3) annotation(Placement(transformation(extent = {{-186, -56}, {-166, -36}})));
    Chemical.Components.Substance K_E(substanceData = Chemical.Examples.Substances.Potassium_aqueous, amountOfSubstance_start = 99 * 0.32e-3) annotation(Placement(transformation(extent = {{-186, -82}, {-166, -62}})));
    Chemical.Components.Substance Cl_E(substanceData = Chemical.Examples.Substances.Chloride_aqueous, amountOfSubstance_start = 55.3 * 0.32e-3) annotation(Placement(transformation(extent = {{-158, -156}, {-138, -136}})));
    Chemical.Components.Substance other_E(substanceData(z = 0.012), amountOfSubstance_start = 95.9 * 0.32e-3) annotation(Placement(transformation(extent = {{-224, -82}, {-204, -62}})));
    Chemical.Components.Substance DPG(amountOfSubstance_start = 4.4 * 0.32e-3, substanceData(MolarWeight = 0.266, z = -2.2, density = 1000)) annotation(Placement(transformation(extent = {{-224, -108}, {-204, -88}})));
    //(amountOfSubstance_start=4.4*0.32e-3)
    Chemical.Components.Substance GSH(substanceData(MolarWeight = 0.2, z = -1, density = 1000), amountOfSubstance_start = 2.2 * 0.32e-3) annotation(Placement(transformation(extent = {{-224, -132}, {-204, -112}})));
    //(amountOfSubstance_start=2.2*0.32e-3)
    Chemical.Components.Substance ATP(substanceData(z = -4, DfH_25degC = 16700, DfG_25degC_1bar = 30500, References = {"http://www.wiley.com/college/pratt/0471393878/student/review/thermodynamics/7_relationship.html"}), amountOfSubstance_start = 1.8 * 0.32e-3) annotation(Placement(transformation(extent = {{-224, -158}, {-204, -138}})));
    //(amountOfSubstance_start=1.8*0.32e-3)
    Chemical.Components.Substance Hb(substanceData(MolarWeight = 64, z = -4.4, density = 1500), amountOfSubstance_start = 5.3 * 0.32e-3) annotation(Placement(transformation(extent = {{-224, -52}, {-204, -32}})));
    //(amountOfSubstance_start=5.3*0.32e-3)
    Chemical.Components.Substance HCO3_P(substanceData = Chemical.Examples.Substances.Bicarbonate_aqueous, amountOfSubstance_start = 26 * 0.53e-3) annotation(Placement(transformation(extent = {{-4, 76}, {16, 96}})));
    Chemical.Components.Substance H_P(substanceData = Chemical.Examples.Substances.Proton_aqueous, amountOfSubstance_start = 0.53 * 10 ^ (-7.37)) annotation(Placement(transformation(extent = {{-6, 32}, {14, 52}})));
    Chemical.Components.Reaction reaction3(nS = 1, s = {1}, nP = 2, p = {1, 1}) annotation(Placement(transformation(extent = {{30, 56}, {50, 76}})));
    Chemical.Components.Reaction reaction4(nS = 2, s = {1, 1}, nP = 2, p = {1, 1}) annotation(Placement(transformation(extent = {{-38, 66}, {-18, 86}})));
    Chemical.Components.Substance CO3_P(substanceData = Chemical.Examples.Substances.Carbonate_aqueous, amountOfSubstance_start = 0.04 * 0.53e-3) annotation(Placement(transformation(extent = {{52, 94}, {72, 114}})));
    Chemical.Components.Substance H2PO4_P(substanceData = Chemical.Examples.Substances.DihydrogenPhosphate_aqueous, amountOfSubstance_start = 0.56 * 0.53e-3) annotation(Placement(transformation(extent = {{-72, -12}, {-52, 8}})));
    Chemical.Components.Substance HPO4_P(substanceData = Chemical.Examples.Substances.HydrogenPhosphate_aqueous, amountOfSubstance_start = 0.56 * 0.53e-3) annotation(Placement(transformation(extent = {{-6, 8}, {14, 28}})));
    Chemical.Components.Reaction reaction5(nS = 1, s = {1}, nP = 2, p = {1, 1}) annotation(Placement(transformation(extent = {{-40, 0}, {-20, 20}})));
    Chemical.Components.Substance Na_P(substanceData = Chemical.Examples.Substances.Sodium_aqueous, amountOfSubstance_start = 141 * 0.53e-3) annotation(Placement(transformation(extent = {{50, -44}, {70, -24}})));
    Chemical.Components.Substance K_P(substanceData = Chemical.Examples.Substances.Potassium_aqueous, amountOfSubstance_start = 4.2 * 0.53e-3) annotation(Placement(transformation(extent = {{50, -72}, {70, -52}})));
    Chemical.Components.Substance Cl_P(substanceData = Chemical.Examples.Substances.Chloride_aqueous, amountOfSubstance_start = 104 * 0.53e-3) annotation(Placement(transformation(extent = {{-18, -156}, {2, -136}})));
    Chemical.Components.Substance Ca_P(substanceData = Chemical.Examples.Substances.Calcium_aqueous, amountOfSubstance_start = 2.3 * 0.53e-3) annotation(Placement(transformation(extent = {{50, -100}, {70, -80}})));
    Chemical.Components.Substance Mg_P(substanceData = Chemical.Examples.Substances.Magnesium_aqueous, amountOfSubstance_start = 0.8 * 0.53e-3) annotation(Placement(transformation(extent = {{50, -130}, {70, -110}})));
    Chemical.Components.Substance other_P(substanceData(z = 0.02), amountOfSubstance_start = 21.5 * 0.53e-3) annotation(Placement(transformation(extent = {{-6, -62}, {14, -42}})));
    Chemical.Components.Substance Alb_P(substanceData(MolarWeight = 66.463, z = -0.2, density = 1080), amountOfSubstance_start = 0.65 * 0.53e-3) annotation(Placement(transformation(extent = {{-4, -34}, {16, -14}})));
    //(amountOfSubstance_start=0.65*0.53e-3)
    Chemical.Components.Substance HCO3_I(substanceData = Chemical.Examples.Substances.Bicarbonate_aqueous, amountOfSubstance_start = 29.4 * 2e-3) annotation(Placement(transformation(extent = {{226, 76}, {246, 96}})));
    Chemical.Components.Substance H_I(substanceData = Chemical.Examples.Substances.Proton_aqueous, amountOfSubstance_start = 2 * 10 ^ (-7.39)) annotation(Placement(transformation(extent = {{226, 32}, {246, 52}})));
    Chemical.Components.Reaction reaction6(nS = 2, s = {1, 1}, nP = 2, p = {1, 1}) annotation(Placement(transformation(extent = {{190, 70}, {210, 90}})));
    Chemical.Components.Reaction reaction7(nS = 1, s = {1}, nP = 2, p = {1, 1}) annotation(Placement(transformation(extent = {{258, 56}, {278, 76}})));
    Chemical.Components.Substance CO3_I(substanceData = Chemical.Examples.Substances.Carbonate_aqueous, amountOfSubstance_start = 0.048 * 2e-3) annotation(Placement(transformation(extent = {{288, 94}, {308, 114}})));
    Chemical.Components.Substance H2PO4_I(substanceData = Chemical.Examples.Substances.DihydrogenPhosphate_aqueous, amountOfSubstance_start = 0.6 * 2e-3) annotation(Placement(transformation(extent = {{164, -12}, {144, 8}})));
    Chemical.Components.Substance HPO4_I(substanceData = Chemical.Examples.Substances.HydrogenPhosphate_aqueous, amountOfSubstance_start = 0.6 * 2e-3) annotation(Placement(transformation(extent = {{226, 10}, {246, 30}})));
    Chemical.Components.Reaction reaction8(nS = 1, s = {1}, nP = 2, p = {1, 1}) annotation(Placement(transformation(extent = {{190, -4}, {210, 16}})));
    Chemical.Components.Substance Na_I(substanceData = Chemical.Examples.Substances.Sodium_aqueous, amountOfSubstance_start = 142 * 2e-3) annotation(Placement(transformation(extent = {{164, -44}, {144, -24}})));
    Chemical.Components.Substance K_I(substanceData = Chemical.Examples.Substances.Potassium_aqueous, amountOfSubstance_start = 4.14 * 2e-3) annotation(Placement(transformation(extent = {{164, -72}, {144, -52}})));
    Chemical.Components.Substance Cl_I(substanceData = Chemical.Examples.Substances.Chloride_aqueous, amountOfSubstance_start = 118 * 2e-3) annotation(Placement(transformation(extent = {{204, -154}, {224, -134}})));
    Chemical.Components.Substance Ca_I(substanceData = Chemical.Examples.Substances.Calcium_aqueous, amountOfSubstance_start = 2.2 * 2e-3) annotation(Placement(transformation(extent = {{164, -100}, {144, -80}})));
    Chemical.Components.Substance Mg_I(substanceData = Chemical.Examples.Substances.Magnesium_aqueous, amountOfSubstance_start = 0.75 * 2e-3) annotation(Placement(transformation(extent = {{164, -128}, {144, -108}})));
    Chemical.Components.Substance other_I(substanceData(z = 0.02), amountOfSubstance_start = 20 * 2e-3) annotation(Placement(transformation(extent = {{216, -62}, {236, -42}})));
    Chemical.Components.Substance Alb_I(substanceData(MolarWeight = 66.463, z = -17, density = 1080), amountOfSubstance_start = 0.19 * 2e-3) annotation(Placement(transformation(extent = {{216, -36}, {236, -16}})));
    //(amountOfSubstance_start=0.19*2e-3)
    Chemical.Components.Diffusion diffusion annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin = {-110, 132})));
    Chemical.Components.Diffusion diffusion1 annotation(Placement(transformation(extent = {{104, 122}, {124, 142}})));
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
    Chemical.Components.Solution erythrocyte annotation(Placement(transformation(extent = {{-324, -176}, {-124, 164}})));
    Chemical.Components.Solution palsma annotation(Placement(transformation(extent = {{-94, -176}, {106, 164}})));
    Chemical.Components.Solution intersticium annotation(Placement(transformation(extent = {{132, -176}, {332, 164}})));
    Chemical.Components.Membrane membrane14 annotation(Placement(transformation(extent = {{-118, 50}, {-98, 70}})));
    Chemical.Components.Membrane membrane15 annotation(Placement(transformation(extent = {{106, 50}, {126, 70}})));
  equation
    connect(CO2_E.solution, erythrocyte.solution) annotation(Line(points = {{-292, 122}, {-296, 122}, {-296, 56}, {-296, -164}, {-164, -164}, {-164, -172.6}}, color = {127, 127, 0}));
    connect(Cl_E.solution, erythrocyte.solution) annotation(Line(points = {{-154, -156}, {-164, -156}, {-164, -172.6}}, color = {127, 127, 0}));
    connect(Na_E.solution, erythrocyte.solution) annotation(Line(points = {{-182, -56}, {-190, -56}, {-198, -56}, {-198, -164}, {-164, -164}, {-164, -172.6}}, color = {127, 127, 0}));
    connect(K_E.solution, erythrocyte.solution) annotation(Line(points = {{-182, -82}, {-190, -82}, {-198, -82}, {-198, -164}, {-164, -164}, {-164, -172.6}}, color = {127, 127, 0}));
    connect(HPO4_E.solution, erythrocyte.solution) annotation(Line(points = {{-156, 8}, {-170, 8}, {-170, -32}, {-198, -32}, {-198, -164}, {-164, -164}, {-164, -172.6}}, color = {127, 127, 0}));
    connect(H_E.solution, erythrocyte.solution) annotation(Line(points = {{-156, 30}, {-162, 30}, {-170, 30}, {-170, -32}, {-198, -32}, {-198, -164}, {-164, -164}, {-164, -172.6}}, color = {127, 127, 0}));
    connect(CO3_E.solution, erythrocyte.solution) annotation(Line(points = {{-156, 94}, {-170, 94}, {-170, -32}, {-198, -32}, {-198, -164}, {-164, -164}, {-164, -172.6}}, color = {127, 127, 0}));
    connect(Water_E.solution, erythrocyte.solution) annotation(Line(points = {{-290, 48}, {-296, 48}, {-296, -164}, {-164, -164}, {-164, -172.6}}, color = {127, 127, 0}));
    connect(CO2_P.solution, palsma.solution) annotation(Line(points = {{-70, 122}, {-80, 122}, {-80, -172.6}, {66, -172.6}}, color = {127, 127, 0}));
    connect(Water_P.solution, palsma.solution) annotation(Line(points = {{-68, 50}, {-80, 50}, {-80, -172.6}, {66, -172.6}}, color = {127, 127, 0}));
    connect(H2PO4_P.solution, palsma.solution) annotation(Line(points = {{-68, -12}, {-80, -12}, {-80, -172.6}, {66, -172.6}}, color = {127, 127, 0}));
    connect(Cl_P.solution, palsma.solution) annotation(Line(points = {{-14, -156}, {-14, -172.6}, {66, -172.6}}, color = {127, 127, 0}));
    connect(CO3_P.solution, palsma.solution) annotation(Line(points = {{56, 94}, {56, -20}, {40, -20}, {40, -172.6}, {66, -172.6}}, color = {127, 127, 0}));
    connect(HCO3_P.solution, palsma.solution) annotation(Line(points = {{0, 76}, {22, 76}, {56, 76}, {56, -20}, {40, -20}, {40, -172.6}, {66, -172.6}}, color = {127, 127, 0}));
    connect(Na_P.solution, palsma.solution) annotation(Line(points = {{54, -44}, {40, -44}, {40, -172.6}, {66, -172.6}}, color = {127, 127, 0}));
    connect(K_P.solution, palsma.solution) annotation(Line(points = {{54, -72}, {40, -72}, {40, -172.6}, {66, -172.6}}, color = {127, 127, 0}));
    connect(Ca_P.solution, palsma.solution) annotation(Line(points = {{54, -100}, {50, -100}, {40, -100}, {40, -172.6}, {66, -172.6}}, color = {127, 127, 0}));
    connect(Mg_P.solution, palsma.solution) annotation(Line(points = {{54, -130}, {50, -130}, {40, -130}, {40, -172.6}, {66, -172.6}}, color = {127, 127, 0}));
    connect(Alb_P.solution, palsma.solution) annotation(Line(points = {{0, -34}, {0, -34}, {40, -34}, {40, -172.6}, {66, -172.6}}, color = {127, 127, 0}));
    connect(other_P.solution, palsma.solution) annotation(Line(points = {{-2, -62}, {16, -62}, {40, -62}, {40, -172.6}, {66, -172.6}}, color = {127, 127, 0}));
    connect(ATP.solution, erythrocyte.solution) annotation(Line(points = {{-220, -158}, {-220, -164}, {-164, -164}, {-164, -172.6}}, color = {127, 127, 0}));
    connect(GSH.solution, erythrocyte.solution) annotation(Line(points = {{-220, -132}, {-198, -132}, {-198, -164}, {-164, -164}, {-164, -172.6}}, color = {127, 127, 0}));
    connect(DPG.solution, erythrocyte.solution) annotation(Line(points = {{-220, -108}, {-198, -108}, {-198, -164}, {-164, -164}, {-164, -172.6}}, color = {127, 127, 0}));
    connect(other_E.solution, erythrocyte.solution) annotation(Line(points = {{-220, -82}, {-210, -82}, {-198, -82}, {-198, -164}, {-164, -164}, {-164, -172.6}}, color = {127, 127, 0}));
    connect(Hb.solution, erythrocyte.solution) annotation(Line(points = {{-220, -52}, {-212, -52}, {-198, -52}, {-198, -164}, {-164, -164}, {-164, -172.6}}, color = {127, 127, 0}));
    connect(H2PO4_E.solution, erythrocyte.solution) annotation(Line(points = {{-236, -12}, {-198, -12}, {-198, -164}, {-164, -164}, {-164, -172.6}}, color = {127, 127, 0}));
    connect(HCO3_E.solution, erythrocyte.solution) annotation(Line(points = {{-224, 76}, {-170, 76}, {-170, -32}, {-198, -32}, {-198, -164}, {-164, -164}, {-164, -172.6}}, color = {127, 127, 0}));
    connect(CO2_I.solution, intersticium.solution) annotation(Line(points = {{160, 122}, {160, 118}, {180, 118}, {180, -172.6}, {292, -172.6}}, color = {127, 127, 0}));
    connect(CO3_I.solution, intersticium.solution) annotation(Line(points = {{292, 94}, {292, 94}, {292, -172.6}}, color = {127, 127, 0}));
    connect(HCO3_I.solution, intersticium.solution) annotation(Line(points = {{230, 76}, {292, 76}, {292, -172.6}}, color = {127, 127, 0}));
    connect(H_I.solution, intersticium.solution) annotation(Line(points = {{230, 32}, {180, 32}, {180, -172.6}, {292, -172.6}}, color = {127, 127, 0}));
    connect(HPO4_I.solution, intersticium.solution) annotation(Line(points = {{230, 10}, {228, 10}, {228, -12}, {180, -12}, {180, -172.6}, {292, -172.6}}, color = {127, 127, 0}));
    connect(Alb_I.solution, intersticium.solution) annotation(Line(points = {{220, -36}, {180, -36}, {180, -172.6}, {292, -172.6}}, color = {127, 127, 0}));
    connect(other_I.solution, intersticium.solution) annotation(Line(points = {{220, -62}, {206, -62}, {180, -62}, {180, -172.6}, {292, -172.6}}, color = {127, 127, 0}));
    connect(H2PO4_I.solution, intersticium.solution) annotation(Line(points = {{160, -12}, {180, -12}, {180, -172.6}, {292, -172.6}}, color = {127, 127, 0}));
    connect(Na_I.solution, intersticium.solution) annotation(Line(points = {{160, -44}, {180, -44}, {180, -172.6}, {292, -172.6}}, color = {127, 127, 0}));
    connect(K_I.solution, intersticium.solution) annotation(Line(points = {{160, -72}, {160, -70}, {180, -70}, {180, -172.6}, {292, -172.6}}, color = {127, 127, 0}));
    connect(Ca_I.solution, intersticium.solution) annotation(Line(points = {{160, -100}, {160, -100}, {180, -100}, {180, -172.6}, {292, -172.6}}, color = {127, 127, 0}));
    connect(Mg_I.solution, intersticium.solution) annotation(Line(points = {{160, -128}, {160, -128}, {180, -128}, {180, -172.6}, {292, -172.6}}, color = {127, 127, 0}));
    connect(Water_I.solution, intersticium.solution) annotation(Line(points = {{160, 52}, {160, 50}, {180, 50}, {180, -172.6}, {292, -172.6}}, color = {127, 127, 0}));
    connect(HPO4_P.solution, palsma.solution) annotation(Line(points = {{-2, 8}, {22, 8}, {56, 8}, {56, -20}, {40, -20}, {40, -172.6}, {66, -172.6}}, color = {127, 127, 0}));
    connect(H_P.solution, palsma.solution) annotation(Line(points = {{-2, 32}, {20, 32}, {56, 32}, {56, -20}, {40, -20}, {40, -172.6}, {66, -172.6}}, color = {127, 127, 0}));
    connect(externalIdealGasSubstance1.port_a, gasSolubility1.gas_port) annotation(Line(points = {{-78, 188}, {-68, 188}}, color = {158, 66, 200}));
    connect(gasSolubility1.liquid_port, CO2_P.port_a) annotation(Line(points = {{-48, 188}, {-38, 188}, {-38, 132}, {-54, 132}}, color = {158, 66, 200}));
    connect(diffusion.port_a, CO2_P.port_a) annotation(Line(points = {{-100, 132}, {-88, 132}, {-54, 132}}, color = {158, 66, 200}));
    connect(diffusion.port_b, CO2_E.port_a) annotation(Line(points = {{-120, 132}, {-198, 132}, {-276, 132}}, color = {158, 66, 200}));
    connect(diffusion1.port_a, CO2_P.port_a) annotation(Line(points = {{104, 132}, {-54, 132}}, color = {158, 66, 200}));
    connect(diffusion1.port_b, CO2_I.port_a) annotation(Line(points = {{124, 132}, {132, 132}, {144, 132}}, color = {158, 66, 200}));
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
    annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-400, -300}, {400, 300}})), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-400, -300}, {400, 300}})));
  end bloky03_kade;

  model bloky04_bezCO2
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
  end bloky04_bezCO2;

  model bloky04_h2co3
    Chemical.Components.Substance Water_E(substanceData = Chemical.Examples.Substances.Water_liquid, amountOfSubstance_start = 55.13 * 0.44 * 1 * 0.73) annotation(Placement(transformation(extent = {{-294, 48}, {-274, 68}})));
    Chemical.Components.Substance Water_P(substanceData = Chemical.Examples.Substances.Water_liquid, amountOfSubstance_start = 55.13 * 0.56 * 1 * 0.94) annotation(Placement(transformation(extent = {{-72, 50}, {-52, 70}})));
    Chemical.Components.Substance Water_I(substanceData = Chemical.Examples.Substances.Water_liquid, amountOfSubstance_start = 55.13 * 2) annotation(Placement(transformation(extent = {{164, 52}, {144, 72}})));
    Chemical.Components.Substance CO2_E(substanceData = Chemical.Examples.Substances.CarbonDioxide_aqueous, redeclare
        package stateOfMatter =
          Chemical.Interfaces.Incompressible,                                                                                                    amountOfSubstance_start = 1.2 * 0.32e-3) annotation(Placement(transformation(extent = {{-296, 122}, {-276, 142}})));
    Chemical.Components.Substance CO2_P(substanceData = Chemical.Examples.Substances.CarbonDioxide_aqueous, amountOfSubstance_start = 1.407 * 0.53e-3) annotation(Placement(transformation(extent = {{-74, 122}, {-54, 142}})));
    Chemical.Components.Substance CO2_I(substanceData = Chemical.Examples.Substances.CarbonDioxide_aqueous, amountOfSubstance_start = 1.5 * 2e-3) annotation(Placement(transformation(extent = {{164, 122}, {144, 142}})));
    Chemical.Components.Substance HCO3_E(substanceData = Chemical.Examples.Substances.Bicarbonate_aqueous, amountOfSubstance_start = 15.1 * 0.32e-3) annotation(Placement(transformation(extent = {{-228, 76}, {-208, 96}})));
    Chemical.Components.Substance H_E(substanceData = Chemical.Examples.Substances.Proton_aqueous, amountOfSubstance_start = 0.32 * 10 ^ (-7.2)) annotation(Placement(transformation(extent = {{-160, 30}, {-140, 50}})));
    Chemical.Components.Reaction reaction1(nS = 1, s = {1}, nP = 2, p = {1, 1}) annotation(Placement(transformation(extent = {{-204, 30}, {-184, 50}})));
    Chemical.Components.Substance CO3_E(substanceData = Chemical.Examples.Substances.Carbonate_aqueous, amountOfSubstance_start = 0.015 * 0.32e-3) annotation(Placement(transformation(extent = {{-160, 94}, {-140, 114}})));
    Chemical.Components.Substance H2PO4_E(substanceData = Chemical.Examples.Substances.DihydrogenPhosphate_aqueous, amountOfSubstance_start = 0.33 * 0.32e-3) annotation(Placement(transformation(extent = {{-240, -12}, {-220, 8}})));
    Chemical.Components.Substance HPO4_E(substanceData = Chemical.Examples.Substances.HydrogenPhosphate_aqueous, amountOfSubstance_start = 0.33 * 0.32e-3) annotation(Placement(transformation(extent = {{-160, 8}, {-140, 28}})));
    Chemical.Components.Reaction reaction2(nP = 2, p = {1, 1}, nS = 1, s = {1}) annotation(Placement(transformation(extent = {{-204, 2}, {-184, 22}})));
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
    Chemical.Components.Substance H_P(substanceData = Chemical.Examples.Substances.Proton_aqueous, amountOfSubstance_start = 0.53 * 10 ^ (-7.37)) annotation(Placement(transformation(extent = {{-6, 32}, {14, 52}})));
    Chemical.Components.Reaction reaction3(nS = 1, s = {1}, nP = 2, p = {1, 1}) annotation(Placement(transformation(extent = {{30, 56}, {50, 76}})));
    Chemical.Components.Substance CO3_P(substanceData = Chemical.Examples.Substances.Carbonate_aqueous, amountOfSubstance_start = 0.04 * 0.53e-3) annotation(Placement(transformation(extent = {{52, 94}, {72, 114}})));
    Chemical.Components.Substance H2PO4_P(substanceData = Chemical.Examples.Substances.DihydrogenPhosphate_aqueous, amountOfSubstance_start = 0.56 * 0.53e-3) annotation(Placement(transformation(extent = {{-72, -12}, {-52, 8}})));
    Chemical.Components.Substance HPO4_P(substanceData = Chemical.Examples.Substances.HydrogenPhosphate_aqueous, amountOfSubstance_start = 0.56 * 0.53e-3) annotation(Placement(transformation(extent = {{-6, 8}, {14, 28}})));
    Chemical.Components.Reaction reaction5(nS = 1, s = {1}, nP = 2, p = {1, 1}) annotation(Placement(transformation(extent = {{-40, 0}, {-20, 20}})));
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
    Chemical.Components.Substance H_I(substanceData = Chemical.Examples.Substances.Proton_aqueous, amountOfSubstance_start = 2 * 10 ^ (-7.39)) annotation(Placement(transformation(extent = {{226, 32}, {246, 52}})));
    Chemical.Components.Reaction reaction7(nS = 1, s = {1}, nP = 2, p = {1, 1}) annotation(Placement(transformation(extent = {{258, 56}, {278, 76}})));
    Chemical.Components.Substance CO3_I(substanceData = Chemical.Examples.Substances.Carbonate_aqueous, amountOfSubstance_start = 0.048 * 2e-3) annotation(Placement(transformation(extent = {{288, 94}, {308, 114}})));
    Chemical.Components.Substance H2PO4_I(substanceData = Chemical.Examples.Substances.DihydrogenPhosphate_aqueous, amountOfSubstance_start = 0.6 * 2e-3) annotation(Placement(transformation(extent = {{164, -12}, {144, 8}})));
    Chemical.Components.Substance HPO4_I(substanceData = Chemical.Examples.Substances.HydrogenPhosphate_aqueous, amountOfSubstance_start = 0.6 * 2e-3) annotation(Placement(transformation(extent = {{226, 10}, {246, 30}})));
    Chemical.Components.Reaction reaction8(nS = 1, s = {1}, nP = 2, p = {1, 1}) annotation(Placement(transformation(extent = {{190, -4}, {210, 16}})));
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
    Chemical.Components.Substance H2CO3_E(substanceData=Chemical.Examples.Substances.CarbonicAcid_aqueous,
        amountOfSubstance_start=0)
      annotation (Placement(transformation(extent={{-268,76},{-248,96}})));
    Chemical.Components.Reaction reaction(
      s={1},
      p={1,1},
      nP=2)
      annotation (Placement(transformation(extent={{-244,106},{-224,126}})));
    Chemical.Components.Reaction reaction9(
      s={1,1},
      p={1},
      nS=2)
      annotation (Placement(transformation(extent={{-302,82},{-282,102}})));
    Chemical.Components.Reaction reaction10(
      s={1,1},
      p={1},
      nS=2) annotation (Placement(transformation(extent={{-36,118},{-16,138}})));
    Chemical.Components.Substance H2CO3_P(substanceData=Chemical.Examples.Substances.CarbonicAcid_aqueous,
        amountOfSubstance_start=0)
      annotation (Placement(transformation(extent={{-2,112},{18,132}})));
    Chemical.Components.Reaction reaction11(
      s={1},
      p={1,1},
      nP=2) annotation (Placement(transformation(extent={{24,104},{44,124}})));
    Chemical.Components.Reaction reaction4(
      s={1,1},
      p={1},
      nS=2) annotation (Placement(transformation(extent={{190,124},{210,144}})));
    Chemical.Components.Substance H2CO3_I(substanceData=Chemical.Examples.Substances.CarbonicAcid_aqueous,
        amountOfSubstance_start=0)
      annotation (Placement(transformation(extent={{224,118},{244,138}})));
    Chemical.Components.Reaction reaction12(
      s={1},
      p={1,1},
      nP=2) annotation (Placement(transformation(extent={{250,110},{270,130}})));
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
    connect(HCO3_E.port_a, reaction1.substrates[1]) annotation(Line(points = {{-208, 86}, {-208, 40}, {-204, 40}}, color = {158, 66, 200}));
    connect(reaction1.products[1], H_E.port_a) annotation(Line(points = {{-184, 38}, {-184, 40}, {-140, 40}}, color = {158, 66, 200}));
    connect(H2PO4_E.port_a, reaction2.substrates[1]) annotation(Line(points = {{-220, -2}, {-220, -2}, {-204, -2}, {-204, 12}}, color = {158, 66, 200}));
    connect(reaction2.products[1], HPO4_E.port_a) annotation(Line(points = {{-184, 10}, {-140, 10}, {-140, 18}}, color = {158, 66, 200}));
    connect(reaction2.products[2], H_E.port_a) annotation(Line(points = {{-184, 14}, {-178, 14}, {-178, 40}, {-140, 40}}, color = {158, 66, 200}));
    connect(HCO3_P.port_a, reaction3.substrates[1]) annotation(Line(points = {{16, 86}, {30, 86}, {30, 84}, {30, 66}}, color = {158, 66, 200}));
    connect(reaction3.products[1], H_P.port_a) annotation(Line(points = {{50, 64}, {80, 64}, {80, 42}, {14, 42}}, color = {158, 66, 200}));
    connect(reaction3.products[2], CO3_P.port_a) annotation(Line(points = {{50, 68}, {62, 68}, {80, 68}, {80, 104}, {72, 104}}, color = {158, 66, 200}));
    connect(H2PO4_P.port_a, reaction5.substrates[1]) annotation(Line(points = {{-52, -2}, {-40, -2}, {-40, 10}}, color = {158, 66, 200}));
    connect(reaction5.products[1], HPO4_P.port_a) annotation(Line(points = {{-20, 8}, {-20, 8}, {14, 8}, {14, 18}}, color = {158, 66, 200}));
    connect(reaction5.products[2], H_P.port_a) annotation(Line(points = {{-20, 12}, {-20, 42}, {14, 42}}, color = {158, 66, 200}));
    connect(membrane15.port_b, Water_I.port_a) annotation(Line(points = {{126, 60}, {144, 60}, {144, 62}}, color = {158, 66, 200}));
    connect(membrane15.port_a, Water_P.port_a) annotation(Line(points = {{106, 60}, {38, 60}, {-52, 60}}, color = {158, 66, 200}));
    connect(HCO3_I.port_a, reaction7.substrates[1]) annotation(Line(points = {{246, 86}, {258, 86}, {258, 66}}, color = {158, 66, 200}));
    connect(reaction7.products[1], H_I.port_a) annotation(Line(points = {{278, 64}, {278, 64}, {278, 42}, {246, 42}}, color = {158, 66, 200}));
    connect(reaction7.products[2], CO3_I.port_a) annotation(Line(points = {{278, 68}, {278, 68}, {278, 84}, {278, 104}, {308, 104}}, color = {158, 66, 200}));
    connect(H2PO4_I.port_a, reaction8.substrates[1]) annotation(Line(points = {{144, -2}, {162, -2}, {190, -2}, {190, 6}}, color = {158, 66, 200}));
    connect(reaction8.products[1], H_I.port_a) annotation(Line(points = {{210, 4}, {220, 4}, {220, 14}, {220, 42}, {246, 42}}, color = {158, 66, 200}));
    connect(reaction8.products[2], HPO4_I.port_a) annotation(Line(points = {{210, 8}, {210, 20}, {246, 20}}, color = {158, 66, 200}));
    connect(Cl_I.solution, intersticium.solution) annotation(Line(points = {{208, -154}, {208, -172.6}, {292, -172.6}}, color = {127, 127, 0}));
    connect(reaction1.products[2], CO3_E.port_a) annotation(Line(points = {{-184, 42}, {-184, 42}, {-184, 64}, {-184, 104}, {-140, 104}}, color = {158, 66, 200}));
    connect(im_E.solution, erythrocyte.solution) annotation (Line(points={{-274,
            -112},{-274,-164},{-164,-164},{-164,-172.6}}, color={127,127,0}));
    connect(im_P.solution, plasma.solution) annotation (Line(points={{-48,-114},
            {-48,-172},{66,-172.6}}, color={127,127,0}));
    connect(im_I.solution, intersticium.solution) annotation (Line(points={{260,
            -130},{262,-130},{262,-172.6},{292,-172.6}}, color={127,127,0}));
    connect(CO2_E.port_a, reaction9.substrates[1]) annotation (Line(points={{
            -276,132},{-290,132},{-290,90},{-302,90}}, color={158,66,200}));
    connect(Water_E.port_a, reaction9.substrates[1]) annotation (Line(points={{
            -274,58},{-290,58},{-290,90},{-302,90}}, color={158,66,200}));
    connect(reaction9.products[1], H2CO3_E.port_a) annotation (Line(points={{
            -282,92},{-276,92},{-276,86},{-248,86}}, color={158,66,200}));
    connect(H2CO3_E.port_a, reaction.substrates[1]) annotation (Line(points={{
            -248,86},{-246,86},{-246,116},{-244,116}}, color={158,66,200}));
    connect(reaction.products[1], H_E.port_a) annotation (Line(points={{-224,
            114},{-178,114},{-178,40},{-140,40}}, color={158,66,200}));
    connect(reaction.products[1], HCO3_E.port_a) annotation (Line(points={{-224,
            114},{-208,114},{-208,98},{-208,86}}, color={158,66,200}));
    connect(CO2_P.port_a, reaction10.substrates[1]) annotation (Line(points={{
            -54,132},{-44,132},{-44,126},{-36,126}}, color={158,66,200}));
    connect(Water_P.port_a, reaction10.substrates[1]) annotation (Line(points={
            {-52,60},{-44,60},{-44,126},{-36,126}}, color={158,66,200}));
    connect(reaction10.products[1], H2CO3_P.port_a) annotation (Line(points={{
            -16,128},{-4,128},{-4,122},{18,122}}, color={158,66,200}));
    connect(H2CO3_P.port_a, reaction11.substrates[1]) annotation (Line(points={
            {18,122},{22,122},{22,114},{24,114}}, color={158,66,200}));
    connect(reaction11.products[1], HCO3_P.port_a) annotation (Line(points={{44,
            112},{26,112},{26,86},{16,86}}, color={158,66,200}));
    connect(reaction11.products[1], H_P.port_a) annotation (Line(points={{44,
            112},{26,112},{26,42},{14,42}}, color={158,66,200}));
    connect(CO2_I.port_a, reaction4.substrates[1]) annotation (Line(points={{
            144,132},{190,132},{190,132}}, color={158,66,200}));
    connect(Water_I.port_a, reaction4.substrates[1]) annotation (Line(points={{
            144,62},{168,62},{168,132},{190,132}}, color={158,66,200}));
    connect(reaction4.products[1], H2CO3_I.port_a) annotation (Line(points={{
            210,134},{228,134},{228,128},{244,128}}, color={158,66,200}));
    connect(H2CO3_I.port_a, reaction12.substrates[1]) annotation (Line(points={
            {244,128},{248,128},{248,120},{250,120}}, color={158,66,200}));
    connect(reaction12.products[1], HCO3_I.port_a) annotation (Line(points={{
            270,118},{256,118},{256,86},{246,86}}, color={158,66,200}));
    connect(reaction12.products[1], H_I.port_a) annotation (Line(points={{270,
            118},{256,118},{256,42},{246,42}}, color={158,66,200}));
    connect(H2CO3_E.solution, erythrocyte.solution) annotation (Line(points={{
            -264,76},{-296,76},{-296,-164},{-164,-164},{-164,-172.6}}, color={
            127,127,0}));
    connect(H2CO3_P.solution, plasma.solution) annotation (Line(points={{2,112},
            {28,112},{28,90},{56,90},{56,-20},{40,-20},{40,-172.6},{66,-172.6}},
          color={127,127,0}));
    connect(H2CO3_I.solution, intersticium.solution) annotation (Line(points={{
            228,118},{180,118},{180,-172.6},{292,-172.6}}, color={127,127,0}));
    annotation(Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-400,
              -300},{400,300}})),                                                                           Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-400, -300}, {400, 300}})));
  end bloky04_h2co3;

  model bloky04_bezReakci
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
  end bloky04_bezReakci;

  model bloky04_CO2
    Chemical.Components.Substance Water_E(substanceData = Chemical.Examples.Substances.Water_liquid,
        amountOfSubstance_start=5*55.13*0.44*1*0.73)                                                                                                    annotation(Placement(transformation(extent = {{-294, 48}, {-274, 68}})));
    Chemical.Components.Substance Water_P(substanceData = Chemical.Examples.Substances.Water_liquid,
        amountOfSubstance_start=(5*55.13*0.56*1*0.94))                                                                                                  annotation(Placement(transformation(extent = {{-72, 50}, {-52, 70}})));
    Chemical.Components.Substance Water_I(substanceData = Chemical.Examples.Substances.Water_liquid,
        amountOfSubstance_start=5*55.13*2)                                                                                                annotation(Placement(transformation(extent = {{164, 52}, {144, 72}})));
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
    Chemical.Sources.ExternalMolality externalMolality(substanceData=Chemical.Examples.Substances.CarbonDioxide_aqueous,
        Molality=(5*1.2*0.32e-3)/0.73)
      annotation (Placement(transformation(extent={{-298,174},{-278,194}})));
    Chemical.Sources.ExternalMolality externalMolality1(substanceData=Chemical.Examples.Substances.CarbonDioxide_aqueous,
        Molality=(5*1.407*0.53e-3)/0.94)
      annotation (Placement(transformation(extent={{-76,172},{-56,192}})));
    Chemical.Sources.ExternalMolality externalMolality2(substanceData=Chemical.Examples.Substances.CarbonDioxide_aqueous,
        Molality=5*1.5*2e-3)
      annotation (Placement(transformation(extent={{120,170},{140,190}})));
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
    connect(HCO3_E.port_a, reaction1.substrates[1]) annotation(Line(points = {{-208, 86}, {-208, 40}, {-204, 40}}, color = {158, 66, 200}));
    connect(reaction1.products[1], H_E.port_a) annotation(Line(points = {{-184, 38}, {-184, 40}, {-140, 40}}, color = {158, 66, 200}));
    connect(H2PO4_E.port_a, reaction2.substrates[1]) annotation(Line(points = {{-220, -2}, {-220, -2}, {-204, -2}, {-204, 12}}, color = {158, 66, 200}));
    connect(reaction2.products[1], HPO4_E.port_a) annotation(Line(points = {{-184, 10}, {-140, 10}, {-140, 18}}, color = {158, 66, 200}));
    connect(reaction2.products[2], H_E.port_a) annotation(Line(points = {{-184, 14}, {-178, 14}, {-178, 40}, {-140, 40}}, color = {158, 66, 200}));
    connect(reaction4.products[1], H_P.port_a) annotation(Line(points = {{-18, 74}, {-20, 74}, {-20, 48}, {-20, 42}, {14, 42}}, color = {158, 66, 200}));
    connect(reaction4.products[2], HCO3_P.port_a) annotation(Line(points = {{-18, 78}, {-18, 86}, {16, 86}}, color = {158, 66, 200}));
    connect(HCO3_P.port_a, reaction3.substrates[1]) annotation(Line(points = {{16, 86}, {30, 86}, {30, 84}, {30, 66}}, color = {158, 66, 200}));
    connect(reaction3.products[1], H_P.port_a) annotation(Line(points = {{50, 64}, {80, 64}, {80, 42}, {14, 42}}, color = {158, 66, 200}));
    connect(reaction3.products[2], CO3_P.port_a) annotation(Line(points = {{50, 68}, {62, 68}, {80, 68}, {80, 104}, {72, 104}}, color = {158, 66, 200}));
    connect(H2PO4_P.port_a, reaction5.substrates[1]) annotation(Line(points = {{-52, -2}, {-40, -2}, {-40, 10}}, color = {158, 66, 200}));
    connect(reaction5.products[1], HPO4_P.port_a) annotation(Line(points = {{-20, 8}, {-20, 8}, {14, 8}, {14, 18}}, color = {158, 66, 200}));
    connect(reaction5.products[2], H_P.port_a) annotation(Line(points = {{-20, 12}, {-20, 42}, {14, 42}}, color = {158, 66, 200}));
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
    connect(externalMolality2.port_a, reaction6.substrates[1]) annotation (Line(
          points={{140,180},{164,180},{164,78},{190,78}}, color={158,66,200}));
    connect(externalMolality.port_a, reaction.substrates[1]) annotation (Line(
          points={{-278,184},{-274,184},{-274,70},{-266,70}}, color={158,66,200}));
    connect(Water_E.port_a, reaction.substrates[2]) annotation (Line(points={{
            -274,58},{-270,58},{-270,74},{-266,74}}, color={158,66,200}));
    connect(externalMolality1.port_a, reaction4.substrates[1]) annotation (Line(
          points={{-56,182},{-46,182},{-46,74},{-38,74}}, color={158,66,200}));
    connect(Water_P.port_a, reaction4.substrates[2]) annotation (Line(points={{
            -52,60},{-48,60},{-48,72},{-38,72},{-38,78}}, color={158,66,200}));
    annotation(Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-400,
              -300},{400,300}})),                                                                           Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-400, -300}, {400, 300}})));
  end bloky04_CO2;

  model bloky04_H
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
  end bloky04_H;
  annotation (uses(Chemical(version="1.1.0"), Modelica(version="3.2.1")));
end IPEbloky;
