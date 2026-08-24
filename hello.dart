class Hello {
  final List<String> args;

  Hello(this.args);

  @override
  String toString() => 
    args.isEmpty ? 'Hallo!' : 'Hallo ${args.join(' ')}!';
}

void main(List<String> args) {
  print(Hello(args));
}