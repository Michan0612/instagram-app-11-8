import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from 'rails-ujs'
axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()

const handleHeartDisplay = (hasLiked) => {
  if (hasLiked) {
    $('.active_heart').removeClass('hidden')
  } else {
    $('.inactive-heart').removeClass('hidden')
  }
}

document.addEventListener('DOMContentLoaded', () => {
  const dataset = $('#item-show').data()
  const itemId = dataset.postId

  // いいね機能
  axios.get(`/items/${itemId}/like`)
    .then((response) => {
      const hasLiked = response.data.hasLiked
      handleHeartDisplay(hasLiked)
    })
  
   $('.inactive-heart').on('click', () => {
    axios.post(`/items/${itemId}/like`)
      .then((response) => {
        if (response.data.status === 'ok') {
          $('.active_heart').removeClass('hidden')
          $('.inactive-heart').addClass('hidden')
        }
      })
      .catch((e) => {
        window.alert('Error')
        console.log(e)
      })
  })

  $('.active_heart').on('click', () => {
    axios.delete(`/items/${itemId}/like`)
      .then((response) => {
        if (response.data.status === 'ok') {
          $('.active_heart').addClass('hidden')
          $('.inactive-heart').removeClass('hidden')
        }
      })
      .catch((e) => {
        window.alert('Error')
        console.log(e)
      })
  })
});