local id = 'MODIS/061/MOD09A1';
local predecessor_id = 'MODIS/006/MOD09A1';
local subdir = 'MODIS';

local ee_const = import 'earthengine_const.libsonnet';
local ee = import 'earthengine.libsonnet';
local spdx = import 'spdx.libsonnet';

local license = spdx.proprietary;
local template = import 'templates/MODIS_006_MOD09A1.libsonnet';

local basename = std.strReplace(id, '/', '_');
local base_filename = basename + '.json';
local predecessor_basename = std.strReplace(predecessor_id, '/', '_');
local predecessor_filename = predecessor_basename + '.json';

local self_ee_catalog_url = ee_const.ee_catalog_url + basename;
local catalog_subdir_url = ee_const.catalog_base + subdir + '/';
local parent_url = catalog_subdir_url + 'catalog.json';
local self_url = catalog_subdir_url + base_filename;
local predecessor_url = catalog_subdir_url + predecessor_filename;

{
  stac_version: ee_const.stac_version,
  type: ee_const.stac_type.collection,
  stac_extensions: [
    ee_const.ext_eo,
    ee_const.ext_sci,
    ee_const.ext_ver,
  ],
  id: id,
  title: 'MOD09A1.061 Terra Surface Reflectance 8-Day Global 500m',
  version: 'V061',
  'gee:type': ee_const.gee_type.image_collection,
  description: |||
    The MOD09A1 V6.1 product provides an estimate of the surface
    spectral reflectance of Terra MODIS bands 1-7 at 500m resolution
    and corrected for atmospheric conditions such as gasses, aerosols,
    and Rayleigh scattering. Along with the seven reflectance bands
    is a quality layer and four observation bands. For each pixel,
    a value is selected from all the acquisitions within the 8-day
    composite on the basis of high observation coverage, low view angle,
    the absence of clouds or cloud shadow, and aerosol loading.

    Documentation:

    * [User's Guide](https://lpdaac.usgs.gov/documents/306/MOD09_User_Guide_V6.pdf)

    * [Algorithm Theoretical Basis Document (ATBD)](https://lpdaac.usgs.gov/documents/305/MOD09_ATBD.pdf)

    * [General Documentation](https://ladsweb.modaps.eosdis.nasa.gov/filespec/MODIS/6/MOD09A1)
  |||,
  license: license.id,
  links: ee.standardLinks(subdir, id) + [
    {
      rel: 'cite-as',
      href: 'https://doi.org/10.5067/MODIS/MOD09A1.061',
    },
    ee.link.predecessor(predecessor_id, predecessor_url)
  ],
  keywords: [
    '8-day',
    'global',
    'mod09a1',
    'modis',
    'nasa',
    'sr',
    'surface_reflectance',
    'terra',
    'usgs',
  ],
  providers: [
    ee.producer_provider('NASA LP DAAC at the USGS EROS Center', 'https://doi.org/10.5067/MODIS/MOD09A1.061'),
    ee.host_provider(self_ee_catalog_url),
  ],
  'gee:provider_ids': [
    'C1621091377-LPDAAC_ECS',
  ],
  extent: ee.extent_global('2000-02-18T00:00:00Z', null),
  summaries: template.summaries {
    platform: [
      'Terra',
    ],
  },
  'sci:doi': '10.5067/MODIS/MOD09A1.061',
  'sci:citation': |||
    Please visit [LP DAAC 'Citing Our Data' page](https://lpdaac.usgs.gov/citing_our_data)
    for information on citing LP DAAC datasets.
  |||,
  'gee:interval': {
    type: 'cadence',
    unit: 'day',
    interval: 8,
  },
  'gee:extend_end': true,
  'gee:terms_of_use': |||
    MODIS data and products acquired through the LP DAAC
    have no restrictions on subsequent use, sale, or redistribution.
  |||,
}
