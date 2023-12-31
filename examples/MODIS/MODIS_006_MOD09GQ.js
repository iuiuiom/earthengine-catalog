var dataset = ee.ImageCollection('MODIS/006/MOD09GQ')
                  .filter(ee.Filter.date('2018-01-01', '2018-05-01'));
var falseColorVis = {
  min: -100,
  max: 8000,
  bands: ['sur_refl_b02', 'sur_refl_b02', 'sur_refl_b01'],
};
Map.setCenter(6.746, 46.529, 2);
Map.addLayer(dataset, falseColorVis, 'False Color');
