import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  final formData = <String, dynamic>{};

  String selectedDate = '';
  String selectedTime = '';

  bool isDateError = false;
  bool isTimeError = false;

  Widget buildInputField({
    required String label,
    required IconData icon,
    required String field,
    required String? Function(String?) validator,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return TextFormField(
      keyboardType: keyboardType,
      maxLines: maxLines,

      decoration: InputDecoration(
        hintText: label,

        prefixIcon: Icon(icon, color: const Color(0xFF6B4D5F)),

        filled: true,
        fillColor: Colors.white,

        hintStyle: const TextStyle(color: Color(0xFF8A7B84)),

        errorStyle: const TextStyle(
          color: Colors.redAccent,
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

      validator: validator,

      onSaved: (value) {
        formData[field] = value;
      },
    );
  }

  Widget buildTimeItem(String time) {
    final isSelected = selectedTime == time;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTime = time;
          isTimeError = false;
        });
      },

      child: Container(
        margin: const EdgeInsets.only(right: 10, bottom: 10),

        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),

        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFE284A5) : Colors.white,

          borderRadius: BorderRadius.circular(14),
        ),

        child: Text(
          time,

          style: TextStyle(
            color: isSelected ? Colors.white : const Color(0xFF6B4D5F),

            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Future<void> pickDate() async {
    DateTime now = DateTime.now();

    DateTime? pickedDate = await showDatePicker(
      context: context,

      initialDate: now,

      firstDate: now,

      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate =
            '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}';

        isDateError = false;
      });
    }
  }

  Widget buildSubmitButton() {
    return SizedBox(
      height: 56,
      width: double.infinity,

      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFE284A5),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),

        onPressed: () {
          bool isValid = formKey.currentState!.validate();

          setState(() {
            isDateError = selectedDate.isEmpty;
            isTimeError = selectedTime.isEmpty;
          });

          if (isValid && !isDateError && !isTimeError) {
            formKey.currentState!.save();

            Get.snackbar(
              'Booking Berhasil',

              '${widget.name} berhasil dibooking\n'
                  'Atas nama: ${formData["name"]}\n'
                  'Nomor HP: ${formData["phone"]}\n'
                  'Tanggal: $selectedDate\n'
                  'Jam: $selectedTime',

              backgroundColor: const Color(0xFFE284A5),
              colorText: Colors.white,

              snackPosition: SnackPosition.BOTTOM,

              margin: const EdgeInsets.all(16),

              borderRadius: 16,

              duration: const Duration(seconds: 4),
            );
          }
        },

        child: const Text(
          'Konfirmasi Booking',

          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
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

                    child: Image.asset(
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

            const SizedBox(height: 30),

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

                  buildInputField(
                    label: 'Nama Lengkap',
                    icon: Icons.person_outline,
                    field: 'name',

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama lengkap wajib diisi';
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 14),

                  buildInputField(
                    label: 'Nomor HP',
                    icon: Icons.phone_outlined,
                    field: 'phone',

                    keyboardType: TextInputType.phone,

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nomor HP wajib diisi';
                      }

                      if (!RegExp(r'^08[0-9]{8,11}$').hasMatch(value)) {
                        return 'Format nomor HP tidak valid';
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 30),

                  const Text(
                    'Pilih Tanggal',

                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2D2430),
                    ),
                  ),

                  const SizedBox(height: 14),

                  GestureDetector(
                    onTap: pickDate,

                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 18,
                      ),

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                      ),

                      child: Row(
                        children: [
                          const Icon(
                            Icons.calendar_month_outlined,
                            color: Color(0xFF6B4D5F),
                          ),

                          const SizedBox(width: 12),

                          Text(
                            selectedDate.isEmpty
                                ? 'Pilih tanggal booking'
                                : selectedDate,

                            style: TextStyle(
                              color: selectedDate.isEmpty
                                  ? const Color(0xFF8A7B84)
                                  : const Color(0xFF2D2430),

                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 6),

                  if (isDateError)
                    const Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Text(
                        'Tanggal booking wajib dipilih',

                        style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                  const SizedBox(height: 30),

                  const Text(
                    'Pilih Jam',

                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2D2430),
                    ),
                  ),

                  const SizedBox(height: 14),

                  Wrap(
                    children: [
                      buildTimeItem('10:00'),
                      buildTimeItem('11:00'),
                      buildTimeItem('12:00'),
                      buildTimeItem('13:00'),
                      buildTimeItem('14:00'),
                      buildTimeItem('15:00'),
                      buildTimeItem('16:00'),
                      buildTimeItem('17:00'),
                      buildTimeItem('18:00'),
                      buildTimeItem('19:00'),
                      buildTimeItem('20:00'),
                    ],
                  ),

                  if (isTimeError)
                    const Padding(
                      padding: EdgeInsets.only(left: 12, top: 4),
                      child: Text(
                        'Jam booking wajib dipilih',

                        style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                  const SizedBox(height: 30),

                  const Text(
                    'Catatan Tambahan',

                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2D2430),
                    ),
                  ),

                  const SizedBox(height: 14),

                  buildInputField(
                    label: 'Permintaan khusus jika ada',
                    icon: Icons.notes_outlined,
                    field: 'notes',
                    maxLines: 4,

                    validator: (value) {
                      if (value == null) {
                        return 'Field tidak valid';
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 30),

                  buildSubmitButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
