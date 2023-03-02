local id = 'NASA/NEX-DCP30';
local subdir = 'NASA';

local ee_const = import 'earthengine_const.libsonnet';
local ee = import 'earthengine.libsonnet';
local spdx = import 'spdx.libsonnet';
local units = import 'units.libsonnet';

local license = spdx.proprietary;

local basename = std.strReplace(id, '/', '_');
local base_filename = basename + '.json';
local self_ee_catalog_url = ee_const.ee_catalog_url + basename;
local catalog_subdir_url = ee_const.catalog_base + subdir + '/';
local parent_url = catalog_subdir_url + 'catalog.json';
local self_url = catalog_subdir_url + base_filename;

{
  stac_version: ee_const.stac_version,
  type: ee_const.stac_type.collection,
  stac_extensions: [
    ee_const.ext_eo,
    ee_const.ext_sci,
    ee_const.ext_ver,
  ],
  id: id,
  title: 'NEX-DCP30: NASA Earth Exchange Downscaled Climate Projections',
  version: '1',
  'gee:type': ee_const.gee_type.image_collection,
  description: |||
    The NASA NEX-DCP30 dataset is comprised of downscaled climate scenarios
    for the conterminous United States that are derived from the General
    Circulation Model (GCM) runs conducted under the Coupled Model
    Intercomparison Project Phase 5 (CMIP5, see [Taylor et al. 2012](https://journals.ametsoc.org/doi/abs/10.1175/BAMS-D-11-00094.1))
    and across the four greenhouse gas emissions scenarios known as
    Representative Concentration Pathways (RCPs, see [Meinshausen et al. 2011](https://rd.springer.com/article/10.1007%2Fs10584-011-0156-z#page-1))
    developed for the Fifth Assessment Report of the Intergovernmental Panel
    on Climate Change (IPCC AR5). The purpose of these datasets is to provide
    a set of high resolution, bias-corrected climate change projections that
    can be used to evaluate climate change impacts on processes that are
    sensitive to finer-scale climate gradients and the effects of local
    topography on climate conditions.

    The dataset contains monthly projections covering the periods from 1950
    through 2005 (Retrospective Run) and from 2006 to 2099 (Prospective Run).
    It includes downscaled projections from 33 models. Not every
    scenario contains projections from every model.

    NEX-DCP30 was prepared by the Climate Analytics Group and NASA Ames
    Research Center using the NASA Earth Exchange, and distributed by the NASA
    Center for Climate Simulation (NCCS).
  |||,
  license: license.id,
  links: ee.standardLinks(subdir, id) + [
  ],
  keywords: [
    'climate',
    'cmip5',
    'csu',
    'geophysical',
    'nasa',
    'nex',
    'precipitation',
    'temperature',
  ],
  providers: [
    ee.producer_provider('NASA / CSU', 'https://cds.nccs.nasa.gov/nex/'),
    ee.host_provider(self_ee_catalog_url),
  ],
  extent: ee.extent(-125.03, 24.07, -66.47, 53.74,
                    '1950-01-01T00:00:00Z', '2099-12-01T00:00:00Z'),
  summaries: {
    'gee:schema': [
      {
        name: 'scenario',
        description: |||
          Name of the CMIP5 scenario. It is one of: 'historical',
          'rcp26', 'rcp45', 'rcp60', 'rcp85', where 'historical' designates
          retrospective model runs (pre-2006).
        |||,
        type: ee_const.var_type.string,
      },
      {
        name: 'model',
        description: |||
          Name of the CMIP5 model. It is one of 'ACCESS1-0',
          'bcc-csm1-1', 'bcc-csm1-1-m', 'BNU-ESM', 'CanESM2', 'CCSM4',
          'CESM1-BGC', 'CESM1-CAM5', 'CMCC-CM', 'CNRM-CM5', 'CSIRO-Mk3-6-0',
          'FGOALS-g2', 'FIO-ESM', 'GFDL-CM3', 'GFDL-ESM2G', 'GFDL-ESM2M',
          'GISS-E2-H-CC', 'GISS-E2-R', 'GISS-E2-R-CC', 'HadGEM2-AO',
          'HadGEM2-CC', 'HadGEM2-ES', 'inmcm4', 'IPSL-CM5A-LR', 'IPSL-CM5A-MR',
          'IPSL-CM5B-LR', 'MIROC5', 'MIROC-ESM', 'MIROC-ESM-CHEM', 'MPI-ESM-LR',
          'MPI-ESM-MR', 'MRI-CGCM3', 'NorESM1-M'.
        |||,
        type: ee_const.var_type.string,
      },
      {
        name: 'metric',
        description: 'Calendar month',
        type: ee_const.var_type.double,
      },
    ],
    gsd: [
      927.67,
    ],
    'eo:bands': [
      {
        name: 'pr',
        description: |||
          Monthly mean of the daily precipitation rate at surface;
          includes both liquid and solid phases from all types of clouds
          (both large-scale and convective)
        |||,
        'gee:units': 'kg/(m^2*s)',
      },
      {
        name: 'tasmin',
        description: 'Monthly mean of the daily-minimum near-surface air temperature',
        'gee:units': units.kelvin,
      },
      {
        name: 'tasmax',
        description: 'Monthly mean of the daily-maximum near-surface air temperature',
        'gee:units': units.kelvin,
      },
    ],
    'gee:visualizations': [
      {
        display_name: 'Minimum Air Temperature',
        lookat: {
          lat: 38.686,
          lon: -115.356,
          zoom: 5,
        },
        image_visualization: {
          band_vis: {
            min: [
              265.0,
            ],
            max: [
              285.0,
            ],
            palette: [
              'blue',
              'purple',
              'cyan',
              'green',
              'yellow',
              'red',
            ],
            bands: [
              'tasmin',
            ],
          },
        },
      },
    ],
    pr: {
      minimum: 0.0,
      maximum: 0.0016,
      'gee:estimated_range': true,
    },
    tasmin: {
      minimum: 235.91,
      maximum: 308.97,
      'gee:estimated_range': true,
    },
    tasmax: {
      minimum: 246.4,
      maximum: 325.53,
      'gee:estimated_range': true,
    },
  },
  'sci:citation': |||
    Thrasher, B., J. Xiong, W. Wang, F. Melton, A. Michaelis and R. Nemani
    (2013), Downscaled Climate Projections Suitable for Resource Management,
    Eos Trans. AGU, 94(37), 321.
    [doi:10.1002/2013EO370002](https://doi.org/10.1002/2013EO370002)
  |||,
  'gee:interval': {
    type: 'cadence',
    unit: 'month',
    interval: 1,
  },
  'gee:terms_of_use': |||
    This dataset is in the public domain and is available
    without restriction on use and distribution. See [NASA's
    Earth Science Data & Information Policy](https://science.nasa.gov/earth-science/earth-science-data/data-information-policy)
    for additional information.
  |||,
}
