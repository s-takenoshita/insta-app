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
