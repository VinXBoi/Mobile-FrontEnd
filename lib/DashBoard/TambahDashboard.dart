import 'package:activity_tracker/main.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class TambahDashboard extends StatefulWidget {
  final String username;
  const TambahDashboard({super.key, required this.username});

  @override
  State<TambahDashboard> createState() => _TambahDashboardState();
}

class _TambahDashboardState extends State<TambahDashboard> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  bool _showButton = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _showButton = _controller.text.trim().isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create New Dashboard"),
        leading: const Icon(Icons.folder_open),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close),
          ),
          // if (_showButton)
          //   TextButton(
          //     onPressed: () {
          //       Navigator.pop(context, DashboardProvider(title: _controller.text, icon: Icons.edit));
          //     },
          //     child: const Text(
          //       "Done",
          //       style: TextStyle(
          //         color: Colors.white,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //   ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                // Tambahkan logika untuk pilih gambar/icon
              },
              child: Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.blue, width: 1.5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.add_photo_alternate_outlined,
                        size: 32,
                        color: Colors.blue,
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Add Image or Icon",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: "New Page Title",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.title),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _controller2,
              maxLines: 3,
              decoration: const InputDecoration(
                hintText: "Add a short description...",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.notes),
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                if (_controller.text.isEmpty) {
                  showTopSnackBar(
                    Overlay.of(context),
                    Material(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.redAccent,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: const [
                            // Icon(Icons.warning, color: Colors.white),
                            SizedBox(width: 12, height: 10),
                            Expanded(
                              child: Text(
                                "Title Tidak Boleh Kosong",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                  return;
                }

                Navigator.pop(
                  context,
                  DashboardProvider(title: _controller.text, icon: Icons.edit),
                );
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Dashboard Baru Berhasil Ditambahkan'),
                      duration: Duration(seconds: 4),
                    ),
                  );
                });
              },
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
