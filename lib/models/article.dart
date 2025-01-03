class Article {
  final String title;
  final String imageUrl;
  final String websiteUrl;

  Article({
    required this.title,
    required this.imageUrl,
    required this.websiteUrl,
  });
}

final List<Article> dummyArticles = [
  Article(
    title: '4 Tips Mengelola Keuangan yang Cocok dengan Karakteristik Gen Z',
    imageUrl: 'https://mediakeuangan.kemenkeu.go.id/_/media/static/files/Article/finansial/2024/fotoherofinansialmaret.jpeg?w=1600&h=900&fit=crop&fm=webp&s=2f593841efc9100c7a0b7c753033d298',
    websiteUrl: 'https://mediakeuangan.kemenkeu.go.id/article/show/4-tips-mengelola-keuangan-yang-cocok-dengan-karakteristik-gen-z',
  ),
  Article(
    title: 'Mengenal Inklusi Keuangan, Tujuan, dan Cara Mewujudkannya',
    imageUrl: 'https://www.megasyariah.co.id/bms-new/edukasi-tips/inklusi_keuangan_adalah.jpg',
    websiteUrl: 'https://www.megasyariah.co.id/id/artikel/edukasi-tips/lainnya/inklusi-keuangan-adalah',
  ),
  Article(
    title: 'Rumah Subsidi: Harga, Syarat, Kelebihan, & Kekurangannya',
    imageUrl: 'https://storage.googleapis.com/sahabat-pegadaian/migrated-media/2024--04--rumah-subsidi-adalah.webp',
    websiteUrl: 'https://sahabat.pegadaian.co.id/artikel/keuangan/rumah-subsidi-adalah',
  ),
];
