import 'package:flutter/material.dart';
import 'widgets/screen_components.dart';
import 'constants/constants.dart';

final skillsGlobalKey = GlobalKey();
final projectGlobalKey = GlobalKey();
final homeGlobalKey = GlobalKey();

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MaterialApp(
        theme: Theme.of(context).copyWith(),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: kMainBackGroundColor,
          appBar: size.width >= 700
              ? appBarNav()
              : AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  actions: const [],
                ),
          drawer: const NavDrawer(),
          body: mainWidgetScroll(),
        ));
  }
}

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});
  Future scrollToItem(GlobalKey key) async {
    final context = key.currentContext;
    if (context != null) {
      await Scrollable.ensureVisible(context,
          alignment: 0.5, duration: const Duration(milliseconds: 700));
    }
  }

  ListTile appDrawerTile(
      BuildContext context, String text, dynamic key, IconData ico) {
    return ListTile(
      splashColor: const Color.fromARGB(255, 105, 41, 130),
      leading: Icon(ico),
      title: Text(
        text,
        style: kconstNoramlText,
      ),
      onTap: () {
        scrollToItem(key);
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kMainBackGroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 100,
          ),
          appDrawerTile(context, 'Home', homeGlobalKey, Icons.home_outlined),
          appDrawerTile(
              context, 'Skills', skillsGlobalKey, Icons.work_history_outlined),
          appDrawerTile(context, 'Project', projectGlobalKey, Icons.done),
        ],
      ),
    );
  }
}
