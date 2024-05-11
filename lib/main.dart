import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_almacee/Controlador/Controlador_Login.dart';
import 'package:flutter_application_almacee/Controlador/Controlador_camiones.dart';
import 'package:flutter_application_almacee/Vista/Vista_Admin.dart';
import 'Vista/Vista_MenuAlmacen.dart';
import 'Vista/Vista_MenuVigilante.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Asegurar la inicialización de Flutter
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tu Aplicacion",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: Color.fromARGB(255, 232, 114, 4), elevation: 0.0),
        colorScheme:
            ColorScheme.fromSeed(seedColor: const Color.fromARGB(0, 0, 0, 0)),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3), 
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()), 
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 15, 58, 47),
              Color.fromARGB(255, 70, 209, 191),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
          'lib/assets/camion.png', 
          width: 300,
          height: 300,
          color: Colors.white, 
              ),
              const SizedBox(
          height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class AnimatedLogo extends StatefulWidget {
  const AnimatedLogo({Key? key}) : super(key: key);

  @override
  _AnimatedLogoState createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State
<StatefulWidget> with SingleTickerProviderStateMixin{
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this as TickerProviderStateMixin,
    );
    _controller.forward(); 
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (__, _) {
        return Transform.scale(
          scale: _controller.value * 0.5 + 1.0, 
          child: Image.asset(
            'lib/assets/camion.png', 
            width: 300,
            height: 300,
            color: Colors.white,
          ),
        );
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPassword = false;
  final _formKey = GlobalKey<FormState>();
  ControladorLogin controlador = ControladorLogin();
  ControladorCamiones controladorCamiones = ControladorCamiones();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  void dispose() {
    _emailController.clear();
    _passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.7,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 15, 58, 47),
                  Color.fromARGB(255, 70, 209, 191),
                ],
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 40,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'lib/assets/camion.png',
                    width: 90,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(90),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    Form(
                      key: _formKey,
                      child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 0),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            width: MediaQuery.of(context).size.width * 0.7,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 15),
                                const Padding(
                                  padding: EdgeInsets.only(left: 8),
                                  child: Text(
                                    'Usuario',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 17),
                                  ),
                                ),
                                TextFormField(
                                  controller: _emailController,
                                  decoration: const InputDecoration(
                                    hintText: '',
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 17,
                                    ),
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                  ),
                                  style: const TextStyle(color: Colors.black),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Introduce aquí tu usuario';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            width: MediaQuery.of(context).size.width * 0.7,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 15),
                                Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(left: 8),
                                      child: Text(
                                        'Contraseña',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 17),
                                      ),
                                    ),
                                    Expanded(child: Container()),
                                    IconButton(
                                      icon: Icon(
                                        _showPassword
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color:
                                            const Color.fromARGB(255, 70, 209, 191),
                                        size: 25,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _showPassword = !_showPassword;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                TextFormField(
                                  controller: _passwordController,
                                  obscureText: !_showPassword,
                                  decoration: const InputDecoration(
                                    hintText: '',
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 17),
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                  ),
                                  style: const TextStyle(color: Colors.black),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Ingrese su contraseña';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 60.0),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: ElevatedButton(
                            onPressed: () async {
                               String usuario = _emailController.text;
                              if (await controlador.loginAndGetTipoUsuario(
                                      _emailController.text,
                                      _passwordController.text) ==
                                  1) {
                                Navigator.of(context, rootNavigator: true).push(
                                  MaterialPageRoute(
                                    builder: (context) => Inicio( usuario: usuario),
                                  ),
                                );
                                 dispose();
                              } else if (await controlador.loginAndGetTipoUsuario(
                                      _emailController.text,
                                      _passwordController.text) ==
                                  2) {
                                Navigator.of(context, rootNavigator: true).push(
                                  MaterialPageRoute(
                                    builder: (context) => MenuVigilante(usuario: usuario),
                                  ),
                                );
                                 dispose();
                              } else if (await controlador.loginAndGetTipoUsuario(
                                      _emailController.text,
                                      _passwordController.text) ==
                                  3) {
                                Navigator.of(context, rootNavigator: true).push(
                                  MaterialPageRoute(
                                    builder: (context) => VistaAdmin(usuario: usuario),
                                  ),
                                );
                                 dispose();
                              }
                             
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(const Color.fromARGB(255, 70, 209, 191)),
                              elevation: MaterialStateProperty.all(0),
                              
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(10.0), 
                              child: Text(
                                'INGRESAR',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}