part of 'weather_bloc.dart';

@immutable
abstract class WeatherState extends Equatable {
  const WeatherState();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class WeatherStateInitial extends WeatherState {}
class WeatherStateLoading extends WeatherState {}
class WeatherStateSuccess extends WeatherState {
  final List<Weather> weathers ;
  const WeatherStateSuccess({@required this.weathers}):
        assert(weathers != null);
  @override
  // TODO: implement props
  List<Object> get props => [weathers];
}
class WeatherStateFailure extends WeatherState{

}
