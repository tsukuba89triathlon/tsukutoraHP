# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
CalcConvDist ->
  swim = parseFloast(document.lab_practice_log.lab_practice_log[swim].value)
  bike = parseFloast(document.lab_practice_log.lab_practice_log[bike].value)
  run = parseFloast(document.lab_practice_log.lab_practice_log[run].value)
  document.lab_practice_log.lab_practice_log[conversion_distance].value = swim * 2 + bike * 0.4 + run
