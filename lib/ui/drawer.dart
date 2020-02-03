import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bundang/ui/page_container.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({
    @required this.items,
    this.onTap,
    this.currentIndex: 0,
  })
      : super() {
    assert(items != null);
    assert(0 <= currentIndex && currentIndex < items.length);
  }

  final List<PageContainer> items;

  final int currentIndex;

  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final List<Widget> lists = <Widget>[];

    return new Drawer(
      child: new Column(
        children: <Widget>[
          new UserAccountsDrawerHeader(
//            accountName: new Text(
//              user != null ? user.displayName : Strings.of(context).appName,
//            ),
//            accountEmail: new Text(
//              user != null ? user.email : Strings.of(context).appDescription,
//            ),
//            currentAccountPicture: new CircleAvatar(
//              backgroundColor: Colors.white,
//              backgroundImage: user != null
//                  ? new NetworkImage(user.photoUrl)
//                  : new AssetImage(icDefault),
//            ),
//            decoration: new BoxDecoration(
//              image: new DecorationImage(
//                image: new AssetImage(
//                  imgHeader,
//                ),
//                fit: BoxFit.cover,
//              ),
//            ),
//            margin: EdgeInsets.zero,
          ),
          new MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: new Expanded(
              child: new ListView(
                padding: const EdgeInsets.only(top: 8.0),
                children: <Widget>[
                  new Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: lists,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
