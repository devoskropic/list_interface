import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:line_icons/line_icons.dart';
import 'package:list_interface/app/functional/presentation/widgets/custom_dialog.dart';
import 'package:list_interface/app/functional/presentation/widgets/my_app_bar.dart';

// import 'user/usr_info.dart';
// import 'user/usr_address.dart';
// import 'user/user_emergency.dart';
// import 'user/usr_health.dart';
// import 'user/usr_security.dart';
import 'package:flutter/cupertino.dart';

class Settings extends StatefulWidget {
  // const Settings({Key? key}) : super(key: key);
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  // final user = FirebaseAuth.instance.currentUser!;
  final CustomDialog _cdOb = CustomDialog();
  // final MyAppBar _cab = MyAppBar();

  void signOut() {
    Navigator.of(context).pop();
    // FirebaseAuth.instance.signOut();
    // Navigator.pop(context);
  }

  bool valNotify1 = false;
  bool valNotify2 = true;
  bool valNotify3 = false;
  bool valNotify4 = true;

  onChangeFunction1(bool newValue1) {
    setState(() {
      valNotify1 = newValue1;
    });
  }

  onChangeFunction2(bool newValue2) {
    setState(() {
      valNotify2 = newValue2;
    });
  }

  onChangeFunction3(bool newValue3) {
    setState(() {
      valNotify3 = newValue3;
    });
  }

  onChangeFunction4(bool newValue4) {
    setState(() {
      valNotify4 = newValue4;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: MyAppBar(name: 'Dev'),
      ),
      // appBar: _cab.customAppBar(
      //   context,
      //   "Ajustes",
      //   Colors.white,
      //   Colors.black,
      //   () {
      //     Navigator.pop(context);
      //   },
      // ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            const SizedBox(height: 15),
            Row(
              //Mi Perfil
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Icon(
                    size: 30,
                    LineIcons.userAlt,
                    color: Colors.blue[400],
                  ),
                ),
                const SizedBox(width: 3),
                const Text(
                  "Mi Perfil",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Divider(height: 2, thickness: 1),
            const SizedBox(height: 10),
            buildOption(context, "Información Personal", () {
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Container(),
                  ),
                );
              }
            }),
            buildOption(context, "Dirección", () {
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Container(),
                  ),
                );
              }
            }),
            buildOption(context, "Contacto de Emergencia", () {
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Container(),
                  ),
                );
              }
            }),
            buildOption(context, "Salud", () {
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Container(),
                  ),
                );
              }
            }),
            buildOption(context, "Seguridad", () {
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Container(),
                  ),
                );
              }
            }),
            const SizedBox(height: 15),
            Row(
              //Notificaciones
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Icon(
                    size: 30,
                    LineIcons.volumeUp,
                    color: Colors.blue[400],
                  ),
                ),
                const SizedBox(width: 3),
                const Text(
                  "Notificaciones",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Divider(height: 2, thickness: 1),
            const SizedBox(height: 10),
            buildNotifyOption("Tema oscuro", valNotify1, onChangeFunction1),
            buildNotifyOption("Nuevo grupo", valNotify2, onChangeFunction2),
            buildNotifyOption("Próxima clase", valNotify3, onChangeFunction3),
            buildNotifyOption("Fin de paquete", valNotify4, onChangeFunction4),
            const SizedBox(height: 50),
            Center(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding:
                      const EdgeInsetsDirectional.symmetric(horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                onPressed: () {
                  _cdOb.exitDialog(
                    context,
                    "Atencion",
                    "Confirmas tu cierre de sesión?",
                    "Cerrar",
                    signOut,
                  );
                },
                child: const Text(
                  "Cerrar Sesión",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    letterSpacing: 2.2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector buildOption(
      BuildContext context, String title, Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: onTap,
              icon: const Icon(
                LineIcons.angleRight,
                color: Colors.black,
              ),
              padding: const EdgeInsets.only(bottom: 2.0),
              constraints: BoxConstraints.tight(const Size(24, 25)),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildNotifyOption(String title, bool value, Function onChangeMethod) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          ),
          Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              activeColor: Colors.blue,
              trackColor: Colors.grey,
              value: value,
              onChanged: (bool newValue) {
                onChangeMethod(newValue);
              },
            ),
          ),
        ],
      ),
    );
  }
}
