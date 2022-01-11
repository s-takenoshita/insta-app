// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from 'rails-ujs'
axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()

document.addEventListener('DOMContentLoaded', () => {
  $('.post_list').on('click', () => {
    axios.get('/')
      .then((response) => {
        console.log(response)
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

})
