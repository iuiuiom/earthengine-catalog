var dataset = ee.ImageCollection('LANDSAT/LC08/C01/T1_ANNUAL_NBRT')
                  .filterDate('2017-01-01', '2017-12-31');
var colorized = dataset.select('NBRT');
var colorizedVis = {
  min: 0.9,
  max: 1.0,
  palette: ['000000', 'ffffff'],
};
Map.setCenter(6.746, 46.529, 6);
Map.addLayer(colorized, colorizedVis, 'Colorized');
