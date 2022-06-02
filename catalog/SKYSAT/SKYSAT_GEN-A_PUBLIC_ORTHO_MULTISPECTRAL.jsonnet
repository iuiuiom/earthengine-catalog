local id = 'SKYSAT/GEN-A/PUBLIC/ORTHO/MULTISPECTRAL';
local subdir = 'SKYSAT';

local ee_const = import 'earthengine_const.libsonnet';
local ee = import 'earthengine.libsonnet';
local spdx = import 'spdx.libsonnet';

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
  title: 'Planet SkySat Public Ortho Imagery, Multispectral',
  'gee:type': ee_const.gee_type.image_collection,
  description: |||
    This data from Planet labs Inc. SkySat satellites was collected for
    the experimental \"Skybox for Good Beta\" program in 2015, as well as for
    various crisis response events and a few other projects. The data is
    available in both a 5-band Multispectral/Pan collection, and a Pansharpened
    RGB collection.

    Each image's asset ID contains the acquisition date and time, for
    example, image s01_20150304T080608Z was acquired on March 4, 2015 at
    08:06 Zulu (UTC). For more information, please see the [Planet Imagery
    Product Specifications]
    (https://www.planet.com/products/satellite-imagery/files/Planet_Combined_Imagery_Product_Specs_December2017.pdf)
    and visit the [Planet Imagery and Archive]
    (https://www.planet.com/products/planet-imagery/) site.

    This Multispectral/Pan collection contains images with five 16-bit bands
    shifted up from the original 12-bit data. The B, G, R, and Near-IR bands
    have a resolution of approximately 2m per pixel, while the Pan band is
    approximately 0.8m resolution (closer to 1m for off-nadir images).
  |||,
  license: license.id,
  links: ee.standardLinks(subdir, id),
  keywords: [
    'highres',
    'multispectral',
    'pansharpened',
    'planet',
    'skysat',
  ],
  providers: [
    ee.producer_provider('Planet Labs Inc.', 'https://www.planet.com/'),
    ee.host_provider(self_ee_catalog_url),
  ],
  extent: ee.extent(-180.0, -70.0, 180.0, 53.0,
                    '2014-07-03T00:00:00Z', '2016-12-24T00:00:00Z'),
  summaries: {
    'gee:schema': [
      {
        name: 'catalogID',
        description: 'Unique catalog ID corresponding to a single collection event; same across all three detectors.',
        type: ee_const.var_type.string,
      },
      {
        name: 'collectionEndTime',
        description: 'ISO 8601 collection end time (UTC).',
        type: ee_const.var_type.string,
      },
      {
        name: 'collectionStartTime',
        description: 'ISO 8601 collection start time (UTC).',
        type: ee_const.var_type.string,
      },
      {
        name: 'collectionType',
        description: "'Strip', 'Point', 'Area', or 'Path'.",
        type: ee_const.var_type.string,
      },
      {
        name: 'productType',
        description: "Product type identifying the product level ('Orthorectified Imagery').",
        type: ee_const.var_type.string,
      },
      {
        name: 'productionID',
        description: 'ID of this version of this product, generated by Singer/TileMill.',
        type: ee_const.var_type.string,
      },
      {
        name: 'productionSystemVersion',
        description: 'N/A',
        type: ee_const.var_type.string,
      },
      {
        name: 'resamplingMethod',
        description: 'The method used for interpolated pixel values.',
        type: ee_const.var_type.string,
      },
      {
        name: 'satelliteAzimuthAngleMax',
        description: 'Maximum satellite azimuth angle over the collection (degrees).',
        type: ee_const.var_type.double,
      },
      {
        name: 'satelliteAzimuthAngleMean',
        description: 'Mean satellite azimuth angle over the collection (degrees).',
        type: ee_const.var_type.double,
      },
      {
        name: 'satelliteAzimuthAngleMin',
        description: 'Minimum satellite azimuth angle over the collection (degrees).',
        type: ee_const.var_type.double,
      },
      {
        name: 'satelliteElevationAngleMax',
        description: 'Maximum satellite elevation angle over the collection (degrees).',
        type: ee_const.var_type.double,
      },
      {
        name: 'satelliteElevationAngleMean',
        description: 'Mean satellite elevation angle over the collection (degrees).',
        type: ee_const.var_type.double,
      },
      {
        name: 'satelliteElevationAngleMin',
        description: 'Minimum satellite elevation angle over the collection (degrees).',
        type: ee_const.var_type.double,
      },
      {
        name: 'satelliteName',
        description: 'Unique name identifying the spacecraft.',
        type: ee_const.var_type.string,
      },
      {
        name: 'snaptoAlignmentConfidence',
        description: 'N/A',
        type: ee_const.var_type.double,
      },
      {
        name: 'snaptoReferenceAssets',
        description: 'N/A',
        type: ee_const.var_type.string,
      },
      {
        name: 'solarAzimuthAngle',
        description: 'Solar azimuth angle at the time of collection.',
        type: ee_const.var_type.double,
      },
      {
        name: 'solarElevationAngle',
        description: 'Solar elevation angle at the time of collection.',
        type: ee_const.var_type.double,
      },
      {
        name: 'terrainBlendEpoch',
        description: 'N/A',
        type: ee_const.var_type.double,
      },
    ],
    platform: [
      'SkySat',
    ],
    instruments: [
      'CMOS Frame Camera with Panchromatic and Multispectral halves',
    ],
    'eo:bands': [
      {
        name: 'B',
        description: 'Blue',
        center_wavelength: 0.4825,
        gsd: 2.0,
        'gee:wavelength': '450-515nm',
      },
      {
        name: 'G',
        description: 'Green',
        center_wavelength: 0.555,
        gsd: 2.0,
        'gee:wavelength': '515-595nm',
      },
      {
        name: 'R',
        description: 'Red',
        center_wavelength: 0.65,
        gsd: 2.0,
        'gee:wavelength': '605-695nm',
      },
      {
        name: 'N',
        description: 'Near-IR',
        center_wavelength: 0.82,
        gsd: 2.0,
        'gee:wavelength': '740-900nm',
      },
      {
        name: 'P',
        description: 'Panchromatic',
        center_wavelength: 0.675,
        gsd: 0.8,
        'gee:wavelength': '450-900nm',
      },
    ],
    'gee:visualizations': [
      {
        display_name: 'False Color',
        lookat: {
          lat: 41.6555,
          lon: -70.892,
          zoom: 10,
        },
        image_visualization: {
          band_vis: {
            min: [
              200.0,
            ],
            max: [
              6000.0,
            ],
            bands: [
              'N',
              'G',
              'B',
            ],
          },
        },
      },
    ],
    B: {
      minimum: 878.0,
      maximum: 62089.0,
      'gee:estimated_range': true,
    },
    G: {
      minimum: 341.0,
      maximum: 62007.0,
      'gee:estimated_range': true,
    },
    R: {
      minimum: 107.0,
      maximum: 63393.0,
      'gee:estimated_range': true,
    },
    N: {
      minimum: 16.0,
      maximum: 62874.0,
      'gee:estimated_range': true,
    },
    P: {
      minimum: 16.0,
      maximum: 65520.0,
      'gee:estimated_range': true,
    },
  },
  'sci:citation': '© \\<year\\> Planet Labs Inc.',
  'gee:terms_of_use': |||
    This dataset is made available publicly under the Creative Commons by
    Attribution license(CC-BY-4.0).
  |||,
}
