local id = 'MODIS/006/MYD13A2';
local latest_id = 'MODIS/061/MYD13A2';
local successor_id = 'MODIS/061/MYD13A2';
local subdir = 'MODIS';

local ee_const = import 'earthengine_const.libsonnet';
local ee = import 'earthengine.libsonnet';
local spdx = import 'spdx.libsonnet';

local license = spdx.proprietary;
local template = import 'templates/MODIS_006_MOD13A2.libsonnet';

local basename = std.strReplace(id, '/', '_');
local latest_basename = std.strReplace(latest_id, '/', '_');
local successor_basename = std.strReplace(successor_id, '/', '_');
local base_filename = basename + '.json';
local latest_filename = latest_basename + '.json';
local successor_filename = successor_basename + '.json';

local self_ee_catalog_url = ee_const.ee_catalog_url + basename;
local catalog_subdir_url = ee_const.catalog_base + subdir + '/';
local parent_url = catalog_subdir_url + 'catalog.json';
local self_url = catalog_subdir_url + base_filename;
local latest_url = catalog_subdir_url + latest_filename;
local successor_url = catalog_subdir_url + successor_filename;

{
  stac_version: ee_const.stac_version,
  type: ee_const.stac_type.collection,
  stac_extensions: [
    ee_const.ext_eo,
    ee_const.ext_sci,
    ee_const.ext_ver,
  ],
  id: id,
  title: 'MYD13A2.006 Aqua Vegetation Indices 16-Day Global 1km',
  version: 'V006',
  'gee:type': ee_const.gee_type.image_collection,
  description: |||
    The MYD13A2 V6 product provides two Vegetation Indices (VI): the Normalized
    Difference Vegetation Index (NDVI) and the Enhanced Vegetation Index (EVI).
    The NDVI is referred to as the continuity index to the existing National
    Oceanic and Atmospheric Administration-Advanced Very High Resolution
    Radiometer (NOAA-AVHRR) derived NDVI. The EVI has improved sensitivity over
    high biomass regions.

    The algorithm for this product chooses the best available
    pixel value from all the acquisitions from the 16-day period. The criteria
    used are low clouds, low view angle, and the highest NDVI/EVI value.

    Documentation:

    * [User's Guide](https://lpdaac.usgs.gov/documents/103/MOD13_User_Guide_V6.pdf)

    * [Algorithm Theoretical Basis Document (ATBD)](https://lpdaac.usgs.gov/documents/104/MOD13_ATBD.pdf)

    * [General Documentation](https://ladsweb.modaps.eosdis.nasa.gov/filespec/MODIS/6/MYD13A2)
  |||,
  license: license.id,
  links: ee.standardLinks(subdir, id) + [
    {
      rel: 'cite-as',
      href: 'https://doi.org/10.5067/MODIS/MYD13A2.006',
    },
    ee.link.latest(latest_id, latest_url),
    ee.link.successor(successor_id, successor_url),
  ],
  keywords: [
    '16-day',
    'aqua',
    'evi',
    'global',
    'modis',
    'myd13a2',
    'nasa',
    'ndvi',
    'usgs',
    'vegetation',
  ],
  providers: [
    ee.producer_provider('NASA LP DAAC at the USGS EROS Center', 'https://doi.org/10.5067/MODIS/MYD13A2.006'),
    ee.host_provider(self_ee_catalog_url),
  ],
  'gee:provider_ids': [
    'C194001218-LPDAAC_ECS',
  ],
  extent: ee.extent_global('2002-07-04T00:00:00Z', null),
  summaries: template.summaries {
    platform: [
      'Aqua',
    ],
  },
  'sci:doi': '10.5067/MODIS/MYD13A2.006',
  'sci:citation': |||
    Please visit [LP DAAC 'Citing Our Data' page](https://lpdaac.usgs.gov/citing_our_data)
    for information on citing LP DAAC datasets.
  |||,
  'gee:interval': {
    type: 'cadence',
    unit: 'day',
    interval: 16,
  },
  'gee:terms_of_use': |||
    MODIS data and products acquired through the LP DAAC
    have no restrictions on subsequent use, sale, or redistribution.
  |||,
}
