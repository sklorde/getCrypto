import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:implicitly_animated_list/implicitly_animated_list.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:getCrypto/app/utils/string_extension.dart';

import '../../shared/models/Crypto.dart';
import '../../utils/getcrypto_colors.dart';

class SearchBarWidget extends StatefulWidget {
  final List<Crypto> cryptos;
  final Widget body;

  const SearchBarWidget({Key key, this.cryptos, this.body}) : super(key: key);

  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  List<Crypto> _suggestions;

  @override
  Widget build(BuildContext context) {
    return FloatingSearchBar(
      hint: 'Search...',
      body: widget.body,
      borderRadius: BorderRadius.circular(8),
      iconColor: Colors.white,
      queryStyle: TextStyle(color: Colors.white),
      backgroundColor: GetCryptoColors.secundary,
      hintStyle: TextStyle(color: Colors.grey.shade400),
      transition: CircularFloatingSearchBarTransition(),
      debounceDelay: Duration(milliseconds: 250),
      onQueryChanged: (query) => onQueryChanged(query),
      builder: (context, _) {
        if (_suggestions == null)
          return Container();
        else
          return buildSearchBody();
      },
    );
  }

  onQueryChanged(String query) {
    if (query.length > 1) {
      _suggestions = widget.cryptos
          .toList()
          .where((cryptos) =>
              (cryptos.name.toCompare()).contains(query.toCompare()))
          .toList();
    } else {
      if (_suggestions.length != null) _suggestions.clear();
    }
    setState(() {});
  }

  buildSearchBody() {
    return Material(
      color: GetCryptoColors.secundary,
      borderRadius: BorderRadius.circular(8),
      child: ImplicitlyAnimatedList<Crypto>(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemData: _suggestions.toList().take(5).toList(),
        itemBuilder: (context, data) {
          return InkWell(
            splashColor: GetCryptoColors.secundary,
            onTap: () {
              FloatingSearchBar.of(context).close();
              Modular.to.pushNamed('/info/${data.name}');
              _suggestions.clear();
            },
            child: Container(
              height: 70,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Text(
                      data.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
