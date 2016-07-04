#!/bin/sh

# Setup
rm -r artifacts
mkdir -p artifacts

# Build VMs and Controllers
./buildOSXVM.sh
./buildOSXController.sh
./buildLinuxVM.sh

# Build Snapshots
./buildCoreSnapshot.sh
./buildMorphicSnapshot.sh
./buildKitchenSinkSnapshot.sh

# Build Distributions
./buildDMG.sh "Self 2016.1" self-2016.1
./buildZIP.sh self-2016.1

