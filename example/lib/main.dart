import 'package:click_login_box/click_login_box.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Click Login Box',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Click Login Box'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ClickLoginBox(
        forgotPasswordText: 'Esqueceu sua senha?',
        loginType: LoginType.id,
        logo: SvgPicture.asset(
          'assets/white-logo.svg',
        ),
        applicationName: 'CLICK ORDER',
        applicationVersionText: 'Versão - 1.0.0',
        onPressedLogin: (loginModel) async {
          await Future.delayed(const Duration(seconds: 3));
          debugPrint(loginModel.toJson());
        },
        onPressedForgotPassword: () async {
          debugPrint('Esqueci a senha');
        },
      ),
    );
  }
}
