import 'package:flutter/material.dart';
import 'package:raffle_app/models/widgets.dart';
import 'package:raffle_app/services/auth.dart';

class CreateAccountForm extends StatefulWidget {
  const CreateAccountForm({Key? key}) : super(key: key);

  CreateAccount createState() => CreateAccount();
}

class CreateAccount extends State<CreateAccountForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final FirebaseAuthService _auth = FirebaseAuthService();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PlainTextField(
            obscureText: false,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: 'email'),
            controller: emailController),
        PlainTextField(
            obscureText: true,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: 'Password'),
            controller: passwordController),
        SmallButton(
            child: Text('Create Account'),
            onPressed: () async {
              int result = await _auth.createAccount(
                  emailController.text, passwordController.text);
              if (result == 0) {
                Navigator.pushNamed(context, '/home');
              } else if (result == 1) {
                showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                            title: const Text('Weak password!'),
                            actions: <Widget>[
                              TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'))
                            ]));
              } else if (result == 2) {
                showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                            title: const Text('Email already in use!'),
                            actions: <Widget>[
                              TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'))
                            ]));
              } else {
                showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                            title: const Text('Unknown error!'),
                            content:
                                const Text('(you shouldnt be seeing this)'),
                            actions: <Widget>[
                              TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'))
                            ]));
              }
            }),
        SmallButton(
            child: Text('Sign In'),
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            })
      ],
    )));
  }
}
