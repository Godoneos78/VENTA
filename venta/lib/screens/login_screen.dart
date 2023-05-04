import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../widgets/input_decoration.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [cajapurpura(size), iconocasa(), loginform(context)],
        ),
      ),
    );
  }

  SingleChildScrollView loginform(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        const SizedBox(height: 250),
        Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 40),
            width: double.infinity,
            //height: 100,
            //color: Colors.indigo,
            // height: 340,
            decoration: BoxDecoration(
                //caja de inicio dseion
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 15, //sombreado de la caja inicio sesion
                      offset: Offset(0, 5))
                ]),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text('Login', style: Theme.of(context).textTheme.headline4),
                const SizedBox(height: 30),
                Container(
                    child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      decoration: InputDecorations.inputDecoration(
                          hintext: 'ejemplo@gmail.com',
                          labeltext: 'correo electronico',
                          icono: const Icon(Icons.alternate_email_rounded)),
                      validator: (value) {
                        String pattern =
                            (r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                        RegExp regExp = new RegExp(pattern);
                        return regExp.hasMatch(value ?? '')
                            ? null
                            : 'El valor ingresado no es un correo';
                      },
                    ),
                    SizedBox(height: 30),
                    TextFormField(
                        autocorrect: false,
                        obscureText: true,
                        decoration: InputDecorations.inputDecoration(
                            hintext: '********',
                            icono: const Icon(Icons.lock_clock_outlined),
                            labeltext: 'Ingrese Contraseña'),
                        validator: (value) {
                          return (value != null && value.length >= 8)
                              ? null
                              : 'Ingrese sus 8 o mas caracteres';
                        }),
                    const SizedBox(height: 20),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      disabledColor: Colors.grey,
                      color: const Color.fromARGB(255, 82, 35, 91),
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 80, vertical: 15),
                          child: Text(
                            'Ingresar',
                            style: TextStyle(color: Colors.white),
                          )),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, 'home');
                      },
                    )
                  ]),
                )) // texto  SizedBox(height: 30),
              ],
            )),
        SizedBox(height: 50),
        Text(
          'Crear una cuenta cuenta',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        )
      ]),
    );
  }

  SafeArea iconocasa() {
    return SafeArea(
      //para cualquier tamaño de celular
      child: Container(
        margin: const EdgeInsets.only(top: 40),
        width: double.infinity,
        child: const Icon(Icons.home_filled, color: Colors.white, size: 150),
      ),
    );
  }

  Container cajapurpura(Size size) {
    return Container(
      //color: Colors.blue,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(63, 63, 156, 1),
        Color.fromRGBO(90, 70, 178, 1),
      ])),
      width: double.infinity,
      height: size.height * 0.4,
      child: Stack(children: [
        Positioned(child: burbuja(), top: 90, left: 30),
        Positioned(child: burbuja(), top: -40, left: -30),
        Positioned(child: burbuja(), top: -50, right: -20),
        Positioned(child: burbuja(), bottom: -50, left: 10),
        Positioned(child: burbuja(), bottom: 120, right: 20),
      ]),
    );
  }

  Container burbuja() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Color.fromRGBO(255, 255, 255, 0.05)),
    );
  }
}
