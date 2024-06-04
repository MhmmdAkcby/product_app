import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/product/cubit/product_cubit.dart';
import 'package:product_app/product/cubit/product_cubit_state.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().fetchProductItemAdvance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductCubit, ProductCubitState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.item?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              return state.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListTile(
                      title: Text(state.item?[index].description ?? ''),
                    );
            },
          );
        },
      ),
    );
  }
}
