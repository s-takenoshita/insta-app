import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from 'rails-ujs'
axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()

document.addEventListener('DOMContentLoaded', () => {
  const followVal = $('.follow').text()
  debugger
  window.alert(followVal)

})

$('.follow').on('click', (e) => {
  const dataset = $('#account_show').data()
  const userId = dataset.userid
  axios.post(`/accounts/${userId}/follows`)
    .then((response) => {
      debugger
      window.alert(userId)
    })
})