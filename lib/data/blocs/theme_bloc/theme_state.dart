part of 'theme_bloc.dart';

class ThemeState extends Equatable{
  final List<Widget> icon ;
  const ThemeState({
    this.icon
});


  @override
  // TODO: implement props
  List<Object> get props => [icon] ;
}

