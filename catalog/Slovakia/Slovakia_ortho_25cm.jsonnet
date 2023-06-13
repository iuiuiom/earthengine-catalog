local id = 'Slovakia/ortho/25cm';
local subdir = 'Slovakia';

local ee_const = import 'earthengine_const.libsonnet';
local ee = import 'earthengine.libsonnet';
local spdx = import 'spdx.libsonnet';
local units = import 'units.libsonnet';

local license = spdx.cc_by_4_0;

local basename = std.strReplace(id, '/', '_');
local base_filename = basename + '.json';
local self_ee_catalog_url = ee_const.ee_catalog_url + basename;

{
  stac_version: ee_const.stac_version,
  type: ee_const.stac_type.collection,
  stac_extensions: [
    ee_const.ext_eo,
    ee_const.ext_sci,
  ],
  id: id,
  title: 'Slovakia orthophotos',
  'gee:type': ee_const.gee_type.image_collection,
  description: |||
    The orthophotomosaic of the Slovak Republic created at a spatial resolution
    of GSD 0.25 m as part of the creation of the first cycle of
    orthophotomosaics in the period 2017-2019 meets the required criteria  for
    positional and radiometric accuracy, which were established in the
    Methodological Guide for the  quality control of orthophotomosaics.
    The orthophotomosaic creates a harmonious, visually uniform  impression,
    the connecting lines of the orthophotomosaic are not visible, and cloud
    cover practically does not appear in the image.

    Orthophotomosaic SR represents a set of color orthoimages combined into one
    image unit without overlaps, gaps and visible brightness and color
    differences along the connecting lines and is made in a set of map sheets
    SMO5 scale 1:5000 with dimensions of 2.5 km x 2 km.

    For more information, please see the [Slovakia orthophotos documentation]
    (https://www.geoportal.sk/files/zbgis/orto/technicka_sprava_ortofotomozaika_sr_2017-2019.pdf)
  |||,
  license: license.id,
  links: ee.standardLinks(subdir, id),
  keywords: [
    'orthophoto',
    'rgb',
    // 'slovakia'
  ],
  providers: [
    ee.producer_provider(
      'Slovakia orthophotomosaic',
      'https://www.geoportal.sk/en/zbgis/orthophotomosaic/'),
    ee.host_provider(self_ee_catalog_url),
  ],
  extent: ee.extent(47.44, 16.5, 49.36, 22.33,
                    '2017-01-01T00:00:00Z', '2020-01-01T00:00:00Z'),
  summaries: {
    gsd: [0.25],
    'eo:bands': [
      {name: 'R', description: 'Red', 'gee:units': units.dn},
      {name: 'G', description: 'Green', 'gee:units': units.dn},
      {name: 'B',  description: 'Blue', 'gee:units': units.dn}
    ],
    R: {minimum: 0, maximum: 255, 'gee:estimated_range': false},
    G: {minimum: 0, maximum: 255, 'gee:estimated_range': false},
    B: {minimum: 0, maximum: 255, 'gee:estimated_range': false},
    'gee:visualizations': [{
      display_name: 'Red, Green and Blue (RGB)',
      lookat: {lon: 48.8, lat: 19.2, zoom: 18},
      image_visualization: {
        band_vis: {min: [0], max: [255], bands: ['R', 'G', 'B']}}}],
  },
  'sci:citation': 'GKU Bratislava, NLC',
  'gee:terms_of_use': |||
    The data is free and free use for any legitimate purpose,
    the only strict obligation being that of acknowledging and mentioning the
    origin and ownership of GKU Bratislava, NLC (Geodetic and Cartographic
    Institute Bratislava and National Forest Centre).

    For more details, see [Terms of use](
       https://www.geoportal.sk/files/zbgis/orto/licencne_podmienky_orto.zip)
  |||
}
