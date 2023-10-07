import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:triton_fire_management_app/models/region.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  _MapScreenState();

  late List<Region> _data;
  late MapShapeSource _mapSource;
  @override
  void initState() {
    _data = const <Region>[
      Region('New South Wales', Color.fromRGBO(255, 215, 0, 1.0),
          '       New\nSouth Wales'),
      Region('Queensland', Color.fromRGBO(72, 209, 204, 1.0), 'Queensland'),
      Region('Northern Territory', Color.fromRGBO(255, 78, 66, 1.0),
          'Northern\nTerritory'),
      Region('Victoria', Color.fromRGBO(171, 56, 224, 0.75), 'Victoria'),
      Region('South Australia', Color.fromRGBO(126, 247, 74, 0.75),
          'South Australia'),
      Region('Western Australia', Color.fromRGBO(79, 60, 201, 0.7),
          'Western Australia'),
      Region('Tasmania', Color.fromRGBO(99, 164, 230, 1), 'Tasmania'),
      Region('Australian Capital Territory', Colors.teal, 'ACT')
    ];

    _mapSource = MapShapeSource.asset(
      'assets/kz_2.json',
      shapeDataField: 'STATE_NAME',
      dataCount: _data.length,
      primaryValueMapper: (int index) => _data[index].regionName,
      dataLabelMapper: (int index) => _data[index].regionId,
      shapeColorValueMapper: (int index) => _data[index].regionColor,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 520,
        child: Center(
          child: SfMaps(
            layers: <MapShapeLayer>[
              MapShapeLayer(
                source: _mapSource,
                showDataLabels: true,
                legend: const MapLegend(MapElement.shape),
                tooltipSettings: MapTooltipSettings(
                    color: Colors.grey[700],
                    strokeColor: Colors.white,
                    strokeWidth: 2),
                strokeColor: Colors.white,
                strokeWidth: 0.5,
                shapeTooltipBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _data[index].regionId,
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                },
                dataLabelSettings: MapDataLabelSettings(
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize:
                          Theme.of(context).textTheme.bodySmall!.fontSize),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
