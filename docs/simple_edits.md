This is a tutorial on how to make small changes to the Earth Engine Public Data Catalog via GitHub. These types of changes might include:

* Correcting typos in text or field names
* Updating a broken URL
* Changing a description of a property or band

Catalog entries are written in [Jsonnet](https://jsonnet.org/) that creates
[SpatioTemporal Asset Catalogs (STAC)](https://stacspec.org/) JSON files. You
do not need to know the details of either to make simple changes. Changes are
managed using GitHub. If you are unfamiliar with these tools, refer to the
following resources for guidance.

* [Getting started with GitHub documentation](https://docs.github.com/en/get-started)
* [About branches - GitHub Docs](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-branches)
* [Creating a pull request - GitHub Docs](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request)

# Initial setup

1. Fork https://github.com/google/earthengine-catalog/fork
1. In your fork, navigate to the file you would like to edit.
1. Turn on continuous integration (CI) checks by going to your fork's "Actions"
  tab and pressing "I understand my workflows, go ahead and enable them."

Before we can accept your pull requests you will need to sign a Contributor
License Agreement (CLA):

* If you are an individual writing original source code and you own the
  intellectual property, then you will need to sign an
  [individual CLA](https://developers.google.com/open-source/cla/individual).
* If you work for a company that wants to allow you to contribute your work,
  then you will need to sign a
  [corporate CLA](https://developers.google.com/open-source/cla/corporate).

You can sign these electronically (just scroll to the bottom). After that,
we will be able to accept your pull requests.

# Make a change

1. Navigate to the file you want to modify. For example
 `catalog/NOAA/NOAA_GOES_16_FDCC.jsonnet`
1. Under the pencil menu on the top right of the file, select "Edit in place" or
  press `e`.
1. Make your change.
1. Press "Commit changes..."
1. Edit the "Extended description" to describe what the change is.
1. Press "Commit changes"
1. Navigate to the top of your fork.
1. Check next to the SHA for your most recent commit. If there is a problem,
  follow the instructions in the next section.
1. Create a pull request (PR).

The Earth Engine team will be notified of your pull request. It may take a few
days before your change is reviewed. The reviewer may ask you to make additional
changes if there are any issues with the edits. Make an additional commit
to fix any review comments.

Once the pull request has been approved, automated tools will take care of
merging your pull request.

# If the checker failed

For checker failures, look at the "Details." The "Checker" section will list
any issues that it sees with the changes. Work through the list of issues from
top to bottom editing the file to resolve the issues. Then commit the changes.

An example issue:

```
Issue('HYCOM/sea_surface_elevation', 'HYCOM/HYCOM_sea_surface_elevation.json', 'eo_extension', 'summaries gsd too small: -123 m', IssueLevel.error)
```

The issue starts with the asset id and then the STAC JSON file that should match
the Jsonnet file if you append "net" to the end of the string. The third
entry is the STAC checker module that reported the error. The fourth entry is
the error message. Here it is saying the Ground Sample Distance is not
valid. Take a look at the specific checker module's doc string to get a
description of the requirements. For example, here you would look at

https://github.com/google/earthengine-catalog/blob/main/checker/node/eo_extension.py

For additional notes about the structure of the file, see the STAC templates
here:

https://github.com/google/earthengine-catalog/tree/main/catalog/TEMPLATE

# Making additional changes

Repeat the process for making a change. If you want to have more than one pull
request in progress, you will need to create separate branches.

When coming back for future edits, make sure to do "Update branch" under
"Sync fork" on your "main" branch to get the latest changes from
https://github.com/google/earthengine-catalog. It is okay to discard local edits
if you have no unmerged pull requests on your main branch.