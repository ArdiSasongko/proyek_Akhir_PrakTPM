import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mexican_food/Hive/user.dart';
import 'package:mexican_food/LOGIN/register.dart';
import 'package:mexican_food/card.dart';
import 'package:mexican_food/listFood.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _alertDialog(BuildContext context){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          backgroundColor: Colors.black,
          content: const Text('Silahkan Register',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),),
          actions: [
            TextButton(
                child: Text('Close'),
                onPressed: (){
                  Navigator.of(context).pop();
                }, )
          ],
        );
      }
    );
  }

  void _alertDialog2(BuildContext context){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            backgroundColor: Colors.black,
            content: const Text('Silahkan Isi data',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,),),
            actions: [
              TextButton(
                child: Text('Close'),
                onPressed: (){
                  Navigator.of(context).pop();
                }, )
            ],
          );
        }
    );
  }
  void _loginUser() {
    final String username = _usernameController.text;
    final String password = _passwordController.text;

    if (username.isNotEmpty && password.isNotEmpty) {
      final Box<User> userBox = Hive.box<User>('users');
      final List<User> users = userBox.values.toList();

      for (final user in users) {
        final String encryptedPassword = sha256.convert(utf8.encode(password)).toString();
        if (user.username == username && user.password == encryptedPassword) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => ListFood()),
          );
          return;
        }
      }

      _alertDialog(context);
      // Gagal login, tambahkan logika lainnya di sini, seperti menampilkan pesan kesalahan.
    }
    else{
      _alertDialog2(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Masuk",
          style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: SizedBox(
        height: 500,
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text(
                  "Login",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
                const SizedBox(height: 50),
                SizedBox(
                  width: 400,
                  child: TextField(
                    controller: _usernameController,
                    style: const TextStyle(fontSize: 14),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Username",
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 400,
                  child: TextField(
                    controller: _passwordController,
                    style: const TextStyle(fontSize: 14),
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Password",
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: _loginUser,
                  child: const Text("Login", style: TextStyle(fontSize: 17)),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 22),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    primary: Color(0xFF282828),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context)=> RegisterForm()));
                  },
                  child: const Text("Register", style: TextStyle(fontSize: 17)),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 22),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    primary: Color(0xFF282828),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // Column(
      //   children: [
      //     TextFormField(
      //       controller: _usernameController,
      //       decoration: InputDecoration(labelText: 'Username'),
      //     ),
      //     TextFormField(
      //       controller: _passwordController,
      //       obscureText: true,
      //       decoration: InputDecoration(labelText: 'Password'),
      //     ),
      //     ElevatedButton(
      //       onPressed: _loginUser,
      //       child: Text('Login'),
      //     ),
      //   ],
      // ),

    );
  }
}
