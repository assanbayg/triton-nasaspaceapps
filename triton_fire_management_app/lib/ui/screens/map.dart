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
    //for now random data
    _data = const <Region>[
      Region('Almaty', 20),
      Region('Aqmola', 30),
      Region('Aqtöbe', 25),
      Region('Atyrau', 90),
      Region('East Kazakhstan', 18),
      Region('Mangghystau', 45),
      Region('North Kazakhstan', 40),
      Region('Pavlodar', 48),
      Region('Qaraghandy', 28),
      Region('Qostanay', 44),
      Region('Qyzylorda', 87),
      Region('South Kazakhstan', 12),
      Region('West Kazakhstan', 32),
      Region('Zhambyl', 89)
    ];

    _mapSource = MapShapeSource.asset(
      'assets/kz_1.json',
      shapeDataField: 'NAME_1',
      dataCount: _data.length,
      primaryValueMapper: (int index) => _data[index].regionName,
      dataLabelMapper: (int index) => _data[index].regionName,
      shapeColorValueMapper: (int index) => _data[index].probability,
      shapeColorMappers: <MapColorMapper>[
        const MapColorMapper(
            from: 0,
            to: 20,
            color: Color.fromRGBO(128, 159, 255, 1),
            text: '0-20'),
        const MapColorMapper(
            from: 21,
            to: 40,
            color: Color.fromRGBO(51, 102, 255, 1),
            text: '40'),
        const MapColorMapper(
            from: 41, to: 60, color: Color.fromRGBO(0, 57, 230, 1), text: '60'),
        const MapColorMapper(
            from: 61, to: 80, color: Color.fromRGBO(0, 45, 179, 1), text: '80'),
        const MapColorMapper(
            from: 81,
            to: 100,
            color: Color.fromRGBO(0, 26, 102, 1),
            text: '100'),
      ],
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
                      _data[index].regionName,
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
