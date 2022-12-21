// import 'package:Edifarm/aktivitas/activity_data.dart';
// import 'package:Edifarm/shared/Theme_App.dart';
// import 'package:flutter/material.dart';
// import 'package:dotted_border/dotted_border.dart';

// class ListViewActivity extends StatefulWidget {
//   const ListViewActivity(
//       {Key? key, this.mainScreenAnimationController, this.mainScreenAnimation})
//       : super(key: key);

//   final AnimationController? mainScreenAnimationController;
//   final Animation<double>? mainScreenAnimation;
//   @override
//   _ListViewActivityState createState() => _ListViewActivityState();
// }

// class _ListViewActivityState extends State<ListViewActivity>
//     with TickerProviderStateMixin {
//   AnimationController? animationController;
//   List<ActListData> tabactList = ActListData.tabactList;
//   bool iri = false;
//   bool pup = false;

//   @override
//   void initState() {
//     animationController = AnimationController(
//         duration: const Duration(milliseconds: 200), vsync: this);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     animationController?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: widget.mainScreenAnimationController!,
//       builder: (BuildContext context, Widget? child) {
//         return FadeTransition(
//           opacity: widget.mainScreenAnimation!,
//           child: Transform(
//             transform: Matrix4.translationValues(
//                 0.0, 30 * (1.0 - widget.mainScreenAnimation!.value), 0.0),
//             child: AspectRatio(
//               aspectRatio: 1.0,
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 8.0, right: 8),
//                 child: GridView(
//                   padding: const EdgeInsets.only(
//                       left: 16, right: 16, top: 16, bottom: 16),
//                   physics: const BouncingScrollPhysics(),
//                   scrollDirection: Axis.vertical,
//                   children: List<Widget>.generate(
//                     tabactList.length,
//                     (int index) {
//                       final int count = tabactList.length;
//                       final Animation<double> animation =
//                           Tween<double>(begin: 0.0, end: 1.0).animate(
//                         CurvedAnimation(
//                           parent: animationController!,
//                           curve: Interval((1 / count) * index, 1.0,
//                               curve: Curves.fastOutSlowIn),
//                         ),
//                       );
//                       animationController?.forward();
//                       return AreaView(
//                         tabactList: tabactList[index],
//                         animation: animation,
//                         animationController: animationController!,
//                       );
//                     },
//                   ),
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 1,
//                     mainAxisSpacing: 25,
//                     crossAxisSpacing: 10,
//                     childAspectRatio: 3 / 1,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// class AreaView extends StatelessWidget {
//   const AreaView({
//     Key? key,
//     this.tabactList,
//     this.animationController,
//     this.animation,
//   }) : super(key: key);

//   final ActListData? tabactList;
//   final AnimationController? animationController;
//   final Animation<double>? animation;
//   final bool isi = true;

//   // cek(){
//   //   set
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//         animation: animationController!,
//         builder: (BuildContext context, Widget? child) {
//           return FadeTransition(
//             opacity: animation!,
//             child: Transform(
//               transform: Matrix4.translationValues(
//                   0.0, 50 * (1.0 - animation!.value), 0.0),
//               child: Container(
//                   child: DottedBorder(
//                       strokeWidth: 1,
//                       borderType: BorderType.RRect,
//                       radius: Radius.circular(25),
//                       color: Color.fromARGB(255, 1, 104, 97),
//                       child: Material(
//                           color: Colors.transparent,
//                           child: InkWell(
//                             focusColor: Colors.transparent,
//                             highlightColor: Colors.transparent,
//                             hoverColor: Colors.transparent,
//                             borderRadius:
//                                 const BorderRadius.all(Radius.circular(8.0)),
//                             splashColor:
//                                 AppTheme.nearlyDarkBlue.withOpacity(0.2),
//                             onTap: () {},
//                             child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: <Widget>[
//                                   Padding(
//                                       padding: const EdgeInsets.only(
//                                           top: 16, left: 16, right: 16),
//                                       child: Expanded(
//                                           child: Padding(
//                                         padding: const EdgeInsets.only(
//                                             top: 4, bottom: 2),
//                                         child: Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.start,
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: <Widget>[
//                                               Container(
//                                                   padding: EdgeInsets.only(
//                                                       top: 0, left: 0),
//                                                   child: Text(
//                                                       tabactList!.aktivitas,
//                                                       style: TextStyle(
//                                                         fontFamily:
//                                                             AppTheme.fontName,
//                                                         fontWeight:
//                                                             FontWeight.w800,
//                                                         fontSize: 14,
//                                                         letterSpacing: 0.2,
//                                                         color: AppTheme.green,
//                                                       ))),
//                                               const Spacer(),
//                                               Scaffold(

//                                                   // alignment: Alignment.centerRight,
//                                                   // padding: EdgeInsets.only(
//                                                   //     bottom: 2, right: 6),
//                                                   body: Column(children: [
//                                                 CheckboxListTile(
//                                                   value: isi,
//                                                   onChanged: (isi) {
//                                                     isi = false;
//                                                     // setState(() {
//                                                     //   isi = val;
//                                                     // });
//                                                   },
//                                                   activeColor: AppTheme.green,
//                                                   title:
//                                                       Text("Irigasi - Hujan"),
//                                                   subtitle: Text(
//                                                       "12 September 2020 - 09.00 WIB"),
//                                                 ),
//                                                 CheckboxListTile(
//                                                   value: isi,
//                                                   onChanged: (value) {},
//                                                   activeColor: AppTheme.green,
//                                                   title: Text("Pupuk - NPK"),
//                                                   subtitle: Text(
//                                                       "12 September 2020 - 09.00 WIB"),
//                                                 ),
//                                               ]))
//                                             ]),
//                                       ))),
//                                   Row(
//                                     children: [
//                                       Container(
//                                           child: Padding(
//                                               padding: EdgeInsets.only(
//                                                 top: 1,
//                                               ),
//                                               child: Text(tabactList!.tanggal,
//                                                   style: TextStyle(
//                                                     fontFamily:
//                                                         AppTheme.fontName,
//                                                     fontWeight: FontWeight.w800,
//                                                     fontSize: 10,
//                                                     letterSpacing: 0.2,
//                                                     color: AppTheme.green,
//                                                   )))),
//                                       const Spacer(),
//                                       Container(
//                                         child: Text(tabactList!.jam,
//                                             textAlign: TextAlign.start,
//                                             style: TextStyle(
//                                               fontFamily: AppTheme.fontName,
//                                               fontWeight: FontWeight.w500,
//                                               fontSize: 10,
//                                               letterSpacing: 0.2,
//                                               color: AppTheme.green,
//                                             )),
//                                       )
//                                     ],
//                                   )
//                                 ]),
//                           )))),
//             ),
//           );
//         });
//   }
// }
import 'package:Edifarm/ui/pages/aktivitas/activity_data.dart';
import 'package:Edifarm/ui/pages/aktivitas/cek.dart';
import 'package:Edifarm/shared/Theme_App.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class ListViewActivity extends StatefulWidget {
  const ListViewActivity(
      {Key? key, this.mainScreenAnimationController, this.mainScreenAnimation})
      : super(key: key);

  final AnimationController? mainScreenAnimationController;
  final Animation<double>? mainScreenAnimation;
  @override
  _ListViewActivityState createState() => _ListViewActivityState();
}

class _ListViewActivityState extends State<ListViewActivity>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  List<ActListData> tabactList = ActListData.tabactList;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 0), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.mainScreenAnimationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: widget.mainScreenAnimation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 30 * (1.0 - widget.mainScreenAnimation!.value), 0.0),
            child: AspectRatio(
              aspectRatio: 0.2,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: GridView(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 16, bottom: 16),
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  children: List<Widget>.generate(
                    tabactList.length,
                    (int index) {
                      final int count = tabactList.length;
                      final Animation<double> animation =
                          Tween<double>(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                          parent: animationController!,
                          curve: Interval((1 / count) * index, 1.0,
                              curve: Curves.fastOutSlowIn),
                        ),
                      );
                      animationController?.forward();
                      return AreaView(
                        tabactList: tabactList[index],
                        animation: animation,
                        animationController: animationController!,
                      );
                    },
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 25,
                    crossAxisSpacing: 10,
                    childAspectRatio: 3 / 1,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class AreaView extends StatelessWidget {
  AreaView({
    Key? key,
    this.tabactList,
    this.animationController,
    this.animation,
  }) : super(key: key);

  final ActListData? tabactList;
  final AnimationController? animationController;
  final Animation<double>? animation;

  // void cek() {
  //   setState(() {
  //     value = !value;
  //   });
  // }
  // void cek({bool? value = true}) {
  //   if (value == true) {
  //     set
  //   } else {
  //     // Menonaktifkan fitur
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController!,
        builder: (BuildContext context, Widget? child) {
          return FadeTransition(
              opacity: animation!,
              child: Transform(
                  transform: Matrix4.translationValues(
                      0.0, 50 * (1.0 - animation!.value), 0.0),
                  child: Container(
                      child: DottedBorder(
                    strokeWidth: 1,
                    borderType: BorderType.RRect,
                    radius: Radius.circular(25),
                    color: Color.fromARGB(255, 1, 104, 97),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 16, left: 16, right: 16),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                      padding: EdgeInsets.only(top: 0, left: 0),
                                      child: Text(tabactList!.aktivitas,
                                          style: TextStyle(
                                            fontFamily: AppTheme.fontName,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 14,
                                            letterSpacing: 0.2,
                                            color: AppTheme.green,
                                          ))),
                                  const Spacer(),
                                  // cek1(),
                                ]),
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.only(left: 16, right: 16),
                              child: Row(
                                children: [
                                  Container(
                                      child: Padding(
                                          padding: EdgeInsets.only(
                                            top: 1,
                                          ),
                                          child: Text(tabactList!.tanggal,
                                              style: TextStyle(
                                                fontFamily: AppTheme.fontName,
                                                fontWeight: FontWeight.w800,
                                                fontSize: 10,
                                                letterSpacing: 0.2,
                                                color: AppTheme.green,
                                              )))),
                                  const Spacer(),
                                  Container(
                                    child: Text(tabactList!.jam,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontFamily: AppTheme.fontName,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10,
                                          letterSpacing: 0.2,
                                          color: AppTheme.green,
                                        )),
                                  )
                                ],
                              ))
                        ]),
                  ))));
        });
  }
}
