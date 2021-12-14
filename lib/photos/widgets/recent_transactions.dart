import 'package:flutter/material.dart';

class RecentTransactions extends StatelessWidget {
  const RecentTransactions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text('Recent Transactions',
                      style: Theme.of(context).textTheme.headline3),
                ),
                PopupMenuButton(
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 1,
                      child: Text("First"),
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: Text("Second"),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ListView(
            //scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 30, bottom: 30),
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0), //or 15.0
                    child: Container(
                      height: 60.0,
                      width: 60.0,
                      color: Color.fromARGB(255, 244, 48, 143),
                      child: Icon(Icons.wallet_travel_outlined,
                          color: Colors.white),
                    ),
                  ),
                  title: Text('Salary',
                      style: Theme.of(context).textTheme.headline3),
                  subtitle: Text('Belong Interactive'),
                  trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                    Text(
                      '+\$2,010',
                      style: Theme.of(context).textTheme.headline4,
                    )
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 30, bottom: 30),
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0), //or 15.0
                    child: Container(
                      height: 60.0,
                      width: 60.0,
                      color: Color.fromARGB(255, 28, 20, 92),
                      child: Icon(Icons.payment_rounded,
                          color: Colors.white),
                    ),
                  ),
                  title: Text('Paypal',
                      style: Theme.of(context).textTheme.headline3),
                  subtitle: Text('Belong Interactive'),
                  trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                    Text(
                      '+\$12,010',
                      style: Theme.of(context).textTheme.headline4,
                    )
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 30, bottom: 30),
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0), //or 15.0
                    child: Container(
                      height: 60.0,
                      width: 60.0,
                      color: Color.fromARGB(255, 141, 65, 151),
                      child: Icon(Icons.settings_outlined, color: Colors.white),
                    ),
                  ),
                  title: Text('Car Repair',
                      style: Theme.of(context).textTheme.headline3),
                  subtitle: Text('Belong Interactive'),
                  trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                    Text(
                      '+\$232,010',
                      style: Theme.of(context).textTheme.headline4,
                    )
                  ]),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}