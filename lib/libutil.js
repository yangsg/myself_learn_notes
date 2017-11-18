const uuidv4 = require('uuid/v4');

exports.getUuid = getUuid;

function getUuid() {
  return uuidv4();
}


