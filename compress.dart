void main(List<String> args) {
  args.isEmpty ? print('args is empty') : compress(args);
}

compress(List<String> args) {
  print(args.map((a) => a.length));
}