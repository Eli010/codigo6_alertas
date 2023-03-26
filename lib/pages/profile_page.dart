import 'package:codigo6_alerts/models/user_model.dart';
import 'package:codigo6_alerts/pages/login_page.dart';
import 'package:codigo6_alerts/services/api_service.dart';
import 'package:codigo6_alerts/utils/spg_global.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  UserModel? user;

  // const ProfilePage({super.key});
  ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    // print(" asdasdsdsadasdasadsas $user");

    // print(" =======${SPGlobal().user[0]}=====");
    return Scaffold(
      backgroundColor: Colors.green,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 52,
              child: CircleAvatar(
                radius: 50.0,
                backgroundImage: NetworkImage(
                    "https://images.pexels.com/photos/1589282/pexels-photo-1589282.jpeg?auto=compress&cs=tinysrgb&w=600"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
                child: Card(
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: const Icon(
                      Icons.phone,
                      color: Colors.teal,
                    ),
                    title: Text(
                      'Nombre completo',
                      style: TextStyle(
                          fontFamily: 'SourceSansPro',
                          fontSize: 20,
                          color: Colors.teal.shade900),
                    ),
                  ),
                ),
                onTap: () {
                  // _launchURL('tel:+229 96119149');
                }),
            InkWell(
                child: Card(
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: const Icon(
                      Icons.phone,
                      color: Colors.teal,
                    ),
                    title: Text(
                      'telefono',
                      style: TextStyle(
                          fontFamily: 'SourceSansPro',
                          fontSize: 20,
                          color: Colors.teal.shade900),
                    ),
                  ),
                ),
                onTap: () {
                  // _launchURL('tel:+229 96119149');
                }),
            InkWell(
              child: Card(
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.location_on_outlined,
                    color: Colors.teal,
                  ),
                  title: Text(
                    'Dirección',
                    style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontSize: 20,
                        color: Colors.teal.shade900),
                  ),
                ),
              ),
              onTap: () {
                // _launchURL('mailto:fadcrepin@gmail.com?subject=Need Flutter developer&body=Please contact me');
              },
            ),
            Container(
              margin: const EdgeInsets.only(top: 30, bottom: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                // color: Colors.red,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 50),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 13),
                  ),
                  onPressed: () {
                    SPGlobal().isLogin = false;
                    SPGlobal().token = "";
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                        (route) => false);
                  },
                  child: const Text(
                    "Cerrar Sesión",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 17),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



    //  Scaffold(
    //   body: Container(
    //     color: Colors.amber,

    //     // child:
        //  SafeArea(
        // child:
        //  FutureBuilder<UserModel>(
        //   future:ApiService().login(dni, password) ,
        //   builder: (context, AsyncSnapshot snapshot) {
        //     if (snapshot.hasData) {
        //       final user = snapshot.data;
        //       return Text(user.toString());
        //     } else if (snapshot.hasError) {
        //       return const Center(
        //         child: Text("Netword erro"),
        //       );
        //     }
        //     return const Center(
        //       child: CircularProgressIndicator(),
        //     );
        //   },
        // ),
        // ),
        // )

//         child:
// Center(
//           child: Column(
//             children: [
//               Text("data"),
//               ElevatedButton(
//                 onPressed: () {
//                   SPGlobal().isLogin = false;
//                   SPGlobal().token = "";
//                   Navigator.pushAndRemoveUntil(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => LoginPage(),
//                       ),
//                       (route) => false);
//                 },
//                 child: Text("Cerrar Sesión"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
