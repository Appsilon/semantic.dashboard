const eslint = require("gulp-eslint");
const gulp = require("gulp");
const plumber = require("gulp-plumber");
const uglify = require("gulp-terser");
const concat = require('gulp-concat');

// Lint scripts
function scriptsLint() {
  return gulp
    .src(["../srcjs"])
    .pipe(plumber())
    .pipe(eslint())
    .pipe(eslint.format())
    .pipe(eslint.failAfterError());
}

// Transpile and concatenate scripts
function scripts() {
  return gulp
    .src(["../srcjs/*.js"])
    .pipe(plumber())
    .pipe(concat("semantic.dashboard.js"))
    .pipe(gulp.dest("../inst/"))
}

// Minify scripts
function scripts_uglify() {
  return gulp
    .src(["../inst/semantic.dashboard.js"])
    .pipe(concat("semantic.dashboard.min.js"))
    .pipe(uglify())
    .pipe(gulp.dest("../inst"))
}

const js = gulp.series(scriptsLint, gulp.series(scripts, scripts_uglify));

exports.js = js;
exports.default = js;
