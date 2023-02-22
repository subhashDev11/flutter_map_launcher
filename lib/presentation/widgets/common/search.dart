// import 'package:flutter/material.dart';
// import 'package:autocomplete_textfield/autocomplete_textfield.dart';
//
// class Search extends StatefulWidget {
//   const Search({
//     required this.placeholder,
//     required this.controller,
//     this.onChanged,
//     Key? key,
//   }) : super(key: key);
//
//   final String placeholder;
//   final TextEditingController controller;
//   final dynamic onChanged;
//
//   @override
//   _SearchState createState() => _SearchState();
// }
//
// class _SearchState extends State<Search> {
//   late AutoCompleteTextField search;
//   GlobalKey<AutoCompleteTextFieldState> key = GlobalKey();
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//
//     return Container(
//       height: 54,
//       color: Colors.transparent,
//       padding: const EdgeInsets.fromLTRB(14, 12, 14, 0),
//       child: TextField(
//         key: widget.key,
//         controller: widget.controller,
//         onChanged: widget.onChanged,
//         minLines: 1,
//         maxLines: 1,
//         decoration: InputDecoration(
//           labelText: widget.placeholder,
//           fillColor: theme.progressIndicatorTheme.color,
//           filled: true,
//           floatingLabelBehavior: FloatingLabelBehavior.never,
//           prefixIcon: const Icon(Icons.search),
//           contentPadding:
//               const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
//           focusedBorder: UnderlineInputBorder(
//             borderRadius: BorderRadius.circular(40),
//             borderSide:
//                 const BorderSide(color: Color.fromRGBO(30, 38, 44, 0.07)),
//           ),
//           enabledBorder: UnderlineInputBorder(
//             borderRadius: BorderRadius.circular(40),
//             borderSide:
//                 const BorderSide(color: Color.fromRGBO(30, 38, 44, 0.07)),
//           ),
//         ),
//       ),
//     );
//   }
// }
