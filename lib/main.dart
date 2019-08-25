import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:vlibrary1/mainScreen.dart';

// import 'package:vlibrary1/loading.dart';
// import 'package:vlibrary1/popup.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SplashScreen(
      seconds: 3,
      image: Image.asset("images/vishnu.png"),
      navigateAfterSeconds: MainScreen(),
      photoSize: 100,
      title: Text(
        "BVRITN Library.. ",
        style: TextStyle(fontFamily: "bebas-neue", fontSize: 25.0),
      ),
    ));
  }
}
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   String scannedText="";
//   String sai="Nothing is Scanned";

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: Text("vLibrary"),
//         ),
//         body: MainScreen()
//       ),
//     );
//   }
//   Future scan() async{
//       scannedText=await FlutterBarcodeScanner.scanBarcode("#004297", "cancel",true);
//       setState(() {
//         sai=scannedText;
//       });
//   }
// }
