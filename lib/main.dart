import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: Text("QPolimer", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
        actions: [
              Icon(Icons.business, color: Colors.red,),
              Padding(
              padding: EdgeInsets.all(10),
              child:
                Icon(Icons.shopping_cart, color: Colors.red,),
               ),
              ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    singleTab(true, "All"),
                    singleTab(false, "40x25sm"),
                    singleTab(false, "50x30sm"),
                    singleTab(false, "37x25,5sm"),
                    singleTab(false, "58x49sm"),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              makeItem("assets/images/d9c50bfe-7b49-41c2-9878-c22fac52fab4.jpg"),
              makeItem("assets/images/42370d46-2ca2-4004-a43e-c44f989abb9f.jpg"),
              makeItem("assets/images/7db98265-c477-400f-bb13-845a9e2ae898.jpg"),
              makeItem("assets/images/e3749aa8-4458-41dc-9fa3-b09819df3d9b.jpg"),
            ],
          ),
        ),
      ),
    );
  }

  Widget singleTab(bool type, String text){
    return AspectRatio(aspectRatio: 2.5/1,
    child: Container(
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: type? Colors.red.shade700:Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(text, style: TextStyle(fontSize: type? 19:16, color: type? Colors.white:Colors.black, fontWeight: FontWeight.bold),),
      ),
    ),
    );
  }

  Widget makeItem(String image){
    return Container(
      height: 220,
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 10,
            offset: Offset(0,10),
          )
        ]
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            colors: [
              Colors.black.withOpacity(0.9),
              Colors.black.withOpacity(0.6),
              Colors.black.withOpacity(0.3),
              Colors.black.withOpacity(0.2),
            ]
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("PE paketlar", style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                        ),
                        SizedBox(height: 10,),
                        Text("600 so'm", style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),)
                      ],
                    ),
                Container(
                  margin: EdgeInsets.only(top: 5, left: 10),
                    child: Text("Hajmi 40x25sm", style: TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold),))
              ],
            ),
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red
              ),
              child: Center(
                child: Icon(Icons.favorite_border, size: 20, color: Colors.white,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

