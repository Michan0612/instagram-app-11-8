// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import $ from 'jquery'
import axios from 'axios'

import { csrfToken } from 'rails-ujs'

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()

document.addEventListener('DOMContentLoaded', () => {
  function readURL(input) {
    if (input.files && input.files[0]) {
      const reader = new FileReader();
      axios.post('profile') 

        .then((res) => {

          reader.onload = function (e) {
            $('#avatar_img_prev').attr('src', e.target.result);
            

          }
    
          reader.readAsDataURL(input.files[0]);
          

        } )
    }
  }
 
  $("#post_img").change(function(){
    $('#avatar_img_prev').removeClass('hidden');
    $('.avatar_present_img').remove();
    
    readURL(this);
  });

  $('.avatar_present_img').on('click', () => {
    $('#post_img').click()
  })
});