module.exports = function(grunt) { //(The "wrapper" function) Every Gruntfile (and gruntplugin) uses this basic format, and all of your Grunt code must be specified inside this function:

  // Project configuration.
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'), // imports the JSON metadata stored in package.json into the grunt config

    bower: {
      options: {
        //        targetDir: './public/vendor',
        //        copy: true
      },
      install: {
        //just run 'grunt bower:install' and you'll see files from your Bower packages in lib directory
      }
    },

    uglify: {
      options: {
        banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
      },
      build: {
        src: 'src/<%= pkg.name %>.js',
        dest: 'build/<%= pkg.name %>.min.js'
      }
    },

    cachebreaker: {
      dev: {
        options: {
          match: ['all.min.js', 'core.min.css'],
          //position: 'filename'
        },
        files: {
          src: ['./public/index.html']
        }
      }
    }
  });

  // Load the plugin that provides the "uglify" task.
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-less');
  grunt.loadNpmTasks('grunt-cache-breaker'); //https://github.com/shakyshane/grunt-cache-breaker
  grunt.loadNpmTasks('grunt-bower-task');

  // Default task(s).
  grunt.registerTask('default', ['uglify']);

};
