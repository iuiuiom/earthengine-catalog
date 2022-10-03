local id = 'MODIS/006/MOD14A2';
local latest_id = 'MODIS/061/MOD14A2';
local successor_id = 'MODIS/061/MOD14A2';
local subdir = 'MODIS';

local ee_const = import 'earthengine_const.libsonnet';
local ee = import 'earthengine.libsonnet';
local spdx = import 'spdx.libsonnet';

local license = spdx.proprietary;
local template = import 'templates/MODIS_006_MOD14A2.libsonnet';

local basename = std.strReplace(id, '/', '_');
local latest_basename = std.strReplace(latest_id, '/', '_');
local successor_basename = std.strReplace(successor_id, '/', '_');
local base_filename = basename + '.json';
local latest_filename = latest_basename + '.json';
local successor_filename = successor_basename + '.json';

local self_ee_catalog_url = ee_const.ee_catalog_url + basename;
local catalog_subdir_url = ee_const.catalog_base + subdir + '/';
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
  title: 'MOD14A2.006: Terra Thermal Anomalies & Fire 8-Day Global 1km [deprecated]',
  deprecated: true,
  version: 'V006',
  'gee:type': ee_const.gee_type.image_collection,
  description: |||
    The MOD14A2 V6 dataset provides 8-day fire mask composites
    at 1km resolution. It contains the maximum value of the individual
    pixel classes over the compositing period. Along with the fire
    mask, an associated quality information layer is also provided.

    Documentation:

    * [User's Guide](https://lpdaac.usgs.gov/documents/88/MOD14_User_Guide_v6.pdf)

    * [Algorithm Theoretical Basis Document (ATBD)](https://lpdaac.usgs.gov/documents/87/MOD14_ATBD.pdf)

    * [General Documentation](https://ladsweb.modaps.eosdis.nasa.gov/filespec/MODIS/6/MOD14A2)
  |||,
  license: license.id,
  links: ee.standardLinks(subdir, id) + [
    {
      rel: ee_const.rel.cite_as,
      href: 'https://doi.org/10.5067/MODIS/MOD14A2.006',
    },
    ee.link.latest(latest_id, latest_url),
    ee.link.successor(successor_id, successor_url),
  ],
  keywords: [
    '8_day',
    'fire',
    'global',
    'mod14a2',
    'modis',
    'nasa',
    'terra',
    'usgs',
  ],
  providers: [
    ee.producer_provider('NASA LP DAAC at the USGS EROS Center', 'https://doi.org/10.5067/MODIS/MOD14A2.006'),
    ee.host_provider(self_ee_catalog_url),
  ],
  'gee:provider_ids': [
    'C194001243-LPDAAC_ECS',
  ],
  extent: ee.extent_global('2000-02-18T00:00:00Z', null),
  summaries: template.summaries {
    platform: [
      'Terra',
    ],
  },
  'sci:doi': '10.5067/MODIS/MOD14A2.006',
  'sci:citation': |||
    Please visit [LP DAAC 'Citing Our Data' page](https://lpdaac.usgs.gov/citing_our_data)
    for information on citing LP DAAC datasets.
  |||,
  'gee:interval': {
    type: 'cadence',
    unit: 'day',
    interval: 8,
  },
  'gee:terms_of_use': |||
    MODIS data and products acquired through the LP DAAC
    have no restrictions on subsequent use, sale, or redistribution.
  |||,
}
