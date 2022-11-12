import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// nama : Siti Salmah Zakiah
// NPM  : 20552011189

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            key: _scaffoldkey,
            appBar: AppBar(
              title: Text("Latihan Notification"),
            ),
            body: Center(
              child: Builder(
                  builder: (context) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          MaterialButton(
                            onPressed: () {
                              showToast();
                            },
                            child: Text("Show Toast"),
                          ),
                          MaterialButton(
                            onPressed: () {
                              showSnackBar();
                            },
                            child: Text("Show SnackBar"),
                          ),
                          MaterialButton(
                            onPressed: () {
                              showAlert(context);
                            },
                            child: Text("Show Alert"),
                          )
                        ],
                      )),
            )));
  }

  void showToast() {
    setState(() {
      Fluttertoast.showToast(
          msg: 'This is notification from toast',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER);
    });
  }

  void showSnackBar() {}
  final snackBar = SnackBar(
    content: const Text('hi salma this is a SnackBar!'),
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () {},
    ),
  );

  void showAlert(BuildContext context) {
    setState(() {
      Widget buttonOK = MaterialButton(
          child: Text("OK"),
          onPressed: () {
            Navigator.of(context).pop();
          });

      Widget buttonCancel = MaterialButton(
          child: Text("Cancel"),
          onPressed: () {
            Navigator.of(context).pop();
          });

      AlertDialog alert = AlertDialog(
        title: Text("Hai Salmah"),
        content: Text("Notivication from Alert"),
        actions: [
          buttonOK,
          buttonCancel,
        ],
      );
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          });
    });
  }
}
