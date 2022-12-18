import 'dart:io';

import 'package:Edifarm/shared/Theme_App.dart';
import 'package:Edifarm/ui/pages/dashboard/list_view/dashboard_screen.dart';
import 'package:Edifarm/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class PotoPadi extends StatefulWidget {
  PotoPadi({Key? key}) : super(key: key);

  @override
  State<PotoPadi> createState() => _PotoPadiState();
}

class _PotoPadiState extends State<PotoPadi> {
  @override
  File? image;

  Future<void> getImageGalerry() async {
    var galleryPermission = Permission.storage;

    if (galleryPermission.status == PermissionStatus.denied) {
      galleryPermission.request();
      if (galleryPermission.status == PermissionStatus.permanentlyDenied) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(""))
          ]),
        );
      }
    }

    final ImagePicker picker = ImagePicker();
    final imagePicked = await picker.pickImage(source: ImageSource.gallery);
    image = File(imagePicked?.path ?? "");
    setState(() {});
  }

  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future getImageCamera() async {
    final ImagePicker picker = ImagePicker();
    final imagePicked = await picker.pickImage(source: ImageSource.camera);
    image = File(imagePicked!.path);
    setState(() {});
  }

  Future _potoBottomSheet() {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: 200,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: 5,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    onTap: () async {
                      await getImageGalerry();
                    },
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: AppTheme.green.withOpacity(0.1),
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        color: AppTheme.green,
                      ),
                    ),
                    title: Text("Upload dari Galeri",
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF454444),
                        )),
                    trailing: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.grey.shade200,
                      ),
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        color: AppTheme.black,
                        size: 15,
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () async {
                      await getImageCamera();
                    },
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: AppTheme.green.withOpacity(0.1),
                      ),
                      child: const Icon(
                        Icons.image,
                        color: AppTheme.green,
                      ),
                    ),
                    title: Text("Upload dari Kamera",
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF454444),
                        )),
                    trailing: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.grey.shade200,
                      ),
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        color: AppTheme.black,
                        size: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 0, bottom: 0),
        child: Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,

                  border: Border.all(color: Color(0xFF006B6C)),

                  borderRadius: BorderRadius.circular(20),

                  // boxShadow: <BoxShadow>[
                  //   BoxShadow(
                  //       color: FitnessAppTheme.grey.withOpacity(0.4),
                  //       offset: Offset(1.1, 1.1),
                  //       blurRadius: 10.0),
                  // ],
                ),
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: <Widget>[
                    const ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      child: SizedBox(
                        height: 300,
                        child: AspectRatio(
                          aspectRatio: 1.714,
                          // child: Image.asset(
                          //     "assets/fitness_app/back.png"),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(top: 10),
                          alignment: Alignment.topCenter,
                          child: const Text(
                            'Masukan Gambar Untuk Membantu Identifikasi !!',
                            style: TextStyle(
                              fontFamily: AppTheme.fontName,
                              fontWeight: FontWeight.w800,
                              fontSize: 10,
                              letterSpacing: 0.2,
                              color: AppTheme.grey,
                            ),
                          ),
                        ),
                        image == null
                            ? InkWell(
                                onTap: () => _potoBottomSheet(),
                                child: Container(
                                  height: 190,
                                  decoration: const BoxDecoration(
                                      color: Colors.transparent,
                                      image: DecorationImage(
                                          image:
                                              AssetImage('assets/camera.png'))),
                                ))
                            : InkWell(
                                // onTap: () => _potoBottomSheet(),
                                child: Container(
                                  height: 190,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        // image: Image.file(
                                        //   image ?? File(""),
                                        // ) as ImageProvider<Object>),
                                        image: FileImage(
                                          image ?? File(""),
                                        ),
                                      )
                                      // DecorationImage(
                                      //     image: AssetImage('assets/camera.png')),
                                      ),
                                ),
                              ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 80,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 30,
                                width: 60,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(color: AppTheme.green),
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Text(
                                  'Cancel',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: AppTheme.green,
                                      fontFamily: AppTheme.fontName),
                                ),
                              ),
                            ),
                            const Spacer(),
                            InkWell(
                              child: Container(
                                height: 30,
                                width: 60,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: AppTheme.green,
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Text(
                                  'Submit',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white,
                                      fontFamily: AppTheme.fontName),
                                ),
                              ),
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        padding: EdgeInsets.only(
                                            top: 50, bottom: 50),
                                        height: 150,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: AlertDialog(
                                          title: const Text(
                                            "Apakah data yang anda masukan sudah sesuai ?",
                                            selectionColor: Colors.white,
                                            style: TextStyle(
                                                color: AppTheme.black,
                                                fontFamily: AppTheme.fontName,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          actions: [
                                            Container(
                                              height: 30,
                                              width: 60,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  color: AppTheme.orange,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text(
                                                    "Tidak",
                                                    style: TextStyle(
                                                        color: AppTheme.white,
                                                        fontFamily:
                                                            AppTheme.fontName,
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  )),
                                            ),
                                            Container(
                                              height: 30,
                                              width: 60,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.orange),
                                                  color: AppTheme.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text(
                                                    "Ya",
                                                    style: TextStyle(
                                                        color: AppTheme.orange,
                                                        fontFamily:
                                                            AppTheme.fontName,
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  )),
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                              },
                            ),
                            const SizedBox(
                              width: 80,
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
