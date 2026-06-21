import 'package:flutter/material.dart';
import 'package:task1/main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _hidePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.asset('assets/2.jpg').image,
            fit: .fill,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 8, 30, 8),
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: .center,
                      // mainAxisAlignment: .center,
                      spacing: 30,
                      children: [
                        const SizedBox(height: 100),
                        Text(
                          'Welcome Back!',
                          style: const TextStyle(
                            fontSize: 36,
                            fontWeight: .bold,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        TextFormField(
                          controller: emailController,
                          style: const TextStyle(color: Colors.white),
                          keyboardType: .emailAddress,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Email is required";
                            }
                            final emailRegEx = RegExp(
                              r'^[\w\.-]+@[\w\.-]+\.\w+$',
                            );
                            if (!emailRegEx.hasMatch(value)) {
                              return "Enter a valid Email Address";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            // filled: true,
                            fillColor: Color.fromARGB(255, 255, 255, 255),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: Colors.white,
                            ),
                            hintText: 'Enter Email',
                            labelText: 'Email',
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),

                        TextField(
                          controller: passwordController,
                          style: const TextStyle(color: Colors.white),
                          obscureText: _hidePassword,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            prefixIcon: Icon(
                              Icons.password_outlined,
                              color: Colors.white,
                            ),
                            hintText: 'Enter Password',
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.white),
                            suffixIcon: IconButton(
                              color: Colors.white,
                              icon: Icon(
                                _hidePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  _hidePassword = !_hidePassword;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // All fields are valid

                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        MyHomePage(title: 'Task 1 - Home Page'),
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(
                                255,
                                1,
                                115,
                                208,
                              ),
                              foregroundColor: Colors.white,
                              elevation: 3,
                            ),
                            child: Text('Login'),
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
      ),
    );
  }
}
