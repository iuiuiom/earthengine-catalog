var dataset = ee.ImageCollection('WRI/GFW/FORMA/raw_output_firms')
                  .filter(ee.Filter.date('2018-08-01', '2018-08-15'));
var percentageOfClearing = dataset.select('nday');
var visParams = {
  min: 0.0,
  max: 0.01,
};
Map.setCenter(26, -8, 3);
Map.addLayer(percentageOfClearing, visParams, 'Percentage of clearing');
