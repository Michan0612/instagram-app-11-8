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
  const reader = new FileReader();
  const params = new FormData();
  const imageUpload = document.getElementById("post_img");

  imageUpload.onchange = function() {
    const input = this.files[0];
    params.append('file', input);

    axios.post('profile', params)
      .then((res) => {

        window.alert('成功！')

        reader.onload = function (e) {
          $('#avatar_img_prev').attr('src', e.target.result);
        }
    
        reader.readAsDataURL(input);
        
        $('#avatar_img_prev').removeClass('hidden');
        $('.avatar_present_img').remove();

      })

      .catch((e) => {
        window.alert('失敗！')
      })
  }
  
  $('.avatar_present_img').on('click', () => {
    $('#post_img').click()
  })
});