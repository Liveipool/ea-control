Ea-box = require './ea-box'
Test-execution = require './test-execution'

fs = require 'fs'

boxes = [new Ea-box "测试盒 #name", 'in-service' for name in [1 to 10]]
# console.log "boxesliwwwwwwww: ", JSON.stringify boxes
/*var boxes, res, i, ref, len, name;
res = [];
for (i = 0, len = (ref = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]).length; i < len; ++i) {
  name = ref[i];
  res.push(new EaBox("测试盒 " + name, 'in-service'));
}
boxes = res;*/
fs.write-file-sync __dirname + '/../src/app/data/test/boxes.json', JSON.stringify {boxes}


executions = [new Test-execution for i in [1 to 200]]
fs.write-file-sync __dirname + '/../src/app/data/test/executions.json', JSON.stringify {executions}