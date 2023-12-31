var dataset = ee.ImageCollection('LANDSAT/LC08/C01/T1_32DAY_NDSI')
                  .filterDate('2017-01-01', '2017-12-31');
var colorized = dataset.select('NDSI');
var colorizedVis = {
  palette: ['000088', '0000ff', '8888ff', 'ffffff'],
};
Map.setCenter(6.746, 46.529, 6);
Map.addLayer(colorized, colorizedVis, 'Colorized');
