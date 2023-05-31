import 'package:flutter/material.dart';

class Drawer extends StatefulWidget {
  const Drawer({super.key, required List<ListView> children});

  @override
  State<Drawer> createState() => _DrawerState();
}

class _DrawerState extends State<Drawer> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  Widget DrawerBox(double width) {
    return Container(
      width: width * .7,
      child: Drawer(
        children: [
          ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                // arrowColor: Colors.black,
                decoration: BoxDecoration(
                  color: Colors.orange,
                ),
                accountName: Text("Tester"),
                accountEmail: Text("test@gmail.com"),
                currentAccountPicture: Image.network(
                    'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/a89c3e38-b6f3-48a0-9f9e-df9a0129fb93/daghh5x-4a77b3ec-fd4f-4d17-9f84-5963a8cb5c03.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2E4OWMzZTM4LWI2ZjMtNDhhMC05ZjllLWRmOWEwMTI5ZmI5M1wvZGFnaGg1eC00YTc3YjNlYy1mZDRmLTRkMTctOWY4NC01OTYzYThjYjVjMDMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.dWTFMrwnbAbj5TtUp9U_vQsohW7MnkRPymzR5wZQoV8'),
              ),
              ListTile(
                leading: Icon(Icons.home),

                //shape: Border.all(color: Colors.black),
                title: Text('Home'),
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              ListTile(
                leading: Icon(Icons.play_circle),

                //  shape: Border.all(color: Colors.black),
                title: Text('Wedding Destination'),
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              ListTile(
                leading: Icon(Icons.place_sharp),

                // shape: Border
                //.all(color: Colors.black),
                title: Text('Exotic Place'),
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              ListTile(
                leading: Icon(Icons.dehaze_rounded),

                // shape: Border
                //.all(color: Colors.black),
                title: Text('Best Deals'),
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              ListTile(
                leading: Icon(Icons.hotel),

                // shape: Border.all(color: Colors.black),
                title: Text('Hotels'),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => AboutUs()),
                  // );
                  // Navigator.pop(context);
                },
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              ListTile(
                leading: Icon(Icons.flight),

                // shape: Border.all(color: Colors.black),
                title: Text('Flights'),
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              ListTile(
                leading: Icon(Icons.question_answer_outlined),
                title: Text(
                  "FAQs",
                ),
                // subtitle: Text('Item description'),
                //trailing: Icon(Icons.more_vert),
                // shape: Border.all(color: Colors.black),
                // title: Text('FAQ'),
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              SizedBox(
                height: 10,
              ),
              Center(child: Text("Legals")),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.phone),
                  Text("Contact us"),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Center(child: Text("Version 1.0.0"))
            ],
          ),
        ],
      ),
    );
  }
}
