require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from 'rails-ujs'
axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()

const handleHeartDisplay = (hasLiked) => {
  if (hasLiked) {
    $('.active_heart_wrap').removeClass('hidden')
  } else {
    $('.inactive_heart_wrap').removeClass('hidden')
  }
}

const appendNewComment = (comment) => {
  $('.comments_container').append(
    `<div class="post_comment"><p>${comment.content}</p></div>`
  )
}

const handleCommentForm = () => {
  $('.show_comment_form').on('click', () => {
    $('.show_comment_form').addClass('hidden')
    $('.comment_text_area').removeClass('hidden')
  })
}

document.addEventListener('DOMContentLoaded', () => {
  const reader = new FileReader();
  const imageUpload = document.getElementById("post_img");


// アバター画像の非同期通信
  imageUpload.onchange = function() {
    var file = $('input[type="file"]').prop('files')[0];

    if(!file) {
      window.alert('画像を選択してください')
    } else {
      reader.readAsDataURL(file);
      reader.onload = function (e) {

        $('#avatar_img_prev').attr('src', e.target.result);
        axios.put('/profile', {profile: {avatar: e.target.result}})
        
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


document.addEventListener('DOMContentLoaded', () => {
  const dataset = $('#item-show').data()
  const itemId = dataset.postId

  axios.get(`/items/${itemId}/comments`)

    .then((response) => {
      const comments = response.data
      comments.forEach((comment) => {
        appendNewComment(comment)
      })
    })

    handleCommentForm()
  
  $('.add_comment_btn').on('click', () => {
    const content = $('#comment_content').val()
    if (!content) {
      window.alert('コメントを入力して下さい')
    } else {
      axios.post(`/items/${itemId}/comments`, {
        comment: {content: content}
      })
        .then((res) => {
          const comment = res.data
          appendNewComment(comment)
          $('#comment_content').val('')
        })
    }
  })

  // いいね機能
  axios.get(`/items/${itemId}/like`)
    .then((response) => {
      const hasLiked = response.data.hasLiked
      handleHeartDisplay(hasLiked)
    })
  
   $('.inactive_heart_wrap').on('click', () => {
    axios.post(`/items/${itemId}/like`)
      .then((response) => {
        if (response.data.status === 'ok') {
          $('.active_heart_wrap').removeClass('hidden')
          $('.inactive_heart_wrap').addClass('hidden')
        }
      })
      .catch((e) => {
        window.alert('Error')
        console.log(e)
      })
  })

  $('.active_heart_wrap').on('click', () => {
    axios.delete(`/items/${itemId}/like`)
      .then((response) => {
        if (response.data.status === 'ok') {
          $('.active_heart_wrap').addClass('hidden')
          $('.inactive_heart_wrap').removeClass('hidden')
        }
      })
      .catch((e) => {
        window.alert('Error')
        console.log(e)
      })
  })
});


