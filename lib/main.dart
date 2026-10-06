import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Semeru(),
    );
  }
}

class Semeru extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // =========================
      // APP BAR
      // =========================
      appBar: AppBar(
        leading: Icon(Icons.landscape),
        title: Text("Gunung Semeru"),
        foregroundColor: Color(0xff000000),
        backgroundColor: Color(0x003770c6),
        elevation: 4,
      ),

      // =========================
      // BODY
      // =========================
      body: Container(
        width: double.infinity,
        height: double.infinity,

        // =========================
        // BACKGROUND GAMBAR
        // =========================
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('asset/semeru1.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.80),
              BlendMode.darken,
            ),
          ),
        ),

        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: 50,
              left: 20,
              right: 20,
              bottom: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // =========================
                // FOTO SEMERU
                // =========================
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'asset/semeru.png',
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),

                SizedBox(height: 20),

                // =========================
                // NAMA GUNUNG
                // =========================
                Text(
                  "Gunung Semeru",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                SizedBox(height: 5),

                Text(
                  "Jawa Timur, Indonesia",
                  style: TextStyle(
                    color: Colors.blue[100],
                    fontSize: 16,
                  ),
                ),

                SizedBox(height: 20),

                // =========================
                // KETINGGIAN & STATUS
                // =========================
                Row(
                  children: [
                    // KETINGGIAN
                    Expanded(
                      child: HoverCard(
                        icon: Icons.height,
                        title: "Ketinggian",
                        value: "3.676 mdpl",
                        color: Colors.blue,
                      ),
                    ),

                    SizedBox(width: 10),

                    // STATUS
                    Expanded(
                      child: HoverCard(
                        icon: Icons.landscape,
                        title: "Status",
                        value: "Gunung Api",
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),

                // =========================
                // TENTANG SEMERU
                // =========================
                Text(
                  "Tentang Semeru",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                SizedBox(height: 10),

                Text(
                  "Gunung Semeru adalah gunung tertinggi di Pulau Jawa "
                  "dengan ketinggian sekitar 3.676 meter di atas permukaan "
                  "laut. Gunung ini terletak di Jawa Timur dan termasuk "
                  "dalam kawasan Taman Nasional Bromo Tengger Semeru. "
                  "Semeru merupakan salah satu gunung berapi aktif di "
                  "Indonesia dan menjadi salah satu tujuan pendakian "
                  "yang populer. Gunung ini memiliki pemandangan alam "
                  "yang indah dan menjadi habitat bagi berbagai flora "
                  "dan fauna.",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),

                SizedBox(height: 20),

                // =========================
                // LOKASI & CONTACT
                // =========================
                Row(
                  children: [
                    // LOKASI
                    Expanded(
                      child: HoverCard(
                        icon: Icons.location_on,
                        title: "Lokasi",
                        value: "Kabupaten Lumajang\nJawa Timur",
                        color: Colors.blue,
                      ),
                    ),

                    SizedBox(width: 10),

                    // CONTACT
                    Expanded(
                      child: HoverCard(
                        icon: Icons.contact_phone,
                        title: "Contact",
                        value: "0895-xxxx-xxxx\ninfo@semeru.id",
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 30),

                // =========================
                // QUOTE
                // =========================
                Column(
                  children: [
                    Center(
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          vertical: 25,
                          horizontal: 20,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.85),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.blue.withOpacity(0.3),
                          ),
                        ),
                        child: Text(
                          "Where Nature Meets the Sky",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Center(
                      child: Text(
                        "SEMERU • EAST JAVA",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// =====================================================
// HOVER CARD
// =====================================================

class HoverCard extends StatefulWidget {
  final String title;
  final String value;
  final Color color;
  final IconData icon;

  const HoverCard({
    super.key,
    required this.title,
    required this.value,
    required this.color,
    required this.icon,
  });

  @override
  State<HoverCard> createState() => _HoverCardState();
}

// =====================================================
// STATE HOVER CARD
// =====================================================

class _HoverCardState extends State<HoverCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      // MOUSE MASUK
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },

      // MOUSE KELUAR
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },

      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),

        // Card naik ketika hover
        transform: Matrix4.translationValues(
          0,
          isHovered ? -5 : 0,
          0,
        ),

        padding: EdgeInsets.all(15),

        decoration: BoxDecoration(
          // Warna card
          color: isHovered
              ? widget.color.withOpacity(0.25)
              : widget.color.withOpacity(0.08),

          borderRadius: BorderRadius.circular(12),

          // Shadow ketika hover
          boxShadow: isHovered
              ? [
                  BoxShadow(
                    color: widget.color.withOpacity(0.35),
                    blurRadius: 12,
                    offset: Offset(0, 6),
                  ),
                ]
              : [],
        ),

        child: Column(
          children: [
            // ICON
            Icon(
              widget.icon,
              color: widget.color,
              size: 30,
            ),

            SizedBox(height: 8),

            // TITLE
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            SizedBox(height: 5),

            // VALUE
            Text(
              widget.value,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: isHovered ? 18 : 16,
                color: isHovered ? widget.color : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
