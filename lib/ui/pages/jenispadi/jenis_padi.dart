import 'package:Edifarm/shared/Theme_App.dart';
import 'package:Edifarm/ui/pages/dashboard/list_view/dashboard_screen.dart';
import 'package:Edifarm/ui/pages/jenispadi/deskripsi_jenis.dart';
import 'package:Edifarm/ui/pages/jenispadi/info_data_jenis.dart';
import 'package:Edifarm/ui/pages/jenispadi/nama_padi.dart';
import 'package:flutter/material.dart';

class JenisPadiPage extends StatefulWidget {
  const JenisPadiPage({Key? key, this.animationController}) : super(key: key);

  final AnimationController? animationController;
  @override
  _JenisPadiPageState createState() => _JenisPadiPageState();
}

class _JenisPadiPageState extends State<JenisPadiPage>
    with TickerProviderStateMixin {
  final double infoHeight = 364.0;
  AnimationController? animationController;
  Animation<double>? animation;
  double opacity1 = 9.0;
  double opacity2 = 0.0;
  double opacity3 = 0.0;
  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 100), vsync: this);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController!,
        curve: Interval(0, 1.0, curve: Curves.fastOutSlowIn)));
    setData();
    super.initState();
  }

  Future<void> setData() async {
    animationController?.forward();
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity1 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity2 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity3 = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double tempHeight = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).size.width / 1.2) +
        24.0;
    return Container(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            Image.asset('') == 0
                ? Center(
                    child: CircularProgressIndicator(color: AppTheme.orange),
                  )
                : Column(
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio: 1.2,
                        child: Image.asset(
                          'assets/gambar_back_jenis.jpg',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
            Positioned(
              top: (MediaQuery.of(context).size.width / 1.2) - 24.0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32.0),
                      topRight: Radius.circular(32.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: AppTheme.grey.withOpacity(0.2),
                        offset: const Offset(1.1, 1.1),
                        blurRadius: 10.0),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: SingleChildScrollView(
                    child: Container(
                      constraints: BoxConstraints(
                          minHeight: infoHeight,
                          maxHeight: tempHeight > infoHeight
                              ? tempHeight
                              : infoHeight),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Padding(
                            padding:
                                EdgeInsets.only(top: 16.0, left: 18, right: 16),
                            child: Text(
                              'Informasi Mengenai \nJenis Padi',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: AppTheme.fontName,
                                fontSize: 22,
                                letterSpacing: 0.27,
                                color: AppTheme.darkerText,
                              ),
                            ),
                          ),
                          const JenisPadi(),
                          // Padding(
                          //   padding: const EdgeInsets.only(
                          //       left: 16, right: 16, bottom: 8, top: 16),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     crossAxisAlignment: CrossAxisAlignment.center,
                          //     children: const <Widget>[
                          //       Text(
                          //         'Padi Ciherang',
                          //         textAlign: TextAlign.left,
                          //         style: TextStyle(
                          //           fontWeight: FontWeight.w200,
                          //           fontFamily: AppTheme.fontName,
                          //           fontSize: 22,
                          //           letterSpacing: 0.27,
                          //           color: AppTheme.green,
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          const DeskripsiJenis(),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            "  Informasi mengenai pengembang",
                            style: TextStyle(
                                color: AppTheme.green,
                                fontFamily: AppTheme.fontName,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const InfoLink(),
                          // Expanded(
                          //   child: AnimatedOpacity(
                          //     duration: const Duration(milliseconds: 500),
                          //     opacity: opacity2,
                          //     child: const Padding(
                          //       padding: EdgeInsets.only(
                          //           left: 16, right: 16, top: 8, bottom: 8),
                          //       child: Text(
                          //         'Padi Ciherang merupakan varietas padi unggul turunan dari IR64. Selain memiliki potensi hasil yang tinggi, bentuk gabah padi Ciherang adalah ramping panjang berwarna kuning bersih serta tekstur nasi yang pulen, menjadikan varietas ini masih diminati oleh petani dan konsumen.',
                          //         textAlign: TextAlign.justify,
                          //         style: TextStyle(
                          //           fontWeight: FontWeight.w200,
                          //           fontFamily: AppTheme.fontName,
                          //           fontSize: 14,
                          //           letterSpacing: 0.27,
                          //           color: AppTheme.grey,
                          //         ),
                          //         maxLines: 3,
                          //         overflow: TextOverflow.ellipsis,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // AnimatedOpacity(
                          //   duration: const Duration(milliseconds: 500),
                          //   opacity: opacity1,
                          //   child: Padding(
                          //     padding: const EdgeInsets.all(8),
                          //     child: Row(
                          //       children: <Widget>[
                          //         getTimeBoxUI('Tanggal Tanam', '02/04/22'),
                          //         getTimeBoxUI('Lama Panen', '4 bulan'),
                          //         getTimeBoxUI('Tanggal Panen', '02/07/22'),
                          //       ],
                          //     ),
                          //   ),
                          // // ),
                          // AnimatedOpacity(
                          //   duration: const Duration(milliseconds: 500),
                          //   opacity: opacity3,
                          //   child: Padding(
                          //     padding: const EdgeInsets.only(
                          //         left: 16, bottom: 16, right: 16),
                          //     child: Row(
                          //       mainAxisAlignment: MainAxisAlignment.center,
                          //       crossAxisAlignment: CrossAxisAlignment.center,
                          //       children: const <Widget>[
                          //         const SizedBox(
                          //           height: 200,
                          //         )
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          SizedBox(
                            height: MediaQuery.of(context).padding.bottom,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: (MediaQuery.of(context).size.width / 1.2) - 24.0 - 35,
              right: 35,
              child: ScaleTransition(
                alignment: Alignment.center,
                scale: CurvedAnimation(
                    parent: animationController!, curve: Curves.fastOutSlowIn),
                child: Card(
                  color: AppTheme.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                  elevation: 10.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: SizedBox(
                width: AppBar().preferredSize.height,
                height: AppBar().preferredSize.height,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius:
                        BorderRadius.circular(AppBar().preferredSize.height),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          color: AppTheme.white,
                          size: 20,
                        )),
                    // onTap: () => const HomeScreen(),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getTimeBoxUI(String text1, String txt2) {
    return Padding(

        // scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(8.0),
        child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(16.0)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: AppTheme.grey.withOpacity(0.2),
                    offset: const Offset(1.1, 1.1),
                    blurRadius: 8.0),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 5.0, right: 5.0, top: 12.0, bottom: 12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    text1,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontFamily: AppTheme.fontName,
                      fontSize: 10,
                      letterSpacing: 0.27,
                      color: AppTheme.green,
                    ),
                  ),
                  Text(
                    txt2,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: AppTheme.fontName,
                      fontSize: 8,
                      letterSpacing: 0.27,
                      color: AppTheme.grey,
                    ),
                  ),
                ],
              ),
            )));
  }
}
