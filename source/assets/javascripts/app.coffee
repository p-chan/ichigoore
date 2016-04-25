require 'jquery'
require 'jquery.easing'
require 'velocity'

$ () ->
  console.log 'Hello from Ichigoore'

  $('.hoge').css
    "width": "50px",
    "height": "50px",
    "backgroundColor": "black"

  $('.hoge').on
    'click': ->
      $(this).velocity
        'width': '100px'
        'height': '100px'
      ,
        'duration': 1000
        'easing': 'easeInOutExpo'
