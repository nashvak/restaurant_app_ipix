import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app_ipix/view/login_page/widgets/custom_textfield.dart';
import 'package:restaurant_app_ipix/view/login_page/widgets/login_button.dart';
import 'package:restaurant_app_ipix/view_model/login_page_controller.dart';
import 'package:restaurant_app_ipix/view_model/splash_screen_contoller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../home_screen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final SplashScreenController splash = SplashScreenController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Lottie.asset('assets/lottie/login_logo.json', height: 300),
                  const SizedBox(height: 10),
                  const Text(
                    "Log in\nyour account",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  const SizedBox(height: 20),
                  CustomTextfield(
                    text: 'Email',
                    controller: emailController,
                    validator: () {},
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 20),
                  Consumer<LoginScreenController>(
                    builder: (context, loginController, child) {
                      return CustomTextfield(
                        text: 'Password',
                        sufiixIcon: IconButton(
                          icon: Icon(loginController.isVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            loginController.toggleVisibility();
                          },
                        ),
                        obscure: loginController.isVisible,
                        controller: passwordController,
                        validator: () {},
                        keyboardType: TextInputType.visiblePassword,
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(value: false, onChanged: (value) {}),
                          const Text("Remember me"),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                              color: Colors.blue.shade700,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  LoginButton(
                    title: 'Log in',
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        var pref = await SharedPreferences.getInstance();
                        pref.setBool(splash.keyToLogin, true);
                        pref.setString(splash.email, emailController.text);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
