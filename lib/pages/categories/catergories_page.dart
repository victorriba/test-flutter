import 'package:app/config/responsive.dart';
import 'package:app/constants.dart';
import 'package:app/pages/categories/category_model.dart';
import 'package:app/pages/categories/category_provider.dart';
import 'package:app/widgets/custom_elevated_button.dart';
import 'package:app/widgets/custom_table.dart';
import 'package:app/widgets/input_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class CategoriesPage extends StatefulWidget {
  const CategoriesPage({ Key? key }) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  
  @override
  void initState() { 
    super.initState();
    Provider.of<CategoryProvider>(context, listen: false).getListCategory();    
  }
  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final _search = TextEditingController();
    final _name = TextEditingController();
    final categoryProvider = Provider.of<CategoryProvider>(context);
    DataRow tableRow(Category row) {
      return DataRow(cells: [
        DataCell(Text(row.name)),
        DataCell(Row(
          children: [
            IconButton(
                padding: const EdgeInsets.all(0),
                color: Colors.orange,
                icon: const Icon(Icons.edit, size: 30),
                onPressed: () {
                  categoryProvider.service = row;
                }),
            IconButton(
              padding: const EdgeInsets.all(0),
              color: Colors.red,
              icon: const Icon(Icons.delete, size: 30),
              onPressed: () {
              },
            ),
          ],
        )),
      ]);
    }    
    return SingleChildScrollView(
      child: Card(
        margin: EdgeInsets.all(isMobile ? paddingSmall : paddingLarge),
        child: Column(
          children: [
            const SizedBox(height: defaultSized),
            Container(
              height: 46,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? paddingSmall : paddingLarge
              ),
              child: Row(
                children: [
                  inputSearch(_search),
                  Expanded(child: Container()),
                  Row(
                    children: [
                      inputName(_name),
                      const SizedBox(width: 10), 
                      customElevatedButton(
                        width: 200,
                        text: "Add New Categories",
                        onPressed: () async {
                          categoryProvider.service.name = _name.text; 
                          categoryProvider.form();
                          _name.clear();
                        },
                        color: secondaryColor                 
                      ),                  
                    ],
                  ),
                ],
              ),
            ), 
            const SizedBox(height: 20),           
            CustomTable(
              count: categoryProvider.count,
              listColumns: const [
                DataColumn(label: Text("Categories")),
                DataColumn(label: Text("Action")),
              ],
              listRows: categoryProvider.list
              .map((row) => tableRow(row))
              .toList(),
            ),
          ],
        ),
      ),
    );
  }

  InputText inputSearch(TextEditingController _controller) {
    return InputText(
      prefix: Container(
        constraints: const BoxConstraints.tightForFinite(),
        child: const Icon(Icons.search_outlined)
      ),
      dark: false,
      width: 200,
      label: "Search",
      placeholder: "Search",
      controller: _controller,
      onValidate: (value) {
        if (value.length == 0) {
          return 'error';
        }
        return null;
      }
    );
  }

  InputText inputName(TextEditingController _controller) {
    return InputText(
      prefix: Container(
        constraints: const BoxConstraints.tightForFinite(),
        child: const Icon(Icons.search_outlined)
      ),
      dark: false,
      width: 200,
      placeholder: "Name",
      controller: _controller,
      onValidate: (value) {
        if (value.length == 0) {
          return 'error';
        }
        return null;
      }
    );
  }
}