abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsBottomNavBarState extends NewsStates {}

class NewsBottomNavState extends NewsStates {}

class GetNewsLoadingState extends NewsStates {}

class GetNewsSuccessState extends NewsStates {}

class GetNewsErrorState extends NewsStates {
  final String error;
  GetNewsErrorState(this.error);
}
