gulp = require('gulp')
gutil = require('gulp-util');
concat = require('gulp-concat')
coffee = require('gulp-coffee')
rename = require('gulp-rename')
watch = require('gulp-watch')

src = ['jquery.creditCardValidator.coffee', 'trie.coffee', 'range.coffee']

gulp.task('coffee', ->
    gulp.src(src)
        .pipe(concat('jquery.creditCardValidator.concat.coffee'))
        .pipe(coffee()).on('error', gutil.log)
        .pipe(rename('jquery.creditCardValidator.js'))
        .pipe(gulp.dest('.'))
)

gulp.task 'watch', ->
  gulp.watch src, ['coffee']
