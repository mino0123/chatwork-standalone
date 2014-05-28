matchdep = require 'matchdep'

module.exports = (grunt) ->

  modules = matchdep.filter('*').map((name) -> "./node_modules/#{name}/**/*")

  grunt.config 'nodewebkit',
    options:
      build_dir: './bin'
      win: true
    src: ['./*'].concat(modules)

  grunt.config 'exec',
    launch:
      cmd: () ->
        return 'start ./bin/releases/chatwork-standalone/win/chatwork-standalone/chatwork-standalone.exe'

  grunt.config 'clean', ['./bin']

  grunt.loadNpmTasks 'grunt-node-webkit-builder'
  grunt.loadNpmTasks 'grunt-exec'
  grunt.loadNpmTasks 'grunt-contrib-clean'

  grunt.registerTask 'build', ['nodewebkit']
  grunt.registerTask 'launch', ['exec:launch']
  grunt.registerTask 'default', ['build', 'launch']

