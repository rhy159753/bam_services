import 'package:flutter/material.dart';
import 'package:bamservices/theme/bam.colors.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:bamservices/model/env.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Search_Section extends StatefulWidget {
  const Search_Section({Key? key});

  @override
  _Search_SectionState createState() => _Search_SectionState();
}

class _Search_SectionState extends State<Search_Section> {
  late String categorySearch = "Servisan - No Servisan";
  late String apiLink = "servisan/single?noserv=";

  final TextEditingController _searchController = TextEditingController();

  void updateApiLink(String category) {
    if (category == 'Servisan - No Servisan') {
      apiLink = 'servisan/search?field=noserv&keyword=';
    } else if (category == 'Servisan - Jenis Barang') {
      apiLink = 'servisan/search?field=jebar&keyword=';
    } else if (category == 'Servisan - Atas Nama') {
      apiLink = 'servisan/search?field=atn&keyword=';
    } else if (category == 'Panggilan - Lokasi') {
      apiLink = 'panggilan/search?field=lok&keyword=';
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future fetchData(String query) async {
    updateApiLink(categorySearch);
    if (query == "") {
      print("Tidak ada data yang diinputkan");
    } else {
      final response = await http.get(Uri.parse(Env.API_URL + apiLink + query));
      if (response.statusCode == 200) {
        String Row = jsonDecode(response.body)['rows'].toString();

        if (Row == "0") {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: black_color,
              title: Text('Tidak Ada Data. Cari dengan kata kunci lain', style: TextStyle(color: white_color)),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text('Cari', style: TextStyle(color: white_color)),
                ),
              ],
            ),
          );

          print("Data tidak ditemukan");
        } else {
          _searchController.clear();
          FocusScope.of(context).requestFocus(FocusNode());
          if (categorySearch == 'Servisan - No Servisan') {
            Navigator.pushNamed(context, '/detail_services',
                arguments: query);
          } else if (categorySearch == 'Servisan - Jenis Barang') {
            Navigator.pushNamed(context, '/servisan/search',
                arguments: jsonDecode(response.body)['data']);
          } else if (categorySearch == 'Servisan - Atas Nama') {
            Navigator.pushNamed(context, '/servisan/search',
                arguments: jsonDecode(response.body)['data']);
          } else if (categorySearch == 'Panggilan - Lokasi') {
            Navigator.pushNamed(context, '/panggilan/search',
                arguments: jsonDecode(response.body)['data']);
          }
        }
      } else {
        throw Exception('Failed to load data');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 31),
      child: Column(
        children: [
          Container(
            height: 67,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 15,
                  child: Container(
                    decoration: BoxDecoration(
                      color: primary_color,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                    padding: const EdgeInsets.fromLTRB(15, 11, 5, 11),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cari Berdasarkan',
                          style: GoogleFonts.lato(
                            fontSize: 11,
                            color: white_color,
                          ),
                        ),
                        Text(
                          categorySearch,
                          style: GoogleFonts.lato(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: white_color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    decoration: BoxDecoration(
                      color: primary_color,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.clear_all_rounded,
                        color: white_color,
                      ),
                      color: white_color,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () => categoryOverlayDialog(context),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: _searchController,
            autofocus: false,
            decoration: InputDecoration(
              hoverColor: Colors.transparent,
              hintText: 'Pencarian',
              suffixIcon: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                child: IconButton(
                    icon: const Icon(Icons.search),
                    color: black_color,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () => {
                          // Navigator.pushNamed(context, '/servisan/search'),
                          fetchData(_searchController.text)
                        }),
              ),
              fillColor: white_color,
              filled: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void categoryOverlayDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  5.0,
                ),
              ),
            ),
            contentPadding: EdgeInsets.all(0),
            backgroundColor: Colors.transparent,
            content: Container(
              height: 50,
              decoration: BoxDecoration(
                color: black_color,
                border: Border.all(
                  color: white_color,
                  width: 1,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    15.0,
                  ),
                ),
              ),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: white_color,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 1),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      value: categorySearch,
                      style: GoogleFonts.lato(fontSize: 14, color: black_color),
                      onChanged: (newValue) {
                        setState(() {
                          categorySearch = newValue!;
                          updateApiLink(categorySearch);
                        });
                        Navigator.of(context).pop();
                      },
                      items: [
                        DropdownMenuItem(
                          value: 'Servisan - No Servisan',
                          child: Text('Servisan - No Servisan'),
                        ),
                        DropdownMenuItem(
                          value: 'Servisan - Jenis Barang',
                          child: Text('Servisan - Jenis Barang'),
                        ),
                        DropdownMenuItem(
                          value: 'Servisan - Atas Nama',
                          child: Text('Servisan - Atas Nama'),
                        ),
                        DropdownMenuItem(
                          value: 'Panggilan - Lokasi',
                          child: Text('Panggilan - Lokasi'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
