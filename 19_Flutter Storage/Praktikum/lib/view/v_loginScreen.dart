import 'package:coba_storage/view/v_contactScreen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  String passwd = "12345";

  late SharedPreferences loginData;
  late bool newUser;

  void checkLogin() async {
    loginData = await SharedPreferences.getInstance();
    newUser = loginData.getBool("newUser") ?? true;

    if (newUser == false) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const Login(),
          ),
          (route) => false);
    }
  }

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login Page',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              const Text(
                "LOGIN",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5.0),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text(
                        "Login to your account",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _usernameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter username";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text("Username"),
                          prefixIcon: Icon(Icons.person),
                          labelStyle: TextStyle(color: Colors.grey),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2.0, color: Colors.grey),
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter email";
                          }
                          final emailValidate = EmailValidator.validate(value);
                          if (!emailValidate) {
                            return "Please enter valid email";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text("Email"),
                          prefixIcon: Icon(Icons.mail),
                          labelStyle: TextStyle(color: Colors.grey),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2.0, color: Colors.grey),
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter password";
                          }
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          label: const Text("Password"),
                          prefixIcon: Icon(Icons.lock),
                          labelStyle: TextStyle(color: Colors.grey),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2.0, color: Colors.grey),
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 40),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            final isValidate =
                                _formKey.currentState!.validate();
                            String username = _usernameController.text;
                            print(username);
                            String password = _passwordController.text;

                            if (isValidate) {
                              if (password != passwd) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Incorrect Password"),
                                  ),
                                );
                              } else {
                                loginData.setBool("login", false);
                                loginData.setString("username", username);

                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ContactScreen()),
                                    (route) => false);
                              }
                            }
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
