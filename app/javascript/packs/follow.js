import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from 'rails-ujs'
axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()

document.addEventListener('DOMContentLoaded', () => {
  const followVal = $('.follow').text()

})

$('.follow').on('click', (e) => {
  const dataset = $('#account_show').data()
  const userId = dataset.userid
  const followVal = $('.follow').text()
  debugger
  if (followVal === 'Unfollow') {
    axios.post(`/accounts/${userId}/follows`)
    .then((response) => {
      $('.follow').text('Follow')
    })
  } else {
    axios.post(`/accounts/${userId}/unfollows`)
    .then((response) => {
      $('.follow').text('Unfollow')
    })
  }
  
})