import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:knoxxbox/constants.dart';
import 'package:knoxxbox/helpers/adaptive.dart';
import 'package:knoxxbox/models/drawer_item.dart';
import 'package:knoxxbox/screens/dashboard.dart';
import 'package:yaru/yaru.dart';

class KnoxxboxApp extends StatefulWidget {
  const KnoxxboxApp({Key? key}) : super(key: key);

  @override
  State<KnoxxboxApp> createState() => _KnoxxboxAppState();
}

class _KnoxxboxAppState extends State<KnoxxboxApp> {
  bool isDesktop = true;
  List<DrawerItem> drawerItems = [];
  int _selectedDrawerIndex = 0;
  String _selectedMenu = "Dashboard";

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return const DashboardPage();
      default:
        return const Text("Error");
    }
  }

  _onDrawerItemSelect(int index) {
    setState(() => _selectedDrawerIndex = index);
    if (!isDesktop) Navigator.of(context).pop(); // close the drawer
  }

  @override
  void initState() {
    super.initState();
    drawerItems = [
      DrawerItem(0, 'Dashboard', CupertinoIcons.square_grid_2x2, true),
      DrawerItem(1, 'Users', CupertinoIcons.person_2, true),
      DrawerItem(2, 'Business', CupertinoIcons.cube_box, true),
    ];
  }

  @override
  Widget build(BuildContext context) {
    isDesktop = isDisplayDesktop(context);

    Widget drawer() {
      var drawerOptions = <Widget>[];

      drawerOptions.add(Padding(
        padding: kGlobalOuterPadding,
        child: Card(
          child: ListTile(
            title: const Text('Full name'),
            subtitle: const Text('username'),
            trailing: IconButton(
              icon: const Icon(CupertinoIcons.square_arrow_right),
              onPressed: () {
                // pref.clear();
                // Navigator.of(context)
                //     .pushNamedAndRemoveUntil('/', ModalRoute.withName('/'));
              },
            ),
          ),
        ),
      ));
      for (var i = 0; i < drawerItems.length; i++) {
        var d = drawerItems[i];
        if (d.isAdmin) {
          // user.userClientId.contains('super-admin') &&
          drawerOptions.add(ListTile(
            dense: true,
            selectedTileColor: YaruVariant.orange.color.withOpacity(0.2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            leading: Icon(d.icon),
            title: Text(d.title),
            selected: d.code == _selectedDrawerIndex,
            onTap: () {
              setState(() {
                _selectedMenu = d.title;
              });
              _onDrawerItemSelect(d.code);
            },
          ));
        }
        if (!d.isAdmin) {
          //!user.userClientId.contains('super-admin') &&
          drawerOptions.add(ListTile(
            dense: true,
            selectedTileColor: YaruVariant.orange.color.withOpacity(0.2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            leading: Icon(d.icon),
            title: Text(d.title),
            selected: d.code == _selectedDrawerIndex,
            onTap: () {
              setState(() {
                _selectedMenu = d.title;
              });
              _onDrawerItemSelect(d.code);
            },
          ));
        }
      }
      return Drawer(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: ListView(
            children: drawerOptions,
          ),
        ),
      );
    }

    if (isDesktop) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          drawer(),
          Expanded(
            child: Scaffold(
              appBar: AppBar(
                title: Text(_selectedMenu),
                centerTitle: false,
              ),
              body: _getDrawerItemWidget(_selectedDrawerIndex),
            ),
          ),
        ],
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(_selectedMenu),
          centerTitle: false,
        ),
        body: _getDrawerItemWidget(_selectedDrawerIndex),
        drawer: drawer(),
      );
    }
  }
}
