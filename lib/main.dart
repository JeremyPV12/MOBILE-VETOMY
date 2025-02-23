import 'package:flutter/material.dart';
//import 'screens/splash_screen.dart'; // Importa la pantalla de carga
import 'screens/home_screen.dart'; // Importa la pantalla principal
import 'screens/login_screen.dart'; //Importa la pantalla de login
import 'screens/welcome_screen.dart';
import 'screens/nueva_cuenta_screen.dart'; 
import 'screens/mi_cuenta.dart';
import 'package:localstorage/localstorage.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocalStorage();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Veterinaria App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(), // Pantalla de carga inicial
      routes: {
        '/home': (context) => HomeScreen(), // Pantalla principal
        '/login': (context) => LoginScreen(),
        '/welcome': (context) => WelcomeScreen(),
        '/register': (context) => NuevaCuentaScreen(),
        '/account': (context) => MiCuentaScreen(),
      },
    );
  }
}
