class Book {
  int? id;
  String title;
  String releaseDate;
  String author;
  String image;
  String type;

  Book(
    this.id,
    this.title,
    this.releaseDate,
    this.author,
    this.image,
    this.type,
  );

  static Book bookDefault() {
    return Book(null, '', '1900-01-01', '', '', '');
  }

  Book copyWith({
    int? id,
    String? title,
    String? releaseDate,
    String? author,
    String? image,
    String? type,
  }) {
    return Book(
      id ?? this.id,
      title ?? this.title,
      releaseDate ?? this.releaseDate,
      author ?? this.author,
      image ?? this.image,
      type ?? this.type,
    );
  }
}
