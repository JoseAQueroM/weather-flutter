import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/screens/city_screen.dart';
import '../services/location.dart';
import 'package:weather/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'location_screen.dart';

const apiKey = 'dbcfbc1da42db345e17654c741952071';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  Location clima = Location();

  @override
 
  void initState() {
    super.initState();
    initializeLocationAndData();
  }

  checkPermission(permission) async {
    
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission != LocationPermission.whileInUse &&
            permission != LocationPermission.always) {
          print('Permiso denegado');
          return;
    } else if (permission == LocationPermission.deniedForever) {
          print('PErmisos permanentemente denegados');
          return;
    }

  }

  Future<void> getLocationData() async {

    LocationPermission permission = await Geolocator.checkPermission();

    await checkPermission(permission);

    await clima.getCurrentLocation();

    WeatherModel weatherModel = WeatherModel();

    var weatherData = await weatherModel.getLocationWeather();

    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) {return LocationScreen(
          locationWeather: weatherData,
        ); })
      );

  }

  Future<void> initializeLocationAndData() async {
    await getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 41, 39, 39),
        appBar: AppBar(
          backgroundColor: blueColor,
        ),
      
        body: TweenAnimationBuilder(
          tween: Tween(begin: 0.0, end: 1.0),
          duration: Duration(seconds: 10),
          builder:(context, value, child) {
             return Transform.rotate(
              angle: value * 6.28,
              child: SpinKitFoldingCube( color: blueColor, size: 50.0)
             );
          },
         
          ),
        ),
      
      );
  }
}
