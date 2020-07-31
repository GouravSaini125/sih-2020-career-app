class Pdf {
  final String title;
  final String image;
  final String path;

  Pdf(this.title, this.image, this.path);

  static List<Pdf> fetchAllPdfs() {
    var titles = [
      "A unique love story of Professional and Online Course",
      "Age is not an Issue",
      "Knowledge in your pocket",
      "Love Computer Science",
      "New Education Policy Highlights 2020",
    ];
    var paths = [
      "unique",
      "age",
      "knowledge",
      "cs",
      "policy",
    ];

    return List<Pdf>.generate(
      titles.length,
      (i) => Pdf(
        titles[i],
        'assets/images/${paths[i]}.jpeg',
        'assets/PDFs/${paths[i]}.pdf',
      ),
    );
  }
}
