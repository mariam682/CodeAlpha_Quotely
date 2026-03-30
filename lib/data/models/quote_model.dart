class Quote {
  final String text;
  final String author;

  const Quote({required this.text, required this.author});

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is Quote && other.text == text);

  @override
  int get hashCode => text.hashCode;

  @override
  String toString() => 'Quote(author: $author)';
}
