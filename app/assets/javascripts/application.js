// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require jquery
//= require bootstrap-sprockets

$(document).on("turbolinks:load", function(){
  function readURL(input) {
    // ファイルが1つ読み込まれた場合
    if(input.files && input.files[0]){
      var reader = new FileReader();
      reader.onload = function (e) {
        // class="imag_prev"にsrc属性を追加
        $('.profile_image').attr('src', e.target.result);
      }
      // ファイルの中身を読み込む
      reader.readAsDataURL(input.files[0]);
    }
  }
  // ユーザーのprofile_imageの中身を変換
  $("#user_profile_image").change(function(){
    readURL(this);
  });
});