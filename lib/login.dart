// import 'dart:convert';

// import 'package:Edifarm/API/Api_connect.dart';
// import 'package:Edifarm/models/Remember_User.dart';
// import 'package:Edifarm/models/User_model.dart';
// import 'package:Edifarm/shared/Theme_App.dart';
// import 'package:Edifarm/ui/pages/dashboard/list_view/dashboard_screen.dart';

// import 'package:Edifarm/ui/widgets/buttons.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class SignInPage extends StatefulWidget {
//   @override
//   State<SignInPage> createState() => _SignInPageState();
// }

// final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

// // enum Loginstatus { notSignin, signin }

// class _SignInPageState extends State<SignInPage> {
//   // const SignInPage({Key? key}) : super(key: key);
//   bool _secureText = true;
//   // Loginstatus _loginstatus = Loginstatus.notSignin;

//   showHide() {
//     setState(() {
//       _secureText = !_secureText;
//     });
//   }

//   @override
//   void initState() {
//     share();
//     // getPref();
//     // TODO: implement initState
//     super.initState();

//     username = TextEditingController();
//     password = TextEditingController();
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     username.dispose();
//     password.dispose();
//   }

//   bool _loading = false;

//   TextEditingController username = TextEditingController();
//   TextEditingController password = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     // switch (_loginstatus) {
//     //   case Loginstatus.notSignin:
//     return Scaffold(
//         body: ListView(
//             padding: const EdgeInsets.only(
//               left: 30,
//               right: 30,
//               bottom: 24,
//             ),
//             children: <Widget>[
//           Container(
//             width: 161,
//             height: 161,
//             margin: const EdgeInsets.only(top: 50),
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/logo.png'),
//               ),
//             ),
//           ),
//           Text(
//             'Selamat Datang !!',
//             textAlign: TextAlign.center,
//             style: AppTheme.custom1.copyWith(
//               fontWeight: FontWeight.w900,
//               fontSize: 26,
//               color: AppTheme.green,
//             ),
//           ),
//           Container(
//             width: 216,
//             height: 197,
//             // margin: const EdgeInsets.only(top: 5, bottom: 55),
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/gambar_login.png'),
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 5,
//           ),
//           Container(
//               child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               // NOTE: INPUT EMAIL
//               TextFormField(
//                 controller: username,
//                 showCursor: true,
//                 cursorHeight: 25,
//                 style: GoogleFonts.montserrat(),
//                 decoration: const InputDecoration(
//                   focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: AppTheme.green)),
//                   labelText: 'Username',
//                   hintText: 'Masukan Username Anda',
//                   hintStyle: AppTheme.custom,
//                   labelStyle: AppTheme.custom1,
//                   focusColor: AppTheme.green,
//                   fillColor: AppTheme.green,
//                 ),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               // NOTE: INPUT PASSWORD
//               TextFormField(
//                 controller: password,
//                 showCursor: true,
//                 cursorHeight: 25,
//                 style: GoogleFonts.montserrat(),
//                 obscureText: _secureText,
//                 decoration: InputDecoration(
//                   focusedBorder: const OutlineInputBorder(
//                       borderSide: BorderSide(color: AppTheme.green)),
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                       _secureText ? Icons.visibility : Icons.visibility_off,
//                       color: AppTheme.green,
//                     ),
//                     onPressed: () {
//                       showHide();
//                     },
//                   ),
//                   labelText: 'Password',
//                   hintText: 'Masukan Password Anda',
//                   hintStyle: AppTheme.custom,
//                   labelStyle: AppTheme.custom1,
//                   focusColor: AppTheme.green,
//                   fillColor: AppTheme.green,
//                 ),
//               ),
//               const SizedBox(
//                 height: 8,
//               ),

//               const SizedBox(
//                 height: 90,
//               ),
//               InkWell(
//                   child: Container(
//                     padding: const EdgeInsets.only(
//                         top: 50, left: 75, bottom: 50, right: 75),
//                     child: Container(
//                       height: 40,
//                       width: 70,
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                           color: AppTheme.green,
//                           borderRadius: BorderRadius.circular(30)),
//                       child: const Text(
//                         'Masuk',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             fontSize: 12,
//                             color: Colors.white,
//                             fontFamily: AppTheme.fontName,
//                             fontWeight: FontWeight.w600),
//                       ),
//                     ),
//                   ),
//                   onTap: () {
//                     verifyLogin();
//                     // Navigator.pushNamed(context, '/home');
//                   }),
//               const SizedBox(
//                 height: 50,
//               ),
//             ],
//           )),
//         ]));
//     //   case Loginstatus.signin:
//     //     return HomeScreen();
//     // }
//   }

//   share() async {
//     final SharedPreferences sharedPreferences =
//         await SharedPreferences.getInstance();
//     sharedPreferences.setString('username', username.text);
//     sharedPreferences.setString('password', password.text);
//     Get.to(HomeScreen());
//   }

//   void verifyLogin() {
//     if (username.text.isEmpty) {
//       Fluttertoast.showToast(
//         msg: "Username Harus Diisi",
//         backgroundColor: Colors.red[300],
//         fontSize: 12,
//       );
//     } else if (password.text.isEmpty) {
//       Fluttertoast.showToast(
//           msg: "Password Harus Diisi",
//           backgroundColor: Colors.red[300],
//           fontSize: 12);
//     } else {
//       login();
//     }
//   }

//   Future login() async {
//     try {
//       var response = await http.post(Uri.parse(ApiConnect.signin), body: {
//         "username": username.text.trim(),
//         "password": password.text.trim(),
//       });

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         if (data['success'] == true) {
//           snackBarSucces();
//           setState(() {
//             // _loginstatus = Loginstatus.signin;
//             // sharePref(data, username, password);
//           });
//           // User userInfo = User.fromJson(data['user']);
//           // await RememberUser().storeUser(json.encode(userInfo));
//           // // ignore: use_build_context_synchronously
//           Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
//           // sharePref(data, username, password);
//         } else {
//           snackBarPass();
//         }
//       } else {
//         snackBarFailed();
//       }
//     } catch (e) {
//       Fluttertoast.showToast(msg: e.toString());
//       print(e.toString());
//     }
//   }

//   snackBarFailed() {
//     {
//       Container(
//         height: 50,
//         width: 50,
//         color: AppTheme.green,
//       );
//       Fluttertoast.showToast(
//         msg: 'Ussername Atau Password Salah \n Silahkan Login Kembali',
//         backgroundColor: Colors.red[300],
//         textColor: Colors.white,
//         fontSize: 12,
//       );
//     }
//   }

//   snackBarPass() {
//     {
//       Container(
//         height: 50,
//         width: 50,
//         color: AppTheme.green,
//       );
//       Fluttertoast.showToast(
//         msg: 'Password Salah \n Silahkan Login Kembali',
//         backgroundColor: Colors.red[300],
//         textColor: Colors.white,
//         fontSize: 12,
//       );
//     }
//   }

//   snackBarSucces() {
//     Fluttertoast.showToast(
//       msg: 'Berhasil Login',
//       backgroundColor: Colors.green[300],
//       fontSize: 12,
//       textColor: Colors.white,
//     );
//   }

//   // Future sharePref(username) async {
//   //   SharedPreferences preferences = await SharedPreferences.getInstance();
//   //   setState(() {
//   //     preferences.setInt("username", username);
//   //     preferences.commit();
//   //   });
//   // }

//   // String? user = '';
//   // String? pass = '';
//   // var data;
//   // getPref() async {
//   //   SharedPreferences preferences = await SharedPreferences.getInstance();
//   //   setState(() {
//   //     data = preferences.getBool('success');
//   //     _loginstatus = data == true ? Loginstatus.signin : Loginstatus.notSignin;
//   //   });
//   // }

//   // sharePref(data, username, password) async {
//   //   SharedPreferences preferences = await SharedPreferences.getInstance();
//   //   setState(() {
//   //     preferences.setBool("success", data);
//   //     preferences.setString('username', username);
//   //     preferences.setString('password', password);
//   //   });
//   // }

//   // safaedata() async {
//   //   WidgetsFlutterBinding.ensureInitialized();
//   //   SharedPreferences preferences = await SharedPreferences.getInstance();
//   //   preferences.getString('username');
//   //   preferences.getString('password');
//   // }
// }
