import 'dart:ui' as ui;

import 'package:flutter/material.dart';

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.8725762, size.height * 0.03092784);
    path_0.cubicTo(
      size.width * 0.9143629,
      size.height * 0.03092784,
      size.width * 0.9352548,
      size.height * 0.03092863,
      size.width * 0.9482355,
      size.height * 0.04703265,
    );
    path_0.cubicTo(
      size.width * 0.9612188,
      size.height * 0.06313677,
      size.width * 0.9612188,
      size.height * 0.08905533,
      size.width * 0.9612188,
      size.height * 0.1408935,
    );
    path_0.lineTo(size.width * 0.9612188, size.height * 0.7697595);
    path_0.cubicTo(
      size.width * 0.9612188,
      size.height * 0.8475155,
      size.width * 0.9612188,
      size.height * 0.8863952,
      size.width * 0.9417479,
      size.height * 0.9105533,
    );
    path_0.cubicTo(
      size.width * 0.9222742,
      size.height * 0.9347079,
      size.width * 0.8909335,
      size.height * 0.9347079,
      size.width * 0.8282548,
      size.height * 0.9347079,
    );
    path_0.lineTo(size.width * 0.6348255, size.height * 0.9347079);
    path_0.cubicTo(
      size.width * 0.6339723,
      size.height * 0.9347079,
      size.width * 0.6361025,
      size.height * 0.9347079,
      size.width * 0.6346870,
      size.height * 0.9345945,
    );
    path_0.cubicTo(
      size.width * 0.6149446,
      size.height * 0.9330275,
      size.width * 0.6231025,
      size.height * 0.9372165,
      size.width * 0.6082465,
      size.height * 0.9210103,
    );
    path_0.cubicTo(
      size.width * 0.6071828,
      size.height * 0.9198454,
      size.width * 0.5954238,
      size.height * 0.9052577,
      size.width * 0.5719058,
      size.height * 0.8760790,
    );
    path_0.lineTo(size.width * 0.5719058, size.height * 0.8760790);
    path_0.cubicTo(
      size.width * 0.5589252,
      size.height * 0.8599759,
      size.width * 0.5380305,
      size.height * 0.8599759,
      size.width * 0.4962438,
      size.height * 0.8599759,
    );
    path_0.lineTo(size.width * 0.4760526, size.height * 0.8599759);
    path_0.cubicTo(
      size.width * 0.4473269,
      size.height * 0.8599759,
      size.width * 0.4329612,
      size.height * 0.8599759,
      size.width * 0.4240360,
      size.height * 0.8710481,
    );
    path_0.lineTo(size.width * 0.4240360, size.height * 0.8710481);
    path_0.cubicTo(
      size.width * 0.3976454,
      size.height * 0.9037835,
      size.width * 0.3844515,
      size.height * 0.9201546,
      size.width * 0.3831053,
      size.height * 0.9215773,
    );
    path_0.cubicTo(
      size.width * 0.3685485,
      size.height * 0.9369622,
      size.width * 0.3769557,
      size.height * 0.9326460,
      size.width * 0.3578892,
      size.height * 0.9345326,
    );
    path_0.cubicTo(
      size.width * 0.3561274,
      size.height * 0.9347079,
      size.width * 0.3655762,
      size.height * 0.9347079,
      size.width * 0.3617978,
      size.height * 0.9347079,
    );
    path_0.lineTo(size.width * 0.1717452, size.height * 0.9347079);
    path_0.cubicTo(
      size.width * 0.1090654,
      size.height * 0.9347079,
      size.width * 0.07772493,
      size.height * 0.9347079,
      size.width * 0.05825291,
      size.height * 0.9105533,
    );
    path_0.cubicTo(
      size.width * 0.03878089,
      size.height * 0.8863952,
      size.width * 0.03878116,
      size.height * 0.8475155,
      size.width * 0.03878116,
      size.height * 0.7697595,
    );
    path_0.lineTo(size.width * 0.03878116, size.height * 0.1958763);
    path_0.cubicTo(
      size.width * 0.03878116,
      size.height * 0.1181189,
      size.width * 0.03878089,
      size.height * 0.07923952,
      size.width * 0.05825291,
      size.height * 0.05508351,
    );
    path_0.cubicTo(
      size.width * 0.07772493,
      size.height * 0.03092735,
      size.width * 0.1090654,
      size.height * 0.03092784,
      size.width * 0.1717452,
      size.height * 0.03092784,
    );
    path_0.lineTo(size.width * 0.8725762, size.height * 0.03092784);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.8725762, size.height * 0.03092784);
    path_1.cubicTo(
      size.width * 0.9143629,
      size.height * 0.03092784,
      size.width * 0.9352548,
      size.height * 0.03092863,
      size.width * 0.9482355,
      size.height * 0.04703265,
    );
    path_1.cubicTo(
      size.width * 0.9612188,
      size.height * 0.06313677,
      size.width * 0.9612188,
      size.height * 0.08905533,
      size.width * 0.9612188,
      size.height * 0.1408935,
    );
    path_1.lineTo(size.width * 0.9612188, size.height * 0.7697595);
    path_1.cubicTo(
      size.width * 0.9612188,
      size.height * 0.8475155,
      size.width * 0.9612188,
      size.height * 0.8863952,
      size.width * 0.9417479,
      size.height * 0.9105533,
    );
    path_1.cubicTo(
      size.width * 0.9222742,
      size.height * 0.9347079,
      size.width * 0.8909335,
      size.height * 0.9347079,
      size.width * 0.8282548,
      size.height * 0.9347079,
    );
    path_1.lineTo(size.width * 0.6348255, size.height * 0.9347079);
    path_1.cubicTo(
      size.width * 0.6339723,
      size.height * 0.9347079,
      size.width * 0.6361025,
      size.height * 0.9347079,
      size.width * 0.6346870,
      size.height * 0.9345945,
    );
    path_1.cubicTo(
      size.width * 0.6149446,
      size.height * 0.9330275,
      size.width * 0.6231025,
      size.height * 0.9372165,
      size.width * 0.6082465,
      size.height * 0.9210103,
    );
    path_1.cubicTo(
      size.width * 0.6071828,
      size.height * 0.9198454,
      size.width * 0.5954238,
      size.height * 0.9052577,
      size.width * 0.5719058,
      size.height * 0.8760790,
    );
    path_1.lineTo(size.width * 0.5719058, size.height * 0.8760790);
    path_1.cubicTo(
      size.width * 0.5589252,
      size.height * 0.8599759,
      size.width * 0.5380305,
      size.height * 0.8599759,
      size.width * 0.4962438,
      size.height * 0.8599759,
    );
    path_1.lineTo(size.width * 0.4760526, size.height * 0.8599759);
    path_1.cubicTo(
      size.width * 0.4473269,
      size.height * 0.8599759,
      size.width * 0.4329612,
      size.height * 0.8599759,
      size.width * 0.4240360,
      size.height * 0.8710481,
    );
    path_1.lineTo(size.width * 0.4240360, size.height * 0.8710481);
    path_1.cubicTo(
      size.width * 0.3976454,
      size.height * 0.9037835,
      size.width * 0.3844515,
      size.height * 0.9201546,
      size.width * 0.3831053,
      size.height * 0.9215773,
    );
    path_1.cubicTo(
      size.width * 0.3685485,
      size.height * 0.9369622,
      size.width * 0.3769557,
      size.height * 0.9326460,
      size.width * 0.3578892,
      size.height * 0.9345326,
    );
    path_1.cubicTo(
      size.width * 0.3561274,
      size.height * 0.9347079,
      size.width * 0.3655762,
      size.height * 0.9347079,
      size.width * 0.3617978,
      size.height * 0.9347079,
    );
    path_1.lineTo(size.width * 0.1717452, size.height * 0.9347079);
    path_1.cubicTo(
      size.width * 0.1090654,
      size.height * 0.9347079,
      size.width * 0.07772493,
      size.height * 0.9347079,
      size.width * 0.05825291,
      size.height * 0.9105533,
    );
    path_1.cubicTo(
      size.width * 0.03878089,
      size.height * 0.8863952,
      size.width * 0.03878116,
      size.height * 0.8475155,
      size.width * 0.03878116,
      size.height * 0.7697595,
    );
    path_1.lineTo(size.width * 0.03878116, size.height * 0.1958763);
    path_1.cubicTo(
      size.width * 0.03878116,
      size.height * 0.1181189,
      size.width * 0.03878089,
      size.height * 0.07923952,
      size.width * 0.05825291,
      size.height * 0.05508351,
    );
    path_1.cubicTo(
      size.width * 0.07772493,
      size.height * 0.03092735,
      size.width * 0.1090654,
      size.height * 0.03092784,
      size.width * 0.1717452,
      size.height * 0.03092784,
    );
    path_1.lineTo(size.width * 0.8725762, size.height * 0.03092784);
    path_1.close();

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.shader = ui.Gradient.linear(
      Offset(size.width * 0.5000000, size.height * 0.03092784),
      Offset(size.width * 0.5000000, size.height * 0.9347079),
      [Color(0xffEF7676).withOpacity(1), Color(0xffE92929).withOpacity(1)],
      [0, 1],
    );
    canvas.drawPath(path_1, paint1Fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.9482355, size.height * 0.04703265);
    path_2.lineTo(size.width * 0.9531551, size.height * 0.04093058);
    path_2.lineTo(size.width * 0.9482355, size.height * 0.04703265);
    path_2.close();
    path_2.moveTo(size.width * 0.9417479, size.height * 0.9105533);
    path_2.lineTo(size.width * 0.9466648, size.height * 0.9166529);
    path_2.lineTo(size.width * 0.9417479, size.height * 0.9105533);
    path_2.close();
    path_2.moveTo(size.width * 0.4760526, size.height * 0.8599759);
    path_2.lineTo(size.width * 0.4760526, size.height * 0.8513471);
    path_2.lineTo(size.width * 0.4760526, size.height * 0.8599759);
    path_2.close();
    path_2.moveTo(size.width * 0.05825291, size.height * 0.9105533);
    path_2.lineTo(size.width * 0.05333407, size.height * 0.9166529);
    path_2.lineTo(size.width * 0.05825291, size.height * 0.9105533);
    path_2.close();
    path_2.moveTo(size.width * 0.05825291, size.height * 0.05508351);
    path_2.lineTo(size.width * 0.05333407, size.height * 0.04898144);
    path_2.lineTo(size.width * 0.05825291, size.height * 0.05508351);
    path_2.close();
    path_2.moveTo(size.width * 0.3831053, size.height * 0.9215773);
    path_2.lineTo(size.width * 0.3785956, size.height * 0.9150069);
    path_2.lineTo(size.width * 0.3831053, size.height * 0.9215773);
    path_2.close();
    path_2.moveTo(size.width * 0.3578892, size.height * 0.9345326);
    path_2.lineTo(size.width * 0.3584432, size.height * 0.9431340);
    path_2.lineTo(size.width * 0.3578892, size.height * 0.9345326);
    path_2.close();
    path_2.moveTo(size.width * 0.6346870, size.height * 0.9345945);
    path_2.lineTo(size.width * 0.6342410, size.height * 0.9432062);
    path_2.lineTo(size.width * 0.6346870, size.height * 0.9345945);
    path_2.close();
    path_2.moveTo(size.width * 0.6082465, size.height * 0.9210103);
    path_2.lineTo(size.width * 0.6128421, size.height * 0.9145292);
    path_2.lineTo(size.width * 0.6082465, size.height * 0.9210103);
    path_2.close();
    path_2.moveTo(size.width * 0.8725762, size.height * 0.03092784);
    path_2.lineTo(size.width * 0.8725762, size.height * 0.03955739);
    path_2.cubicTo(
      size.width * 0.8936648,
      size.height * 0.03955739,
      size.width * 0.9087839,
      size.height * 0.03957595,
      size.width * 0.9202825,
      size.height * 0.04149381,
    );
    path_2.cubicTo(
      size.width * 0.9315789,
      size.height * 0.04337835,
      size.width * 0.9383352,
      size.height * 0.04695326,
      size.width * 0.9433186,
      size.height * 0.05313471,
    );
    path_2.lineTo(size.width * 0.9482355, size.height * 0.04703265);
    path_2.lineTo(size.width * 0.9531551, size.height * 0.04093058);
    path_2.cubicTo(
      size.width * 0.9451579,
      size.height * 0.03100811,
      size.width * 0.9349751,
      size.height * 0.02653052,
      size.width * 0.9221357,
      size.height * 0.02438863,
    );
    path_2.cubicTo(
      size.width * 0.9094958,
      size.height * 0.02228010,
      size.width * 0.8932715,
      size.height * 0.02229825,
      size.width * 0.8725762,
      size.height * 0.02229825,
    );
    path_2.lineTo(size.width * 0.8725762, size.height * 0.03092784);
    path_2.close();
    path_2.moveTo(size.width * 0.9482355, size.height * 0.04703265);
    path_2.lineTo(size.width * 0.9433186, size.height * 0.05313471);
    path_2.cubicTo(
      size.width * 0.9483019,
      size.height * 0.05931615,
      size.width * 0.9511828,
      size.height * 0.06769725,
      size.width * 0.9527008,
      size.height * 0.08171271,
    );
    path_2.cubicTo(
      size.width * 0.9542465,
      size.height * 0.09597629,
      size.width * 0.9542632,
      size.height * 0.1147306,
      size.width * 0.9542632,
      size.height * 0.1408935,
    );
    path_2.lineTo(size.width * 0.9612188, size.height * 0.1408935);
    path_2.lineTo(size.width * 0.9681745, size.height * 0.1408935);
    path_2.cubicTo(
      size.width * 0.9681745,
      size.height * 0.1152182,
      size.width * 0.9681884,
      size.height * 0.09509381,
      size.width * 0.9664903,
      size.height * 0.07941271,
    );
    path_2.cubicTo(
      size.width * 0.9647645,
      size.height * 0.06348351,
      size.width * 0.9611551,
      size.height * 0.05085326,
      size.width * 0.9531551,
      size.height * 0.04093058,
    );
    path_2.lineTo(size.width * 0.9482355, size.height * 0.04703265);
    path_2.close();
    path_2.moveTo(size.width * 0.9612188, size.height * 0.1408935);
    path_2.lineTo(size.width * 0.9542632, size.height * 0.1408935);
    path_2.lineTo(size.width * 0.9542632, size.height * 0.7697595);
    path_2.lineTo(size.width * 0.9612188, size.height * 0.7697595);
    path_2.lineTo(size.width * 0.9681745, size.height * 0.7697595);
    path_2.lineTo(size.width * 0.9681745, size.height * 0.1408935);
    path_2.lineTo(size.width * 0.9612188, size.height * 0.1408935);
    path_2.close();
    path_2.moveTo(size.width * 0.9612188, size.height * 0.7697595);
    path_2.lineTo(size.width * 0.9542632, size.height * 0.7697595);
    path_2.cubicTo(
      size.width * 0.9542632,
      size.height * 0.8088832,
      size.width * 0.9542465,
      size.height * 0.8373574,
      size.width * 0.9518920,
      size.height * 0.8591065,
    );
    path_2.cubicTo(
      size.width * 0.9495596,
      size.height * 0.8806082,
      size.width * 0.9450554,
      size.height * 0.8942440,
      size.width * 0.9368283,
      size.height * 0.9044502,
    );
    path_2.lineTo(size.width * 0.9417479, size.height * 0.9105533);
    path_2.lineTo(size.width * 0.9466648, size.height * 0.9166529);
    path_2.cubicTo(
      size.width * 0.9579086,
      size.height * 0.9027045,
      size.width * 0.9631413,
      size.height * 0.8848213,
      size.width * 0.9656787,
      size.height * 0.8614055,
    );
    path_2.cubicTo(
      size.width * 0.9681911,
      size.height * 0.8382371,
      size.width * 0.9681745,
      size.height * 0.8083952,
      size.width * 0.9681745,
      size.height * 0.7697595,
    );
    path_2.lineTo(size.width * 0.9612188, size.height * 0.7697595);
    path_2.close();
    path_2.moveTo(size.width * 0.9417479, size.height * 0.9105533);
    path_2.lineTo(size.width * 0.9368283, size.height * 0.9044502);
    path_2.cubicTo(
      size.width * 0.9286011,
      size.height * 0.9146564,
      size.width * 0.9176094,
      size.height * 0.9202440,
      size.width * 0.9002770,
      size.height * 0.9231375,
    );
    path_2.cubicTo(
      size.width * 0.8827452,
      size.height * 0.9260584,
      size.width * 0.8597922,
      size.height * 0.9260790,
      size.width * 0.8282548,
      size.height * 0.9260790,
    );
    path_2.lineTo(size.width * 0.8282548, size.height * 0.9347079);
    path_2.lineTo(size.width * 0.8282548, size.height * 0.9433368);
    path_2.cubicTo(
      size.width * 0.8593989,
      size.height * 0.9433368,
      size.width * 0.8834543,
      size.height * 0.9433574,
      size.width * 0.9021302,
      size.height * 0.9402405,
    );
    path_2.cubicTo(
      size.width * 0.9210055,
      size.height * 0.9370928,
      size.width * 0.9354211,
      size.height * 0.9306014,
      size.width * 0.9466648,
      size.height * 0.9166529,
    );
    path_2.lineTo(size.width * 0.9417479, size.height * 0.9105533);
    path_2.close();
    path_2.moveTo(size.width * 0.8282548, size.height * 0.9347079);
    path_2.lineTo(size.width * 0.8282548, size.height * 0.9260790);
    path_2.lineTo(size.width * 0.6348255, size.height * 0.9260790);
    path_2.lineTo(size.width * 0.6348255, size.height * 0.9347079);
    path_2.lineTo(size.width * 0.6348255, size.height * 0.9433368);
    path_2.lineTo(size.width * 0.8282548, size.height * 0.9433368);
    path_2.lineTo(size.width * 0.8282548, size.height * 0.9347079);
    path_2.close();
    path_2.moveTo(size.width * 0.5719058, size.height * 0.8760790);
    path_2.lineTo(size.width * 0.5768255, size.height * 0.8699794);
    path_2.cubicTo(
      size.width * 0.5688255,
      size.height * 0.8600550,
      size.width * 0.5586454,
      size.height * 0.8555773,
      size.width * 0.5458033,
      size.height * 0.8534364,
    );
    path_2.cubicTo(
      size.width * 0.5331607,
      size.height * 0.8513265,
      size.width * 0.5169391,
      size.height * 0.8513471,
      size.width * 0.4962438,
      size.height * 0.8513471,
    );
    path_2.lineTo(size.width * 0.4962438, size.height * 0.8599759);
    path_2.lineTo(size.width * 0.4962438, size.height * 0.8686048);
    path_2.cubicTo(
      size.width * 0.5173324,
      size.height * 0.8686048,
      size.width * 0.5324515,
      size.height * 0.8686254,
      size.width * 0.5439501,
      size.height * 0.8705430,
    );
    path_2.cubicTo(
      size.width * 0.5552465,
      size.height * 0.8724261,
      size.width * 0.5620055,
      size.height * 0.8760000,
      size.width * 0.5669861,
      size.height * 0.8821821,
    );
    path_2.lineTo(size.width * 0.5719058, size.height * 0.8760790);
    path_2.close();
    path_2.moveTo(size.width * 0.4962438, size.height * 0.8599759);
    path_2.lineTo(size.width * 0.4962438, size.height * 0.8513471);
    path_2.lineTo(size.width * 0.4760526, size.height * 0.8513471);
    path_2.lineTo(size.width * 0.4760526, size.height * 0.8599759);
    path_2.lineTo(size.width * 0.4760526, size.height * 0.8686048);
    path_2.lineTo(size.width * 0.4962438, size.height * 0.8686048);
    path_2.lineTo(size.width * 0.4962438, size.height * 0.8599759);
    path_2.close();
    path_2.moveTo(size.width * 0.4760526, size.height * 0.8599759);
    path_2.lineTo(size.width * 0.4760526, size.height * 0.8513471);
    path_2.cubicTo(
      size.width * 0.4618864,
      size.height * 0.8513471,
      size.width * 0.4505623,
      size.height * 0.8513265,
      size.width * 0.4416925,
      size.height * 0.8528076,
    );
    path_2.cubicTo(
      size.width * 0.4326233,
      size.height * 0.8543196,
      size.width * 0.4250886,
      size.height * 0.8575395,
      size.width * 0.4191163,
      size.height * 0.8649450,
    );
    path_2.lineTo(size.width * 0.4240360, size.height * 0.8710481);
    path_2.lineTo(size.width * 0.4289557, size.height * 0.8771478);
    path_2.cubicTo(
      size.width * 0.4319086,
      size.height * 0.8734845,
      size.width * 0.4360194,
      size.height * 0.8711684,
      size.width * 0.4435457,
      size.height * 0.8699107,
    );
    path_2.cubicTo(
      size.width * 0.4512715,
      size.height * 0.8686220,
      size.width * 0.4614931,
      size.height * 0.8686048,
      size.width * 0.4760526,
      size.height * 0.8686048,
    );
    path_2.lineTo(size.width * 0.4760526, size.height * 0.8599759);
    path_2.close();
    path_2.moveTo(size.width * 0.3617978, size.height * 0.9347079);
    path_2.lineTo(size.width * 0.3617978, size.height * 0.9260790);
    path_2.lineTo(size.width * 0.1717452, size.height * 0.9260790);
    path_2.lineTo(size.width * 0.1717452, size.height * 0.9347079);
    path_2.lineTo(size.width * 0.1717452, size.height * 0.9433368);
    path_2.lineTo(size.width * 0.3617978, size.height * 0.9433368);
    path_2.lineTo(size.width * 0.3617978, size.height * 0.9347079);
    path_2.close();
    path_2.moveTo(size.width * 0.1717452, size.height * 0.9347079);
    path_2.lineTo(size.width * 0.1717452, size.height * 0.9260790);
    path_2.cubicTo(
      size.width * 0.1402086,
      size.height * 0.9260790,
      size.width * 0.1172560,
      size.height * 0.9260584,
      size.width * 0.09972299,
      size.height * 0.9231375,
    );
    path_2.cubicTo(
      size.width * 0.08239030,
      size.height * 0.9202440,
      size.width * 0.07139972,
      size.height * 0.9146564,
      size.width * 0.06317175,
      size.height * 0.9044502,
    );
    path_2.lineTo(size.width * 0.05825291, size.height * 0.9105533);
    path_2.lineTo(size.width * 0.05333407, size.height * 0.9166529);
    path_2.cubicTo(
      size.width * 0.06457812,
      size.height * 0.9306014,
      size.width * 0.07899391,
      size.height * 0.9370928,
      size.width * 0.09786925,
      size.height * 0.9402405,
    );
    path_2.cubicTo(
      size.width * 0.1165446,
      size.height * 0.9433574,
      size.width * 0.1406019,
      size.height * 0.9433368,
      size.width * 0.1717452,
      size.height * 0.9433368,
    );
    path_2.lineTo(size.width * 0.1717452, size.height * 0.9347079);
    path_2.close();
    path_2.moveTo(size.width * 0.05825291, size.height * 0.9105533);
    path_2.lineTo(size.width * 0.06317175, size.height * 0.9044502);
    path_2.cubicTo(
      size.width * 0.05494349,
      size.height * 0.8942440,
      size.width * 0.05043934,
      size.height * 0.8806082,
      size.width * 0.04810914,
      size.height * 0.8591065,
    );
    path_2.cubicTo(
      size.width * 0.04575208,
      size.height * 0.8373574,
      size.width * 0.04573740,
      size.height * 0.8088832,
      size.width * 0.04573740,
      size.height * 0.7697595,
    );
    path_2.lineTo(size.width * 0.03878116, size.height * 0.7697595);
    path_2.lineTo(size.width * 0.03182493, size.height * 0.7697595);
    path_2.cubicTo(
      size.width * 0.03182493,
      size.height * 0.8083952,
      size.width * 0.03180997,
      size.height * 0.8382371,
      size.width * 0.03432078,
      size.height * 0.8614055,
    );
    path_2.cubicTo(
      size.width * 0.03685845,
      size.height * 0.8848213,
      size.width * 0.04209003,
      size.height * 0.9027045,
      size.width * 0.05333407,
      size.height * 0.9166529,
    );
    path_2.lineTo(size.width * 0.05825291, size.height * 0.9105533);
    path_2.close();
    path_2.moveTo(size.width * 0.03878116, size.height * 0.7697595);
    path_2.lineTo(size.width * 0.04573740, size.height * 0.7697595);
    path_2.lineTo(size.width * 0.04573740, size.height * 0.1958763);
    path_2.lineTo(size.width * 0.03878116, size.height * 0.1958763);
    path_2.lineTo(size.width * 0.03182493, size.height * 0.1958763);
    path_2.lineTo(size.width * 0.03182493, size.height * 0.7697595);
    path_2.lineTo(size.width * 0.03878116, size.height * 0.7697595);
    path_2.close();
    path_2.moveTo(size.width * 0.03878116, size.height * 0.1958763);
    path_2.lineTo(size.width * 0.04573740, size.height * 0.1958763);
    path_2.cubicTo(
      size.width * 0.04573740,
      size.height * 0.1567536,
      size.width * 0.04575208,
      size.height * 0.1282797,
      size.width * 0.04810914,
      size.height * 0.1065292,
    );
    path_2.cubicTo(
      size.width * 0.05043934,
      size.height * 0.08502715,
      size.width * 0.05494349,
      size.height * 0.07139278,
      size.width * 0.06317175,
      size.height * 0.06118557,
    );
    path_2.lineTo(size.width * 0.05825291, size.height * 0.05508351);
    path_2.lineTo(size.width * 0.05333407, size.height * 0.04898144);
    path_2.cubicTo(
      size.width * 0.04209003,
      size.height * 0.06293024,
      size.width * 0.03685845,
      size.height * 0.08081375,
      size.width * 0.03432078,
      size.height * 0.1042296,
    );
    path_2.cubicTo(
      size.width * 0.03180997,
      size.height * 0.1273973,
      size.width * 0.03182493,
      size.height * 0.1572416,
      size.width * 0.03182493,
      size.height * 0.1958763,
    );
    path_2.lineTo(size.width * 0.03878116, size.height * 0.1958763);
    path_2.close();
    path_2.moveTo(size.width * 0.05825291, size.height * 0.05508351);
    path_2.lineTo(size.width * 0.06317175, size.height * 0.06118557);
    path_2.cubicTo(
      size.width * 0.07139972,
      size.height * 0.05097801,
      size.width * 0.08239030,
      size.height * 0.04539038,
      size.width * 0.09972299,
      size.height * 0.04249966,
    );
    path_2.cubicTo(
      size.width * 0.1172560,
      size.height * 0.03957560,
      size.width * 0.1402086,
      size.height * 0.03955739,
      size.width * 0.1717452,
      size.height * 0.03955739,
    );
    path_2.lineTo(size.width * 0.1717452, size.height * 0.03092784);
    path_2.lineTo(size.width * 0.1717452, size.height * 0.02229825);
    path_2.cubicTo(
      size.width * 0.1406019,
      size.height * 0.02229825,
      size.width * 0.1165446,
      size.height * 0.02227979,
      size.width * 0.09786925,
      size.height * 0.02539447,
    );
    path_2.cubicTo(
      size.width * 0.07899391,
      size.height * 0.02854251,
      size.width * 0.06457812,
      size.height * 0.03503265,
      size.width * 0.05333407,
      size.height * 0.04898144,
    );
    path_2.lineTo(size.width * 0.05825291, size.height * 0.05508351);
    path_2.close();
    path_2.moveTo(size.width * 0.1717452, size.height * 0.03092784);
    path_2.lineTo(size.width * 0.1717452, size.height * 0.03955739);
    path_2.lineTo(size.width * 0.8725762, size.height * 0.03955739);
    path_2.lineTo(size.width * 0.8725762, size.height * 0.03092784);
    path_2.lineTo(size.width * 0.8725762, size.height * 0.02229825);
    path_2.lineTo(size.width * 0.1717452, size.height * 0.02229825);
    path_2.lineTo(size.width * 0.1717452, size.height * 0.03092784);
    path_2.close();
    path_2.moveTo(size.width * 0.4240360, size.height * 0.8710481);
    path_2.lineTo(size.width * 0.4191163, size.height * 0.8649450);
    path_2.cubicTo(
      size.width * 0.4059197,
      size.height * 0.8813162,
      size.width * 0.3960305,
      size.height * 0.8935876,
      size.width * 0.3892687,
      size.height * 0.9019416,
    );
    path_2.cubicTo(
      size.width * 0.3858892,
      size.height * 0.9061203,
      size.width * 0.3833019,
      size.height * 0.9093093,
      size.width * 0.3814765,
      size.height * 0.9115361,
    );
    path_2.cubicTo(
      size.width * 0.3805651,
      size.height * 0.9126495,
      size.width * 0.3798560,
      size.height * 0.9135120,
      size.width * 0.3793380,
      size.height * 0.9141271,
    );
    path_2.cubicTo(
      size.width * 0.3787562,
      size.height * 0.9148247,
      size.width * 0.3785679,
      size.height * 0.9150378,
      size.width * 0.3785956,
      size.height * 0.9150069,
    );
    path_2.lineTo(size.width * 0.3831053, size.height * 0.9215773);
    path_2.lineTo(size.width * 0.3876177, size.height * 0.9281443);
    path_2.cubicTo(
      size.width * 0.3885623,
      size.height * 0.9271443,
      size.width * 0.3925069,
      size.height * 0.9223058,
      size.width * 0.3990886,
      size.height * 0.9141684,
    );
    path_2.cubicTo(
      size.width * 0.4058615,
      size.height * 0.9057973,
      size.width * 0.4157618,
      size.height * 0.8935155,
      size.width * 0.4289557,
      size.height * 0.8771478,
    );
    path_2.lineTo(size.width * 0.4240360, size.height * 0.8710481);
    path_2.close();
    path_2.moveTo(size.width * 0.3617978, size.height * 0.9347079);
    path_2.lineTo(size.width * 0.3617978, size.height * 0.9433368);
    path_2.cubicTo(
      size.width * 0.3622604,
      size.height * 0.9433368,
      size.width * 0.3625402,
      size.height * 0.9433368,
      size.width * 0.3626593,
      size.height * 0.9433368,
    );
    path_2.cubicTo(
      size.width * 0.3626759,
      size.height * 0.9433368,
      size.width * 0.3627341,
      size.height * 0.9433368,
      size.width * 0.3627922,
      size.height * 0.9433368,
    );
    path_2.cubicTo(
      size.width * 0.3628033,
      size.height * 0.9433368,
      size.width * 0.3628199,
      size.height * 0.9433368,
      size.width * 0.3628421,
      size.height * 0.9433333,
    );
    path_2.cubicTo(
      size.width * 0.3628587,
      size.height * 0.9433333,
      size.width * 0.3629086,
      size.height * 0.9433333,
      size.width * 0.3629695,
      size.height * 0.9433299,
    );
    path_2.cubicTo(
      size.width * 0.3630028,
      size.height * 0.9433299,
      size.width * 0.3630859,
      size.height * 0.9433230,
      size.width * 0.3631385,
      size.height * 0.9433196,
    );
    path_2.cubicTo(
      size.width * 0.3632355,
      size.height * 0.9433093,
      size.width * 0.3635568,
      size.height * 0.9432715,
      size.width * 0.3637812,
      size.height * 0.9432302,
    );
    path_2.cubicTo(
      size.width * 0.3649474,
      size.height * 0.9428729,
      size.width * 0.3696399,
      size.height * 0.9341478,
      size.width * 0.3652271,
      size.height * 0.9266667,
    );
    path_2.cubicTo(
      size.width * 0.3644765,
      size.height * 0.9263643,
      size.width * 0.3635152,
      size.height * 0.9261375,
      size.width * 0.3633269,
      size.height * 0.9261134,
    );
    path_2.cubicTo(
      size.width * 0.3632410,
      size.height * 0.9261031,
      size.width * 0.3631108,
      size.height * 0.9260928,
      size.width * 0.3630609,
      size.height * 0.9260893,
    );
    path_2.cubicTo(
      size.width * 0.3630305,
      size.height * 0.9260859,
      size.width * 0.3629778,
      size.height * 0.9260859,
      size.width * 0.3629557,
      size.height * 0.9260825,
    );
    path_2.cubicTo(
      size.width * 0.3629141,
      size.height * 0.9260825,
      size.width * 0.3628809,
      size.height * 0.9260790,
      size.width * 0.3628643,
      size.height * 0.9260790,
    );
    path_2.cubicTo(
      size.width * 0.3628310,
      size.height * 0.9260790,
      size.width * 0.3628061,
      size.height * 0.9260790,
      size.width * 0.3627950,
      size.height * 0.9260790,
    );
    path_2.cubicTo(
      size.width * 0.3627368,
      size.height * 0.9260756,
      size.width * 0.3626427,
      size.height * 0.9260756,
      size.width * 0.3625789,
      size.height * 0.9260756,
    );
    path_2.cubicTo(
      size.width * 0.3622465,
      size.height * 0.9260722,
      size.width * 0.3614903,
      size.height * 0.9260687,
      size.width * 0.3606731,
      size.height * 0.9260584,
    );
    path_2.cubicTo(
      size.width * 0.3598338,
      size.height * 0.9260447,
      size.width * 0.3590139,
      size.height * 0.9260309,
      size.width * 0.3585263,
      size.height * 0.9260103,
    );
    path_2.cubicTo(
      size.width * 0.3584072,
      size.height * 0.9260034,
      size.width * 0.3583463,
      size.height * 0.9260000,
      size.width * 0.3583269,
      size.height * 0.9260000,
    );
    path_2.cubicTo(
      size.width * 0.3583186,
      size.height * 0.9260000,
      size.width * 0.3583463,
      size.height * 0.9260000,
      size.width * 0.3583989,
      size.height * 0.9260069,
    );
    path_2.cubicTo(
      size.width * 0.3584211,
      size.height * 0.9260103,
      size.width * 0.3585956,
      size.height * 0.9260275,
      size.width * 0.3588283,
      size.height * 0.9260756,
    );
    path_2.cubicTo(
      size.width * 0.3589335,
      size.height * 0.9260962,
      size.width * 0.3592105,
      size.height * 0.9261546,
      size.width * 0.3595596,
      size.height * 0.9262749,
    );
    path_2.cubicTo(
      size.width * 0.3597341,
      size.height * 0.9263368,
      size.width * 0.3600499,
      size.height * 0.9264536,
      size.width * 0.3604294,
      size.height * 0.9266564,
    );
    path_2.cubicTo(
      size.width * 0.3606260,
      size.height * 0.9267629,
      size.width * 0.3608947,
      size.height * 0.9269210,
      size.width * 0.3611994,
      size.height * 0.9271409,
    );
    path_2.cubicTo(
      size.width * 0.3614931,
      size.height * 0.9273574,
      size.width * 0.3619252,
      size.height * 0.9277079,
      size.width * 0.3623850,
      size.height * 0.9282302,
    );
    path_2.cubicTo(
      size.width * 0.3628338,
      size.height * 0.9287491,
      size.width * 0.3634681,
      size.height * 0.9296082,
      size.width * 0.3639529,
      size.height * 0.9308729,
    );
    path_2.cubicTo(
      size.width * 0.3644709,
      size.height * 0.9322302,
      size.width * 0.3647562,
      size.height * 0.9338969,
      size.width * 0.3645651,
      size.height * 0.9356976,
    );
    path_2.cubicTo(
      size.width * 0.3643823,
      size.height * 0.9374364,
      size.width * 0.3638089,
      size.height * 0.9387766,
      size.width * 0.3632770,
      size.height * 0.9396770,
    );
    path_2.cubicTo(
      size.width * 0.3627618,
      size.height * 0.9405498,
      size.width * 0.3622161,
      size.height * 0.9411271,
      size.width * 0.3618476,
      size.height * 0.9414708,
    );
    path_2.cubicTo(
      size.width * 0.3611413,
      size.height * 0.9421271,
      size.width * 0.3605014,
      size.height * 0.9424605,
      size.width * 0.3602438,
      size.height * 0.9425876,
    );
    path_2.cubicTo(
      size.width * 0.3599252,
      size.height * 0.9427457,
      size.width * 0.3596593,
      size.height * 0.9428419,
      size.width * 0.3595069,
      size.height * 0.9428935,
    );
    path_2.cubicTo(
      size.width * 0.3591994,
      size.height * 0.9429966,
      size.width * 0.3589584,
      size.height * 0.9430481,
      size.width * 0.3588615,
      size.height * 0.9430687,
    );
    path_2.cubicTo(
      size.width * 0.3587396,
      size.height * 0.9430928,
      size.width * 0.3586482,
      size.height * 0.9431065,
      size.width * 0.3585983,
      size.height * 0.9431168,
    );
    path_2.cubicTo(
      size.width * 0.3585429,
      size.height * 0.9431237,
      size.width * 0.3585014,
      size.height * 0.9431271,
      size.width * 0.3584820,
      size.height * 0.9431306,
    );
    path_2.cubicTo(
      size.width * 0.3584598,
      size.height * 0.9431340,
      size.width * 0.3584460,
      size.height * 0.9431340,
      size.width * 0.3584432,
      size.height * 0.9431340,
    );
    path_2.lineTo(size.width * 0.3578892, size.height * 0.9345326);
    path_2.lineTo(size.width * 0.3573352, size.height * 0.9259313);
    path_2.cubicTo(
      size.width * 0.3572327,
      size.height * 0.9259416,
      size.width * 0.3570831,
      size.height * 0.9259588,
      size.width * 0.3569169,
      size.height * 0.9259828,
    );
    path_2.cubicTo(
      size.width * 0.3568504,
      size.height * 0.9259931,
      size.width * 0.3563989,
      size.height * 0.9260550,
      size.width * 0.3558643,
      size.height * 0.9262371,
    );
    path_2.cubicTo(
      size.width * 0.3557036,
      size.height * 0.9262887,
      size.width * 0.3554321,
      size.height * 0.9263883,
      size.width * 0.3551080,
      size.height * 0.9265464,
    );
    path_2.cubicTo(
      size.width * 0.3548449,
      size.height * 0.9266770,
      size.width * 0.3542022,
      size.height * 0.9270103,
      size.width * 0.3534931,
      size.height * 0.9276701,
    );
    path_2.cubicTo(
      size.width * 0.3531247,
      size.height * 0.9280137,
      size.width * 0.3525762,
      size.height * 0.9285945,
      size.width * 0.3520609,
      size.height * 0.9294674,
    );
    path_2.cubicTo(
      size.width * 0.3515263,
      size.height * 0.9303677,
      size.width * 0.3509557,
      size.height * 0.9317113,
      size.width * 0.3507729,
      size.height * 0.9334502,
    );
    path_2.cubicTo(
      size.width * 0.3505817,
      size.height * 0.9352543,
      size.width * 0.3508670,
      size.height * 0.9369210,
      size.width * 0.3513850,
      size.height * 0.9382784,
    );
    path_2.cubicTo(
      size.width * 0.3518698,
      size.height * 0.9395464,
      size.width * 0.3525042,
      size.height * 0.9404089,
      size.width * 0.3529557,
      size.height * 0.9409244,
    );
    path_2.cubicTo(
      size.width * 0.3537978,
      size.height * 0.9418866,
      size.width * 0.3546260,
      size.height * 0.9423505,
      size.width * 0.3549197,
      size.height * 0.9425052,
    );
    path_2.cubicTo(
      size.width * 0.3553019,
      size.height * 0.9427113,
      size.width * 0.3556233,
      size.height * 0.9428316,
      size.width * 0.3558033,
      size.height * 0.9428935,
    );
    path_2.cubicTo(
      size.width * 0.3561662,
      size.height * 0.9430206,
      size.width * 0.3564598,
      size.height * 0.9430825,
      size.width * 0.3565845,
      size.height * 0.9431065,
    );
    path_2.cubicTo(
      size.width * 0.3570277,
      size.height * 0.9431959,
      size.width * 0.3574349,
      size.height * 0.9432234,
      size.width * 0.3575125,
      size.height * 0.9432302,
    );
    path_2.cubicTo(
      size.width * 0.3576925,
      size.height * 0.9432405,
      size.width * 0.3578809,
      size.height * 0.9432509,
      size.width * 0.3580499,
      size.height * 0.9432577,
    );
    path_2.cubicTo(
      size.width * 0.3587230,
      size.height * 0.9432887,
      size.width * 0.3596953,
      size.height * 0.9433058,
      size.width * 0.3605263,
      size.height * 0.9433162,
    );
    path_2.cubicTo(
      size.width * 0.3613767,
      size.height * 0.9433265,
      size.width * 0.3621662,
      size.height * 0.9433333,
      size.width * 0.3624848,
      size.height * 0.9433333,
    );
    path_2.cubicTo(
      size.width * 0.3625845,
      size.height * 0.9433368,
      size.width * 0.3626011,
      size.height * 0.9433368,
      size.width * 0.3625817,
      size.height * 0.9433368,
    );
    path_2.cubicTo(
      size.width * 0.3625762,
      size.height * 0.9433368,
      size.width * 0.3625540,
      size.height * 0.9433333,
      size.width * 0.3625235,
      size.height * 0.9433333,
    );
    path_2.cubicTo(
      size.width * 0.3625097,
      size.height * 0.9433333,
      size.width * 0.3624765,
      size.height * 0.9433333,
      size.width * 0.3624349,
      size.height * 0.9433299,
    );
    path_2.cubicTo(
      size.width * 0.3624155,
      size.height * 0.9433299,
      size.width * 0.3623629,
      size.height * 0.9433265,
      size.width * 0.3623324,
      size.height * 0.9433230,
    );
    path_2.cubicTo(
      size.width * 0.3622853,
      size.height * 0.9433230,
      size.width * 0.3621524,
      size.height * 0.9433093,
      size.width * 0.3620693,
      size.height * 0.9433024,
    );
    path_2.cubicTo(
      size.width * 0.3618809,
      size.height * 0.9432784,
      size.width * 0.3609197,
      size.height * 0.9430481,
      size.width * 0.3601690,
      size.height * 0.9427457,
    );
    path_2.cubicTo(
      size.width * 0.3557562,
      size.height * 0.9352646,
      size.width * 0.3604488,
      size.height * 0.9265395,
      size.width * 0.3616122,
      size.height * 0.9261821,
    );
    path_2.cubicTo(
      size.width * 0.3618366,
      size.height * 0.9261443,
      size.width * 0.3621607,
      size.height * 0.9261031,
      size.width * 0.3622548,
      size.height * 0.9260962,
    );
    path_2.cubicTo(
      size.width * 0.3623075,
      size.height * 0.9260928,
      size.width * 0.3623906,
      size.height * 0.9260859,
      size.width * 0.3624238,
      size.height * 0.9260825,
    );
    path_2.cubicTo(
      size.width * 0.3624848,
      size.height * 0.9260825,
      size.width * 0.3625319,
      size.height * 0.9260790,
      size.width * 0.3625457,
      size.height * 0.9260790,
    );
    path_2.cubicTo(
      size.width * 0.3625679,
      size.height * 0.9260790,
      size.width * 0.3625845,
      size.height * 0.9260790,
      size.width * 0.3625928,
      size.height * 0.9260790,
    );
    path_2.cubicTo(
      size.width * 0.3626343,
      size.height * 0.9260790,
      size.width * 0.3626620,
      size.height * 0.9260790,
      size.width * 0.3626233,
      size.height * 0.9260790,
    );
    path_2.cubicTo(
      size.width * 0.3625291,
      size.height * 0.9260790,
      size.width * 0.3622770,
      size.height * 0.9260790,
      size.width * 0.3617978,
      size.height * 0.9260790,
    );
    path_2.lineTo(size.width * 0.3617978, size.height * 0.9347079);
    path_2.close();
    path_2.moveTo(size.width * 0.3831053, size.height * 0.9215773);
    path_2.lineTo(size.width * 0.3785956, size.height * 0.9150069);
    path_2.cubicTo(
      size.width * 0.3748199,
      size.height * 0.9189966,
      size.width * 0.3724903,
      size.height * 0.9217595,
      size.width * 0.3709806,
      size.height * 0.9234948,
    );
    path_2.cubicTo(
      size.width * 0.3692604,
      size.height * 0.9254708,
      size.width * 0.3692355,
      size.height * 0.9252921,
      size.width * 0.3695263,
      size.height * 0.9251443,
    );
    path_2.cubicTo(
      size.width * 0.3698172,
      size.height * 0.9249931,
      size.width * 0.3699003,
      size.height * 0.9251409,
      size.width * 0.3675596,
      size.height * 0.9252509,
    );
    path_2.cubicTo(
      size.width * 0.3655014,
      size.height * 0.9253505,
      size.width * 0.3622798,
      size.height * 0.9254399,
      size.width * 0.3573352,
      size.height * 0.9259313,
    );
    path_2.lineTo(size.width * 0.3578892, size.height * 0.9345326);
    path_2.lineTo(size.width * 0.3584432, size.height * 0.9431340);
    path_2.cubicTo(
      size.width * 0.3630332,
      size.height * 0.9426804,
      size.width * 0.3659086,
      size.height * 0.9426048,
      size.width * 0.3680942,
      size.height * 0.9424983,
    );
    path_2.cubicTo(
      size.width * 0.3699917,
      size.height * 0.9424089,
      size.width * 0.3724571,
      size.height * 0.9423196,
      size.width * 0.3748504,
      size.height * 0.9410893,
    );
    path_2.cubicTo(
      size.width * 0.3772438,
      size.height * 0.9398591,
      size.width * 0.3790388,
      size.height * 0.9377595,
      size.width * 0.3804321,
      size.height * 0.9361581,
    );
    path_2.cubicTo(
      size.width * 0.3820360,
      size.height * 0.9343162,
      size.width * 0.3841136,
      size.height * 0.9318488,
      size.width * 0.3876177,
      size.height * 0.9281443,
    );
    path_2.lineTo(size.width * 0.3831053, size.height * 0.9215773);
    path_2.close();
    path_2.moveTo(size.width * 0.6348255, size.height * 0.9347079);
    path_2.lineTo(size.width * 0.6348255, size.height * 0.9260790);
    path_2.cubicTo(
      size.width * 0.6347701,
      size.height * 0.9260790,
      size.width * 0.6347313,
      size.height * 0.9260790,
      size.width * 0.6347036,
      size.height * 0.9260790,
    );
    path_2.cubicTo(
      size.width * 0.6346704,
      size.height * 0.9260790,
      size.width * 0.6346676,
      size.height * 0.9260790,
      size.width * 0.6346787,
      size.height * 0.9260790,
    );
    path_2.cubicTo(
      size.width * 0.6346842,
      size.height * 0.9260790,
      size.width * 0.6346953,
      size.height * 0.9260790,
      size.width * 0.6347119,
      size.height * 0.9260790,
    );
    path_2.cubicTo(
      size.width * 0.6347230,
      size.height * 0.9260790,
      size.width * 0.6347618,
      size.height * 0.9260790,
      size.width * 0.6348144,
      size.height * 0.9260825,
    );
    path_2.cubicTo(
      size.width * 0.6348366,
      size.height * 0.9260825,
      size.width * 0.6348920,
      size.height * 0.9260825,
      size.width * 0.6349612,
      size.height * 0.9260893,
    );
    path_2.cubicTo(
      size.width * 0.6349972,
      size.height * 0.9260893,
      size.width * 0.6350582,
      size.height * 0.9260962,
      size.width * 0.6351330,
      size.height * 0.9261031,
    );
    path_2.cubicTo(
      size.width * 0.6351662,
      size.height * 0.9261031,
      size.width * 0.6352438,
      size.height * 0.9261134,
      size.width * 0.6352881,
      size.height * 0.9261168,
    );
    path_2.cubicTo(
      size.width * 0.6353435,
      size.height * 0.9261237,
      size.width * 0.6354737,
      size.height * 0.9261443,
      size.width * 0.6355512,
      size.height * 0.9261546,
    );
    path_2.cubicTo(
      size.width * 0.6356593,
      size.height * 0.9261753,
      size.width * 0.6359335,
      size.height * 0.9262337,
      size.width * 0.6360997,
      size.height * 0.9262749,
    );
    path_2.cubicTo(
      size.width * 0.6363878,
      size.height * 0.9263608,
      size.width * 0.6372632,
      size.height * 0.9267285,
      size.width * 0.6378338,
      size.height * 0.9270550,
    );
    path_2.cubicTo(
      size.width * 0.6393241,
      size.height * 0.9283540,
      size.width * 0.6415734,
      size.height * 0.9346426,
      size.width * 0.6405457,
      size.height * 0.9392199,
    );
    path_2.cubicTo(
      size.width * 0.6394100,
      size.height * 0.9409622,
      size.width * 0.6373878,
      size.height * 0.9426220,
      size.width * 0.6368033,
      size.height * 0.9429003,
    );
    path_2.cubicTo(
      size.width * 0.6365208,
      size.height * 0.9430069,
      size.width * 0.6360720,
      size.height * 0.9431478,
      size.width * 0.6359058,
      size.height * 0.9431890,
    );
    path_2.cubicTo(
      size.width * 0.6357978,
      size.height * 0.9432131,
      size.width * 0.6356150,
      size.height * 0.9432474,
      size.width * 0.6355402,
      size.height * 0.9432612,
    );
    path_2.cubicTo(
      size.width * 0.6354848,
      size.height * 0.9432680,
      size.width * 0.6353850,
      size.height * 0.9432852,
      size.width * 0.6353435,
      size.height * 0.9432887,
    );
    path_2.cubicTo(
      size.width * 0.6353075,
      size.height * 0.9432955,
      size.width * 0.6352465,
      size.height * 0.9433024,
      size.width * 0.6352188,
      size.height * 0.9433058,
    );
    path_2.cubicTo(
      size.width * 0.6351579,
      size.height * 0.9433093,
      size.width * 0.6351080,
      size.height * 0.9433162,
      size.width * 0.6350776,
      size.height * 0.9433196,
    );
    path_2.cubicTo(
      size.width * 0.6350443,
      size.height * 0.9433196,
      size.width * 0.6350166,
      size.height * 0.9433230,
      size.width * 0.6349945,
      size.height * 0.9433230,
    );
    path_2.cubicTo(
      size.width * 0.6349584,
      size.height * 0.9433265,
      size.width * 0.6349252,
      size.height * 0.9433299,
      size.width * 0.6349086,
      size.height * 0.9433299,
    );
    path_2.cubicTo(
      size.width * 0.6348753,
      size.height * 0.9433299,
      size.width * 0.6348504,
      size.height * 0.9433333,
      size.width * 0.6348421,
      size.height * 0.9433333,
    );
    path_2.cubicTo(
      size.width * 0.6348227,
      size.height * 0.9433333,
      size.width * 0.6348089,
      size.height * 0.9433333,
      size.width * 0.6348144,
      size.height * 0.9433333,
    );
    path_2.cubicTo(
      size.width * 0.6348255,
      size.height * 0.9433333,
      size.width * 0.6348283,
      size.height * 0.9433333,
      size.width * 0.6348643,
      size.height * 0.9433333,
    );
    path_2.cubicTo(
      size.width * 0.6348947,
      size.height * 0.9433299,
      size.width * 0.6349307,
      size.height * 0.9433299,
      size.width * 0.6349695,
      size.height * 0.9433299,
    );
    path_2.cubicTo(
      size.width * 0.6350471,
      size.height * 0.9433265,
      size.width * 0.6351607,
      size.height * 0.9433230,
      size.width * 0.6352853,
      size.height * 0.9433162,
    );
    path_2.cubicTo(
      size.width * 0.6353463,
      size.height * 0.9433093,
      size.width * 0.6354238,
      size.height * 0.9433058,
      size.width * 0.6355125,
      size.height * 0.9432990,
    );
    path_2.cubicTo(
      size.width * 0.6355568,
      size.height * 0.9432955,
      size.width * 0.6356094,
      size.height * 0.9432921,
      size.width * 0.6356676,
      size.height * 0.9432852,
    );
    path_2.cubicTo(
      size.width * 0.6357230,
      size.height * 0.9432784,
      size.width * 0.6357978,
      size.height * 0.9432715,
      size.width * 0.6358809,
      size.height * 0.9432577,
    );
    path_2.cubicTo(
      size.width * 0.6359612,
      size.height * 0.9432474,
      size.width * 0.6360831,
      size.height * 0.9432302,
      size.width * 0.6362299,
      size.height * 0.9432027,
    );
    path_2.cubicTo(
      size.width * 0.6363047,
      size.height * 0.9431890,
      size.width * 0.6364017,
      size.height * 0.9431684,
      size.width * 0.6365125,
      size.height * 0.9431409,
    );
    path_2.cubicTo(
      size.width * 0.6366205,
      size.height * 0.9431134,
      size.width * 0.6367729,
      size.height * 0.9430722,
      size.width * 0.6369529,
      size.height * 0.9430137,
    );
    path_2.cubicTo(
      size.width * 0.6370443,
      size.height * 0.9429828,
      size.width * 0.6371551,
      size.height * 0.9429450,
      size.width * 0.6372825,
      size.height * 0.9428969,
    );
    path_2.cubicTo(
      size.width * 0.6374044,
      size.height * 0.9428454,
      size.width * 0.6375623,
      size.height * 0.9427801,
      size.width * 0.6377368,
      size.height * 0.9426942,
    );
    path_2.cubicTo(
      size.width * 0.6379114,
      size.height * 0.9426082,
      size.width * 0.6381385,
      size.height * 0.9424880,
      size.width * 0.6383989,
      size.height * 0.9423196,
    );
    path_2.cubicTo(
      size.width * 0.6385291,
      size.height * 0.9422337,
      size.width * 0.6386814,
      size.height * 0.9421306,
      size.width * 0.6388449,
      size.height * 0.9420069,
    );
    path_2.cubicTo(
      size.width * 0.6390055,
      size.height * 0.9418797,
      size.width * 0.6391939,
      size.height * 0.9417251,
      size.width * 0.6393934,
      size.height * 0.9415361,
    );
    path_2.cubicTo(
      size.width * 0.6395928,
      size.height * 0.9413505,
      size.width * 0.6398227,
      size.height * 0.9411134,
      size.width * 0.6400609,
      size.height * 0.9408213,
    );
    path_2.cubicTo(
      size.width * 0.6402992,
      size.height * 0.9405292,
      size.width * 0.6405651,
      size.height * 0.9401649,
      size.width * 0.6408255,
      size.height * 0.9397148,
    );
    path_2.cubicTo(
      size.width * 0.6410886,
      size.height * 0.9392646,
      size.width * 0.6413546,
      size.height * 0.9387148,
      size.width * 0.6415817,
      size.height * 0.9380584,
    );
    path_2.cubicTo(
      size.width * 0.6418089,
      size.height * 0.9373986,
      size.width * 0.6419889,
      size.height * 0.9366529,
      size.width * 0.6420776,
      size.height * 0.9358282,
    );
    path_2.cubicTo(
      size.width * 0.6421690,
      size.height * 0.9350034,
      size.width * 0.6421634,
      size.height * 0.9341684,
      size.width * 0.6420637,
      size.height * 0.9333540,
    );
    path_2.cubicTo(
      size.width * 0.6419612,
      size.height * 0.9325464,
      size.width * 0.6417784,
      size.height * 0.9318179,
      size.width * 0.6415512,
      size.height * 0.9311821,
    );
    path_2.cubicTo(
      size.width * 0.6413269,
      size.height * 0.9305498,
      size.width * 0.6410665,
      size.height * 0.9300206,
      size.width * 0.6408144,
      size.height * 0.9295911,
    );
    path_2.cubicTo(
      size.width * 0.6405623,
      size.height * 0.9291615,
      size.width * 0.6403075,
      size.height * 0.9288076,
      size.width * 0.6400803,
      size.height * 0.9285292,
    );
    path_2.cubicTo(
      size.width * 0.6398532,
      size.height * 0.9282509,
      size.width * 0.6396343,
      size.height * 0.9280206,
      size.width * 0.6394460,
      size.height * 0.9278385,
    );
    path_2.cubicTo(
      size.width * 0.6392548,
      size.height * 0.9276529,
      size.width * 0.6390748,
      size.height * 0.9275017,
      size.width * 0.6389197,
      size.height * 0.9273814,
    );
    path_2.cubicTo(
      size.width * 0.6386150,
      size.height * 0.9271409,
      size.width * 0.6383463,
      size.height * 0.9269691,
      size.width * 0.6381468,
      size.height * 0.9268522,
    );
    path_2.cubicTo(
      size.width * 0.6379418,
      size.height * 0.9267320,
      size.width * 0.6377618,
      size.height * 0.9266426,
      size.width * 0.6376205,
      size.height * 0.9265739,
    );
    path_2.cubicTo(
      size.width * 0.6374765,
      size.height * 0.9265086,
      size.width * 0.6373518,
      size.height * 0.9264570,
      size.width * 0.6372465,
      size.height * 0.9264158,
    );
    path_2.cubicTo(
      size.width * 0.6370443,
      size.height * 0.9263368,
      size.width * 0.6368726,
      size.height * 0.9262852,
      size.width * 0.6367562,
      size.height * 0.9262509,
    );
    path_2.cubicTo(
      size.width * 0.6366343,
      size.height * 0.9262131,
      size.width * 0.6365291,
      size.height * 0.9261890,
      size.width * 0.6364460,
      size.height * 0.9261684,
    );
    path_2.cubicTo(
      size.width * 0.6362881,
      size.height * 0.9261306,
      size.width * 0.6361551,
      size.height * 0.9261065,
      size.width * 0.6360665,
      size.height * 0.9260928,
    );
    path_2.cubicTo(
      size.width * 0.6359723,
      size.height * 0.9260756,
      size.width * 0.6358920,
      size.height * 0.9260653,
      size.width * 0.6358227,
      size.height * 0.9260550,
    );
    path_2.cubicTo(
      size.width * 0.6356925,
      size.height * 0.9260378,
      size.width * 0.6355706,
      size.height * 0.9260241,
      size.width * 0.6354654,
      size.height * 0.9260137,
    );
    path_2.cubicTo(
      size.width * 0.6353573,
      size.height * 0.9260034,
      size.width * 0.6352465,
      size.height * 0.9259931,
      size.width * 0.6351302,
      size.height * 0.9259828,
    );
    path_2.lineTo(size.width * 0.6346870, size.height * 0.9345945);
    path_2.lineTo(size.width * 0.6342410, size.height * 0.9432062);
    path_2.cubicTo(
      size.width * 0.6343047,
      size.height * 0.9432131,
      size.width * 0.6343407,
      size.height * 0.9432165,
      size.width * 0.6343573,
      size.height * 0.9432165,
    );
    path_2.cubicTo(
      size.width * 0.6343795,
      size.height * 0.9432199,
      size.width * 0.6343546,
      size.height * 0.9432165,
      size.width * 0.6343019,
      size.height * 0.9432096,
    );
    path_2.cubicTo(
      size.width * 0.6342770,
      size.height * 0.9432062,
      size.width * 0.6342271,
      size.height * 0.9431993,
      size.width * 0.6341634,
      size.height * 0.9431890,
    );
    path_2.cubicTo(
      size.width * 0.6341053,
      size.height * 0.9431787,
      size.width * 0.6339945,
      size.height * 0.9431581,
      size.width * 0.6338560,
      size.height * 0.9431271,
    );
    path_2.cubicTo(
      size.width * 0.6337867,
      size.height * 0.9431100,
      size.width * 0.6336898,
      size.height * 0.9430859,
      size.width * 0.6335734,
      size.height * 0.9430515,
    );
    path_2.cubicTo(
      size.width * 0.6334626,
      size.height * 0.9430206,
      size.width * 0.6332992,
      size.height * 0.9429691,
      size.width * 0.6331025,
      size.height * 0.9428935,
    );
    path_2.cubicTo(
      size.width * 0.6330028,
      size.height * 0.9428522,
      size.width * 0.6328781,
      size.height * 0.9428007,
      size.width * 0.6327368,
      size.height * 0.9427354,
    );
    path_2.cubicTo(
      size.width * 0.6325983,
      size.height * 0.9426701,
      size.width * 0.6324211,
      size.height * 0.9425842,
      size.width * 0.6322161,
      size.height * 0.9424639,
    );
    path_2.cubicTo(
      size.width * 0.6320194,
      size.height * 0.9423471,
      size.width * 0.6317507,
      size.height * 0.9421787,
      size.width * 0.6314460,
      size.height * 0.9419381,
    );
    path_2.cubicTo(
      size.width * 0.6312936,
      size.height * 0.9418144,
      size.width * 0.6311136,
      size.height * 0.9416632,
      size.width * 0.6309252,
      size.height * 0.9414811,
    );
    path_2.cubicTo(
      size.width * 0.6307341,
      size.height * 0.9412990,
      size.width * 0.6305180,
      size.height * 0.9410722,
      size.width * 0.6302909,
      size.height * 0.9407904,
    );
    path_2.cubicTo(
      size.width * 0.6300637,
      size.height * 0.9405120,
      size.width * 0.6298089,
      size.height * 0.9401615,
      size.width * 0.6295568,
      size.height * 0.9397320,
    );
    path_2.cubicTo(
      size.width * 0.6293047,
      size.height * 0.9393024,
      size.width * 0.6290443,
      size.height * 0.9387732,
      size.width * 0.6288199,
      size.height * 0.9381409,
    );
    path_2.cubicTo(
      size.width * 0.6285956,
      size.height * 0.9375052,
      size.width * 0.6284100,
      size.height * 0.9367801,
      size.width * 0.6283102,
      size.height * 0.9359691,
    );
    path_2.cubicTo(
      size.width * 0.6282105,
      size.height * 0.9351546,
      size.width * 0.6282022,
      size.height * 0.9343230,
      size.width * 0.6282936,
      size.height * 0.9334983,
    );
    path_2.cubicTo(
      size.width * 0.6284765,
      size.height * 0.9318247,
      size.width * 0.6290194,
      size.height * 0.9305189,
      size.width * 0.6295457,
      size.height * 0.9296151,
    );
    path_2.cubicTo(
      size.width * 0.6298061,
      size.height * 0.9291649,
      size.width * 0.6300720,
      size.height * 0.9288007,
      size.width * 0.6303102,
      size.height * 0.9285086,
    );
    path_2.cubicTo(
      size.width * 0.6305485,
      size.height * 0.9282199,
      size.width * 0.6307756,
      size.height * 0.9279828,
      size.width * 0.6309751,
      size.height * 0.9277938,
    );
    path_2.cubicTo(
      size.width * 0.6313657,
      size.height * 0.9274296,
      size.width * 0.6317175,
      size.height * 0.9271753,
      size.width * 0.6319668,
      size.height * 0.9270137,
    );
    path_2.cubicTo(
      size.width * 0.6322271,
      size.height * 0.9268488,
      size.width * 0.6324515,
      size.height * 0.9267285,
      size.width * 0.6326233,
      size.height * 0.9266426,
    );
    path_2.cubicTo(
      size.width * 0.6327978,
      size.height * 0.9265567,
      size.width * 0.6329529,
      size.height * 0.9264914,
      size.width * 0.6330748,
      size.height * 0.9264433,
    );
    path_2.cubicTo(
      size.width * 0.6331967,
      size.height * 0.9263952,
      size.width * 0.6333047,
      size.height * 0.9263574,
      size.width * 0.6333961,
      size.height * 0.9263299,
    );
    path_2.cubicTo(
      size.width * 0.6335706,
      size.height * 0.9262715,
      size.width * 0.6337175,
      size.height * 0.9262337,
      size.width * 0.6338199,
      size.height * 0.9262062,
    );
    path_2.cubicTo(
      size.width * 0.6339252,
      size.height * 0.9261821,
      size.width * 0.6340139,
      size.height * 0.9261615,
      size.width * 0.6340803,
      size.height * 0.9261512,
    );
    path_2.cubicTo(
      size.width * 0.6342105,
      size.height * 0.9261237,
      size.width * 0.6343130,
      size.height * 0.9261100,
      size.width * 0.6343740,
      size.height * 0.9261031,
    );
    path_2.cubicTo(
      size.width * 0.6344903,
      size.height * 0.9260859,
      size.width * 0.6345762,
      size.height * 0.9260790,
      size.width * 0.6345983,
      size.height * 0.9260756,
    );
    path_2.cubicTo(
      size.width * 0.6346177,
      size.height * 0.9260756,
      size.width * 0.6346288,
      size.height * 0.9260756,
      size.width * 0.6346371,
      size.height * 0.9260756,
    );
    path_2.cubicTo(
      size.width * 0.6346454,
      size.height * 0.9260722,
      size.width * 0.6346482,
      size.height * 0.9260722,
      size.width * 0.6346510,
      size.height * 0.9260722,
    );
    path_2.cubicTo(
      size.width * 0.6346510,
      size.height * 0.9260722,
      size.width * 0.6346454,
      size.height * 0.9260722,
      size.width * 0.6346343,
      size.height * 0.9260756,
    );
    path_2.cubicTo(
      size.width * 0.6346233,
      size.height * 0.9260756,
      size.width * 0.6346066,
      size.height * 0.9260756,
      size.width * 0.6345900,
      size.height * 0.9260756,
    );
    path_2.cubicTo(
      size.width * 0.6345429,
      size.height * 0.9260756,
      size.width * 0.6345319,
      size.height * 0.9260756,
      size.width * 0.6344709,
      size.height * 0.9260790,
    );
    path_2.cubicTo(
      size.width * 0.6344626,
      size.height * 0.9260790,
      size.width * 0.6344377,
      size.height * 0.9260790,
      size.width * 0.6344100,
      size.height * 0.9260825,
    );
    path_2.cubicTo(
      size.width * 0.6343961,
      size.height * 0.9260825,
      size.width * 0.6343684,
      size.height * 0.9260825,
      size.width * 0.6343324,
      size.height * 0.9260859,
    );
    path_2.cubicTo(
      size.width * 0.6343130,
      size.height * 0.9260859,
      size.width * 0.6342798,
      size.height * 0.9260859,
      size.width * 0.6342410,
      size.height * 0.9260893,
    );
    path_2.cubicTo(
      size.width * 0.6342133,
      size.height * 0.9260928,
      size.width * 0.6341247,
      size.height * 0.9260997,
      size.width * 0.6340139,
      size.height * 0.9261100,
    );
    path_2.cubicTo(
      size.width * 0.6339640,
      size.height * 0.9261168,
      size.width * 0.6338449,
      size.height * 0.9261271,
      size.width * 0.6336953,
      size.height * 0.9261546,
    );
    path_2.cubicTo(
      size.width * 0.6336205,
      size.height * 0.9261684,
      size.width * 0.6334349,
      size.height * 0.9262027,
      size.width * 0.6333269,
      size.height * 0.9262268,
    );
    path_2.cubicTo(
      size.width * 0.6331634,
      size.height * 0.9262680,
      size.width * 0.6327119,
      size.height * 0.9264089,
      size.width * 0.6324294,
      size.height * 0.9265155,
    );
    path_2.cubicTo(
      size.width * 0.6318476,
      size.height * 0.9267904,
      size.width * 0.6298255,
      size.height * 0.9284502,
      size.width * 0.6286870,
      size.height * 0.9301959,
    );
    path_2.cubicTo(
      size.width * 0.6276620,
      size.height * 0.9347698,
      size.width * 0.6299086,
      size.height * 0.9410619,
      size.width * 0.6314017,
      size.height * 0.9423574,
    );
    path_2.cubicTo(
      size.width * 0.6319695,
      size.height * 0.9426873,
      size.width * 0.6328449,
      size.height * 0.9430515,
      size.width * 0.6331330,
      size.height * 0.9431375,
    );
    path_2.cubicTo(
      size.width * 0.6332992,
      size.height * 0.9431821,
      size.width * 0.6335762,
      size.height * 0.9432405,
      size.width * 0.6336842,
      size.height * 0.9432577,
    );
    path_2.cubicTo(
      size.width * 0.6337590,
      size.height * 0.9432715,
      size.width * 0.6338920,
      size.height * 0.9432887,
      size.width * 0.6339474,
      size.height * 0.9432955,
    );
    path_2.cubicTo(
      size.width * 0.6339889,
      size.height * 0.9433024,
      size.width * 0.6340665,
      size.height * 0.9433093,
      size.width * 0.6341025,
      size.height * 0.9433127,
    );
    path_2.cubicTo(
      size.width * 0.6341773,
      size.height * 0.9433196,
      size.width * 0.6342382,
      size.height * 0.9433230,
      size.width * 0.6342742,
      size.height * 0.9433265,
    );
    path_2.cubicTo(
      size.width * 0.6343435,
      size.height * 0.9433299,
      size.width * 0.6344017,
      size.height * 0.9433333,
      size.width * 0.6344266,
      size.height * 0.9433333,
    );
    path_2.cubicTo(
      size.width * 0.6344792,
      size.height * 0.9433368,
      size.width * 0.6345208,
      size.height * 0.9433368,
      size.width * 0.6345374,
      size.height * 0.9433368,
    );
    path_2.cubicTo(
      size.width * 0.6345568,
      size.height * 0.9433368,
      size.width * 0.6345734,
      size.height * 0.9433368,
      size.width * 0.6345845,
      size.height * 0.9433368,
    );
    path_2.cubicTo(
      size.width * 0.6346233,
      size.height * 0.9433368,
      size.width * 0.6346648,
      size.height * 0.9433368,
      size.width * 0.6346925,
      size.height * 0.9433368,
    );
    path_2.cubicTo(
      size.width * 0.6347285,
      size.height * 0.9433368,
      size.width * 0.6347729,
      size.height * 0.9433368,
      size.width * 0.6348255,
      size.height * 0.9433368,
    );
    path_2.lineTo(size.width * 0.6348255, size.height * 0.9347079);
    path_2.close();
    path_2.moveTo(size.width * 0.5719058, size.height * 0.8760790);
    path_2.lineTo(size.width * 0.5669861, size.height * 0.8821821);
    path_2.cubicTo(
      size.width * 0.5903130,
      size.height * 0.9111203,
      size.width * 0.6023657,
      size.height * 0.9260825,
      size.width * 0.6036537,
      size.height * 0.9274880,
    );
    path_2.lineTo(size.width * 0.6082465, size.height * 0.9210103);
    path_2.lineTo(size.width * 0.6128421, size.height * 0.9145292);
    path_2.cubicTo(
      size.width * 0.6128698,
      size.height * 0.9145601,
      size.width * 0.6127091,
      size.height * 0.9143746,
      size.width * 0.6121994,
      size.height * 0.9137595,
    );
    path_2.cubicTo(
      size.width * 0.6117479,
      size.height * 0.9132165,
      size.width * 0.6111247,
      size.height * 0.9124536,
      size.width * 0.6103186,
      size.height * 0.9114674,
    );
    path_2.cubicTo(
      size.width * 0.6087091,
      size.height * 0.9094914,
      size.width * 0.6064127,
      size.height * 0.9066598,
      size.width * 0.6034100,
      size.height * 0.9029416,
    );
    path_2.cubicTo(
      size.width * 0.5974017,
      size.height * 0.8955052,
      size.width * 0.5885845,
      size.height * 0.8845704,
      size.width * 0.5768255,
      size.height * 0.8699794,
    );
    path_2.lineTo(size.width * 0.5719058, size.height * 0.8760790);
    path_2.close();
    path_2.moveTo(size.width * 0.6346870, size.height * 0.9345945);
    path_2.lineTo(size.width * 0.6351302, size.height * 0.9259828);
    path_2.cubicTo(
      size.width * 0.6300360,
      size.height * 0.9255773,
      size.width * 0.6266510,
      size.height * 0.9255395,
      size.width * 0.6245180,
      size.height * 0.9254639,
    );
    path_2.cubicTo(
      size.width * 0.6221136,
      size.height * 0.9253780,
      size.width * 0.6220831,
      size.height * 0.9252096,
      size.width * 0.6222964,
      size.height * 0.9253196,
    );
    path_2.cubicTo(
      size.width * 0.6225097,
      size.height * 0.9254296,
      size.width * 0.6223906,
      size.height * 0.9255189,
      size.width * 0.6206427,
      size.height * 0.9234742,
    );
    path_2.cubicTo(
      size.width * 0.6190914,
      size.height * 0.9216564,
      size.width * 0.6166759,
      size.height * 0.9187113,
      size.width * 0.6128421,
      size.height * 0.9145292,
    );
    path_2.lineTo(size.width * 0.6082465, size.height * 0.9210103);
    path_2.lineTo(size.width * 0.6036537, size.height * 0.9274880);
    path_2.cubicTo(
      size.width * 0.6072465,
      size.height * 0.9314089,
      size.width * 0.6093823,
      size.height * 0.9340206,
      size.width * 0.6110942,
      size.height * 0.9360275,
    );
    path_2.cubicTo(
      size.width * 0.6126094,
      size.height * 0.9378007,
      size.width * 0.6144737,
      size.height * 0.9399794,
      size.width * 0.6169723,
      size.height * 0.9412646,
    );
    path_2.cubicTo(
      size.width * 0.6194709,
      size.height * 0.9425498,
      size.width * 0.6220305,
      size.height * 0.9426392,
      size.width * 0.6241136,
      size.height * 0.9427148,
    );
    path_2.cubicTo(
      size.width * 0.6264681,
      size.height * 0.9428007,
      size.width * 0.6294654,
      size.height * 0.9428282,
      size.width * 0.6342410,
      size.height * 0.9432062,
    );
    path_2.lineTo(size.width * 0.6346870, size.height * 0.9345945);
    path_2.close();

    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = Colors.white.withOpacity(0.3);
    canvas.drawPath(path_2, paint2Fill);

    Path path_3 = Path();
    path_3.moveTo(size.width * 0.1163435, size.height * 0.09367285);
    path_3.lineTo(size.width * 0.1163435, size.height * 0.03780069);
    path_3.lineTo(size.width * 0.2309407, size.height * 0.03780069);
    path_3.lineTo(size.width * 0.2309407, size.height * 0.07727904);
    path_3.lineTo(size.width * 0.2139634, size.height * 0.1026581);
    path_3.lineTo(size.width * 0.1984008, size.height * 0.1280371);
    path_3.lineTo(size.width * 0.1440443, size.height * 0.1280371);
    path_3.cubicTo(
      size.width * 0.1309861,
      size.height * 0.1280371,
      size.width * 0.1244568,
      size.height * 0.1280371,
      size.width * 0.1204003,
      size.height * 0.1230048,
    );
    path_3.cubicTo(
      size.width * 0.1163435,
      size.height * 0.1179722,
      size.width * 0.1163435,
      size.height * 0.1098725,
      size.width * 0.1163435,
      size.height * 0.09367285,
    );
    path_3.close();

    Paint paint3Fill = Paint()..style = PaintingStyle.fill;
    paint3Fill.color = Color(0xffE92929).withOpacity(1.0);
    canvas.drawPath(path_3, paint3Fill);

    Path path_4 = Path();
    path_4.moveTo(size.width * 0.1984072, size.height * 0.1280375);
    path_4.lineTo(size.width * 0.1984072, size.height * 0.08415223);
    path_4.cubicTo(
      size.width * 0.1984072,
      size.height * 0.08035636,
      size.width * 0.2008875,
      size.height * 0.07727938,
      size.width * 0.2039474,
      size.height * 0.07727938,
    );
    path_4.lineTo(size.width * 0.2309471, size.height * 0.07727938);
    path_4.lineTo(size.width * 0.2139698, size.height * 0.1026584);
    path_4.lineTo(size.width * 0.1984072, size.height * 0.1280375);
    path_4.close();

    Paint paint4Fill = Paint()..style = PaintingStyle.fill;
    paint4Fill.color = Color(0xffD98989).withOpacity(1.0);
    canvas.drawPath(path_4, paint4Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
