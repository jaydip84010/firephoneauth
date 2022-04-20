import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:twitter_login/twitter_login.dart';

class SignGoogle extends StatefulWidget {
  const SignGoogle({Key? key}) : super(key: key);

  @override
  State<SignGoogle> createState() => _SignGoogleState();
}

class _SignGoogleState extends State<SignGoogle> {
  GoogleMapController? googleMapController;

  void _onMapCreated(GoogleMapController controller) {
    googleMapController = controller;
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  Future<void> opengooglesign() async {
    await googleSignIn.signIn();
  }

  Future<void> facebook() async {
    if (kIsWeb) {
      // initialiaze the facebook javascript SDK
      await FacebookAuth.instance.webInitialize(
        appId: "1329834907365798",
        cookie: true,
        xfbml: true,
        version: "v13.0",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Center(
              //   child: ElevatedButton(
              //       onPressed: () {
              //         opengooglesign();
              //       },
              //       child: Center(child: Text('Sign in With Google'))),
              // ),
              // Center(
              //   child: ElevatedButton(
              //       onPressed: () {
              //         facebook();
              //       },
              //       child: Center(child: Text('Sign in With facebook'))),
              // ),
              // Center(
              //   child: ElevatedButton(
              //       onPressed: () {},
              //       child: Center(child: Text('Sign in With twitter'))),
              // ),
              Center(
                child: Container(
                  height: 200,
                  width: 200,
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: LatLng(30.521563, -119.677433),
                      zoom: 20,
                    ),
                    onMapCreated: _onMapCreated,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
