import 'package:Edifarm/shared/Theme_App.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextDiag extends StatelessWidget {
  final String titleTxt;
  final String subTxt;
  final AnimationController? animationController;
  final Animation<double>? animation;

  const TextDiag(
      {Key? key,
      this.titleTxt: "",
      this.subTxt: "",
      this.animationController,
      this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 30 * (1.0 - animation!.value), 0.0),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        titleTxt,
                        textAlign: TextAlign.left,
                        style: GoogleFonts.montserrat(
                            color: AppTheme.green,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),

                        // TextStyle(
                        //   fontFamily: FitnessAppTheme.fontName,
                        //   fontWeight: FontWeight.w500,
                        //   fontSize: 18,
                        //   letterSpacing: 0.5,
                        //   color: FitnessAppTheme.lightText,
                        // ),

                        // style: TextStyle(
                        //   fontFamily: AppTheme.fontName,
                        //   fontWeight: FontWeight.w500,
                        //   fontSize: 18,
                        //   letterSpacing: 0.5,
                        //   color: AppTheme.lightText,
                        // ),
                      ),
                    ),
                    InkWell(
                      highlightColor: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Row(
                          children: <Widget>[
                            TextButton(
                              child: Text(
                                subTxt,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: AppTheme.fontName,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12,
                                  letterSpacing: 0.5,
                                  color: AppTheme.splash,
                                ),
                              ),
                              onPressed: (() {
                                Navigator.pushNamed(context, '/act');
                              }),
                            )
                            // SizedBox(
                            //   height: 38,
                            //   width: 26,
                            //   child: Icon(
                            //     Icons.arrow_forward,
                            //     color: FitnessAppTheme.darkText,
                            //     size: 18,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
