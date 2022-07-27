import 'package:app/config/responsive.dart';
import 'package:app/constants.dart';
import 'package:app/widgets/custom_elevated_button.dart';
import 'package:app/widgets/custom_table.dart';
import 'package:app/widgets/input_text.dart';
import 'package:flutter/material.dart';
class EmotionsPage extends StatelessWidget {
  const EmotionsPage({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final _search = TextEditingController();
    final _name = TextEditingController();
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
                  customElevatedButton(
                    width: 200,
                    text: "Add New Emotion",
                    onPressed: () async {
                    },
                    color: secondaryColor                 
                  ),
                ],
              ),
            ), 
            const SizedBox(height: 20),           
            const CustomTable(
              count: 0,
              listColumns: [
                DataColumn(label: Text("Emotion Name")),
                DataColumn(label: Text("Assigned Color")),
                DataColumn(label: Text("Icon")),
                DataColumn(label: Text("Action")),
              ],
              listRows: [],
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