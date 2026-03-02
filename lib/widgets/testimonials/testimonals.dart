class Testimonals {
  final String name;
  final String? role;
  final String? imageUrl;
  final String subjectName;
  final String review;
  final DateTime date;
  final bool isVerified;
  final bool isFeatured;
  final double rating;


  Testimonals({
    required this.name,
    required this.role,
    required this.imageUrl,
    required this.subjectName,
    required this.review,
    required this.date,
    required this.isVerified,
    required this.isFeatured,
    required this.rating,
  });

  @override
  String toString() {
    return 'Testimonals(name: $name, role: $role, imageUrl: $imageUrl, subjectName: $subjectName, review: $review, date: $date, isVerified: $isVerified, isFeatured: $isFeatured, rating: $rating)';
  }
}