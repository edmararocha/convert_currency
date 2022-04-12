import 'package:currency_convertor/app/components/currency_box.dart';
import 'package:flutter/material.dart';

import '../controller/home_controller.dart';

class HomeViewPage extends StatefulWidget {

  @override
  State<HomeViewPage> createState() => _HomeViewPageState();
}

class _HomeViewPageState extends State<HomeViewPage> {

  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();

  late HomeControlller homeControlller;

  @override
  void initState () {
    super.initState();
    homeControlller = HomeControlller(fromText: fromText, toText: toText);
  }
  
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(left: 40, right: 40, top: 100, bottom: 20),
          child: Column(
            children: [
              Image.asset("assets/currency-conversion.png"),
              SizedBox(height: 50,),

              CurrencyBox(
                selectedItem: homeControlller.toCurrency, 
                items: homeControlller.currencies, 
                controller: toText,
                onChanged: (model) {
                  setState(() {
                    homeControlller.toCurrency = model!;
                  });
                }, 
              ),
              
              SizedBox(height: 20,),
              
              CurrencyBox(
                selectedItem: homeControlller.fromCurrency, 
                items: homeControlller.currencies, 
                controller: fromText,
                onChanged: (model) {
                  setState(() {
                    homeControlller.fromCurrency = model!;
                  });
                }, 
              ),
              
              SizedBox(height: 50,),

              ElevatedButton(
                onPressed: () {
                  homeControlller.convert();
                }, 
                child: Text("CONVERTER"),
                style: ElevatedButton.styleFrom(primary: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}