import 'package:easy_localization/easy_localization.dart';
import 'package:fastmkcrm/providers/userapi_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsW, kIsWeb;
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            cajapurpura(size),
            iconpersonal(),
            loginform(context),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView loginform(BuildContext context) {
    final userProvider = Provider.of<Userapi_provider>(context);
    userProvider.getUserapis();
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 250),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            height: (MediaQuery.of(context).size.height) * 0.5,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    //blurRadius: 15, // gölgelik atılması için kullanılır.
                    offset: Offset(0, 5),
                  )
                ]),
            child: Column(
              children: [
                SizedBox(height: 10),
                Text('login_title'.tr(), style: Theme.of(context).textTheme.headline4),
                SizedBox(height: 30),
                Container(
                  child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        TextFormField(
                          autocorrect: false,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green, width: 2),
                            ),
                            hintText: 'Kullanıcı Adı Giriniz...',
                            labelText: 'admin'.tr(),
                            prefix: Icon(Icons.how_to_reg),
                          ),
                          validator: (value){
                            return (value != null && value.length >=3)
                                ? null : 'kullanıcı adı giriniz';
                          },
                        ),
                        const SizedBox(height: 30),
                        TextFormField(
                          autocorrect: false,
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: '******',
                              labelText: 'password'.tr(),
                              prefix: Icon(Icons.lock_outline)),
                          validator: (value) {
                            return (value != null && value.length >= 6)
                                ? null
                                : 'şifre girişi yapmadınız .. en az 6 karakter olmalıdır....';
                          },
                        ),
                        const SizedBox(height: 20),
                        SingleChildScrollView(
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            disabledColor: Colors.grey,
                            color: Colors.green,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 80, vertical: 15),
                              child: Text(
                                'login_button'.tr(),
                                style: TextStyle(color: Colors.white),
                              ).tr(),
                            ),
                            onPressed: () {
                              print (userProvider.userapis);
                              print ("tuşa basıldı.");
                              // Navigator.pushReplacementNamed(context, 'home');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),
          //const Text(
          //  'Kayıt oluşturmak',
          //  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          //),
          Text(
            kIsWeb ? "App is Running on Web".tr() : "App is Running on Mobile".tr(),
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }

  Container cajapurpura(Size size) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(248, 14, 131, 29),
        Color.fromARGB(188, 43, 173, 50),
      ])),
      width: double.infinity,
      height: size.height * 0.4,
      child: Stack(
        children: [
          Positioned(top: 90, left: 30, child: burbuja()),
          Positioned(top: -40, left: -30, child: burbuja()),
          Positioned(top: -50, right: -20, child: burbuja()),
          Positioned(bottom: -50, left: 10, child: burbuja()),
          Positioned(bottom: 120, right: -20, child: burbuja()),
        ],
      ),
    );
  }

  Container burbuja() {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: const Color.fromRGBO(10, 5, 51, 7),
      ),
    );
  }

  SafeArea iconpersonal() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 40),
        width: double.infinity,
        child: const Icon(
          Icons.person_pin,
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
