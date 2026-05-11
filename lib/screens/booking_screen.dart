import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  final String name;
  final String price;
  final String image;

  const BookingScreen({
    super.key,
    required this.name,
    required this.price,
    required this.image,
  });

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final formKey = GlobalKey<FormState>();

  String namaLengkap = '';
  String nomorHp = '';
  String tanggal = '';
  String jam = '';
  String catatan = '';

  void submitBooking() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Booking ${widget.name} atas nama $namaLengkap, '
            'No HP $nomorHp, tanggal $tanggal, jam $jam. '
            'Catatan: ${catatan.isEmpty ? 'Tidak ada catatan' : catatan}',
          ),
          backgroundColor: const Color(0xFFE284A5),
          duration: const Duration(seconds: 5),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF4F6),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                  color: const Color(0xFF6B4D5F),
                ),
                const Expanded(
                  child: Center(
                    child: Text(
                      'Form Booking',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2D2430),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 48),
              ],
            ),

            const SizedBox(height: 24),

            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      widget.image,
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2D2430),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          widget.price,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFE284A5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Informasi Pelanggan',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2D2430),
                    ),
                  ),

                  const SizedBox(height: 14),

                  CustomInputField(
                    label: 'Nama Lengkap',
                    icon: Icons.person_outline,
                    onSaved: (value) {
                      namaLengkap = value ?? '';
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama lengkap tidak boleh kosong';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 14),

                  CustomInputField(
                    label: 'Nomor HP',
                    icon: Icons.phone_outlined,
                    keyboardType: TextInputType.phone,
                    onSaved: (value) {
                      nomorHp = value ?? '';
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nomor HP tidak boleh kosong';
                      }

                      if (value.length < 10) {
                        return 'Nomor HP minimal 10 digit';
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 24),

                  const Text(
                    'Tanggal dan Jam',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2D2430),
                    ),
                  ),

                  const SizedBox(height: 14),

                  CustomInputField(
                    label: 'Tanggal Booking',
                    icon: Icons.calendar_month_outlined,
                    onSaved: (value) {
                      tanggal = value ?? '';
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Tanggal booking wajib diisi';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 14),

                  CustomInputField(
                    label: 'Jam Booking',
                    icon: Icons.access_time,
                    onSaved: (value) {
                      jam = value ?? '';
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Jam booking wajib diisi';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 24),

                  const Text(
                    'Catatan Tambahan',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2D2430),
                    ),
                  ),

                  const SizedBox(height: 14),

                  CustomInputField(
                    label: 'Permintaan khusus jika ada',
                    icon: Icons.notes_outlined,
                    maxLines: 4,
                    onSaved: (value) {
                      catatan = value ?? '';
                    },
                    validator: (value) {
                      return null;
                    },
                  ),

                  const SizedBox(height: 30),

                  SizedBox(
                    height: 56,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: submitBooking,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE284A5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: const Text(
                        'Konfirmasi Booking',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomInputField extends StatelessWidget {
  final String label;
  final IconData icon;
  final TextInputType keyboardType;
  final int maxLines;
  final String? Function(String?) validator;
  final void Function(String?) onSaved;

  const CustomInputField({
    super.key,
    required this.label,
    required this.icon,
    required this.validator,
    required this.onSaved,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator: validator,
      onSaved: onSaved,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: const Color(0xFF6B4D5F)),
        hintText: label,
        filled: true,
        fillColor: Colors.white,
        hintStyle: const TextStyle(color: Color(0xFF8A7B84)),
        errorStyle: const TextStyle(
          color: Color(0xFFE284A5),
          fontWeight: FontWeight.w600,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: Color(0xFFE284A5), width: 1.5),
        ),
      ),
    );
  }
}
