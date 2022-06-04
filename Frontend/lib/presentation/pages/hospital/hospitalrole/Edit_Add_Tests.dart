// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:special_tests/application/specialTest/bloc/specialTestBloc.dart';
import 'package:special_tests/domain/special_tests/entity/special_tests_model.dart';

class editAddTests extends StatelessWidget {
  editAddTests({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Special Test"),),
      body: SafeArea(
        child: BlocBuilder<specialTestBloc, specialTestsState>(
            builder: (context, state) {
          if (state is TestLoadingSuccess) {
            return Container( 
              padding: EdgeInsets.all(40),
              child: SpecialTestAddForm(
                  formKey: formKey,
                  test: state.specialTests,
                  nameController: nameController,
                  priceController: priceController,
                  descriptionController: descriptionController),
            );
          }
          return Container(
            padding: EdgeInsets.all(40),
            child: SpecialTestAddForm(
                formKey: formKey,
                nameController: nameController,
                priceController: priceController,
                descriptionController: descriptionController),
          );
        }),
      ),
    );
  }
}

class SpecialTestAddForm extends StatelessWidget {
  SpecialTestAddForm({
    Key? key,
    this.test,
    required this.formKey,
    required this.nameController,
    required this.priceController,
    required this.descriptionController,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController priceController;
  final TextEditingController descriptionController;
  SpecialTest? test;

  @override
  Widget build(BuildContext context) {
    if (test != null) {
      this.nameController.value = TextEditingValue(text: test!.name);
      this.priceController.value =
          TextEditingValue(text: test!.price.toString());
      this.descriptionController.value =
          TextEditingValue(text: test!.description);
    }
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Special Test',
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(
            height: 2,
          ),
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(
                hintText: 'Enter Name', border: OutlineInputBorder()),
            validator: (String? name) {
              if (name == null || name.isEmpty) {
                return "Name must not be empty";
              }
              return null;
            },
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Price',
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(
            height: 2,
          ),
          TextFormField(
            controller: priceController,
            decoration: InputDecoration(
                hintText: 'Price',
                prefixIcon: Icon(Icons.attach_money_outlined),
                border: OutlineInputBorder()),
            validator: (String? price) {
              if (price == null || price.isEmpty) {
                return "Price must not be empty";
              }
              final validPrice = RegExp("[0-9]");
              final correct = validPrice.hasMatch(price);
              return correct ? null : "Enter a valid price";
            },
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Description',
            
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(
            height: 2,
          ),
          TextFormField(
            controller: descriptionController,
            decoration: InputDecoration(
                hintText: 'description', border: OutlineInputBorder()),
            validator: (String? description) {
              if (description == null || description.isEmpty) {
                return "Description must not be empty";
              }
              return null;
            },
          ),
          SizedBox(
            height: 30,
          ),
          BlocConsumer<specialTestBloc, specialTestsState>(
              listenWhen: (previous, current) =>
                  current is TestOperationSuccess,
              listener: (context, state) {
                context.pop();
              },
              builder: (context, state) {
                Widget button = Text("Save");
                if (state is TestLoading) {
                  button = SizedBox(
                      height: 10,
                      width: 10,
                      child: CircularProgressIndicator(
                        color: Colors.teal,
                      ));
                }
                if (state is TestOperationSuccess) {
                  context.pop();
                  button = Icon(Icons.check);
                }
                if (state is TestOperationFailure) {
                  button = Icon(Icons.refresh_outlined);
                }
                return ElevatedButton(
                  onPressed: () {},
                  child: button,
                );
              })
        ],
      ),
    );
  }
}
