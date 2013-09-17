/*global module:false*/
module.exports = function(grunt) {

  // Project configuration.
  grunt.initConfig({
    // Metadata.
    pkg: grunt.file.readJSON('package.json'),
    banner: '/*! <%= pkg.title || pkg.name %> - v<%= pkg.version %> - ' +
      '<%= grunt.template.today("yyyy-mm-dd") %>\n' +
      '<%= pkg.homepage ? "* " + pkg.homepage + "\\n" : "" %>' +
      '* Copyright (c) <%= grunt.template.today("yyyy") %> <%= pkg.author.name %>;' +
      ' Licensed <%= _.pluck(pkg.licenses, "type").join(", ") %> */\n',
    // Task configuration.
    concat: {
      options: {
        banner: '<%= banner %>',
        stripBanners: true
      },
      dist: {
        src: ['lib/<%= pkg.name %>.js'],
        dest: 'dist/<%= pkg.name %>.js'
      }
    },
    uglify: {
      options: {
        banner: '<%= banner %>'
      },
      dist: {
        src:  ['assets/src/js/vendor/jquery-1.7.2-min.js',
            'assets/dist/js/modernizr-2.6.2.min.js',
            'assets/src/js/vendor/handlebars.js',
            'assets/src/js/vendor/bootstrap.min.js',
            'assets/src/js/vendor/jquery.flexslider.js',
            'assets/src/js/dropnav.js',
            'assets/src/js/vendor/fancybox/jquery.fancybox.js',
            'assets/src/js/master.js'
            ],
        dest: 'assets/dist/js/master-min.js'
      }
    },
    jshint: {
      options: {
        curly: true,
        eqeqeq: true,
        immed: true,
        latedef: true,
        newcap: true,
        noarg: true,
        sub: true,
        undef: true,
        unused: true,
        boss: true,
        eqnull: true,
        browser: true,
        globals: {
          jQuery: true
        }
      },
      gruntfile: {
        src: 'Gruntfile.js'
      },
      lib_test: {
        src: ['lib/**/*.js', 'test/**/*.js']
      }
    },
    qunit: {
      files: ['test/**/*.html']
    },
    watch: {
        less: {
            files: ["assets/src/css/**/*.less"],
            tasks: 'lessc'
        }
    },
   less: {
      development: {
        files: {
          "assets/dist/css/master.css": "assets/src/css/master.less"
        }
      }
    },
    replace: {
      dist: {
        src: ["assets/dist/css/master.css"],
        dest: ["assets/dist/css/master.css"],
        replacements: [
          {from: '/LUD/', to: '/'}
        ]
      }
    }
  });

  // These plugins provide necessary tasks.
  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-nodeunit');
  grunt.loadNpmTasks('grunt-contrib-jshint');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-less');
  grunt.loadNpmTasks('grunt-text-replace');

  // Default task.
  grunt.registerTask('default', 'less min:dist');
  grunt.registerTask('lessc', 'less');
  grunt.registerTask('jsc', 'min:dist');
  grunt.registerTask('repl', 'replace:dist');
  // grunt.registerTask('release', ['less', 'uglify', 'replace:dist']);
  grunt.registerTask('release', ['less', 'replace:dist']);

};
