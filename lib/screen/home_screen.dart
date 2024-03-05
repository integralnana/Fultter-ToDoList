import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding_screen/component/my_button.dart';
import 'package:onboarding_screen/component/my_textfield.dart';
import 'package:onboarding_screen/screen/sign_up_screen.dart';
import 'package:onboarding_screen/screen/todolist_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  signInWithEmailAndPassword() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      _showMyDialog('Login successfully.');
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
      if (e.code == 'invalid-email') {
        _showMyDialog('No user found for that email.');
      } else if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        _showMyDialog('Wrong password provided for that user.');
      }
    }
  }

  void _showMyDialog(String txtMsg) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Expanded(
          child: AlertDialog(
            backgroundColor: Colors.amberAccent,
            title: const Text('AlertDialog Title'),
            content: Text(txtMsg),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ToDoListScreen()),
                  );
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('App Screen'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: Form(
              child: Column(
            children: [
              const Spacer(),
              Text(
                "Hello, ready to get started",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Please sign-in with your email and password",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              MyTextField(
                  controller: emailController,
                  hintText: "Enter your email",
                  obscureText: false,
                  labelText: "Email"),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                  controller: passwordController,
                  hintText: "Enter your password",
                  obscureText: false,
                  labelText: "Password"),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot password",
                          style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.displaySmall,
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.italic,
                          ),
                        )),
                  ],
                ),
              ),
              MyButton(onTap: signInWithEmailAndPassword, hintText: "Sign-in"),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Expanded(child: Divider(thickness: 0.5, color: Colors.blue)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "or continue with",
                      style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.displaySmall,
                        fontSize: 16,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                  const Expanded(
                      child: Divider(
                    color: Colors.blue,
                  ))
                ]),
              ),
              Text("Not a member",
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.displaySmall,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.normal,
                  )),
              const SizedBox(width: 1),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpScreen(),
                    ),
                  );
                },
                child: Text(
                  "Register now",
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.displaySmall,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.italic,
                    color: Colors.blue,
                  ),
                ),
              ),
              const Spacer(),
            ],
          )),
        ));
  }
}
