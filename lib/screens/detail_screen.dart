import 'package:flutter/material.dart';
import 'booking_screen.dart';

class DetailScreen extends StatelessWidget {
  final String name;
  final String price;
  final String rating;
  final String image;
  final List<String> tags;
  final String description;
  final String duration;
  final String level;
  final String include;

  const DetailScreen({
    super.key,
    required this.name,
    required this.price,
    required this.rating,
    required this.image,
    required this.tags,
    required this.description,
    required this.duration,
    required this.level,
    required this.include,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF4F6),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                  color: const Color(0xFF6B4D5F),
                ),
                const Row(
                  children: [
                    Icon(Icons.favorite_border, color: Color(0xFFE284A5)),
                    SizedBox(width: 16),
                    Icon(Icons.share, color: Color(0xFF6B4D5F)),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 12),

            ClipRRect(
              borderRadius: BorderRadius.circular(28),
              child: Image.network(
                image,
                height: 340,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2D2430),
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 20),
                    const SizedBox(width: 4),
                    Text(
                      rating,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF6B4D5F),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 8),

            Text(
              price,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color(0xFFE284A5),
              ),
            ),

            const SizedBox(height: 18),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: tags.map((tag) {
                return TagItem(text: tag);
              }).toList(),
            ),

            const SizedBox(height: 24),

            const Text(
              'Deskripsi',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2D2430),
              ),
            ),

            const SizedBox(height: 10),

            Text(
              description,
              style: const TextStyle(
                fontSize: 15,
                height: 1.6,
                color: Color(0xFF8A7B84),
              ),
            ),

            const SizedBox(height: 24),

            Row(
              children: [
                InfoBox(
                  icon: Icons.timer_outlined,
                  title: 'Durasi',
                  value: duration,
                ),
                const SizedBox(width: 12),
                InfoBox(icon: Icons.bar_chart, title: 'Level', value: level),
                const SizedBox(width: 12),
                InfoBox(
                  icon: Icons.card_giftcard,
                  title: 'Termasuk',
                  value: include,
                ),
              ],
            ),

            const SizedBox(height: 30),

            SizedBox(
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          BookingScreen(name: name, price: price, image: image),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE284A5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: const Text(
                  'Pesan Desain Ini',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TagItem extends StatelessWidget {
  final String text;

  const TagItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF4D9FF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF6B4D5F),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class InfoBox extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const InfoBox({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 91,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: const Color(0xFFE284A5)),
            const SizedBox(height: 6),
            Text(
              title,
              style: const TextStyle(fontSize: 12, color: Color(0xFF8A7B84)),
            ),
            const SizedBox(height: 2),
            Text(
              value,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF2D2430),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
