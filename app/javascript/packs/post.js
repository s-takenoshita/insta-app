import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from 'rails-ujs'
axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()

const dataset = $('#post_show').data()
const postId = dataset.postid

const appendNewComment = (comment) => {
  $('.comments_container').append(
    `<div class="post_comment"><p>${comment.comment}</p></div>`
  )
}

document.addEventListener('DOMContentLoaded', () => {
  // debugger
  axios.get(`/posts/${postId}/comments`)
  .then((response) => {
    const comments = response.data
    comments.forEach((comment) => {
      appendNewComment(comment)
    })
  })
})

$('.Comments_btn').on('click', (e) => {
  const comment = $('#comment').val()
  axios.post(`/posts/${postId}/comments`, {
    comment: {comment: comment}
  })
    .then((response) => {
      const comment = response.data
      appendNewComment(comment)
      $('#comment').val('')
    })
})

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
