#!/bin/bash

# Fetch material2 assets from material2-docs-content repo.


# Dir where documentation assets will be copied (overviews, api docs)
docAssetsPath=./src/assets/documents/

# Dir where live-example assets will be copied
exampleAssetsPath=./src/assets/

plunkerExampleAssetsPath=

# Dir where published assets will temporarily copied to (using `git clone`).
tmpAssetClonePath=

# GitHub repo which contains snapshots of the docs content from angular/material2.
docsContentRepo=https://github.com/angular/material2-docs-content

# Dirs for each of api docs, guides, overviews, and live-examples within the
# cloned content repo.
apiPath=${tmpAssetClonePath}/api
guidesPath=${tmpAssetClonePath}/guides
overviewPath=${tmpAssetClonePath}/overview
examplesPath=${tmpAssetClonePath}/examples/
plunkerExamplesPath=

# Create folders into which to copy content and assets.
mkdir -p ${tmpAssetClonePath}
mkdir -p ${exampleAssetsPath} ${docAssetsPath}

# Clone the assets from Github but only fetch the last commit to download less unused data.
git clone ${docsContentRepo} ${tmpAssetClonePath} --depth 1

# Copy files over to their proper place in src/assets
cp -r ${apiPath} ${overviewPath} ${guidesPath} ${docAssetsPath}
cp -r ${examplesPath} ${exampleAssetsPath}
cp -r /tmp/material-assets/plunker/examples/ ./src/assets/plunker/

# Install the live examples component library
mkdir -p ./node_modules/@angular/material-examples
cp -r ${tmpAssetClonePath}/examples-package/* ./node_modules/@angular/material-examples

# Remove temporary directory
rm -rf ${tmpAssetClonePath}
