import 'package:final_project/model/product_model.dart';

class WishList {
  final int? id;
  final int? userId;
  final int? productId;
  final Product? cartProduct;

  WishList(
      {required this.id,
      required this.cartProduct,
      required this.productId,
      required this.userId});

  factory WishList.fromJson(Map<String, dynamic> json) => WishList(
      id: json['id'] ?? 1,
      cartProduct: Product.fromJson(json['product'] ??
          {
            "id": 50,
            "name": "Printer CANON LBP 6030W WIFI",
            "category_id": 28,
            "image":
                "http://api1.sib3.nurulfikri.com/storage/product//KuoZyGZdquh3gISgRPIpj0ekOdrXFQo7QdSQrmR6.png",
            "image_path":
                "public/product//KuoZyGZdquh3gISgRPIpj0ekOdrXFQo7QdSQrmR6.png",
            "harga": 1925000,
            "deskripsi":
                "Kecepatan cetak (A4): hingga 18ppm\nFitur mode Tidur dan Pematian Otomatis\nPencetakan Mobile Canon dimungkinkan\nVolume cetak bulanan yang direkomendasikan: 200 - 800 halaman\n\nCetak\nMetode Pencetakan Pencetakan Sinar Laser Monokrom\nKecepatan Cetak A4: Hingga 18ppm\nLetter: Hingga 19ppm\nResolusi Cetak 600 x 600dpi\nKualitas cetak dengan Kualitas Perbaikan Gambar 2400 (setara) × 600dpi\nWaktu Pemanasan\n(Dari Menyalakan Daya) 10 detik atau kurang\nWaktu Cetakan Pertama (FPOT) Sekitar 7.8 detik",
            "stock": 96,
            "created_at": "2022-11-18 09:11:06",
            "updated_at": "2022-12-06 07:12:06",
            "deleted_at": null
          }),
      productId: json['product_id'] ?? 1,
      userId: json['user_id'] ?? 1);
}
