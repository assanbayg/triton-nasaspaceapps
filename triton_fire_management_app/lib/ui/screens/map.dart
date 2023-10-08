import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:triton_fire_management_app/models/district.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  _MapScreenState();

  late List<Region> _data;
  late MapShapeSource _mapSource;
  late MapZoomPanBehavior _zoomPanBehavior;

  @override
  void initState() {
    _zoomPanBehavior = MapZoomPanBehavior();
    //for now random wildfire chance
    _data = const <Region>[
      Region('Abayskiy', 20),
      Region('Ayagozskiy', 30),
      Region('Beskaragayskiy', 25),
      Region('Borodulikhinskiy', 90),
      Region('Glubokovskiy', 18),
      Region('Katon-Karagayskiy', 45),
      Region('Kokpektinskiy', 40),
      Region('Kurchumskiy', 48),
      Region('Leninogorsk', 28),
      Region('Semipalatinskiy', 44),
      Region('Glubokovskiy', 87),
      Region('Tarbagatayskiy', 30),
      Region('Shemonaikhinskiy', 33),
      Region('Ulanskiy', 0),
      Region('Urdzharskiy', 78),
      Region('Zaysanskiy', 87),
      Region('Zharminskiy', 54),
      Region('Zyryanovsk', 12),
    ];

    _mapSource = MapShapeSource.asset(
      'assets/kz_2.json',
      shapeDataField: 'NAME_2',
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
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final bool scrollEnabled = constraints.maxHeight > 400;
      double height = scrollEnabled ? constraints.maxHeight : 400;
      if (MediaQuery.of(context).orientation == Orientation.landscape) {
        final double refHeight = height * 0.6;
        height = height > 500 ? (refHeight < 500 ? 500 : refHeight) : height;
      }

      return Container(
        padding: scrollEnabled
            ? EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.05,
                bottom: MediaQuery.of(context).size.height * 0.05)
            : const EdgeInsets.only(top: 10, bottom: 15),
        child: Column(
          children: [
            const Padding(
                padding: EdgeInsets.only(top: 15, bottom: 30),
                child: Align(
                    child: Text(
                  'Wildfire chance in East Kazakhstan',
                  style: TextStyle(fontSize: 20),
                ))),
            Expanded(
              child: SfMaps(
                layers: <MapShapeLayer>[
                  MapShapeLayer(
                    zoomPanBehavior: _zoomPanBehavior,
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
          ],
        ),
      );
    });
  }
}
