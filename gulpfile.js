require('coffee-script/register');

const requireDir = require('require-dir');
requireDir('./gulp/tasks', { recurse: true });
