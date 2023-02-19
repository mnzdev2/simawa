import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localization/src/extension/string_extension.dart';
import 'package:simawa/constants/app_constants.dart';
import 'package:simawa/constants/route_constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController userName = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                AppConstants.appName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w600),
              ),
              const Divider(
                height: 2,
                indent: 10,
                endIndent: 10,
                thickness: 2,
                color: Colors.white,
              ),
              const Text(
                AppConstants.appDesc,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 100),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppConstants.usernameLabel.getString(context),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white),
                child: TextField(
                  controller: userName,
                  style: const TextStyle(color: Colors.black),
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppConstants.passwordLabel.getString(context),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white),
                child: TextField(
                  onChanged: (value) {
                    setState(() {});
                  },
                  controller: password,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.remove_red_eye),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  AppConstants.forgotPassword.getString(context),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                height: 56,
                width: 243,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white),
                child: TextButton(
                    onPressed:
                        userName.text.isNotEmpty && password.text.isNotEmpty
                            ? () {
                                Navigator.of(context)
                                    .pushNamed(RouteConstants.initialPage);
                              }
                            : null,
                    child: Text(
                      AppConstants.login.getString(context),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
              )
            ],
          ),
        ));
  }
}
