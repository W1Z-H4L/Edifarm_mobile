import 'package:Edifarm/cek_Login.dart';
import 'package:Edifarm/controler/Remember_User.dart';
import 'package:Edifarm/sign_in_page.dart';
import 'package:Edifarm/splash_screen.dart';
import 'package:Edifarm/ui/pages/Riwayat/Riwayat_pengobatan/riwayart_pestisida_screen.dart';
import 'package:Edifarm/ui/pages/Riwayat/Riwayat_pupuk/riwayart_pupuk_screen.dart';
import 'package:Edifarm/ui/pages/Riwayat/riwayat_irigasi/riwayart_irigasi_screen.dart';
import 'package:Edifarm/ui/pages/aktivitas/activity.dart';
import 'package:Edifarm/ui/pages/dashboard/list_view/dashboard_screen.dart';
import 'package:Edifarm/ui/pages/diagnosa/Riwayat_diagnosa/riwayat_diag_screen.dart';
import 'package:Edifarm/ui/pages/diagnosa/diagnosa_screen.dart';
import 'package:Edifarm/ui/pages/diagnosa/textbellow.dart';
import 'package:Edifarm/ui/pages/jenispadi/jenis_padi.dart';
import 'package:Edifarm/ui/pages/lahan/lahan_view.dart';
import 'package:Edifarm/ui/pages/setting/page/account/edit_akun/edit_akun.dart';
import 'package:Edifarm/ui/pages/setting/page/account/edit_password.dart';
import 'package:Edifarm/ui/pages/setting/page/account/edit_username.dart';
import 'package:Edifarm/ui/pages/setting/pengaturan.dart';
import 'package:Edifarm/ui/pages/setting/pengaturan_screen.dart';

import 'package:Edifarm/ui/widgets/bottom_navigation/bottomNavigator.dart';

import 'package:flutter/material.dart';

void main(List<String> args) => runApp(MyApp());

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown
//   ]).then((_) => runApp(MyApp()));
// }
class MyApp extends StatefulWidget {
  const MyApp({Key? key, this.animationController}) : super(key: key);

  final AnimationController? animationController;
  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> with TickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? animation;
  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController!,
        curve: Interval(0, 1.0, curve: Curves.fastOutSlowIn)));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashScreen(),
        '/sign-in': (context) => SignInPage(),
        '/home': (context) => BottomNavigator(),
        '/edit-bio': (context) =>
            EditProfilePage(animationController: animationController),
        '/edit-pass': (context) => EditPassword(),
        '/edit-user': (context) => EditUsername(),
        '/riwayatpupuk': (context) => const RiwayatPupuk(),
        '/diag': (context) => const Field(),
        // DiagnosaScreen(animationController: animationController),
        '/lahan': (context) => LahanScreen(
              animationController: animationController,
            ),
        '/jenis': (context) => JenisPadiPage(
              animationController: animationController,
            ),
        '/sett': (context) => const Pengaturan_Screen(),
        '/iri': (context) => RiwayatIrigasi(
              animationController: animationController,
            ),
        '/obat': (context) => RiwayatPestisida(
              animationController: animationController,
            ),
        '/pupuk': (context) => RiwayatPupuk(
              animationController: animationController,
            ),
        '/act': (context) => activityPage(
              animationController: animationController,
            ),
        '/con': (context) => RiwayatConsul(
              animationController: animationController,
            ),
      },
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
