import 'package:flutter/material.dart';

const blueColor = Color.fromARGB(255, 23, 41, 124);

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {

  String cityName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/cityscreen.png'),
              fit: BoxFit.cover,
            )
          ),

          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: FloatingActionButton(
                      backgroundColor: blueColor,
                      onPressed: (){
                        Navigator.pop(context);
                      }
                    , child: const Icon(
                        size: 30.0,
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      )
                    ),
                  ),

                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          color: blueColor,
                          padding: const EdgeInsets.all(20.0),
                          child: TextField(
                            onChanged: (value) {
                              cityName = value;
                              print('CITY NAME: $cityName');
                            },
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20.0
                            ),
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 2.0
                                )
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 2.0
                                )
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              icon: Icon(Icons.location_city, 
                                color: Colors.white,
                                size: 35.0,
                              ), 
                              hintText: 'Escribe una ciudad',
                              hintStyle:  TextStyle(
                                color: Colors.grey
                              )
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 40.0,
                        ),

                           ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: blueColor,
                              padding: const EdgeInsets.all(15.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            onPressed: () => {
                              Navigator.pop(context, cityName)
                            },
                            child: const Text(
                              'Obtener clima',
                                style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                              ),
                            ),
                           )
                      ],
                    ),
                  ),
            
               
              ],
            ),
          ),
        ),
      ),
        
      );
  }
}