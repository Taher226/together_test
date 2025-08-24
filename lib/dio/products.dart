import 'package:flutter/material.dart';
import 'package:together_test/core/config/theme/colors.dart';
import 'package:together_test/core/network/dio_helper.dart';
import 'package:together_test/dio/dio_model.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController ratingRateController = TextEditingController();
  TextEditingController ratingCountController = TextEditingController();

  List<ProductModel> allProducts = [];
  List<ProductModel> filteredProducts = [];
  TextEditingController searchController = TextEditingController();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  Future<void> getProducts() async {
    try {
      final response = await DioHelper.getData(url: 'products');
      if (response.data is List) {
        final List<ProductModel> loadedProducts =
            (response.data as List)
                .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
                .toList();

        setState(() {
          allProducts = loadedProducts;
          filteredProducts = loadedProducts;
          isLoading = false;
        });
      } else {
        print("Unexpected response format: ${response.data}");
        setState(() => isLoading = false);
      }
    } catch (e) {
      print('Error: $e');
      setState(() => isLoading = false);
    }
  }

  Future<void> addProduct({
    required String title,
    required String price,
    required String description,
    required String category,
    required String ratingRate,
    required String ratingCount,
  }) async {
    try {
      final double parsedRate = double.tryParse(ratingRate) ?? 0.0;
      final int parsedCount = int.tryParse(ratingCount) ?? 0;

      final response = await DioHelper.postData(
        url: 'products',
        data: {
          'title': title,
          'price': double.tryParse(price) ?? 0.0,
          'description': description,
          'category': category,
          'rating': {'rate': parsedRate, 'count': parsedCount},
          'image': 'https://cdn-icons-png.flaticon.com/512/869/869636.png',
        },
      );
      final responseData = Map<String, dynamic>.from(response.data);
      if (responseData['rating'] == null) {
        responseData['rating'] = {'rate': parsedRate, 'count': parsedCount};
      }
      final newProduct = ProductModel.fromJson(responseData);
      setState(() {
        allProducts.insert(0, newProduct);
        filteredProducts = List.from(allProducts);
      });

      print("Id: ${newProduct.id}");

      print("Rate: ${newProduct.rating.rate}");
      print("Count: ${newProduct.rating.count}");
      print("======================================");
      print("Product Added: ${responseData}");
      print("======================================");

      print("All Products: ${allProducts}");
    } catch (e) {
      print("Error adding product: $e");
    }
  }

  Future<void> editProduct({
    required int id,
    required String title,
    required String price,
    required String description,
    required String category,
    required String ratingRate,
    required String ratingCount,
  }) async {
    try {
      final double parsedRate = double.tryParse(ratingRate) ?? 0.0;
      final int parsedCount = int.tryParse(ratingCount) ?? 0;

      final response = await DioHelper.putData(
        url: 'products/$id',
        data: {
          'title': title,
          'price': double.tryParse(price) ?? 0.0,
          'description': description,
          'category': category,
          'rating': {'rate': parsedRate, 'count': parsedCount},
          'image': 'https://cdn-icons-png.flaticon.com/512/869/869636.png',
        },
      );
      final updatedData = Map<String, dynamic>.from(response.data);
      if (updatedData['rating'] == null) {
        updatedData['rating'] = {'rate': parsedRate, 'count': parsedCount};
      }
      final updatedProduct = ProductModel.fromJson(updatedData);
      setState(() {
        final index = allProducts.indexWhere((p) => p.id == id);
        if (index != -1) {
          allProducts[index] = updatedProduct;
        }
        filteredProducts = List.from(allProducts);
      });

      print("Updated Product Id: ${updatedProduct.id}");
    } catch (e) {
      print("Error adding product: $e");
    }
  }

  Future<void> deleteProduct({required int id}) async {
    try {
      final response = await DioHelper.deleteData(url: 'products/$id');
      setState(() {
        allProducts.removeWhere((product) => product.id == id);
        filteredProducts = List.from(allProducts);
      });
      print("Status code: ${response.statusCode}");

      print("deleted Product is: ${response.data}");
    } catch (e) {
      print("Error adding product: $e");
    }
  }

  void filterItems(String query) {
    setState(() {
      filteredProducts =
          allProducts
              .where(
                (item) =>
                    item.title.toLowerCase().contains(query.toLowerCase()),
              )
              .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutral100,
      appBar: AppBar(
        backgroundColor: AppColors.neutral100,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh, color: AppColors.neutral0),
            onPressed: () {
              setState(() {
                isLoading = true;
                getProducts();
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.edit, color: AppColors.neutral0),
            onPressed: () {
              setState(() {
                editProduct(
                  id: 1,
                  title: 'Taher',
                  price: '20',
                  description: 'description',
                  category: 'category',
                  ratingRate: '3.3',
                  ratingCount: '5',
                );
              });
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Title',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: titleController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Price',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: priceController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: descriptionController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Category',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: categoryController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Rating Rate',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: ratingRateController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Rating Count',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: ratingCountController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Align(
                        alignment: AlignmentDirectional.bottomCenter,
                        child: ElevatedButton(
                          onPressed: () {
                            addProduct(
                              title: titleController.text,
                              price: priceController.text,
                              description: descriptionController.text,
                              category: categoryController.text,
                              ratingRate: ratingRateController.text,
                              ratingCount: ratingCountController.text,
                            );
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                          ),
                          child: Text(
                            'Add Product',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: AppColors.normal,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },

        backgroundColor: AppColors.primary,
        child: Icon(Icons.add, color: AppColors.normal),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 60),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(20),
              child: Text(
                'Choose A Product',
                style: TextStyle(
                  color: AppColors.neutral0,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                onTapOutside: (_) => FocusScope.of(context).unfocus(),
                controller: searchController,
                onChanged: filterItems,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  suffixIcon: IconButton(
                    onPressed: () {
                      searchController.clear();
                      filterItems('');
                    },
                    icon: Icon(Icons.close, color: AppColors.neutral40),
                  ),
                  prefixIcon: Icon(Icons.search, color: AppColors.neutral10),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: AppColors.neutral80,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: AppColors.primary, width: 1),
                  ),
                ),
                cursorColor: AppColors.primary,
              ),
            ),
            Expanded(
              child:
                  isLoading
                      ? Center(child: CircularProgressIndicator())
                      : filteredProducts.isEmpty
                      ? Center(
                        child: Text(
                          'No products found',
                          style: TextStyle(color: AppColors.neutral40),
                        ),
                      )
                      : ListView.separated(
                        separatorBuilder:
                            (_, __) =>
                                Divider(color: AppColors.neutral90, height: 10),
                        itemCount: filteredProducts.length,
                        itemBuilder: (context, i) {
                          final product = filteredProducts[i];
                          return ListTile(
                            onTap: () {
                              print('Product ID: ${product.id}');
                              print('Title: ${product.title}');
                              print('Price: ${product.price}');
                              print('Description: ${product.description}');
                              print('Category: ${product.category}');
                              setState(() {
                                deleteProduct(id: product.id);
                              });
                            },
                            leading: Image.network(
                              product.image,
                              width: 40,
                              height: 40,
                              errorBuilder:
                                  (_, __, ___) =>
                                      Icon(Icons.image_not_supported),
                            ),
                            title: Text(
                              product.title,
                              style: TextStyle(
                                color: AppColors.neutral10,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            subtitle: Row(
                              children: [
                                Text(
                                  '\$${product.price}',
                                  style: TextStyle(color: AppColors.neutral40),
                                ),
                                SizedBox(width: 20),
                                Icon(
                                  Icons.star,
                                  color: AppColors.warning0,
                                  size: 16,
                                ),
                                Text(
                                  '${product.rating.rate} (${product.rating.count})',
                                  style: TextStyle(color: AppColors.neutral40),
                                ),
                              ],
                            ),
                            trailing: Icon(
                              Icons.arrow_forward,
                              color: AppColors.neutral40,
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
