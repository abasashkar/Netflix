import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/provider/login_provider.dart';
import 'package:netflix_app/widgets/bottom_nav.dart';
import 'package:provider/provider.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  String email = "";
  String password = "";

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  userLogin() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailcontroller.text,
      password: passwordcontroller.text,
    );
    await Future.delayed(const Duration(seconds: 3));

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.green, content: Text('Login succuesful')));

    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext) => const BottomNav()));
  }

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginprovider = Provider.of<LoginProvider>(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: GestureDetector(
            child: const Icon(Icons.arrow_back),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          title: const Row(
            children: [
              Expanded(
                child: Center(
                  child: Image(
                    image: AssetImage('assets/logo.png'),
                    height: 50,
                  ),
                ),
              ),
              Text(
                'Help',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          centerTitle: true, // Ensures the title is centered
        ),
        body: Container(
          margin: const EdgeInsets.all(8.0),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 65,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 82, 77, 77)),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        } else {
                          return null;
                        }
                      },
                      controller: emailcontroller,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.fromLTRB(20, 16, 0, 10),
                        hintText: "Enter Email",
                        hintStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 65,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 82, 77, 77)),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        } else {
                          return null;
                        }
                      },
                      controller: passwordcontroller,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.fromLTRB(20, 16, 0, 10),
                        hintText: "Password",
                        hintStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () async {
                      if (_formkey.currentState!.validate()) {
                        await loginprovider.LoginUser(
                            emailcontroller.text, passwordcontroller.text);
                        if (loginprovider.errormes.isEmpty) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BottomNav()));
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                                  backgroundColor: Colors.black,
                                  content: Center(
                                    child: Text(
                                      'Incorrect password or email',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )));
                        }
                      }
                    },
                    child: Container(
                      height: 50,
                      width: 360,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 128, 16, 8)),
                      child: const Center(
                          child: Text(
                        'Sign In',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      )),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:netflix_app/provider/login_provider.dart';
// import 'package:netflix_app/widgets/bottom_nav.dart';

// class Loginpage extends StatefulWidget {
//   const Loginpage({super.key});

//   @override
//   State<Loginpage> createState() => _LoginpageState();
// }

// class _LoginpageState extends State<Loginpage> {
//   TextEditingController emailcontroller = TextEditingController();
//   TextEditingController passwordcontroller = TextEditingController();
//   final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     final loginprovider = Provider.of<LoginProvider>(context);

//     return SafeArea(
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         appBar: AppBar(
//           leading: GestureDetector(
//             child: const Icon(Icons.arrow_back),
//             onTap: () {
//               Navigator.pop(context);
//             },
//           ),
//           title: const Text('Help',
//               style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
//           centerTitle: true,
//         ),
//         body: Container(
//           margin: const EdgeInsets.all(8.0),
//           child: Form(
//             key: _formkey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // Email input
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: TextFormField(
//                     controller: emailcontroller,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your email';
//                       }
//                       return null;
//                     },
//                     decoration: InputDecoration(hintText: "Enter Email"),
//                   ),
//                 ),
//                 // Password input
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: TextFormField(
//                     controller: passwordcontroller,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your password';
//                       }
//                       return null;
//                     },
//                     decoration: InputDecoration(hintText: "Password"),
//                     obscureText: true,
//                   ),
//                 ),
//                 // Sign In button
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: GestureDetector(
//                     onTap: () async {
//                       if (_formkey.currentState!.validate()) {
//                         await loginprovider.LoginUser(
//                           emailcontroller.text,
//                           passwordcontroller.text,
//                         );
//                         // Check for errors before navigating
//                         if (loginprovider.errormes.isEmpty) {
//                           Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const BottomNav()),
//                           );
//                         } else {
//                           // Show error message if needed
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(content: Text(loginprovider.errormes)),
//                           );
//                         }
//                       }
//                     },
//                     child: Container(
//                       height: 50,
//                       width: 360,
//                       color: Colors.blue,
//                       child: const Center(
//                         child: Text(
//                           'Sign In',
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold, fontSize: 17),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 // Loading Indicator
//                 if (loginprovider.isLoading) CircularProgressIndicator(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
