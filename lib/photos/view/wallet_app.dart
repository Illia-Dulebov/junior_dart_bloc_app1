import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

void main() {
  runApp(const WalletApp());
}

class WalletApp extends StatelessWidget {
  const WalletApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        highlightColor: Colors.transparent,
        textTheme: const TextTheme(
          headline3: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 25, 29, 52),
          ),
          headline4: TextStyle(
            fontSize: 13.0,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 25, 29, 52),
          ),
        ),
        splashColor: Colors.transparent,
      ),
      home: const GeneralPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class GeneralPage extends StatefulWidget {
  const GeneralPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<GeneralPage> createState() => _GeneralPageState();
}

class _GeneralPageState extends State<GeneralPage> {
  int _selectedIndex = 2;

  static const List<Widget> _widgetOptions = <Widget>[
    Center(child: Text('Home')),
    Center(child: Text('Wallet')),
    HomePage(),
    Center(child: Text('History')),
    Center(child: Text('Profile')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined),
            label: 'Wallet',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: MyCustomButton(
              coordinateTranslate: 0.6,
              elevation: 4.0,
              icon: Icons.add,
              color1ForGradient: Color.fromARGB(255, 104, 0, 170),
              color2ForGradient: Color.fromARGB(255, 244, 48, 143),
              color1ForGradientOnTap: Color.fromARGB(255, 85, 0, 140),
              color2ForGradientOnTap: Color.fromARGB(255, 190, 38, 109),
              coordinateTranslateOnTap: 0.0,
              elevationOnTap: 2.0,
            ),
            label: 'Add',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_outlined),
            label: 'History',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Profile',
            tooltip: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 244, 48, 143),
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width, 340),
            painter: CurveTop(
                color1ForGradient: Color.fromARGB(255, 104, 0, 170),
                color2ForGradient: Color.fromARGB(255, 244, 48, 143)),
          ),
          Column(
            children: [
              TopInformation(),
              RecentTransactions(),
            ],
          ),
        ],
      ),
    );
  }
}
