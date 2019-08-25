import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          home: Scaffold(
        // appBar: AppBar(title: Text("vLibrary"),centerTitle: true,),
         backgroundColor: Colors.blue[400],
            body: Center(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SpinKitThreeBounce(color: Colors.white,size: 40,),
                Text("Loading...")
              ],
            )
        ),
      ),
    );
  
  }
}