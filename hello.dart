class Hello {
  final String args;

  Hello(this.args);

  // @override
  // String toString() => 
  //   args.isEmpty ? 'Hallo!' : 'Hallo $args!';
  String toHelloMessage() {
    return args.isEmpty ? 'Hello!' : 'Hello $args!';
  }

}

void main(List<String> args) {
  final String result = args.join('');
  final helloMessage = Hello(result).toHelloMessage();
  print(helloMessage);
}