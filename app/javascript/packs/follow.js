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
  if (followVal === 'Unfollow') {
    axios.post(`/accounts/${userId}/unfollows`)
    .then((response) => {
      debugger
      $('.follow').text('Follow')
      $('.info_data_followers').text(response.data.count)
    })
  } else {
    axios.post(`/accounts/${userId}/follows`)
    .then((response) => {
      debugger
      $('.follow').text('Unfollow')
      $('.info_data_followers').text(response.data.count)
    })
  }
  
})