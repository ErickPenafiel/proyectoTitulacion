import 'package:flutter/material.dart';
import 'usuario.dart';
import 'control_usuario.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key, required this.title});
  final String title;
  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  ControlUsuario ctrlUsuario = ControlUsuario();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Usuario',
                  labelText: 'Cuenta de Usuario',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.verified_user),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: 'Contraseña',
                  prefixIcon: Icon(Icons.password),
                  labelText: 'Conraseña',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  Usuario user = Usuario(
                    cuenta: _emailController.text,
                    contrasena: _passwordController.text,
                  );
                  bool authenticated = await ctrlUsuario.autentificar(user);
                  if (authenticated) {
//                    Navigator.pushReplacementNamed(context, '/home');
                  } else {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Error de autenticación'),
                            content: Text(
                                'No se ha podido autenticar el usuario. Verifica tus credenciales e inténtalo de nuevo.'),
                            actions: [
                              TextButton(
                                child: Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              )
                            ],
                          );
                        });
                  }
                },
                child: Text('Iniciar sesión'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
