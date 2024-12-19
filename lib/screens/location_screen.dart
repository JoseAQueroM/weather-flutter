import 'package:flutter/material.dart';
import 'package:weather/services/weather.dart';
import 'package:weather/screens/city_screen.dart';

class LocationScreen extends StatefulWidget {

  const LocationScreen({
    required this.locationWeather
  });

  final locationWeather;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  
  WeatherModel weather = WeatherModel();

  double? temp;
  String? tempString;
  String? weatherIcon;
  String? weatherText;
  String? cityName;
  String? cityImage;
  
  @override

  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) async {
    var data = await weatherData;
    cityName  = data['name'];

    temp = (data['main']['temp'] as num).toDouble();
    tempString = temp?.toStringAsFixed(0);
    int tempInt = temp!.toInt();
    weatherText = weather.getMessage(tempInt);

    var condition = data['weather'][0]['id'];
    weatherIcon = weather.getWeatherIcon(condition!);

    setState(() {});

    print('Temp es $temp');
    print('Condition es $condition');
    print('cityName es $cityName');
    print('weathericon es $weatherIcon');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/winter2.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.grey, BlendMode.dstATop)
            ),
          
            
          ),
          child: SafeArea(
            child: Column(
                children: [

                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: FloatingActionButton(
                        backgroundColor: blueColor,
                        onPressed: () async{
                          var typedName = await Navigator.push(context, MaterialPageRoute(
                            builder:(context) {
                              return CityScreen();
                            },
                          ));
                          if (typedName != null){
                            var weatherData = weather.getInputCity(typedName); 
                            updateUI(weatherData);                      
                          }
                        },
                        heroTag: 'city',
                        child: const Icon(
                          Icons.location_city,
                          size: 50.0,
                          color: Colors.white,
                        ),
                                          ),
                        ),
                    ),
                  
                Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(right: 80),
                      child: Center(
                        child: Text(
                          '$tempString °$weatherIcon',
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            shadows: 
                            [
                              Shadow(
                                blurRadius: 10.0,
                                color: Colors.black,
                                offset: Offset(5.0, 5.0),
                              ),
                            ]
                            ,
                            color: Colors.white,
                            fontSize: 90.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ),

                     
                     Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              
                              width: double.infinity,
                              child: Text(
                                '$weatherText in $cityName',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  shadows: 
                                    [
                                      Shadow(
                                        blurRadius: 10.0,
                                        color: Colors.black,
                                        offset: Offset(5.0, 5.0),
                                      ),
                                    ],
                                  color: Colors.white,
                                  fontSize: 60.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                     ),

              ],
            ),
          ),
        ),
      );
  }
} 