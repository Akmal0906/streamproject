import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_dart/view_model/bloc/quote_bloc.dart';
class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);
static const String id='second_page';
  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchRandom();
  }
  void _fetchRandom(){
    context.read<QuoteBloc>().add(GetRandom());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding:const EdgeInsets.all(20),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<QuoteBloc,QuoteState>(builder: (context, state){
              if(state is QuoteLoading){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }else
              if(state is QuoteError){
                return Center(
                  child: Text(state.message),
                );
              }else if(state is QuoteSuccess){
                return Center(
                  child: Text(state.quote.content.toString()),
                );
              }
              return Container();
            },
            ),
            SizedBox(height: 100),
            IconButton(onPressed: _fetchRandom, icon: Icon(Icons.refresh,size: 50,)),
          ],
        ),
      ),

    );
  }
}
