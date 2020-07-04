// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

// Core libraries
require("turbolinks").start()
require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

// jQuery (as a read only property so browser extensions can't clobber it)
const jQuery = require("jquery")
global.$ = global.jQuery = jQuery;
window.$ = window.jQuery = jQuery;


// App libraries
require("vendors/techie/bootstrap/js/bootstrap.bundle.min")
require("vendors/techie/jquery.easing/jquery.easing.min")
require("vendors/techie/waypoints/jquery.waypoints.min")
require("vendors/techie/counterup/counterup.min")
require("vendors/techie/owl.carousel/owl.carousel.min")
require("vendors/techie/isotope-layout/isotope.pkgd.min")
require("vendors/techie/venobox/venobox.min")
require("vendors/techie/aos/aos")
require("vendors/techie/main")

// Application
require("app").start()
