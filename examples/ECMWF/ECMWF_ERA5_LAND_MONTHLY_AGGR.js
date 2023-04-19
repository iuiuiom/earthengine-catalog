var dataset = ee.ImageCollection('ECMWF/ERA5_LAND/MONTHLY_AGGR')
                .filter(ee.Filter.date('2020-02-01', '2020-07-10'));

var visualization = {
  bands: ['temperature_2m'],
  min: 250.0,
  max: 320.0,
  palette: [
    '#000080','#0000D9','#4000FF','#8000FF','#0080FF','#00FFFF',
    '#00FF80','#80FF00','#DAFF00','#FFFF00','#FFF500','#FFDA00',
    '#FFB000','#FFA400','#FF4F00','#FF2500','#FF0A00','#FF00FF',
  ]
};

Map.setCenter(-170.13, 45.62, 2);
Map.addLayer(dataset, visualization, 'Air temperature [K] at 2m height');
