#!/bin/sh

# Settings
FULLNAME=`cat release.version`
SHORTNAME=${FULLNAME//\//-}
SHORTNAME=${SHORTNAME// /-}
SHORTNAME=${SHORTNAME//(/}
SHORTNAME=${SHORTNAME//)/}

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
./buildDMG.sh "$FULLNAME" "$SHORTNAME"
./buildZIP.sh "$SHORTNAME"
