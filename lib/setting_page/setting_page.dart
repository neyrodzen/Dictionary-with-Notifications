import 'package:dictionary_with_not/local_notice_service/create_notification.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

int sec = 0;

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController textEditingController = TextEditingController();

  String textError = 'error';
  NotifiCreate notifiCreate = NotifiCreate();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Text(''),
            )
          ],
          title: const Center(
            child: Text(
              'Settings',
            ),
          )),
      body: ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: double.infinity,
          minWidth: double.infinity,
        ),
        child: DecoratedBox(
          decoration: const BoxDecoration(color: Colors.white),
          child: Align(
            alignment: Alignment.topLeft,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Center(
                    child:  Text(
                  'Настройка уведомлений',
                  style:  TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                )),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text('Введите интервал в минутах:'),
                    SizedBox(
                      width: 60,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: textEditingController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5))),
                        onChanged: (value) {
                          if (value != '') {
                            try {
                              sec = int.parse(value);
                            } catch (error) {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(textError),
                                    );
                                  });
                            }
                          }
                        },
                      ),
                    ),
                    // SizedBox(
                    //   width: 20,
                    // ),
                    ElevatedButton(
                      onPressed: () async {
                        await notifiCreate.getWords();
                        notifiCreate.create();
                      },
                      child: const Text('Ok'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}