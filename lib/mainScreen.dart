import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:http/http.dart' as http;
import 'package:vlibrary1/carousel_slider.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  String scannedCode = "";
  AnimationController _controller;
  Animation<double> _animation;
  bool status = false;
  String from = "From";
  String to = "To";

  @override
  void initState() {
    _controller = new AnimationController(
        duration: const Duration(seconds: 6), vsync: this);
    _animation = new CurvedAnimation(
      parent: _controller,
      curve: new Interval(0.0, 1, curve: Curves.elasticOut),
    );
    _controller.forward();
    super.initState();
  }

  galleryCards({@required String imageurl}) {
    return Container(
      padding: EdgeInsets.only(top: 13.0, right: 2.0, left: 2.0, bottom: 5.0),
      height: 100.0,
      width: double.infinity,
      decoration: BoxDecoration(
        // color: Colors.red,
        borderRadius: new BorderRadius.circular(20.0),
      ),
      child: ClipRRect(
        borderRadius: new BorderRadius.circular(20.0),
        child: Card(
          // color: Colors.yellow,
          elevation: 5.0,
          child: Image.asset(
            imageurl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget homeScreen() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 5.0,
          ),
          CarouselSlider(
              autoPlayCurve: Curves.easeInOutCubic,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              aspectRatio: MediaQuery.of(context).size.aspectRatio * 3.5,
              scrollDirection: Axis.horizontal,
              autoPlay: true,
              autoPlayAnimationDuration: const Duration(seconds: 2),
              items: [
                galleryCards(imageurl: "images/library1.png"),
                galleryCards(imageurl: "images/library2.jpg"),
                galleryCards(imageurl: "images/library3.jpg")
              ]),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Container(
                child: Image.asset(
                  "images/vishnu.png",
                  height: MediaQuery.of(context).size.height * 15 / 100,
                  width: MediaQuery.of(context).size.height * 15 / 100,
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 8 / 100,
          ),
          Container(
            // height: MediaQuery.of(context).size.height * 40 / 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Tooltip(
                  message: "Students",
                  child: InkWell(
                    onTap: () {
                      scan();
                      _controller.forward();
                    },
                    child: SlideTransition(
                      position: _animation.drive(Tween<Offset>(
                        begin: const Offset(-0.3, 0),
                        end: const Offset(0.3, 0),
                      )),
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.blueGrey,),
                        // color: Colors.red,
                        child: Center(
                            child: Text(
                          "Student",
                          style: TextStyle(
                              fontFamily: "bebas-neue",
                              fontSize: 25.0,
                              color: Colors.white),
                        )),
                        height: MediaQuery.of(context).orientation ==
                                Orientation.portrait
                            ? MediaQuery.of(context).size.width * 0.10
                            : MediaQuery.of(context).size.height * 0.10,
                        width: MediaQuery.of(context).orientation ==
                                Orientation.portrait
                            ? MediaQuery.of(context).size.width * 0.3
                            : MediaQuery.of(context).size.height * 0.3,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                SlideTransition(
                position: _animation.drive(Tween<Offset>(
                  end: const Offset(-0.3, 0),
                  begin: const Offset(0.3, 0),
                )),
                child: Tooltip(
                  message: "Faculty",
                  child: Padding(
                    padding: EdgeInsets.only(left: 10,right: 10),    
                    child: Padding(
                      padding: EdgeInsets.only(top: 10,bottom: 10),
                      child: RaisedButton(
                      elevation: 5,
                      padding: EdgeInsets.only(top: 8,bottom: 8,left: 13,right: 13),
                      // splashColor: Colors.blue,
                      
                      // focusColor: Colors.green,
                      onPressed: (){},
                      child: Text("Faculty",style: TextStyle(color: Colors.white,fontFamily: "bebas-neue",fontSize: 25),),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), 
                      color: Colors.red,
                      ),
                    ),
                  ) 
                ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }

  TextStyle dialogTextStyle = const TextStyle(
      fontSize: 16.0, color: Colors.white, fontFamily: "bebas-neue");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WillPopScope(
        onWillPop: () {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text(
              "Press Again to Exit",
            ),
          ));
          // return true;
        },
        child: Scaffold(
            // extendBody: true,
            appBar: AppBar(
              leading: Image.asset(
                "images/vishnu.png",
                // height: MediaQuery.of(context).size.height * 35 / 100,
              ),
              backgroundColor: Colors.white,
              // elevation: 1.5,
              title: Text(
                "vLibrary",
                style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                    fontFamily: "bebas-neue"),
              ),
              centerTitle: true,
            ),
            bottomNavigationBar: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.025,
              color: Colors.blue,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "BVRIT Library CC",
                  style: dialogTextStyle.copyWith(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height * 0.01889,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
            ),
            body: homeScreen()),
      ),
    );
  }

  Future<String> scan() async {
    customeDialog(
        {String flare,
        String status,
        Color color = null ?? Colors.black,
        String content}) {
      showCupertinoDialog(
          context: context,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              title: Text(
                status,
                style: dialogTextStyle.copyWith(color: color, fontSize: 19.0),
              ),
              content: Column(
                children: <Widget>[
                  ConstrainedBox(
                    child: FlareActor(flare,
                        alignment: Alignment.center,
                        fit: BoxFit.fitHeight,
                        animation: "Untitled"),
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width % 250.0,
                        maxHeight: MediaQuery.of(context).size.width % 150.0),
                  ),
                  Text(
                    content,
                    style: dialogTextStyle.copyWith(color: color),
                  )
                ],
              ),
              actions: <Widget>[
                ConstrainedBox(
                  child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      _controller.reset();
                      _controller.forward();
                    },
                    child: Text(
                      "OK",
                      style: dialogTextStyle.copyWith(color: Colors.black),
                    ),
                  ),
                  constraints: BoxConstraints(maxWidth: 10.0),
                ),
              ],
            );
          });
    }

// customeDialog(
//               content: "Please Try Again",
//               flare: "assets/correct.flr",
//               status: "Please try",
//               color: Colors.red);
    print("Entered Scan method");
    String output;
    scannedCode =
        await FlutterBarcodeScanner.scanBarcode("#39ff14", "Cancel", true);
    if (scannedCode.isNotEmpty) {
      print(scannedCode);
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              content: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                // width: MediaQuery.of(context).size.width*0.6 ,
                // height: MediaQuery.of(context).size.height * 0.1 ,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CircularProgressIndicator(
                      strokeWidth: 2.0,
                    ),
                    Text(
                      "Loading",
                      style: dialogTextStyle.copyWith(
                          fontSize: 20.0, color: Colors.black),
                    ),
                  ],
                ),
              ),
            );
          });

      await http.post("http://pay1rs.000webhostapp.com/vLibrary.php",
          body: {"rollno": scannedCode}).then((http.Response response) {
        print("entered THen and response is ${response.body}");
        print(response.body + " is the response");
        Navigator.of(context).pop();
        if (response.body.contains("User Entry Successfull")) {
          print("User Entry Successfull");
          customeDialog(
              flare: "assets/correct.flr",
              status: "Entry Successfull",
              color: Colors.blue,
              content: "Welcome");
        }
// Exit Successfull is the response
        else if (response.body.contains("No user record Found")) {
          print("The user has already entered");
          customeDialog(
              content: "Please Try Again",
              flare: "assets/wrong.flr",
              status: "Please Try Again",
              color: Colors.red);
        } else if (response.body == "Exit Successfull") {
          print("Exit Suceesfuly ");
          customeDialog(
              content: "Bye Bye",
              flare: "assets/correct.flr",
              status: "Thank You",
              color: Colors.blueGrey);
        } else {
          print("else part");
          customeDialog(
              content: "Please Try Again",
              flare: "assets/wrong.flr",
              status: "Please try again",
              color: Colors.red);

          // Navigator.of(context).pop();
        }
      }).catchError((e) {
        Navigator.of(context).pop();
        customeDialog(
            content: "Network Error",
            flare: "assets/wrong.flr",
            status: "Network Error",
            color: Colors.red);
        print("error $e");
      });
    } else {
      print("The Barcode is not scanned properly");
      // Navigator.of(context).pop();
    }
    return output;
  }
}
