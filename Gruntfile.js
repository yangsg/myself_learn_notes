module.exports = function(grunt) { //(The "wrapper" function) Every Gruntfile (and gruntplugin) uses this basic format, and all of your Grunt code must be specified inside this function:

  // Project configuration.
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'), // imports the JSON metadata stored in package.json into the grunt config

    uglify: {
      options: {
        banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
      },
      build: {
        src: 'src/<%= pkg.name %>.js',
        dest: 'build/<%= pkg.name %>.min.js'
      }
    }
  });

  // Load the plugin that provides the "uglify" task.
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-less');

  // Default task(s).
  grunt.registerTask('default', ['uglify']);

};
