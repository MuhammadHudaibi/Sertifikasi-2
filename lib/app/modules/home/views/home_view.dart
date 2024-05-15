import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sertif2/app/modules/home/controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Koleksi Punyaku', style: GoogleFonts.poppins(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.grey,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              controller.logout();
            },
            icon: Icon(Icons.logout, color: Colors.white),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: StreamBuilder(
          stream: controller.getFirestoreData(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Center(child: Text('Tidak ada data', style: GoogleFonts.poppins(),));
            }
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                var barang = snapshot.data!.docs[index];
                return Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.blueAccent[100],
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    title: Text(
                      barang['title'],
                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Colors.white)
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5),
                        Text(
                          'Estimasi Waktu: ${barang['time_estimation']} menit',
                          style: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '\nCara Membuat:\n${barang['instructions']}',
                          style: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '\nBahan-bahan:\n${barang['ingredients']}',
                          style: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        child: Icon(Icons.add, color: Colors.white,),
        backgroundColor: Colors.grey,
        shape: CircleBorder(),
      ),
    );
  }
}
