import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffecf4f3),
        body: LayoutBuilder(
          builder: (context, constraints) => ListView(
            children: [
              Container(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  children: [
                    SizedBox(height: spacing_2),
                    Text(
                      "Let's plant with us",
                      style: TextStyle(fontSize: 40),
                    ),
                    SizedBox(height: spacing_1),
                    Text(
                      "Bring nature home",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: spacing_2),
                    Stack(
                      children: [
                        Positioned.fill(
                          bottom: 0,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Image(
                              height: 256,
                              image: AssetImage("images/image bg.png"),
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 0),
                            child: Image(
                              image: AssetImage("images/plant.png"),
                              height: 384,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: spacing_2),
                    MaterialButton(
                      onPressed: () {
                        Navigator.popAndPushNamed(context, '/');
                      },
                      color: Color(0xffff7e67),
                      shape: RoundedRectangleBorder(
                        side: new BorderSide(color: Color(0xffff7e67)),
                        borderRadius: new BorderRadius.all(
                          new Radius.circular(45),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 82, vertical: 12),
                        child: Text(
                          "Sign In",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: spacing_2),
                    GestureDetector(
                      onTap: () {},
                      child: Text("Create an account"),
                    ),
                    SizedBox(height: spacing_2),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
