import 'package:flutter/material.dart';
import 'package:flutter_bundang/src/business_logic/api_bloc.dart';
import 'package:flutter_bundang/src/business_logic/api_provider.dart';
import 'package:flutter_bundang/src/widgets/custom_button_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiBloc apiBloc;
  @override
  Widget build(BuildContext context) {
    apiBloc = Provider.of<ApiProvider>(context).bloc;
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
      body: Center(
        child: CustomMaterialButton(
          onSubmit: () => _signOut(context),
          title: 'LogOut',
        ),
      ),
    );
  }

  Future<void> _signOut(BuildContext context) async {
    try {
      await apiBloc.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
