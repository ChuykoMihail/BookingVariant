import 'package:flutter/material.dart';


class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildHeader(context),
          buildMenuItems(context),
        ],
      ),
    ),
  );

  Widget buildHeader(BuildContext context) => Material(
      color: Colors.deepOrange,
      child: InkWell(
        onTap: () {},
        child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(
            left: 40,
            top: 24 + MediaQuery.of(context).padding.top,
            bottom: 24,
          ),
          child: Column(
            children: const [
              CircleAvatar(
                radius: 52,
                backgroundImage: NetworkImage(
                    'https://i.pinimg.com/originals/b1/90/ea/b190eaf16ed403f2e2b426ef59cfcdc1.jpg'),
              ),
              SizedBox(height: 12),
              Text(
                'Nyan Nyan',
                style: TextStyle(
                    fontSize: 20, color: Colors.white, fontFamily: 'Roboto'),
              ),
              Text(
                'Сотрудник',
                style: TextStyle(
                    fontSize: 16, color: Colors.white, fontFamily: 'Roboto'),
              )
            ],
          ),
        ),
      ));

  Widget buildMenuItems(BuildContext context) => Container(
    padding: const EdgeInsets.all(24),
    child: Column(
      children: [
        ListTile(
          leading: const Icon(Icons.account_circle_outlined),
          title: const Text('Профиль',
          ),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.list_alt_rounded),
          title: const Text('Бронирования'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.group),
          title: const Text('Команды'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Настройки'),
          onTap: () {},
        )
      ],
    ),
  );
}