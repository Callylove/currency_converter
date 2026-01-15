import 'package:currency_converter/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({super.key});

  @override
  State<CurrencyConverter> createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  final counterCubit = CounterCubit();


  final TextEditingController textEditingController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    final border = OutlineInputBorder(
        borderSide: BorderSide(
            width: 2.0,
            style: BorderStyle.solid
        ),
        borderRadius: BorderRadius.circular(60)
    );
    return  BlocBuilder<CounterCubit, double>(
      bloc: counterCubit,
      builder: (context, result) {
        return Scaffold(
          backgroundColor: Colors.blueGrey,
          appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            elevation: 0,
            title: Text('Currency Converter'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text('INR ${result != 0 ? result.toStringAsFixed(2): result.toStringAsFixed(0)}', style: const TextStyle(
                  fontSize: 55,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255),

                ),),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: textEditingController,
                    style: const TextStyle(
                        color: Colors.black
                    ),
                    decoration: InputDecoration(
                      hintText: 'Please enter the amount in USD',
                      hintStyle: const TextStyle(
                          color: Colors.black
                      ),
                      prefixIcon: const Icon(Icons.monetization_on_outlined),
                      prefixIconColor: Colors.black,
                      filled: true,

                      fillColor: Colors.white,
                      focusedBorder: border,
                      enabledBorder: border,

                    ),
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      counterCubit.currencyConverter(textEditingController.text);

                      // setState(() {
                      //   result = double.parse(textEditingController.text) * 81;
                      // });

                    },
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        minimumSize: Size(200,50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        )
                    ),
                    child: const Text('Convert'))

              ],
            ),
          ),
        );
      }
    );
  }
}



