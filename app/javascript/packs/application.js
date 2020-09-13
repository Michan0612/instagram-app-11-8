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
  const imageUpload = document.getElementById("post_img");

  imageUpload.onchange = function() {
    var file = $('input[type="file"]').prop('files')[0];

    if(!file) {
      window.alert('画像を選択してください')
    } else {
      reader.readAsDataURL(file);
      reader.onload = function (e) {

        $('#avatar_img_prev').attr('src', e.target.result);
        axios.post('/profile', {profile: {avatar: e.target.result}})
        
      .then((res) => {
        window.alert('成功！')

        $('#avatar_img_prev').removeClass('hidden');
        $('.avatar_present_img').remove();
      })

      .catch((e) => {
        window.alert('失敗！')
      })
      }
      
    }
  }

  
  $('.avatar_present_img').on('click', () => {
    $('#post_img').click()
  })
});

