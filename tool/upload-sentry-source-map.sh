export SENTRY_AUTH_TOKEN=$(cat $1 | grep SENTRY_AUTH_TOKEN | cut -d ':' -f 2 | sed 's/\"//g' | sed 's/,//g' | sed 's/ //g');
export SENTRY_ORG=$(cat $1 | grep SENTRY_ORG | cut -d ':' -f 2 | sed 's/\"//g' | sed 's/,//g' | sed 's/ //g');
export SENTRY_PROJECT=$(cat $1 | grep SENTRY_PROJECT | cut -d ':' -f 2 | sed 's/\"//g' | sed 's/,//g' | sed 's/ //g');
flutter packages pub run sentry_dart_plugin