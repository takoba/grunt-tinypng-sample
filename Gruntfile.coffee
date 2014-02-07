'use strict'

exclude = [
  '!**/.svn/'
]

module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    tinypng:
      options:
        apiKey: "YOUR_API_KEY"
        summarize: true
        showProgress: true
        stopOnImageError: true
      compress:
        expand: true
        cwd: 'src/'
        src: [
          '**/*.png'
          '!hoge.png'
        ].concat exclude
        dest: 'src/'
        #rename: (dest, src) ->
        #  path = require('path')
        #  parts = src.split("/")
        #  fname = path.basename(parts.pop(), ".png")
        #  path.join dest, fname + ".png"

  require('load-grunt-tasks') grunt
  grunt.registerTask 'default', ['tinypng:compress']
