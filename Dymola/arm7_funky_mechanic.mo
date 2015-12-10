within ;
model arm7_funky_mechanic

  inner Modelica.Mechanics.MultiBody.World world(
    gravityType=Modelica.Mechanics.MultiBody.Types.GravityTypes.UniformGravity,
    n={0,0,-1},
    animateWorld=false,
    animateGravity=false,
    nominalLength=1)
    annotation (Placement(transformation(extent={{-52,66},{-32,86}})));

  Modelica.Mechanics.MultiBody.Parts.Fixed O annotation (Placement(
        transformation(
        extent={{-11,-11},{11,11}},
        rotation=90,
        origin={109,-71})));
  Modelica.Mechanics.MultiBody.Parts.BodyShape K1(
    m=0.04325,
    r={0.007,0,0},
    r_CM={0.00092,0,0},
    I_33=0.000002194)
    annotation (Placement(transformation(extent={{112,-20},{132,0}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute_beta(
    animation=false,
    useAxisFlange=true,
    phi(displayUnit="deg", fixed=false))
                                  annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={116,-40})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute_theta(animation=false, phi(
        fixed=true, start=0),
    stateSelect=StateSelect.always)
                                  annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={122,14})));
  Modelica.Mechanics.MultiBody.Parts.BodyShape K2(
    m=0.00365,
    I_33=0.000000441,
    r={0.028,0,0},
    r_CM={0.0165,0,0})
                   annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={80,14})));
  Modelica.Mechanics.MultiBody.Parts.BodyShape K3(
    m=0.02373,
    r={0.035,0,0},
    I_33=0.000005255,
    r_CM={0.01626,0.01043,0})             annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={16,30})));
  Modelica.Mechanics.MultiBody.Parts.Fixed B(animation=false, r={-0.03635,
        0.03273,0})
    annotation (Placement(transformation(extent={{-16,56},{4,76}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute_gamma(animation=false, phi(
        fixed=false, displayUnit="deg"))
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={20,66})));
  Modelica.Mechanics.MultiBody.Forces.Spring spring_C(
    s_unstretched=0.07785,
    width=0.005,
    c=4530) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={64,60})));
  Modelica.Mechanics.MultiBody.Parts.Fixed C(animation=false, r={0.014,0.072,0})
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={64,84})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(
      animation=true, r={0.01874,0.02,0})
    annotation (Placement(transformation(extent={{54,24},{74,44}})));
  Modelica.Mechanics.MultiBody.Parts.Fixed A(animation=false, r={-0.06934,-0.00227,
        0})
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-152,-26})));
  Modelica.Mechanics.MultiBody.Parts.BodyShape K4(
    r_CM={0.01421,0,0},
    m=0.00706,
    r={0.02,0,0},
    I_33=0.0000005667)
                  annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-38,2})));
  Modelica.Mechanics.MultiBody.Parts.BodyShape K5(
    r={0.04,0,0},
    r_CM={0.02308,0.00916,0},
    m=0.0705,
    I_33=0.00001169)
              annotation (Placement(transformation(extent={{-110,2},{-90,22}})));
  Modelica.Mechanics.MultiBody.Parts.BodyShape K6(
    r={0.02,0,0},
    m=0.00706,
    I_33=0.0000005667,
    r_CM={0.01421,0,0})
               annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-22,-76})));
  Modelica.Mechanics.MultiBody.Parts.BodyShape K7(
    r={0.04,0,0},
    r_CM={0.01228,-0.00449,0},
    m=0.05498,
    I_33=0.00001912)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-96,-58})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute_epsilon(animation=false, phi(
        start=-1.5707963267949))    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-126,-58})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute_phi(animation=false)
    annotation (Placement(transformation(extent={{-82,2},{-62,22}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute_omega(animation=false)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-62,-86})));
  Modelica.Mechanics.MultiBody.Joints.RevolutePlanarLoopConstraint revolute1(
      animation=false) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-22,-18})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute_delta(animation=false, phi(
      displayUnit="deg",
      fixed=false,
      start=0.78539816339745))
    annotation (Placement(transformation(extent={{-138,2},{-118,22}})));
  Modelica.Mechanics.MultiBody.Joints.RevolutePlanarLoopConstraint revolute2(
      animation=false) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-10,-54})));
  Modelica.Mechanics.MultiBody.Joints.RevolutePlanarLoopConstraint revolute3(
      animation=false) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={16,4})));
  Modelica.Mechanics.Rotational.Sources.Torque driving_torque
    annotation (Placement(transformation(extent={{72,-50},{92,-30}})));
  Modelica.Blocks.Sources.Constant Constant_momentum(k=0.033)
    annotation (Placement(transformation(extent={{38,-86},{58,-66}})));
equation
  connect(revolute_beta.frame_b, K1.frame_a) annotation (Line(
      points={{116,-30},{106,-30},{106,-28},{106,-10},{110,-10},{112,-10}},
      color={95,95,95},
      thickness=0.5));
  connect(C.frame_b, spring_C.frame_b) annotation (Line(
      points={{64,74},{64,70}},
      color={95,95,95},
      thickness=0.5));
  connect(fixedTranslation.frame_b, spring_C.frame_a) annotation (Line(
      points={{74,34},{74,34},{74,50},{64,50}},
      color={95,95,95},
      thickness=0.5));
  connect(K5.frame_b, revolute_phi.frame_a) annotation (Line(
      points={{-90,12},{-86,12},{-82,12}},
      color={95,95,95},
      thickness=0.5));
  connect(K4.frame_b, revolute_phi.frame_b) annotation (Line(
      points={{-38,12},{-50,12},{-62,12}},
      color={95,95,95},
      thickness=0.5));
  connect(revolute1.frame_b, K4.frame_a) annotation (Line(
      points={{-32,-18},{-38,-18},{-38,-8}},
      color={95,95,95},
      thickness=0.5));
  connect(revolute_delta.frame_b, K5.frame_a) annotation (Line(
      points={{-118,12},{-118,12},{-110,12}},
      color={95,95,95},
      thickness=0.5));
  connect(revolute_delta.frame_a, A.frame_b) annotation (Line(
      points={{-138,12},{-142,12},{-142,-26}},
      color={95,95,95},
      thickness=0.5));
  connect(O.frame_b, revolute_beta.frame_a) annotation (Line(
      points={{109,-60},{116,-60},{116,-50}},
      color={95,95,95},
      thickness=0.5));
  connect(driving_torque.flange, revolute_beta.axis)
    annotation (Line(points={{92,-40},{92,-40},{106,-40}}, color={0,0,0}));
  connect(Constant_momentum.y, driving_torque.tau) annotation (Line(points={{59,
          -76},{66,-76},{66,-40},{70,-40}}, color={0,0,127}));
  connect(K1.frame_b, revolute_theta.frame_a) annotation (Line(
      points={{132,-10},{132,-10},{132,14}},
      color={95,95,95},
      thickness=0.5));
  connect(revolute_gamma.frame_a, B.frame_b) annotation (Line(
      points={{10,66},{12,66},{4,66}},
      color={95,95,95},
      thickness=0.5));
  connect(revolute_gamma.frame_b, K3.frame_a) annotation (Line(
      points={{30,66},{30,66},{30,40},{16,40}},
      color={95,95,95},
      thickness=0.5));
  connect(K3.frame_b, revolute3.frame_b) annotation (Line(
      points={{16,20},{16,17},{16,14}},
      color={95,95,95},
      thickness=0.5));
  connect(fixedTranslation.frame_a, K3.frame_a) annotation (Line(
      points={{54,34},{36,34},{36,40},{16,40}},
      color={95,95,95},
      thickness=0.5));
  connect(K2.frame_b, revolute_theta.frame_b) annotation (Line(
      points={{90,14},{102,14},{112,14}},
      color={95,95,95},
      thickness=0.5));
  connect(revolute3.frame_a, K2.frame_a) annotation (Line(
      points={{16,-6},{42,-6},{42,14},{70,14}},
      color={95,95,95},
      thickness=0.5));
  connect(revolute1.frame_a, K2.frame_a) annotation (Line(
      points={{-12,-18},{50,-18},{50,14},{70,14}},
      color={95,95,95},
      thickness=0.5));
  connect(revolute2.frame_a, K2.frame_a) annotation (Line(
      points={{0,-54},{54,-54},{54,14},{70,14}},
      color={95,95,95},
      thickness=0.5));
  connect(A.frame_b, revolute_epsilon.frame_a) annotation (Line(
      points={{-142,-26},{-142,-26},{-142,-58},{-136,-58}},
      color={95,95,95},
      thickness=0.5));
  connect(revolute_epsilon.frame_b, K7.frame_a) annotation (Line(
      points={{-116,-58},{-112,-58},{-106,-58}},
      color={95,95,95},
      thickness=0.5));
  connect(K7.frame_b, revolute_omega.frame_b) annotation (Line(
      points={{-86,-58},{-80,-58},{-80,-86},{-72,-86}},
      color={95,95,95},
      thickness=0.5));
  connect(revolute_omega.frame_a, K6.frame_b) annotation (Line(
      points={{-52,-86},{-38,-86},{-22,-86}},
      color={95,95,95},
      thickness=0.5));
  connect(K6.frame_a, revolute2.frame_b) annotation (Line(
      points={{-22,-66},{-22,-66},{-22,-54},{-20,-54}},
      color={95,95,95},
      thickness=0.5));
  annotation (uses(Modelica(version="3.2.1")), Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}})));
end arm7_funky_mechanic;
