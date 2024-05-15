import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sertif2/app/modules/register/views/register_view.dart';
import '../controllers/login_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;
  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[300],
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 200, 16, 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login',
              style: GoogleFonts.poppins(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              'Welcome back,\nPlease login to your account',
              style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 32),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: GoogleFonts.poppins(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              style: GoogleFonts.poppins(color: Colors.white),
              cursorColor: Colors.white,
            ),
            SizedBox(height: 16),
            TextField(
              controller: passwordController,
              obscureText: !isPasswordVisible,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: GoogleFonts.poppins(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                ),
              ),
              style: GoogleFonts.poppins(color: Colors.white),
              cursorColor: Colors.white,
            ),
            SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      String email = emailController.text.trim();
                      String password = passwordController.text.trim();
                      _loginController.login(email, password, context);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.pink[300],
                      backgroundColor: Colors.white, // Text color
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Login',
                            style: GoogleFonts.poppins(fontSize: 18),
                          ),
                          Icon(Icons.arrow_right_alt),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Center(
              child: TextButton(
                onPressed: () {
  
                },
                child: Text(
                  'Forgot the password?',
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
              ),
            ),
            Spacer(),
            Center(
              child: TextButton(
                onPressed: () {
                  Get.off(RegisterView());
                },
                child: Text(
                  'Don\'t have any account? Register',
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
