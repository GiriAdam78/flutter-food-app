part of 'models.dart';

// ignore: constant_identifier_names
enum FoodType { new_food, popular, recommended }

class Food extends Equatable {
  final int id;
  final String picturePath;
  final String name;
  final String description;
  final String ingredients;
  final int price;
  final double rate;
  final List<FoodType> types;

  // ignore: prefer_const_constructors_in_immutables
  Food({
    required this.id,
    required this.picturePath,
    required this.name,
    required this.description,
    required this.ingredients,
    required this.price,
    required this.rate,
    this.types = const [],
  });

  @override
  // ignore: override_on_non_overriding_member
  List<Object> get props =>
      [id, picturePath, name, description, ingredients, price, rate];

  static fromJson(e) {}
}

class Equatable {}

List<Food> mockFoods = [
  Food(
      id: 1,
      picturePath:
          "https://i.pinimg.com/736x/06/7b/28/067b2879e5c9c42ec669bf639c3fbffc.jpg",
      name: "Sate Sayur Sultan",
      description: "Sate Sayur Sultan adalah menu sate vegan paling terkenal di Bandung. Sate ini dibuat dari berbagai macam bahan bermutu tinggi. Semua bahan ditanam dengan menggunakan teknologi masa kini sehingga memiliki nutrisi yang kaya.",
      ingredients: "Bawang Merah, Paprika, Bawang Bombay, Timun",
      price: 150000,
      rate: 4.2,
      types: [FoodType.new_food, FoodType.recommended, FoodType.popular]),
  Food(
      id: 2,
      picturePath:
          "https://img-global.cpcdn.com/recipes/1f520da39ac6eac0/680x482cq70/beef-steak-korean-bbq-sauce-foto-resep-utama.jpg",
      name: "Steak Daging Sapi Korea",
      description:
          "Daging sapi Korea adalah jenis sapi paling premium di Korea. Namun, untuk menikmatinya Anda tidak perlu jauh-jauh ke Korea Selatan. Steak Sapi Korea Oppa Bandung ini sudah terkenal di seluruh Indonesia dan sudah memiliki lebih dari 2 juta cabang.",
      ingredients: "Daging Sapi Korea, Garam, Lada Hitam",
      price: 750000,
      rate: 4.5),
  Food(
      id: 3,
      picturePath:
          "https://sucktheheads.com/wp-content/uploads/2024/06/CopperVine_Chopped-Romaine-Salad_Credit_Emily-Ferretti-1024x683.jpg",
      name: "Mexican Chopped Salad",
      description: "Salad ala mexico yang kaya akan serat dan vitamin. Seluruh bahan diambil dari Mexico sehingga akan memiliki cita rasa yang original.",
      ingredients: "Salad ala mexico yang kaya akan serat dan vitamin. Seluruh bahan diambil dari Mexico sehingga akan memiliki cita rasa yang original.",
      price: 105900,
      rate: 3.9,
      types: [FoodType.new_food]),
  Food(
      id: 4,
      picturePath:
          "https://images.immediate.co.uk/production/volatile/sites/2/2016/08/25097.jpg?quality=90&resize=768,574",
      name: "Sup Wortel Pedas",
      description: "Sup wortel pedas yang unik ini cocok banget buat kalian-kalian yang suka pedas namun ingin tetap sehat. Rasanya yang unik akan memanjakan lidah Anda.",
      ingredients: "Wortel, Seledri, Kacang Tanah, Labu, Garam, Gula",
      price: 60000,
      rate: 4.9,
      types: [FoodType.recommended]),
  Food(
      id: 5,
      picturePath:
          "https://asianinspirations.com.au/wp-content/uploads/2018/12/R01611_Korean_Raw_Beef_Bibimbap.jpg",
      name: "Korean Raw Beef Tartare",
      description:
          "Daging sapi Korea cincang yang disajikan mentah dan disiram saus spesial dengan toping kuning telur dan taburan biji wijen.",
      ingredients: "Daging Sapi Korea, Telur, Biji Wijen",
      price: 350000,
      rate: 3.4),
  Food(
      id: 6,
      picturePath:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Sate_Padang2.JPG/500px-Sate_Padang2.JPG",
      name: "Sate Padang",
      description: "Sate Padang adalah sebutan untuk tiga jenis varian sate di Sumatera Barat, yaitu Sate Padang, Sate Padang Panjang, dan Sate Pariaman. Namun karena adanya ekslusivitas istilah makanan, istilah sate Padang tidak digunakan di Sumatera Barat yang hanya merujuk pada sate daging, lidah, dan jeroan; sedangkan istilah ini hanya digunakan di luar Sumatera Barat",
      ingredients: "bahan daging sapi, lidah, biji atau jeroan (jantung, usus, dan tetelan).",
      price: 12000,
      rate: 5.5,
      types: [FoodType.new_food]),
  Food(
      id: 7,
      picturePath:
          "https://cdn.yummy.co.id/content-images/images/20220826/C7cGauVaxLPeuIpZ7A7tcdvSjb0ftAzJ-31363631343732353132d41d8cd98f00b204e9800998ecf8427e.jpg?x-oss-process=image/resize,w_388,h_388,m_fixed,x-oss-process=image/format,webp",
      name: "Kue Kelepon",
      description: "Kue klepon adalah kue tradisional Indonesia yang terbuat dari tepung ketan, gula merah, dan parutan kelapa. Kue ini biasanya berwarna hijau karena menggunakan daun pandan.",
      ingredients: "Gula Merah, Pandan, Pewarna Makanan",
      price: 10000,
      rate: 6.5,
      types: [FoodType.popular]),
];
