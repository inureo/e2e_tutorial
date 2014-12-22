$ ->
  $('.js-menuToggle').on 'click', (e) ->
    e.preventDefault()
    $('.js-menu').toggleClass('is-visible')