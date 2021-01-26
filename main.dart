import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: HomePage(),
    );

  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double billAmount =0, tipPercent = 0,tip = 0, totalBill =0;
  int people=1;

  void tipPercentIncrement(){
    setState(() {
      tipPercent++;
    });
  }

  void tipPercentDecrement(){
    setState(() {
      tipPercent--;
    });
  }

  void peopleIncrement(){
    setState(() {
      people++;
    });
  }

  void peopleDecrement(){
    setState(() {
      people--;
    });
  }


  // void calculate(){
  //   setState(() {
  //     print(billAmount);
  //     print(tipPercent);
  //     tip=(tipPercent/100)*billAmount;
  //     if(people == 1){
  //       tip = billAmount*(tipPercent/100);
  //       tiPP=tip/people;
  //       totalBill=billAmount+tip;
  //     }
  //     else
  //       {
  //         tip=billAmount*(tipPercent/100);
  //         tiPP = tip/people;
  //         totalBill=billAmount+tip;
  //       }
  //   });
  // }


  void claculate(){
    setState(() {
      print(billAmount);
      print(tipPercent);
      if(people == 1){
        tip = billAmount*(tipPercent/100);
        totalBill = billAmount + tip;
      }else{
        tip = billAmount*(tipPercent/100);
        tip = tip/people;
        totalBill = billAmount + tip;
      }

    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
       alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 50,vertical: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Bill Splitter And Tip Calculator"),
            SizedBox(height: 24,),
            TextField (
              onChanged: (val){
                billAmount=double.parse(val);
              },
              decoration: InputDecoration(hintText: "Bill Amount"),
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              children:<Widget> [
                SizedBox(
                  height: 24,
                ),
                Text("People"),
                Spacer(),
                Container(
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(onTap: (){
                        peopleDecrement();
                      },child: Icon(Icons.remove_circle),),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Text(
                          '${people}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0
                          ),
                        ),
                      ),

                      GestureDetector(onTap: (){
                        peopleIncrement();
                      },child: Icon(Icons.add_circle))
                    ],
                  ),
                ),

              ],
            ),


            Row(
              children: <Widget>[
                SizedBox(height: 24,),
                Text("Tip"),
                Spacer(),
                Container(
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:<Widget> [
                      GestureDetector(onTap: (){
                        tipPercentDecrement();
                      },
                        child: Icon(Icons.remove_circle),),
                        SizedBox(width: 8,),
                        Expanded(
                          child: Text(
                                '${tipPercent}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0
                                  ),),
                        ),
                        GestureDetector(onTap:() {
                          tipPercentIncrement();
                        },child: Icon(Icons.add_circle),),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height:24),
            GestureDetector(
              onTap: (){
                if (billAmount>0){
                  claculate();
                 }
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12,horizontal: 22),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: (BorderRadius.circular(20))
                ),
                child: Text("Calculate", style: TextStyle(color: Colors.red
                ,fontSize: 16),),
              ),
            ),
            SizedBox(height: 16,),
            //tip != 0 ? Text(people == 1 ? "Tip : ${tip.toStringAsFixed(2)}": "Tip : ${tip.toStringAsFixed(2)} per person") : Container(),
            tip != 0 ? Text(people == 1 ? "Total : ${tip.toStringAsFixed(2)}": "Tip : ${tip.toStringAsFixed(2)} ") : Container(),

            SizedBox(height: 8,),
          //  totalBill != 0 ? Text(people == 1 ? "Total : ${totalBill.toStringAsFixed(2)}": "Total : ${totalBill.toStringAsFixed(2)} per person") : Container(),
            totalBill != 0 ? Text(people == 1 ? "Total Bill with Tip : ${totalBill.toStringAsFixed(2)}": "Total : ${totalBill.toStringAsFixed(2)} ") : Container(),

            SizedBox(height: 8,),
            //  totalBill != 0 ? Text(people == 1 ? "Total : ${totalBill.toStringAsFixed(2)}": "Total : ${totalBill.toStringAsFixed(2)} per person") : Container(),
            totalBill != 0 ? Text("Total Per Person: ${(totalBill / people).toStringAsFixed(2)} per person") : Container()
          ],
        ),
      ),
    );

    }

}














