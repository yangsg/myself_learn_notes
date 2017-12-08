module.exports = function(grunt) {
  var path = require('path');

  var appWkspDir = __dirname;
  var cssDir = path.join(appWkspDir, 'src/main/webapp/public/css');
  var jsDir = path.join(appWkspDir,  'src/main/webapp/public/js');

  // Project configuration.
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    less: {
      options: {
        rootpath: '/appweb/images',
      },
      development: {
        options: {
          //paths: ['/home/cnyangsg/workspace/grunt-learn/resource/less/includes'],
          //rootpath: '/appweb/images',
          compress: false,
          plugins: [
            new (require('less-plugin-autoprefix'))({browsers: ["last 2 versions"]})
          ],
        },
        files: [
          {dest: 'public/css/a.css', src: ['resource/less/a01.less', 'resource/less/a02.less']}
        ]
      },
      production: {
        options: {
          //paths: ['/home/cnyangsg/workspace/grunt-learn/resource/less/includes'],
          //rootpath: '/appweb/images',
          compress: true,
          plugins: [
            new (require('less-plugin-autoprefix'))({browsers: ["last 2 versions"]})
          ],
        },
        files: [
          {dest: 'public/css/a.css', src: ['resource/less/a01.less', 'resource/less/a02.less']}
        ]
      }
    },
    concat: {
      options: {
        separator: ';'
      },
      dist: {
        src: ['node_temp/src/a.js', 'node_temp/src/b.js'],
        dest: 'node_temp/build/main.js'
      }
    },
    uglify: {
      "my_target": {
        "files": {
          'node_temp/build/main.min.js': ['node_temp/src/a.js', 'node_temp/src/b.js']
        }
      }

//      options: {
//        banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
//      },
//      build: {
//        src: 'node_temp/build/main.js',
//        dest: 'node_temp/build/a.min.js'
//      }
    },
    jsObfuscate: {
      test: {
        options: {
          concurrency: 2,
          keepLinefeeds: false,
          keepIndentations: false,
          encodeStrings: true,
          encodeNumbers: true,
          moveStrings: true,
          replaceNames: true,
          variableExclusions: [ '^_get_', '^_set_', '^_mtd_' ]
        },
        files: {
          'node_temp/build/dest.js': [
          'node_temp/src/a.js', 'node_temp/src/b.js']
        }
      }
    }
  });

  grunt.loadNpmTasks('grunt-contrib-less');
  // Load the plugin that provides the "uglify" task.
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-concat');
  //grunt.loadNpmTasks('grunt-jscrambler');
  grunt.loadNpmTasks('js-obfuscator');

  // Default task(s).
  //grunt.registerTask('default', ['uglify']);
  grunt.registerTask('default', ['concat', 'uglify']);
};

