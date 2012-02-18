#!/bin/sh
# should be run from jsshaper/src

# pick d8 or node
if test -z "$JS" ; then
  JS=d8
fi
if ! which $JS > /dev/null ; then
  JS=node
fi
if ! which $JS > /dev/null ; then
  echo "Can't find d8 or node on the path.  Please set JS to your JavaScript shell."
  exit 1
fi
PIPELINE="plugins/annotater.js plugins/restricter.js plugins/bitwiser.js plugins/asserter.js plugins/logger.js --source"
OUT="../src.shaped"
VM="$JS"
mkdir -p $OUT/plugins $OUT/tests $OUT/plugins/restricter $OUT/plugins/watcher
cp -rf narcissus $OUT/narcissus
cp bootstrap-shaper.sh $OUT/bootstrap-shaper.sh
$VM run-shaper.js -- assert.js $PIPELINE > $OUT/assert.js
$VM run-shaper.js -- comments.js $PIPELINE > $OUT/comments.js
$VM run-shaper.js -- fmt.js $PIPELINE > $OUT/fmt.js
$VM run-shaper.js -- jsecma5.js $PIPELINE > $OUT/jsecma5.js
$VM run-shaper.js -- log.js $PIPELINE > $OUT/log.js
$VM run-shaper.js -- narcissus.js $PIPELINE > $OUT/narcissus.js
$VM run-shaper.js -- ref.js $PIPELINE > $OUT/ref.js
$VM run-shaper.js -- run-restricter.js $PIPELINE > $OUT/run-restricter.js
$VM run-shaper.js -- run-shaper.js $PIPELINE > $OUT/run-shaper.js
$VM run-shaper.js -- shaper.js $PIPELINE > $OUT/shaper.js
$VM run-shaper.js -- tkn.js $PIPELINE > $OUT/tkn.js
$VM run-shaper.js -- plugins/annotater.js $PIPELINE > $OUT/plugins/annotater.js
$VM run-shaper.js -- plugins/annotation-printer.js $PIPELINE > $OUT/plugins/annotation-printer.js
$VM run-shaper.js -- plugins/asserter.js $PIPELINE > $OUT/plugins/asserter.js
$VM run-shaper.js -- plugins/bitwiser.js $PIPELINE > $OUT/plugins/bitwiser.js
$VM run-shaper.js -- plugins/deeval.js $PIPELINE > $OUT/plugins/deeval.js
$VM run-shaper.js -- plugins/logger.js $PIPELINE > $OUT/plugins/logger.js
$VM run-shaper.js -- plugins/restricter.js $PIPELINE > $OUT/plugins/restricter.js
$VM run-shaper.js -- plugins/restricter/restrict-mode.js $PIPELINE > $OUT/plugins/restricter/restrict-mode.js
$VM run-shaper.js -- plugins/stringconverter.js $PIPELINE > $OUT/plugins/stringconverter.js
$VM run-shaper.js -- plugins/watcher/watcher.js $PIPELINE > $OUT/plugins/watcher/watcher.js
$VM run-shaper.js -- plugins/watcher/watch.js $PIPELINE > $OUT/plugins/watcher/watch.js
$VM run-shaper.js -- tests/match.js $PIPELINE > $OUT/tests/match.js
