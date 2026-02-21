import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDataList extends StatefulWidget {
  const FirebaseDataList({super.key});

  @override
  _FirebaseDataListState createState() => _FirebaseDataListState();
}

class _FirebaseDataListState extends State<FirebaseDataList> {
  final CollectionReference products = FirebaseFirestore.instance.collection(
    'products',
  );

  Future<void> createProduct(
    String name,
    String description,
    double price,
  ) async {
    await products.add({
      'name': name,
      'description': description,
      'price': price,
    });
  }

  Future<void> updateProduct(
    String docId,
    String name,
    String description,
    double price,
  ) async {
    await products.doc(docId).update({
      'name': name,
      'description': description,
      'price': price,
    });
  }

  Future<void> deleteProduct(String docId) async {
    await products.doc(docId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: StreamBuilder<QuerySnapshot>(
        stream: products.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data!.docs;

          return ListView.separated(
            separatorBuilder: (context, index) => const Divider(),
            itemCount: data.length,
            itemBuilder: (context, index) {
              final product = data[index];
              String productId = product.id;
              return ListTile(
                leading: Text(productId),
                title: Text(product['name'] ?? ''),
                subtitle: Text(product['description'] ?? ''),
              );
            },
          );
        },
      ),
    );
  }
}
