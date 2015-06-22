#!/bin/sh
PWD=$(pwd)
echo 'PWD'
echo "${PWD}"
TARGET_SDK="iphoneos8.3"
TARGET_NAME="Depositphotos"
PROJECT_BUILDDIR="${PWD}/dir/dir0"
PROJECT_DIR="${PWD}"
echo "${PROJECT_DIR}"
PROJECT_NAME="Depositphotos"
BUILD_HISTORY_DIR="${PWD}/dir/dir1"
DEVELOPER_NAME="iPhone Distribution: Depositphotos Inc. (VV53US7R3M)"
APPLICATION_NAME="Depositphotos"
BUILD_CONFIGURATION=${BUILD_CONFIGURATION:-"Debug"}
WORKSPACE="${PWD}/Depositphotos.xcworkspace"
PROVISIONING_PROFILE="DP_AD_HOC"
PROVISIONING_PROFILE_ID="2dfd0152-eb37-45d1-a057-e242790e52f2"
SCHEME="Depositphotos"
echo "!!!!!!! Building project ${PROJECT_NAME} with ${BUILD_CONFIGURATION} configuration"
echo "Opening generated project in Xcode GUI"
open "${WORKSPACE}"
echo "Sleeping 50 seconds to wait for GUI"
sleep 50
echo "Killing GUI process"
killall TERM Xcode
echo "Sleeping 5 seconds after Kill"
sleep 5
echo "Cleaning....."
cd ${PWD}
xcodebuild -workspace "${WORKSPACE}" -sdk "${TARGET_SDK}" -scheme "${SCHEME}" -configuration "${BUILD_CONFIGURATION}" SYMROOT="${PROJECT_BUILDDIR}/${PROJECT_NAME}" clean
xcodebuild -scheme "${SCHEME}" -configuration "${BUILD_CONFIGURATION}" -workspace "${WORKSPACE}" clean archive -sdk "${TARGET_SDK}" -archivePath "${PROJECT_BUILDDIR}/${APPLICATION_NAME}" CODE_SIGN_IDENTITY="${DEVELOPER_NAME}" PROVISIONING_PROFILE="${PROVISIONING_PROFILE_ID}"

xcodebuild -exportArchive -archivePath "${PROJECT_BUILDDIR}/${APPLICATION_NAME}.xcarchive" -exportPath "${PROJECT_BUILDDIR}/${APPLICATION_NAME}.ipa" -exportFormat ipa -exportProvisioningProfile "${PROVISIONING_PROFILE}"
