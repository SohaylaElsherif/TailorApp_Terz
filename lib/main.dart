import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/Services/auth.dart';
import 'package:graduation_project/UI/Home/home.dart';
import 'package:graduation_project/UI/Profile/UserProfile1.dart';
import 'package:graduation_project/UI/ServicesScreen/formprovider.dart';
import 'package:graduation_project/UI/TailorsList/tailorsList.dart';
import 'package:graduation_project/UI/TailorsList/tailorsListProvider.dart';
import 'package:graduation_project/UI/Products/productsProvider.dart';
import 'package:graduation_project/Widgets/uploadImage.dart';
import 'package:provider/provider.dart';
import './customWidgetPage.dart';
import 'UI/Order/orderProvider.dart';
import 'UI/authentication/SignUpPage.dart';
import 'UI/authentication/loadingPage.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => TailorsProvider(),),
    ChangeNotifierProvider(create: (context) => ProductsProvider(),),
    ChangeNotifierProvider(create: (context) => FormProvider(),),
    // ChangeNotifierProvider(create: (context) => OrderProvider(),),
  ],
  child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Tailor App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes:{'/HomePage':((context)=>HomePage()),
        '/Profile':((context)=>UserProfile()),
        '/TailorsList':((context)=>TailorsList()),
      },
     home:LandingPage(
        auth:Auth(),
    )
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomePage(
    ),
    UserProfile(),
    UploadImage(),
    SignUpPage(),
    TailorsList(
      title: 'Tailors',
    ),
    CustomWidgetPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(title),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          // Respond to item press.
          print(index);
          setState(() => _currentIndex = index);
        },
        items: [
          BottomNavigationBarItem(title: Text('Home'), icon: Icon(Icons.home)),
          BottomNavigationBarItem(title: Text('Profile'),icon: Icon(Icons.person)),
          BottomNavigationBarItem(title: Text('Test'),icon: Icon(Icons.settings)),

        ],
      ),
    );
  }
}
