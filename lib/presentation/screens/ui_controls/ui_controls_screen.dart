import 'package:flutter/material.dart';


class UiControlsScreen extends StatelessWidget {
  static const name = 'uiControls_screen';
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plain, boat, submarine }



class _UiControlsViewState extends State<_UiControlsView> {
  bool switchValue = false;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  void changeValue(bool value) {
    switchValue = value;

    setState(() {});
  }

  void onChangeTransportation(Transportation value) {
    selectedTransportation = value;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SwitchListTile(
            title: const Text('Developer mode'),
            subtitle: const Text('Controles adicionales'),
            value: switchValue,
            onChanged: (value) => changeValue(value)),
        ExpansionTile(
          title: const Text('Vehiculo de transporte'),
          subtitle: Text('$selectedTransportation'),
          initiallyExpanded: true,
          children: [
            RadioListTile(
                title: const Text('Car'),
                value: Transportation.car,
                groupValue: selectedTransportation,
                onChanged: (value) => onChangeTransportation(value!)),
            RadioListTile(
                title: const Text('Boat'),
                value: Transportation.boat,
                groupValue: selectedTransportation,
                onChanged: (value) => onChangeTransportation(value!)),
            RadioListTile(
                title: const Text('Plain'),
                value: Transportation.plain,
                groupValue: selectedTransportation,
                onChanged: (value) => onChangeTransportation(value!)),
            RadioListTile(
                title: const Text('Plain'),
                value: Transportation.submarine,
                groupValue: selectedTransportation,
                onChanged: (value) => onChangeTransportation(value!))
          ],
        ),
        CheckboxListTile(
            title: const Text('Desayuno?'),
            value: wantsBreakfast,
            onChanged: (value) {
              setState(() {
                wantsBreakfast = !wantsBreakfast;
              });
            }),
        CheckboxListTile(
            title: const Text('Comida?'),
            value: wantsLunch,
            onChanged: (value) {
              setState(() {
                wantsLunch = !wantsLunch;
              });
            }),
        CheckboxListTile(
            title: const Text('Cena?'),
            value: wantsDinner,
            onChanged: (value) {
              setState(() {
                wantsDinner = !wantsDinner;
              });
            }),
      ],
    );
  }
}
