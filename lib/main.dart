import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI',
      theme: ThemeData(


        primarySwatch: Colors.yellow,
      ),
      home: Splashscreen()

    );
  }
}

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => BMI()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow.shade300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Center(
            child: RichText(
              text: TextSpan(
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold
                  ),

                  children: [
                    TextSpan(text:'Body Mass Index ' , style: TextStyle(color: Colors.indigo,fontWeight: FontWeight.bold,fontSize: 30)),

                  ]
              ),
            ),
          ),
          RichText(
            text: TextSpan(
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold
                ),

                children: [
                  TextSpan(text:'(BMI) ' , style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 25)),


                ]
            ),
          ),
          SizedBox(height: 19,),
          RichText(
            text: TextSpan(
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold
                ),

                children: [
                  TextSpan(text:'Discover Your Ideal Health Journey' , style: TextStyle(fontSize: 20,color: Colors.indigo)),
  ]

            ),
          ),
        ],
      ),
    );
  }
}




class BMI extends StatefulWidget {
  const BMI({Key? key}) : super(key: key);

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  var wtcontroller = TextEditingController();
  var ftcontroller = TextEditingController();
  var inchcontroller = TextEditingController();

  var result= "";
  var bgcolor = Colors.yellow.shade300;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text("Body Mass Index"),
        ),
        body:
        Center(
          child: Container(
            color: bgcolor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: wtcontroller,
                  decoration: InputDecoration(

                      label: Text('Enter your Weight(in kgs)',style: TextStyle(color: Colors.black),),

                      prefixIcon: (Icon(Icons.line_weight,color: Colors.black,)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(22),
                          borderSide: BorderSide(
                              color: Colors.blue,
                              width: 4

                          )
                      )
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 11,),
                TextFormField(
                  controller: ftcontroller,
                  decoration: InputDecoration(
                      label: Text('Enter your Height(in Feet)',style: TextStyle(color: Colors.black),),

                      prefixIcon: (Icon(Icons.height_rounded,color: Colors.black,)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(22),
                          borderSide: BorderSide(
                              color: Colors.blue,
                              width: 4

                          )
                      )
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 11,),

                TextFormField(
                  controller: inchcontroller,
                  decoration: InputDecoration(
                      label: Text('Enter your Height(in inch)',style: TextStyle(color: Colors.black),),

                      prefixIcon: (Icon(Icons.height_rounded,color: Colors.black,)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(22),
                          borderSide: BorderSide(
                              color: Colors.blue,
                              width: 4

                          )
                      )
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 16),

                ElevatedButton(onPressed: (){
                  var wt=wtcontroller.text.toString();
                  var ft =ftcontroller.text.toString();
                  var inch=inchcontroller.text.toString();
                  if(wt!="" && ft!="" && inch!="" ){

                    var iwt = int.parse(wt);
                    var ift =int.parse(ft);
                    var iinch= int.parse(inch);

                    var tinch = (ift*12) + iinch;
                    var tcm = tinch*2.54;
                    var tm = tcm/100;
                    var bmi = iwt/(tm*tm);

                    var msg = "";
                    if(bmi>25){
                      msg= "You are OverWeight!!";
                      bgcolor =Colors.red;
                    }else if(bmi>18){
                    msg= "You are UnderWeight!!";
                    bgcolor =Colors.orange;
                    }
                    else{
                      msg= "You are Healthy!!";
                      bgcolor =Colors.grey;
                    }
                    setState(() {
                      result = "$msg\nYour Body Mass Index is: ${bmi.toStringAsFixed(4)}";

                    });


                  }
                  else{

                    setState(() {
                    });
                    result = "Please fill all the blanks!";




                  }
                }, child: Text('Calculate')),

                Center(child: Text(result,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),))

              ],
            ),
          ),
        )

    );
  }
}

