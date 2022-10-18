import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:stream_dart/model/quote_model.dart';
import 'package:stream_dart/model/repositories/random_repositories.dart';

part 'quote_event.dart';

part 'quote_state.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {
  QuoteBloc() : super(QuoteInitial()) {
    on<QuoteEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GetRandom>(_mapGetRandomEventToState);

    on<GetQuotestList>((event, emit) {});
    on<GetAuthorList>((event, emit) {});
  }

  void _mapGetRandomEventToState(
      GetRandom event, Emitter<QuoteState> emit) async {
    emit(QuoteLoading());
    try {
      final quote = await RandomRepository().fetchRandom();
      emit(QuoteSuccess(quote));
    } catch (e) {
      print(e.toString());
      emit(QuoteError(e.toString()));
    }
  }
}
