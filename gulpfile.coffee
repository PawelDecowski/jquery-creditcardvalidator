"use strict"

fs = require "fs"

gulp    = require "gulp"
coffee  = require "gulp-coffee"
clean   = require "gulp-clean"
include = require "gulp-include"
header  = require "gulp-header"

pkg     = require "./package.json"
config  = require "./config/build.json"

readLicenseFile = fs.readFileSync("LICENSE.md", "UTF-8").split "\n"
license = ""


for line, index in readLicenseFile
    license += if (index < readLicenseFile.length - 1) then " * #{line}\n" else " * #{line}"


# compile all .coffee files inside src/ directory
gulp.task "coffee", ->
    gulp.src ["src/*.coffee", "!src/_*.coffee"]
        .pipe include config.include
        .pipe coffee config.coffeescript
        .pipe header config.creditCardValidator.header.join("\n"), package: pkg, license: license
        .pipe gulp.dest "dist/"


# clean compiled directories
gulp.task "clean", ->
    gulp.src "dist/"
        .pipe clean force: true


# default task
gulp.task "default", ["clean"], ->
    gulp.start "coffee"
