import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  final Function(String) onSearch;
  final Function() onSubmitted;
  final TextEditingController controller;
  const SearchBarWidget({
    super.key,
    required this.onSearch,
    required this.onSubmitted,
    required this.controller,
  });

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Timer? timer;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      onChanged: (query) => _debounce(() => widget.onSearch(query)),
      onEditingComplete: widget.onSubmitted,
      controller: widget.controller,
      autofocus: true,
      placeholder: "Pesquisar filmes, séries, etc...",
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      placeholderStyle: const TextStyle(
        color: Colors.white,
      ),
      style: const TextStyle(color: Colors.white),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        border: Border.all(
          color: Colors.white,
          width: 1,
        ),
      ),
      prefix: const Padding(
        padding: EdgeInsets.only(left: 8.0),
        child: Icon(
          Icons.search,
          color: Colors.white,
        ),
      ),
    );
  }

  _debounce(VoidCallback search) {
    timer?.cancel();
    timer = Timer(const Duration(milliseconds: 500), search);
  }
}
