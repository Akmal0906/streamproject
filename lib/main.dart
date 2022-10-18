import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_dart/counter_cubit.dart';
import 'package:stream_dart/home_page.dart';
import 'package:stream_dart/view/pages/second_page.dart';
import 'package:stream_dart/view_model/bloc/quote_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home:MultiBlocProvider(providers: [
          BlocProvider(create: (BuildContext context)=>QuoteBloc())
        ], child: SecondPage())
    );
  }
}
//Homepagega Bitta Cubitni ulash shunaqa bo'ladi, yuqorida esa Juda kop Bloclarni ulash mumkin
// home: BlocProvider(
// create: (context) => CounterCubit(),
// child: const HomePage(),
// ),
// class CounterApp extends StatefulWidget {
//   const CounterApp({Key? key}) : super(key: key);
//
//   @override
//   _CounterAppState createState() => _CounterAppState();
// }
//
// class _CounterAppState extends State<CounterApp> {
//
// // create instance of streamcontroller class
//   StreamController _controller = StreamController();
//   int _counter = 10;
//
//   void StartTimer() {
//
//     // Timer Method that runs every second
//     Timer.periodic(const Duration(seconds: 1), (timer) {
//       _counter--;
//
//       // add event/data to stream controller using sink
//       _controller.sink.add(_counter);
//
//       // will stop Count Down Timer when _counter value is 0
//       if(_counter<=0){
//         timer.cancel();
//         _controller.close();
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//
//     // Destroy the Stream Controller when use exit the app
//     _controller.close();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             StreamBuilder(
//                 initialData: _counter,
//                 stream: _controller.stream,
//                 builder: (context,snapshot){
//                   return Text('${snapshot.data}');
//                 }
//             ),
//            const SizedBox(
//               height: 20,
//             ),
//             ElevatedButton(onPressed: (){
//
//               // start the timer
//               StartTimer();
//             }, child:const Text('Start Count Down'))
//           ],
//         ),
//       ),
//     );
//   }
// }
