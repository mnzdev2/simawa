import 'package:dynamic_themes/dynamic_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:simawa/config/themes/app_themes.dart';
import 'package:simawa/constants/app_constants.dart';
import 'package:simawa/constants/route_constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int dropdownValue = 0;

  final FlutterLocalization _localization = FlutterLocalization.instance;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    dropdownValue = DynamicTheme.of(context)!.themeId;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConstants.title.getString(context)),
      ),
      body: Center(
          child: Column(
        children: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RouteConstants.settingPage);
              },
              child: const Text('settings')),
          Text('Current language is: ${_localization.getLanguageName()}'),
          const SizedBox(height: 64.0),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  child: const Text('English'),
                  onPressed: () {
                    _localization.translate('en');
                  },
                ),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: ElevatedButton(
                  child: const Text('Bahasa'),
                  onPressed: () {
                    _localization.translate('id', save: false);
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 12),
            child: Text(AppConstants.chooseTheme.getString(context)),
          ),
          DropdownButton(
              icon: const Icon(Icons.arrow_downward),
              value: dropdownValue,
              items: [
                DropdownMenuItem(
                  value: AppThemes.lightBlue,
                  child: Text(AppThemes.toStr(AppThemes.lightBlue)),
                ),
                DropdownMenuItem(
                  value: AppThemes.lightRed,
                  child: Text(AppThemes.toStr(AppThemes.lightRed)),
                ),
                DropdownMenuItem(
                  value: AppThemes.darkBlue,
                  child: Text(AppThemes.toStr(AppThemes.darkBlue)),
                ),
                DropdownMenuItem(
                  value: AppThemes.darkRed,
                  child: Text(AppThemes.toStr(AppThemes.darkRed)),
                )
              ],
              onChanged: (dynamic themeId) async {
                await DynamicTheme.of(context)!.setTheme(themeId);
                setState(() {
                  dropdownValue = themeId;
                });
              }),
          Container(
              margin: const EdgeInsets.all(20),
              width: 100,
              height: 100,
              color: theme.primaryColor,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      'Container in primary color and primary text theme',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).primaryTextTheme.bodyText2),
                ),
              )),
          Container(
            margin: const EdgeInsets.all(20),
            width: 100,
            height: 100,
            color: theme.colorScheme.secondary,
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  Text('Container in accent color and with accent text theme',
                      textAlign: TextAlign.center,
                      // ignore: deprecated_member_use
                      style: Theme.of(context).accentTextTheme.bodyText2),
            )),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Elevated Button'),
          ),
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: "Notifications"),
        ],
      ),
    );
  }
}
