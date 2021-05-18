import 'package:flutter/material.dart';
import 'package:flutter_linkedin/linkedloginflutter.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
// import 'package:mangalamjobsuser/services/linkedinlogin.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final String redirectUrl = 'https://www.linkedin.com/company/mangalam123';
  final String clientId = '776wqt3bsht9uk';
  final String clientSecret = 'avUb49e8lqzCqlI6';
  @override
  void initState() {
		super.initState();
    LinkedInLogin.initialize(context,
        clientId: clientId,
        clientSecret: clientSecret,
        redirectUri: redirectUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 60,
                child: SignInButton(
                  Buttons.LinkedIn,
                  onPressed: () {
                    LinkedInLogin.loginForAccessToken(
                            destroySession: true,
                            appBar: AppBar(
                              title: Text('Demo Login Page'),
                            ))
                        .then((accessToken) => print(accessToken))
                        .catchError((error) {
                      print('---------#######----------');
                      print(error.errorDescription);
                    });
                  },
                  text: 'Sign in with Linkedin',
                )),
            FlatButton(
                onPressed: () {
                  LinkedInLogin.getProfile(
                      destroySession: true,
                      forceLogin: true,
                      appBar: AppBar(
                        title: Text('Demo Login Page'),
                      )).then((profile) {
                    print('--------------------------First name : ${profile.firstName}');
                    print('Last name : ${profile.lastName}');
                    print(
                        'Avatar: ${profile.profilePicture.profilePictureDisplayImage.elements.first.identifiers.first.identifier}');
                  }).catchError((error) {
                    print(error.errorDescription);
                  });
                },
                child: Text('Get profile data')),
            // SignInButton(Buttons.Google, onPressed: () async {
            //   var cred = await GoogleAuth().signInWithGoogle();
            //   print(cred.user);
            // }),
            // SignInButton(Buttons.Google, onPressed: () async {
            //   GoogleAuth().signOutGoogle();
            // })
          ],
        ),
      ),
    );
  }
}