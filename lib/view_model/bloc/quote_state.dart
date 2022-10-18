part of 'quote_bloc.dart';

abstract class QuoteState extends Equatable {
  const QuoteState();
}

class QuoteInitial extends QuoteState {
  @override
  List<Object> get props => [];
}
@immutable
class QuoteSuccess extends QuoteState{
 final Quote quote;
  const QuoteSuccess(this.quote);
  @override
  // TODO: implement props
  List<Object?> get props => [quote];

}
class QuoteError extends QuoteState{
  String message='';
  QuoteError(String message);
  @override
  // TODO: implement props
  List<Object?> get props => [message];

}
class QuoteLoading extends QuoteState{
  QuoteLoading();
  @override
  // TODO: implement props
  List<Object?> get props =>[];

}