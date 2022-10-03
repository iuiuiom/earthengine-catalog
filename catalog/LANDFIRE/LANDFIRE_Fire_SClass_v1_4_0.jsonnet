local id = 'LANDFIRE/Fire/SClass/v1_4_0';
local subdir = 'LANDFIRE';

local ee_const = import 'earthengine_const.libsonnet';
local ee = import 'earthengine.libsonnet';
local spdx = import 'spdx.libsonnet';

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
    ee_const.ext_ver,
  ],
  id: id,
  title: 'LANDFIRE SClass (Succession Classes) v1.4.0',
  version: '1.4.0',
  'gee:type': ee_const.gee_type.image_collection,
  description: |||
    LANDFIRE (LF), Landscape Fire and Resource Management Planning Tools, is a
    shared program between the wildland fire management programs of the U.S.
    Department of Agriculture's Forest Service, U.S. Department of the Interior's
    Geological Survey, and The Nature Conservancy.

    Landfire (LF) Historical fire regimes, intervals, and vegetation conditions
    are mapped using the Vegetation Dynamics Development Tool (VDDT).
    These data support fire and landscape management planning goals in
    the National Cohesive Wildland Fire Management Strategy, the Federal Wildland
    Fire Management Policy, and the Healthy Forests Restoration Act.

    The Succession Classes (SClass) layer characterizes current vegetation conditions with respect to the vegetation species composition, cover, and height ranges of successional states that occur within each biophysical setting.
    SClass can also represent uncharacteristic vegetation components, such as exotic species, that are not found within the compositional or structural variability of successional states defined for a biophysical setting.
    Succession classes do not directly quantify fuel characteristics of the current vegetation, but rather represent vegetative states with unique succession or disturbance-related dynamics, such as structural development or fire frequency.
    To produce SClass, the historical reference conditions of these successional states were derived from the vegetation and disturbance dynamics model VDDT (Vegetation Dynamics Development Tool) (LF_1.0.0 CONUS only used the vegetation and disturbance dynamics model LANDSUM).
    The area contained in succession classes is compared to the simulated historical reference conditions to calculate measurements of vegetation departure, such as fire regime condition class.
    SClass is used in landscape assessments.

    The LANDIFRE Fire datasets include:

    * Fire Regime Groups (FRG) is intended to characterize presumed historical
      fire regimes within landscapes based on interactions between vegetation
      dynamics, fire spread, fire effects, and spatial context
    * Mean Fire Return Interval (MFRI) quantifies the average period between
      fires under the presumed historical fire regime
    * Percent of Low-severity Fire (PLS) image quantifies the amount of
      low-severity fires relative to mixed- and replacement-severity fires
      under the presumed historical fire regime and is defined as less than 25
      percent average top-kill within a typical fire perimeter for a given
      vegetation type
    * Percent of Mixed-severity Fire (PMS) layer quantifies the amount of
      mixed-severity fires relative to low- and replacement-severity fires under
      the presumed historical fire regime, and is defined as between 25 and 75
      percent average top-kill within a typical fire perimeter for a given
      vegetation type
    * Percent of Replacement-severity Fire (PRS) layer quantifies the amount of
      replacement-severity fires relative to low- and mixed-severity fires under
      the presumed historical fire regime, and is defined as greater than 75
      percent average top-kill within a typical fire perimeter for a given
      vegetation type
    * Succession Classes (SClass) layer characterizes current vegetation conditions
      with respect to the vegetation species composition, cover, and height ranges
      of successional states that occur within each biophysical setting
    * Vegetation Condition Class (VCC) represents a simple categorization of the
      associated Vegetation Departure (VDEP) layer and indicates the general level
      to which current vegetation is different from the simulated historical
      vegetation reference conditions
    * Vegetation Departure (VDep) indicates how different current vegetation on a
      landscape is from estimated historical conditions. VDep is based on changes
      to species composition, structural stage, and canopy closure.
  |||,
  license: license.id,
  links: ee.standardLinks(subdir, id),
  keywords: [
    'doi',
    'fire',
    'landfire',
    'nature_conservancy',
    'usda',
    'usgs',
    'vegetation',
    'wildfire',
  ],
  providers: [
    ee.producer_provider("U.S. Department of Agriculture's (USDA), U.S. Forest Service (USFS), U.S.
Department of the Interior's Geological Survey (USGS), and The Nature Conservancy.", 'https://landfire.gov/'),
    ee.host_provider(self_ee_catalog_url),
  ],
  extent: ee.extent(-175.1, 17.52, -63.66, 71.48,
                    '2014-09-01T00:00:00Z', '2014-09-01T00:00:00Z'),
  summaries: {
    'gee:properties': [
      {
        name: 'SClass_classes',
        description: 'Class values of the  Succession Classes.',
        type: ee_const.var_type.double,
      },
      {
        name: 'SClass_names',
        description: 'Descriptive names of Succession Classes.',
        type: ee_const.var_type.string,
      },
    ],
    gsd: [
      30.0,
    ],
    'eo:bands': [
      {
        name: 'SClass',
        description: 'Succession Classes',
        'gee:classes': [
          {
            value: 1,
            color: 'a16333',
            description: 'Succession Class A',
          },
          {
            value: 2,
            color: '38a800',
            description: 'Succession Class B',
          },
          {
            value: 3,
            color: 'c9deab',
            description: 'Succession Class C',
          },
          {
            value: 4,
            color: 'fff8a6',
            description: 'Succession Class D',
          },
          {
            value: 5,
            color: '004a4d',
            description: 'Succession Class E',
          },
          {
            value: 6,
            color: 'a00000',
            description: 'Uncharacteristic Native Vegetation Cover / Structure / Composition',
          },
          {
            value: 7,
            color: 'ff0000',
            description: 'Uncharacteristic Exotic Vegetation',
          },
          {
            value: 111,
            color: '0000ff',
            description: 'Water',
          },
          {
            value: 112,
            color: 'c8ffff',
            description: 'Snow / Ice',
          },
          {
            value: 120,
            color: '8400a8',
            description: 'Non-burnable Urban',
          },
          {
            value: 121,
            color: 'e8beff',
            description: 'Burnable Urban',
          },
          {
            value: 131,
            color: '4e4e4e',
            description: 'Barren',
          },
          {
            value: 132,
            color: 'b2b2b2',
            description: 'Sparsely Vegetated',
          },
          {
            value: 180,
            color: 'ffff00',
            description: 'Non-burnable Agriculture',
          },
          {
            value: 181,
            color: 'ffaa00',
            description: 'Burnable Agriculture',
          },
        ],
      },
    ],
    'gee:visualizations': [
      {
        display_name: 'SClass',
        lookat: {
          lat: 40.699,
          lon: -121.671,
          zoom: 5,
        },
        image_visualization: {
          band_vis: {
            bands: [
              'SClass',
            ],
          },
        },
      },
    ],
  },
  'sci:citation': |||
    The suggested way to cite LANDFIRE products is specific to each product,
    so the model for citation is provided, with an example for a particular product.
    Producer. Year released. Product xxxxx:

    - Individual model name.
    - BpS Models and Descriptions, Online. LANDFIRE. Washington, DC. U.S. Department of
      Agriculture, Forest Service
    - U.S. Department of the Interior; U.S. Geological Survey; Arlington, VA
    - The Nature Conservancy (Producers). Available- URL. Access date.

    Example Citation: LANDFIRE Biophysical Settings. 2018. Biophysical setting 14420:
    South Texas sand sheet grassland. In: LANDFIRE Biophysical Setting Model: Map zone 36,
    [Online]. In: BpS Models and Descriptions. In: LANDFIRE. Washington, DC:
    U.S. Department of Agriculture, Forest Service; U.S. Department of the Interior;
    U.S. Geological Survey; Arlington, VA: The Nature Conservancy (Producers).
    Available: [https://www.landfire.gov/national_veg_models_op2.php](https://www.landfire.gov/national_veg_models_op2.php) [2018, June 27].
    Additional guidance on citation of LANDFIRE products can be found
    [here](https://www.landfire.gov/landfire_citation.php)
  |||,
  'gee:terms_of_use': |||
    LANDFIRE data are public domain data with no use restrictions, though if modifications
    or derivatives of the product(s) are created, then please add some descriptive modifier
    to the data set to avoid confusion.
  |||,
  'gee:user_uploaded': true,
}
