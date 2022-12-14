import 'package:Edifarm/shared/Theme_App.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoLink extends StatefulWidget {
  const InfoLink({super.key});

  @override
  State<InfoLink> createState() => _InfoLinkState();
}

class _InfoLinkState extends State<InfoLink>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return Column(children: [
    //   Padding(
    //     padding: EdgeInsets.only(left: 24, right: 24, bottom: 0),
    //     child: Row(children: [
    //       InkWell(
    //         onTap: () {
    //           launch(
    //               "https:aceh.tribunnews.com/2016/03/16/padi-ciherang-tak-lagi-dianjurkan-tanam");
    //         },
    //         child: Container(
    //           padding: const EdgeInsets.all(12),
    //           decoration: BoxDecoration(
    //               color: AppTheme.nearlyWhite,
    //               borderRadius: const BorderRadius.all(Radius.circular(16.0)),
    //               boxShadow: <BoxShadow>[
    //                 BoxShadow(
    //                     color: AppTheme.grey.withOpacity(0.2),
    //                     offset: const Offset(1.1, 1.1),
    //                     blurRadius: 8.0),
    //               ]),
    //           child: Container(
    //             padding: EdgeInsets.all(20),
    //             height: 50,
    //             width: 50,
    //             decoration: BoxDecoration(
    //               image: const DecorationImage(
    //                 image: AssetImage('assets/icon_ciherang_hama.png'),
    //                 opacity: 100,
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //       // InkWell(
    //       //   onTap: () {
    //       //     launch(
    //       //         "https://aceh.tribunnews.com/2016/03/16/padi-ciherang-tak-lagi-dianjurkan-tanam");
    //       //   },
    //       //   child: Container(
    //       //       alignment: Alignment.center,
    //       //       padding: const EdgeInsets.all(10),
    //       //       height: 90,
    //       //       width: 90,
    //       //       decoration: BoxDecoration(
    //       //           // gradient: const LinearGradient(
    //       //           //   colors: [
    //       //           //     AppTheme.orange,
    //       //           //     AppTheme.white,
    //       //           //   ],
    //       //           //   begin: Alignment.topCenter,
    //       //           //   end: Alignment.bottomCenter,
    //       //           // ),
    //       //           borderRadius: BorderRadius.circular(10)),
    //       //       child: Container(
    //       //         alignment: Alignment.center,
    //       //         padding: const EdgeInsets.all(20),
    //       //         decoration: const BoxDecoration(
    //       //             image: DecorationImage(
    //       //                 image: AssetImage(
    //       //           'assets/icon_jenis_insect.png',
    //       //         ))),
    //       //       )),
    //       // ),
    //       const Spacer(),
    //       InkWell(
    //         onTap: () {
    //           launch(
    //               "https://regional.kompas.com/read/2011/10/25/20044528/~Regional~Jawa");
    //         },
    //         child: Container(
    //           padding: const EdgeInsets.all(12),
    //           decoration: BoxDecoration(
    //               color: AppTheme.nearlyWhite,
    //               borderRadius: const BorderRadius.all(Radius.circular(16.0)),
    //               boxShadow: <BoxShadow>[
    //                 BoxShadow(
    //                     color: AppTheme.grey.withOpacity(0.2),
    //                     offset: const Offset(1.1, 1.1),
    //                     blurRadius: 8.0),
    //               ]),
    //           child: Container(
    //             padding: EdgeInsets.all(20),
    //             height: 50,
    //             width: 50,
    //             decoration: BoxDecoration(
    //               image: const DecorationImage(
    //                 image: AssetImage('assets/icon_ciherang_masa2.png'),
    //                 opacity: 100,
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //       const Spacer(),
    //       InkWell(
    //         onTap: () {
    //           launch(
    //               "https://www.kliktani.com/2018/08/menanam-padi-ciherang.html");
    //         },
    //         child: Container(
    //           padding: const EdgeInsets.all(12),
    //           decoration: BoxDecoration(
    //               color: AppTheme.nearlyWhite,
    //               borderRadius: const BorderRadius.all(Radius.circular(16.0)),
    //               boxShadow: <BoxShadow>[
    //                 BoxShadow(
    //                     color: AppTheme.grey.withOpacity(0.2),
    //                     offset: const Offset(1.1, 1.1),
    //                     blurRadius: 8.0),
    //               ]),
    //           child: Container(
    //             padding: EdgeInsets.all(20),
    //             height: 50,
    //             width: 50,
    //             decoration: BoxDecoration(
    //               image: const DecorationImage(
    //                 image: AssetImage('assets/icon_ciherang_perawatan3.png'),
    //                 opacity: 100,
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //     ]),
    //   ),
    //   const SizedBox(
    //     height: 16,
    //   ),
    //   Padding(
    //       padding: EdgeInsets.only(left: 24, right: 24, bottom: 0),
    //       child: Row(
    //         children: [
    //           InkWell(
    //             onTap: () {
    //               launch(
    //                   "https://jogjabenih.jogjaprov.go.id/read/bd1f9448de1a5f21070345d5c919b38d8165e4a7a6ee0ce9f1ace6cc7cca408e1773");
    //             },
    //             child: Container(
    //               padding: const EdgeInsets.all(12),
    //               decoration: BoxDecoration(
    //                   color: AppTheme.nearlyWhite,
    //                   borderRadius:
    //                       const BorderRadius.all(Radius.circular(16.0)),
    //                   boxShadow: <BoxShadow>[
    //                     BoxShadow(
    //                         color: AppTheme.grey.withOpacity(0.2),
    //                         offset: const Offset(1.1, 1.1),
    //                         blurRadius: 8.0),
    //                   ]),
    //               child: Container(
    //                 padding: EdgeInsets.all(20),
    //                 height: 50,
    //                 width: 50,
    //                 decoration: BoxDecoration(
    //                   image: const DecorationImage(
    //                     image: AssetImage('assets/icon_inpari_hama.png'),
    //                     opacity: 100,
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ),
    //           const Spacer(),
    //           InkWell(
    //             onTap: () {
    //               launch(
    //                   "https://www.gatra.com/news-501633-ekonomi-tanam-padi-inpari-32-jurus-jitu-bangun-ketahanan-pangan-.html");
    //             },
    //             child: Container(
    //               padding: const EdgeInsets.all(12),
    //               decoration: BoxDecoration(
    //                   color: AppTheme.nearlyWhite,
    //                   borderRadius:
    //                       const BorderRadius.all(Radius.circular(16.0)),
    //                   boxShadow: <BoxShadow>[
    //                     BoxShadow(
    //                         color: AppTheme.grey.withOpacity(0.2),
    //                         offset: const Offset(1.1, 1.1),
    //                         blurRadius: 8.0),
    //                   ]),
    //               child: Container(
    //                 padding: EdgeInsets.all(20),
    //                 height: 50,
    //                 width: 50,
    //                 decoration: BoxDecoration(
    //                   image: const DecorationImage(
    //                     image: AssetImage('assets/icon_inpari_masa2.png'),
    //                     opacity: 100,
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ),
    //           const Spacer(),
    //           InkWell(
    //             onTap: () {
    //               launch("https://wa.me/+6289503415644");
    //             },
    //             child: Container(
    //               padding: const EdgeInsets.all(12),
    //               decoration: BoxDecoration(
    //                   color: AppTheme.nearlyWhite,
    //                   borderRadius:
    //                       const BorderRadius.all(Radius.circular(16.0)),
    //                   boxShadow: <BoxShadow>[
    //                     BoxShadow(
    //                         color: AppTheme.grey.withOpacity(0.2),
    //                         offset: const Offset(1.1, 1.1),
    //                         blurRadius: 8.0),
    //                   ]),
    //               child: Container(
    //                 padding: EdgeInsets.all(20),
    //                 alignment: Alignment.center,
    //                 height: 50,
    //                 width: 50,
    //                 decoration: BoxDecoration(
    //                   image: const DecorationImage(
    //                     image: AssetImage('assets/whatsapp.png'),
    //                     opacity: 100,
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ],
    //       ))
    // ]);
    return Container(
        color: AppTheme.white,
        height: 80,
        child: ListView(scrollDirection: Axis.horizontal, children: [
          InkWell(
            onTap: () {
              launch('https://wa.me/+6289503415644');
            },
            child: Container(
              width: 80,
              height: 100,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppTheme.nearlyWhite,
                borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: AppTheme.grey.withOpacity(0.2),
                      offset: const Offset(1.1, 1.1),
                      blurRadius: 8.0),
                ],
              ),
              child: Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.center,
                width: 50,
                height: 80,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/whatsapp.png'),
                    opacity: 100,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 40,
          ),
          InkWell(
            onTap: () {
              launch('https://twitter.com/Edifarm21');
            },
            child: Container(
              width: 100,
              height: 80,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppTheme.nearlyWhite,
                borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: AppTheme.grey.withOpacity(0.2),
                      offset: const Offset(1.1, 1.1),
                      blurRadius: 8.0),
                ],
              ),
              child: Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.center,
                width: 50,
                height: 80,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/twitter.png'),
                    opacity: 100,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 40,
          ),
          InkWell(
            onTap: () {
              launch('https://instagram.com/edifarmm_');
            },
            child: Container(
              width: 100,
              height: 80,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppTheme.nearlyWhite,
                borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: AppTheme.grey.withOpacity(0.2),
                      offset: const Offset(1.1, 1.1),
                      blurRadius: 8.0),
                ],
              ),
              child: Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.center,
                width: 50,
                height: 80,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/instagram.png'),
                    opacity: 100,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 40,
          ),
          InkWell(
            onTap: () {
              launch('https://www.facebook.com/profile.php?id=100088522217152');
            },
            child: Container(
              width: 100,
              height: 80,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppTheme.nearlyWhite,
                borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: AppTheme.grey.withOpacity(0.2),
                      offset: const Offset(1.1, 1.1),
                      blurRadius: 8.0),
                ],
              ),
              child: Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.center,
                width: 50,
                height: 80,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/facebook.png'),
                    opacity: 100,
                  ),
                ),
              ),
            ),
          )
        ]));
  }
}
