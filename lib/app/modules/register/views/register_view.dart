import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sertif2/app/modules/login/views/login_view.dart';
import 'package:sertif2/app/modules/register/controllers/register_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterView extends StatelessWidget {
  final RegisterController controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[300],
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 100, 16, 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Register',
              style: GoogleFonts.poppins(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              'Welcome back,\nPlease create to your account',
              style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 32),
            TextField(
              controller: controller.usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
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
              controller: controller.emailController,
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
              controller: controller.passwordController,
              obscureText: !controller.isPasswordVisible,
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
                    controller.isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    controller.togglePasswordVisibility();
                  },
                ),
              ),
              style: GoogleFonts.poppins(color: Colors.white),
              cursorColor: Colors.white,
            ),
            SizedBox(height: 16),
            TextField(
              controller: controller.confirmPasswordController,
              obscureText: !controller.isPasswordVisible,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                labelStyle: GoogleFonts.poppins(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    controller.toggleConfirmPasswordVisibility();
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
                      controller.register();
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.pink[300],
                      backgroundColor: Colors.white,
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
                            'Register',
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
            Spacer(),
            Center(
              child: TextButton(
                onPressed: () {
                  Get.off(LoginView());
                },
                child: Text(
                  'Already have an account? Login',
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
