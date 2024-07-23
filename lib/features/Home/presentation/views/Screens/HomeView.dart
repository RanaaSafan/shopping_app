import 'package:animal_app/core/api_service.dart';
import 'package:animal_app/features/Home/data/models/product.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../data/repo/repo_imp.dart';
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final api_service apiService = api_service(Dio());
  List<Product>? data = [];

  @override
  void initState() {
    super.initState();
    getproduct();
  }

  Future<void> getproduct() async {
    final homeRepo = RepoHomeImpl(apisevice: apiService);
    final result = await homeRepo.FetchProduct();

    result.fold(
          (failure) {
        // Handle the failure scenario
        print("Error fetching products: ${failure.error}");
      },
          (productData) {
        setState(() {
          data = productData;


        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10, top: 25),
        child: data != null && data!.isNotEmpty
            ? Column(
              children: [
                Row(
                          children: [
                if (data![0].products != null && data![0].products!.isNotEmpty)
                  Text("${data![0].products![0].id!}",style: TextStyle(color: Colors.cyan,fontSize: 30),),
                const SizedBox(width: 16),
                const Text(
                  "Welcome!",
                  style: TextStyle(
                    color: Colors.orangeAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    letterSpacing: 2,
                  ),
                ),
                          ],
                        ),
              ],
            )
            : const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
