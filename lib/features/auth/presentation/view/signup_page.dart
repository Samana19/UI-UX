import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_daily_digest/core/common/color/colors.dart';
import 'package:the_daily_digest/core/common/spacing/space.dart';
import 'package:the_daily_digest/core/common/text%20style/text_style.dart';
import 'package:the_daily_digest/core/common/widget/main_button.dart';
import 'package:the_daily_digest/features/auth/domain/entity/user_entity.dart';
import 'package:the_daily_digest/features/auth/presentation/viewmodel/auth_viewmodel.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final fkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authViewModelProvider);
    return Form(
      key: fkey,
      child: Scaffold(
        backgroundColor: white,
        body: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SpaceVH(height: 50.0),
                const Padding(
                  padding: EdgeInsets.only(right: 100.0),
                  child: Text(
                    'Come Join Us!',
                    style: CustomTextStyles.headlinebold,
                  ),
                ),
                const SpaceVH(height: 10.0),
                const Padding(
                  padding: EdgeInsets.only(right: 70.0),
                  child: Text(
                    'Join us to stay updated with the latest news',
                    style: CustomTextStyles.headline3,
                  ),
                ),
                const SpaceVH(height: 40.0),

                // ),
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    hintText: 'Username',
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),

                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),

                const SpaceVH(height: 50.0),
                Mainbutton(
                  onPressed: () {
                    if (fkey.currentState!.validate()) {
                      var user = UserEntity(
                        username: _usernameController.text,
                        email: _emailController.text,
                        password: _passwordController.text,
                      );

                      ref
                          .read(authViewModelProvider.notifier)
                          .registerUser(context, user);
                    }
                  },
                  text: 'Sign Up',
                  btnColor: darkBlueButton,
                ),
                // const SizedBox(
                //   height: 50,
                //   width: 320, // Specify the desired height here
                //   child: Row(
                //     children: [
                //       Expanded(
                //         child: Divider(
                //           thickness: 1.0,
                //           color: Colors.grey,
                //         ),
                //       ),
                //       Padding(
                //         padding: EdgeInsets.symmetric(horizontal: 8.0),
                //         child: Text(
                //           'or',
                //           style: TextStyle(
                //             fontSize: 16.0,
                //             color: Colors.black,
                //           ),
                //         ),
                //       ),
                //       Expanded(
                //         child: Divider(
                //           thickness: 1.0,
                //           color: Colors.grey,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // Mainbutton(
                //   onPressed: () {},
                //   text: 'Sign in with Google',
                //   imagePath: 'assets/images/',
                //   image: 'google.png',
                //   btnColor: whiteBackground,
                //   txtColor: darkBlueText,
                // ),
                const SpaceVH(height: 20.0),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: 'Have an account? ',
                        style: CustomTextStyles.headline.copyWith(
                          fontSize: 14.0,
                        ),
                      ),
                      TextSpan(
                        text: ' Sign In',
                        style: CustomTextStyles.headline3.copyWith(
                          fontSize: 14.0,
                        ),
                      ),
                    ]),
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


// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:permission_handler/permission_handler.dart';
// import '../../../../core/common/color/colors.dart';
// import '../../../../core/common/spacing/space.dart';
// import '../../../../core/common/text style/text_style.dart';
// import '../../../../core/common/widget/main_button.dart';
// import '../../../../core/common/widget/text_field.dart';
// import '../../domain/entity/user_entity.dart';
// import '../viewmodel/auth_viewmodel.dart';

// class SignUpPage extends ConsumerStatefulWidget {
//   const SignUpPage({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _SignUpPageState();
// }

// class _SignUpPageState extends ConsumerState<SignUpPage> {
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final fkey = GlobalKey<FormState>();

//   checkCameraPermission() async {
//     if (await Permission.camera.request().isRestricted ||
//         await Permission.camera.request().isDenied) {
//       await Permission.camera.request();
//     }
//   }

//   File? _img;
//   Future _browseImage(WidgetRef ref, ImageSource imageSource) async {
//     try {
//       final image = await ImagePicker().pickImage(source: imageSource);
//       if (image != null) {
//         setState(() {
//           _img = File(image.path);
//         });
//       } else {
//         return;
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final authState = ref.watch(authViewModelProvider);
//     return Form(
//       key: fkey,
//       child: Scaffold(
//         backgroundColor: white,
//         body: Padding(
//           padding: const EdgeInsets.only(top: 50.0),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 const SpaceVH(height: 50.0),
//                 const Padding(
//                   padding: EdgeInsets.only(right: 100.0),
//                   child: Text(
//                     'Come Join Us!',
//                     style: CustomTextStyles.headlinebold,
//                   ),
//                 ),
//                 const SpaceVH(height: 10.0),
//                 const Padding(
//                   padding: EdgeInsets.only(right: 70.0),
//                   child: Text(
//                     'Join us to stay updated with the latest news',
//                     style: CustomTextStyles.headline3,
//                   ),
//                 ),
//                 const SpaceVH(height: 40.0),

//                 // ),
//                 textField(
//                   controller: _usernameController,
//                   image: 'user.svg',
//                   keyBordType: TextInputType.name,
//                   hintTxt: 'Full Name',
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter your name';
//                     }
//                     return null;
//                   },
//                 ),
//                 textField(
//                   controller: _emailController,
//                   keyBordType: TextInputType.emailAddress,
//                   image: 'user.svg',
//                   hintTxt: 'Email Address',
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter your email';
//                     }
//                     return null;
//                   },
//                 ),
//                 textField(
//                   controller: _passwordController,
//                   isObs: true,
//                   image: 'hide.svg',
//                   hintTxt: 'Password',
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter your password';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SpaceVH(height: 50.0),
//                 Mainbutton(
//                   onPressed: () {
//                     if (fkey.currentState!.validate()) {
//                       var user = UserEntity(
//                         username: _usernameController.text,
//                         email: _emailController.text,
//                         password: _passwordController.text,
//                       );

//                       ref
//                           .read(authViewModelProvider.notifier)
//                           .registerUser(user);

//                       if (authState.error != null) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(
//                             content: Text("sucessfully registered"),
//                           ),
//                         );
//                       } else {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text(authState.error!),
//                           ),
//                         );
//                       }
//                     }
//                   },
//                   text: 'Sign Up',
//                   btnColor: darkBlueButton,
//                 ),
//                 const SizedBox(
//                   height: 50,
//                   width: 320, // Specify the desired height here
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: Divider(
//                           thickness: 1.0,
//                           color: Colors.grey,
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 8.0),
//                         child: Text(
//                           'or',
//                           style: TextStyle(
//                             fontSize: 16.0,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: Divider(
//                           thickness: 1.0,
//                           color: Colors.grey,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Mainbutton(
//                   onPressed: () {},
//                   text: 'Sign in with Google',
//                   imagePath: 'assets/images/',
//                   image: 'google.png',
//                   btnColor: whiteBackground,
//                   txtColor: darkBlueText,
//                 ),
//                 const SpaceVH(height: 20.0),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: RichText(
//                     text: TextSpan(children: [
//                       TextSpan(
//                         text: 'Have an account? ',
//                         style: CustomTextStyles.headline.copyWith(
//                           fontSize: 14.0,
//                         ),
//                       ),
//                       TextSpan(
//                         text: ' Sign In',
//                         style: CustomTextStyles.headline3.copyWith(
//                           fontSize: 14.0,
//                         ),
//                       ),
//                     ]),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
