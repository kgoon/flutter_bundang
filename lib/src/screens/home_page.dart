import 'package:flutter/material.dart';
import 'package:flutter_bundang/src/services/auth.dart';
import 'package:flutter_bundang/src/widgets/custom_button_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.indigo,
              minRadius: 30,
            ),
            DrawerHeader(
              child: Text(
                'User Mail',
                textAlign: TextAlign.center,
              ),
            ),
            CustomMaterialButton(
              title: 'LogOut',
              onSubmit: () => _signOut(context),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<Auth>(context, listen: false);
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
