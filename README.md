<!--
Copyright 2019 The Google Earth Engine Community Authors

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
-->

# Google Earth Engine Public Data Catalog

This repository contains content submitted and/or maintained by the Earth Engine
user community.

https://github.com/google/earthengine-catalog

# STAC

[SpatioTemporal Asset Catalogs (STAC)](https://stacspec.org/) is a standard for
describing spatial datasets in a catalog.

Earth Engine uses STAC [Jsonnet](https://jsonnet.org) templates to generate the
[Earth Engine Public Data Catalog](https://developers.google.com/earth-engine/datasets/catalog)
and the
[STAC JSON catalog](https://console.cloud.google.com/storage/browser/earthengine-stac).
Using Jsonnet
allows repetitive content to be written one time and used across multiple
collections and items.

You can use externally hosted services to browse the STAC catalog:

- [RadiantEarth STAC Browser](https://radiantearth.github.io/stac-browser/#/external/storage.googleapis.com/earthengine-stac/catalog/catalog.json)
- [STAC Index](https://stacindex.org/catalogs/google-earth-engine)
- [gee.stac.cloud](https://gee.stac.cloud/)

# Contributing

The issue tracker is currently disabled. In the future, we plan to enable the
issue tracker. In the meanwhile, you can add an issue
[here](https://issuetracker.google.com/issues?q=componentid:1161653%2B%20status:open)

# Install / Build instructions

See [install](docs/install.md)

# Non-commercial datasets

[non_commercial_datasets.jsonnet](https://github.com/google/earthengine-catalog/blob/main/non_commercial_datasets.jsonnet)
contains a list of datasets that have
licenses known to exclude commercial use. If you are using Earth Engine
in a commercial capacity, these datasets are not available.

# See also

- https://github.com/google/earthengine-community
- https://github.com/google/earthengine-api
