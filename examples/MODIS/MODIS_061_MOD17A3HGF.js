var dataset = ee.ImageCollection('MODIS/061/MOD17A3HGF');

var visualization = {
  bands: ['Npp'],
  min: 0,
  max: 19000,
  palette: ['bbe029', '0a9501', '074b03']
};

Map.setCenter(6.746, 46.529, 3);

Map.addLayer(dataset, visualization, 'NPP');
