import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timetraker/screen/services/auth.dart';
import 'package:timetraker/widgets/avatar.dart';
import 'package:timetraker/widgets/platform_alert_dailog.dart';

class AccountPage extends StatelessWidget {

  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context);
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await PlatformAlertDialog(
      title: 'Logout',
      content: 'Are you sure that you want to logout?',
      cancelActionText: 'Cancel',
      defaultActionText: 'Logout',
    ).show(context);
    if (didRequestSignOut == true) {
      _signOut(context);
    }
  }
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Logout',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
            onPressed: () => _confirmSignOut(context),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(130),
          child: Column(
            children: <Widget>[
              Avatar(
                photoUrl: user.photoUrl,
                radius: 50,
              ),
              SizedBox(height: 10),
              if(user.displayName != null)
                Text(user.displayName, style: TextStyle(color: Colors.white),),
              SizedBox(height: 10),
            ],
          )
        ),
      ),
    );
  }


}
