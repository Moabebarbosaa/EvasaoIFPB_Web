import 'package:evasao_ifpb/components/custom_text.dart';
import 'package:flutter/material.dart';
import '../base/base_page.dart';
import '../home/home_page.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/auth';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  void initState() {
    textControllerEmail = TextEditingController();
    textControllerPassword = TextEditingController();
    textControllerEmail.text = '';
    textControllerPassword.text = '';
    textFocusNodeEmail = FocusNode();
    textFocusNodePassword = FocusNode();
    super.initState();
  }

  late TextEditingController textControllerEmail;
  late FocusNode textFocusNodeEmail;
  bool _isEditingEmail = false;

  late TextEditingController textControllerPassword;
  late FocusNode textFocusNodePassword;
  bool _isEditingPassword = false;
  bool _isLoggingIn = false;

  String? loginStatus;
  Color loginStringColor = Colors.green;

  @override
  Widget build(BuildContext context) {

    String? _validateEmail(String value) {
      value = value.trim();

      if (value.isNotEmpty) {
        if (!value.contains(RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
          return 'Digite um endereço de e-mail válido.';
        }
      }
      return null;
    }

    String? _validatePassword(String value) {
      value = value.trim();

      if (value.isNotEmpty) {
        if (value.length < 6) {
          return 'O tamanho da senha deve ser maior que 6.';
        }
      }
      return null;
    }

    return Scaffold(
        backgroundColor: Colors.green,
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            alignment: Alignment.center,
            width: 325,
            height: 325,
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/ifpb.png',
                        height: 25,
                        alignment: Alignment.topCenter,
                      ),
                      const CustomText(text: 'EVASÃO IFPB-CG', fontSize: 24, fontWeight: FontWeight.bold,corText: Colors.green,)
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20,
                  ),
                  child: TextField(
                    focusNode: textFocusNodeEmail,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    controller: textControllerEmail,
                    autofocus: false,
                    onChanged: (value) {
                      setState(() {
                        _isEditingEmail = true;
                      });
                    },
                    onSubmitted: (value) {
                      textFocusNodeEmail.unfocus();
                      FocusScope.of(context)
                          .requestFocus(textFocusNodePassword);
                    },
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.blueGrey[800]!,
                          width: 3,
                        ),
                      ),
                      filled: true,
                      hintStyle: TextStyle(
                        color: Colors.blueGrey[300],
                      ),
                      hintText: "Email",
                      fillColor: Colors.white,
                      errorText: _isEditingEmail
                          ? _validateEmail(textControllerEmail.text)
                          : null,
                      errorStyle: const TextStyle(
                        fontSize: 12,
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20,
                  ),
                  child: TextField(
                    focusNode: textFocusNodePassword,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    controller: textControllerPassword,
                    obscureText: true,
                    autofocus: false,
                    onChanged: (value) {
                      setState(() {
                        _isEditingPassword = true;
                      });
                    },
                    onSubmitted: (value) {
                      textFocusNodePassword.unfocus();
                      FocusScope.of(context)
                          .requestFocus(textFocusNodePassword);
                    },
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock_sharp),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.blueGrey[800]!,
                          width: 3,
                        ),
                      ),
                      filled: true,
                      hintStyle: TextStyle(
                        color: Colors.blueGrey[300],
                      ),
                      hintText: "Senha",
                      fillColor: Colors.white,
                      errorText: _isEditingPassword
                          ? _validatePassword(textControllerPassword.text)
                          : null,
                      errorStyle: const TextStyle(
                        fontSize: 12,
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        flex: 1,
                        child: SizedBox(
                          width: double.maxFinite,
                          child: TextButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.green),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                    )
                                )
                            ),
                            onPressed: () async {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const Center(child: CircularProgressIndicator(),);
                                  });
                              await loginAction();
                              Navigator.pop(context);
                              setState(() {
                                _isLoggingIn = true;
                                textFocusNodeEmail.unfocus();
                                textFocusNodePassword.unfocus();
                              });
                              if (_validateEmail(textControllerEmail.text) == null &&
                                  _validatePassword(textControllerPassword.text) == null) {
                                if(textControllerEmail.text == "evasaoifpbcg@gmail.com" &&
                                    textControllerPassword.text == "projetoevasao"){
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                                    fullscreenDialog: true,
                                    builder: (context) => const BasePage(),
                                  ));
                                }else{
                                  const snackBar = SnackBar(
                                    content: CustomText(text: 'Email ou senha incorreto.'),
                                    backgroundColor: Colors.red,
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                }
                              }else{
                                const snackBar = SnackBar(
                                  content: CustomText(text: 'Preencha os dados da forma correta.'),
                                  backgroundColor: Colors.red,
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                              setState(() {
                                _isLoggingIn = false;
                                textControllerEmail.text = '';
                                textControllerPassword.text = '';
                                _isEditingEmail = false;
                                _isEditingPassword = false;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 15.0,
                                bottom: 15.0,
                              ),
                              child: _isLoggingIn
                                  ? const SizedBox(
                                height: 16,
                                width: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor:
                                  AlwaysStoppedAnimation<Color>(
                                    Colors.white,
                                  ),
                                ),
                              )
                                  : const Text(
                                'Entrar',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }

  Future<bool> loginAction() async {
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }

}