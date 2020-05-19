import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timetraker/screen/home/home_page.dart';
import 'package:timetraker/screen/services/auth.dart';
import 'package:timetraker/screen/services/database.dart';

import '../screen/sing_in/sign_in_screen.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<User>(
      stream: auth.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User user = snapshot.data;
          if (user == null) {
            return SignInScreen.create(context);
          }
          return Provider<User>.value(
            value: user,
            child: Provider<Database>(
              create: (_) => FirestoreDatabase(uid: user.uid),
              child: HomePage(),
            ),
          );
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
