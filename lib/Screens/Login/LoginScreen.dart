import 'package:flutter/material.dart';
import 'package:refersh_brain/Screens/Home/HomeScreen.dart';
import 'package:refersh_brain/Screens/Login/myClipper.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = 'login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool validateForm() {
    if (!formKey.currentState.validate()) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Enter All Data ')));
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Stack(
        alignment: AlignmentDirectional.centerEnd,
        children: [
          Column(
            children: [
              Expanded(
                  child: ClipPath(
                    clipper: MyClipper(),
                    child: Container(
                decoration: BoxDecoration(
                      color: Colors.grey.shade500,
                      image:
                          DecorationImage(image: AssetImage('assets/yoga.png')),
                    ),
              ),
                  )),
              Expanded(
                  child: Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Center(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.zero,
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text('Please Sign In',
                              style: Theme.of(context).textTheme.headline5),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: (email) {
                              if (email.isEmpty) return 'Please Enter Email';
                              return null;
                            },
                            decoration: InputDecoration(
                                hintText: 'Email',
                                suffixIcon: Icon(Icons.email),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 1),
                                    borderRadius: BorderRadius.circular(30))),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            validator: (password) {
                              if (password.isEmpty)
                                return 'Please Enter Password';
                              return null;
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 1),
                                    borderRadius: BorderRadius.circular(30)),
                                hintText: 'Password',
                                suffixIcon: Icon(Icons.face_unlock_outlined)),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Forget Password!',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(color: Colors.grey),
                          ),
                          ElevatedButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)))),
                              onPressed: () {
                                if(validateForm())
                                Navigator.pushNamed(
                                    context, HomeScreen.routeName);
                              },
                              child: Text(
                                'Sign In',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(color: Colors.white),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: CircleAvatar(
              radius: 25,
              child: IconButton(
                color: Colors.white,
                icon: Icon(Icons.send_outlined),
                onPressed: () {},
              ),
            ),
          )
        ],
      )),
    );
  }
}
