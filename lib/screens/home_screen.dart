import 'package:flutter/material.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, dynamic>> categories = const [
    {'name': 'Semua', 'icon': Icons.apps},
    {'name': 'Minimalis', 'icon': Icons.brush_outlined},
    {'name': 'Glitter', 'icon': Icons.auto_awesome},
    {'name': '3D Art', 'icon': Icons.spa_outlined},
    {'name': 'French', 'icon': Icons.color_lens_outlined},
  ];

  final List<Map<String, dynamic>> nailDesigns = const [
    {
      'name': 'Pink Manis',
      'price': 'Rp 120.000',
      'rating': '4.8',
      'image':
          'https://images.unsplash.com/photo-1604654894610-df63bc536371?w=500',
      'tags': ['Minimalis', 'Pink', 'Glossy'],
      'description':
          'Desain nail art bernuansa pink lembut yang cocok untuk tampilan harian maupun acara santai.',
      'duration': '90 menit',
      'level': 'Mudah',
      'include': 'Gel',
    },
    {
      'name': 'Kilau Aurora',
      'price': 'Rp 130.000',
      'rating': '4.9',
      'image':
          'https://images.unsplash.com/photo-1607779097040-26e80aa78e66?w=500',
      'tags': ['Glitter', 'Aurora', 'Elegan'],
      'description':
          'Desain dengan efek kilau aurora yang memberikan tampilan mewah dan menarik.',
      'duration': '100 menit',
      'level': 'Sedang',
      'include': 'Gel dan glitter',
    },
    {
      'name': 'Nude Elegan',
      'price': 'Rp 110.000',
      'rating': '4.7',
      'image':
          'https://images.unsplash.com/photo-1610992015732-2449b76344bc?w=500',
      'tags': ['Nude', 'Elegan', 'Natural'],
      'description':
          'Desain warna nude yang simpel, rapi, dan cocok untuk tampilan formal.',
      'duration': '80 menit',
      'level': 'Mudah',
      'include': 'Gel',
    },
    {
      'name': 'French Chic',
      'price': 'Rp 125.000',
      'rating': '4.8',
      'image':
          'https://images.unsplash.com/photo-1604654894610-df63bc536371?w=500',
      'tags': ['French', 'Classic', 'Clean'],
      'description':
          'Model french tip klasik dengan sentuhan modern yang elegan dan timeless.',
      'duration': '85 menit',
      'level': 'Mudah',
      'include': 'Gel polish',
    },
    {
      'name': 'Galaxy Night',
      'price': 'Rp 145.000',
      'rating': '4.9',
      'image':
          'https://images.unsplash.com/photo-1604654894610-df63bc536371?w=500',
      'tags': ['Galaxy', 'Dark', 'Sparkle'],
      'description':
          'Inspirasi galaksi malam dengan perpaduan warna gelap dan efek sparkle yang unik.',
      'duration': '110 menit',
      'level': 'Sulit',
      'include': 'Gel, glitter, dan chrome',
    },
    {
      'name': 'Peach Blossom',
      'price': 'Rp 118.000',
      'rating': '4.7',
      'image':
          'https://images.unsplash.com/photo-1632345031435-8727f6897d53?w=500',
      'tags': ['Peach', 'Floral', 'Soft'],
      'description':
          'Desain warna peach lembut dengan detail bunga kecil yang manis dan feminin.',
      'duration': '95 menit',
      'level': 'Sedang',
      'include': 'Gel dan nail sticker',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7FA),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 42,
                      width: 42,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE284A5),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Center(
                        child: Text(
                          'A',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Avelis',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF6B4D5F),
                      ),
                    ),
                  ],
                ),
                const Icon(
                  Icons.notifications_none,
                  size: 28,
                  color: Color(0xFF6B4D5F),
                ),
              ],
            ),

            const SizedBox(height: 24),

            const Text(
              'Selamat Datang',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2D2430),
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              'Temukan gaya nail art yang cocok untukmu',
              style: TextStyle(fontSize: 15, color: Color(0xFF8A7B84)),
            ),

            const SizedBox(height: 24),

            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
                gradient: const LinearGradient(
                  colors: [Color(0xFFE284A5), Color(0xFFCDB4F0)],
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Promo Spesial',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Diskon 20%',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          'Untuk semua desain nail art',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            'Pesan Sekarang',
                            style: TextStyle(
                              color: Color(0xFFE284A5),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 72,
                    width: 72,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const Icon(
                      Icons.local_offer_outlined,
                      color: Colors.white,
                      size: 38,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            Text(
              'Kategori',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2D2430),
              ),
            ),

            const SizedBox(height: 16),

            SizedBox(
              height: 95,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final item = categories[index];

                  return Container(
                    width: 82,
                    margin: const EdgeInsets.only(right: 14),
                    decoration: BoxDecoration(
                      color: index == 0
                          ? const Color(0xFFE284A5)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          item['icon'],
                          size: 26,
                          color: index == 0
                              ? Colors.white
                              : const Color(0xFF6B4D5F),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item['name'],
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: index == 0
                                ? Colors.white
                                : const Color(0xFF6B4D5F),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 28),

            Text(
              'Desain Populer',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2D2430),
              ),
            ),

            const SizedBox(height: 16),

            SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: nailDesigns.length,
                itemBuilder: (context, index) {
                  final nail = nailDesigns[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            name: nail['name'],
                            price: nail['price'],
                            rating: nail['rating'],
                            image: nail['image'],
                            tags: List<String>.from(nail['tags']),
                            description: nail['description'],
                            duration: nail['duration'],
                            level: nail['level'],
                            include: nail['include'],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 160,
                      margin: const EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(22),
                            ),
                            child: Image.network(
                              nail['image']!,
                              height: 140,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  nail['name']!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Color(0xFF2D2430),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  nail['price']!,
                                  style: const TextStyle(
                                    color: Color(0xFF6B4D5F),
                                    fontSize: 13,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 18,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      nail['rating']!,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
