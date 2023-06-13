var dataset = ee.ImageCollection('Slovakia/ortho/25cm');

Map.setCenter(19.2, 48.8, 15);
Map.addLayer(dataset, null, 'Slovakia orthophotos RGB');