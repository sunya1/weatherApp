part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}
class ThemeEventWeatherChanged extends ThemeEvent{
  final List<Weather> weathers;
  const ThemeEventWeatherChanged({@required this.weathers}):
      assert(weathers != null);

  @override
  // TODO: implement props
  List<Object> get props => [weathers];


}
