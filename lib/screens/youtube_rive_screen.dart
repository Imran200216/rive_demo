import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  /// animation link
  var animationLink = "assets/rive/demo.riv";

  /// for logical states for rive animations
  SMIInput<bool>? isChecking;
  SMIInput<bool>? isHandsUp;
  SMIInput<bool>? trigSuccess;
  SMIInput<bool>? trigFailure;

  /// state machine controller is used for handling the rive animations
  late StateMachineController? stateMachineController;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Login screen"),
          centerTitle: true,
          backgroundColor: Colors.black,
          titleTextStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        body: Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 30,
            bottom: 30,
          ),
          child: Column(
            children: [
              /// rive animation
              SizedBox(
                height: 350,
                width: 400,
                child: RiveAnimation.asset(
                  animationLink,
                  fit: BoxFit.fill,
                  stateMachines: const ["Login Machine"],
                  onInit: (artBoard) {
                    StateMachineController.fromArtboard(
                      artBoard,
                      "Login Machine",
                    );

                    if (stateMachineController == null) return;
                    artBoard.addController(stateMachineController!);
                    isChecking =
                        stateMachineController?.findInput("isChecking");

                    isHandsUp = stateMachineController?.findInput("isHandsUp");

                    trigSuccess =
                        stateMachineController?.findInput("trigSuccess");

                    trigFailure =
                        stateMachineController?.findInput("trigFailure");
                  },
                ),
              ),

              SizedBox(
                height: size.height * 0.04,
              ),

              /// user name field
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Username",
                ),
              ),

              SizedBox(
                height: size.height * 0.04,
              ),

              /// password text field
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password",
                ),
              ),

              SizedBox(
                height: size.height * 0.08,
              ),

              InkWell(
                onTap: () {},
                child: Container(
                  height: size.height * 0.06,
                  width: size.width,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.black,
                  ),
                  child: const Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
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
