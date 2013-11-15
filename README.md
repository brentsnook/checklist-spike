Static Sprockets Demo
=====================

## Rack up to dev on dynamically generated assets

    bundle exec rackup

## Build assets into Cordova www directory

    bundle exec rake assets

## Prepare + Run

    cd checklistspike/
    ../node_modules/cordova/bin/cordova prepare
    ../node_modules/cordova/bin/cordova build android
    ../node_modules/cordova/bin/cordova run android
