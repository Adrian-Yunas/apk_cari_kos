import 'package:animations/animations.dart';
import 'package:aplikasi_cari_kos/components/navbar_item.dart';
import 'package:aplikasi_cari_kos/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TipsItem extends StatelessWidget {
  static String id = 'TipsItem';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animations Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: ContainerTransformDemo(),
    );
  }
}

class ContainerTransformDemo extends StatefulWidget {
  const ContainerTransformDemo({Key key}) : super(key: key);

  @override
  _ContainerTransformDemoState createState() {
    return _ContainerTransformDemoState();
  }
}

class _ContainerTransformDemoState extends State<ContainerTransformDemo> {
  ContainerTransitionType _transitionType = ContainerTransitionType.fade;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Navbar(),
              ),
            );
          },
        ),
        title: const Text(
          'Tips dan Guide',
        ),
        backgroundColor: primaryColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: <Widget>[
          ...List<Widget>.generate(10, (int index) {
            return OpenContainer<bool>(
              transitionType: _transitionType,
              openBuilder: (BuildContext _, VoidCallback openContainer) {
                return _DemoDetailsPage();
              },
              closedShape: const RoundedRectangleBorder(),
              closedElevation: 0.0,
              closedBuilder: (BuildContext _, VoidCallback openContainer) {
                return ListTile(
                  onTap: openContainer,
                  title: Text('Tips dan Guide ${index + 1}'),
                  subtitle:
                      const Text('tips dalam mempermudah dalam mencari kos'),
                );
              },
            );
          }),
        ],
      ),
    );
  }
}

class _DemoDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tips dan Guide',
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tips',
                  style: Theme.of(context).textTheme.headline5.copyWith(
                        color: Colors.black54,
                        fontSize: 30.0,
                      ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Tips',
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                        color: Colors.black54,
                        height: 1.5,
                        fontSize: 16.0,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
