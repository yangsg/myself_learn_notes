module.exports = function(grunt) {
  var path = require('path');

  var appWkspDir = __dirname;
  var cssDir = path.join(appWkspDir, 'src/main/webapp/public/css');
  var jsDir = path.join(appWkspDir,  'src/main/webapp/public/js');
  var extDir = path.join(appWkspDir,  'src/main/webapp/static/ext');

  // Project configuration.
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    clean: {
      viewmin_clean: {
        src: ["src/main/webapp/WEB-INF/viewmin/**/*"],
        filter: function(filepath) {
          return grunt.file.exists(filepath) && /^src\/main\/webapp\/WEB-INF\/viewmin/.test(filepath);
        }
      }
    },
    copy: {
      copy_to_viewmin: {
        files: [
          {expand: true,flatten: true, src: ['src/main/webapp/WEB-INF/views/**'], dest: 'src/main/webapp/WEB-INF/viewmin/'},
        ]
      },
      bower_development: {
        files: [
          {src: 'bower_components/jquery/dist/jquery.js', dest:  extDir + '/jquery.min.js'},
          {src: 'bower_components/jquery-validation/dist/jquery.validate.js', dest: extDir + '/jquery.validate.min.js'},
          {src: 'bower_components/uri.js/src/URI.js', dest: extDir + '/URI.min.js'},
        ]
      },
      bower_production: {
        files: [
          {src: 'bower_components/jquery/dist/jquery.min.js', dest: extDir + '/jquery.min.js'},
          {src: 'bower_components/jquery-validation/dist/jquery.validate.min.js', dest: extDir + '/jquery.validate.min.js'},
          {src: 'bower_components/uri.js/src/URI.min.js', dest: extDir + '/URI.min.js'},
        ]
      }
    },
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

  grunt.loadNpmTasks("grunt-contrib-copy");
  grunt.loadNpmTasks("grunt-contrib-less");
  grunt.loadNpmTasks("grunt-contrib-jshint");
  grunt.loadNpmTasks("grunt-contrib-uglify");
  grunt.loadNpmTasks("grunt-contrib-watch");
  grunt.loadNpmTasks("grunt-contrib-clean");
  grunt.loadNpmTasks("grunt-contrib-cssmin");
  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('js-obfuscator');

  // Default task(s).
  //grunt.registerTask('default', ['uglify']);
  grunt.registerTask('default', ['concat', 'uglify']);
  grunt.registerTask('development', ['copy:bower_development']);
  grunt.registerTask('production', ['copy:bower_production']);
};

