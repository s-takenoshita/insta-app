import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from 'rails-ujs'
axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()

$('.inactive-heart').on('click', (e) => {
  e.preventDefault();
  const postId = $(e.currentTarget).attr('id') 
  axios.post(`/posts/${postId}/like`)
  .then((response) => {
    if (response.data.status === 'ok') {
      $(`.active-heart.post${postId}`).removeClass('hidden')
      $(`.inactive-heart.post${postId}`).addClass('hidden')
    }
  })
  .catch((e) => {
    window.alert('Error')
    console.log(e)
  })
})

$('.active-heart').on('click', (e) => {
  e.preventDefault();
  const postId = $(e.currentTarget).attr('id') 
  axios.delete(`/posts/${postId}/like`)
  .then((response) => {
    if (response.data.status === 'ok') {
      $(`.active-heart.post${postId}`).addClass('hidden')
      $(`.inactive-heart.post${postId}`).removeClass('hidden')
    }
  })
  .catch((e) => {
    window.alert('Error')
    console.log(e)
  })
})
