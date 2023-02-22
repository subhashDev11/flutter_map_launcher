typedef VoidFunctionCallbackWithNoParam = Function();
typedef FunctionCallbackWithParam = String? Function(String? value);
typedef VoidFunctionCallback = Function(String? value);
typedef MultiValueFunctionCallbackWithParam = Function(
    MultiValueReturn multiValueReturn);

class MultiValueReturn {
  String value;
  int selectedIndex;

  MultiValueReturn({required this.value, required this.selectedIndex});
}
