local id = 'WWF/HydroSHEDS/03CONDEM';
local subdir = 'WWF';

local ee_const = import 'earthengine_const.libsonnet';
local ee = import 'earthengine.libsonnet';
local spdx = import 'spdx.libsonnet';
local units = import 'units.libsonnet';

local license = spdx.proprietary;

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
  title: 'WWF HydroSHEDS Hydrologically Conditioned DEM, 3 Arc-Seconds',
  'gee:type': ee_const.gee_type.image,
  description: |||
    HydroSHEDS is a mapping product that provides hydrographic
    information for regional and global-scale applications in a consistent
    format. It offers a suite of geo-referenced datasets (vector and
    raster) at various scales, including river networks, watershed
    boundaries, drainage directions, and flow accumulations. HydroSHEDS
    is based on elevation data obtained in 2000 by NASA's Shuttle Radar
    Topography Mission (SRTM).

    This hydrologically conditioned elevation dataset is
    the result of an iterative conditioning and correction process.
    Note that the conditioning process alters the original DEM and
    may render it incorrect for applications other than deriving drainage
    directions. Endorheic basins (inland sinks) are ''seeded'' with
    a no-data cell at their lowest point in order to terminate the
    flow. Full details of the underlying digital elevation model are
    available in the HydroSHEDS website and documentation.

    This dataset is at 3 arc-second resolution. The datasets available
    at 3 arc-seconds are the Void-Filled DEM, Hydrologically Conditioned
    DEM, and Drainage (Flow) Direction.

    There are two areas with incorrect negative values of -100
    close to Vancouver, Canada around (50.16, -123.85) and Australia
    (-14.96, 129.62)
  |||,
  license: license.id,
  links: ee.standardLinks(subdir, id),
  keywords: [
    'conditioned',
    'dem',
    'elevation',
    'geophysical',
    'hydrography',
    'hydrology',
    'hydrosheds',
    'srtm',
    'topography',
    'water',
    'wwf',
  ],
  providers: [
    ee.producer_provider('WWF', 'https://www.hydrosheds.org/'),
    ee.host_provider(self_ee_catalog_url),
  ],
  extent: ee.extent(-180.0, -67.3, 180.0, 60.0,
                    '2000-02-11T00:00:00Z', '2000-02-22T00:00:00Z'),
  summaries: {
    gsd: [
      92.77,
    ],
    'eo:bands': [
      {
        name: 'b1',
        description: 'Elevation',
        'gee:units': units.meters,
      },
    ],
    'gee:visualizations': [
      {
        display_name: 'Elevation',
        lookat: {
          lat: 38.022,
          lon: -121.652,
          zoom: 8,
        },
        image_visualization: {
          band_vis: {
            min: [
              -50.0,
            ],
            max: [
              3000.0,
            ],
            gamma: [
              2.0,
            ],
            bands: [
              'b1',
            ],
          },
        },
      },
    ],
    b1: {
      minimum: -440.0,
      maximum: 8527.0,
      'gee:estimated_range': true,
    },
  },
  'sci:citation': |||
    Lehner, B., Verdin, K., Jarvis, A. (2008): New global hydrography
    derived from spaceborne elevation data. Eos, Transactions, AGU,
    89(10): 93-94.
  |||,
  'gee:terms_of_use': |||
    HydroSHEDS data are free for non-commercial and commercial
    use. For more information, please refer to the [License Agreement](https://www.hydrosheds.org/page/license).
  |||,
}
