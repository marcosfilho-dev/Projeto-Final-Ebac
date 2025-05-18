abstract class CustomEnum<T>{
  final T _value;
  const CustomEnum(this._value);
  T get value => _value;
}