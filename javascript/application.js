// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require jquery
//= require bootstrap-sprockets
// import "@hotwired/turbo-rails"
// import "./controllers"    // only if you’re using Stimulus
import Rails from "@rails/ujs";
Rails.start();
// Make jQuery global (Bootstrap 3 expects window.jQuery)
import $ from "jquery";
window.$ = $;
window.jQuery = $;
import "bootstrap";