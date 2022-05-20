import 'package:flutter/material.dart';

class SearchCity extends StatelessWidget {
  final LinearGradient backgroundGradient;
  const SearchCity({Key? key, required this.backgroundGradient})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cityController = TextEditingController();

    void onSearchTap() {
      Navigator.pop(context, cityController.text);
    }

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        decoration: BoxDecoration(gradient: backgroundGradient),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: cityController,
                autofocus: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                      borderSide: BorderSide.none,
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderSide: BorderSide(color: Colors.red, width: 1),
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(50, 255, 255, 255),
                    hintText: 'Введите название города',
                    hintStyle: TextStyle(
                        color: Color.fromARGB(162, 255, 255, 255),
                        fontSize: 16,
                        fontFamily: 'MullerRegular')),
                style: const TextStyle(
                    color: Colors.white, fontFamily: 'MullerRegular'),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: onSearchTap,
                child: const Text(
                  'НАЙТИ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'MullerRegular',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
