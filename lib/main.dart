import 'package:flutter/material.dart';
import 'package:travel_apps/provider/place_date_provider.dart';
import 'package:travel_apps/provider/place_des_provider.dart';
import 'package:travel_apps/screens/travel_list_screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/single_child_widget.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(TravelApps());
}

class TravelApps extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: providers,
      child: MaterialApp(
          title: "Travel App",
          theme: ThemeData(
              appBarTheme: AppBarTheme(backgroundColor: Colors.redAccent),
          ),
          home: TravelListScreen(),
      ),
    );
  }
}

List<SingleChildWidget> providers=[
 ChangeNotifierProvider<PlaceDateProvider>(create: (_)=>PlaceDateProvider(),),
 ChangeNotifierProvider<PlaceDesProvider>(create: (_)=>PlaceDesProvider(),)
];

