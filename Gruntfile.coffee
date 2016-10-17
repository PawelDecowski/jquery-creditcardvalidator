module.exports = (grunt) ->
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json')
        coffee: {
            compile: {
                options: {
                    "join": true
                }
                files: { "jquery.creditCardValidator.js": ["jquery.creditCardValidator.coffee", "trie.coffee", "range.coffee"] }
            }
        }
        watch: {
            coffee: {
                files: ['**/*.coffee'],
                tasks: ['coffee'],
            }
        }
    })

    grunt.loadNpmTasks('grunt-contrib-watch')
    grunt.loadNpmTasks('grunt-contrib-coffee')
