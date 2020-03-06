import 'package:flutter/material.dart';
import 'package:flutter_bundang/src/business_logic/api_bloc.dart';
import 'package:flutter_bundang/src/business_logic/api_provider.dart';
import 'package:flutter_bundang/src/widgets/custom_button_widget.dart';
import 'package:flutter_bundang/src/widgets/custom_text_widget.dart';
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
            SizedBox(
              height: 30.0,
            ),
            CircleAvatar(
              backgroundColor: Colors.indigo,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Image.network(
                    apiBloc.user.userImageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              maxRadius: 54,
            ),
            SizedBox(
              height: 12.0,
            ),
            DrawerHeader(
              child: Column(
                children: <Widget>[
                  Text(
                    apiBloc.user.userName,
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(
                    height: 7.0,
                  ),
                  Text(
                    apiBloc.user.userEmail,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black45,
                    ),
                  ),
                ],
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            HeadingOneText(
              title: 'Welcom!',
            ),
            CustomMaterialButton(
              onSubmit: () => _signOut(context),
              title: 'LogOut',
            ),
          ],
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
