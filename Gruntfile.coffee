module.exports = (grunt)->
  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")

    coffee:
      product:
        options:
          bare: true
        expand: true
        cwd: 'src'
        src: '*.coffee'
        dest: 'src/js/'
        ext: '.js'

    watch:
      coffee:
        files: ["src/*.coffee"]
        tasks: ["coffee:product", "concat:product", "uglify:product"]

  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-notify"

  grunt.registerTask "default", ["coffee", "stylus"]
  grunt.registerTask "ci", ["coffee"]
