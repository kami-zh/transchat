class Room

class Language
  @current: 'ja'

  @change: ->
    @changeLanguage()
    @hide()
    @show()

  @show: ->
    $(".#{@current}").show()

  @hide: ->
    $(".#{@other()}").hide()

  @other: ->
    if @current == 'ja' then 'en' else 'ja'

  @changeLanguage: ->
    @current = @other()

$ ->
  Language.hide()

  $('.translate').on 'click', ->
    Language.change()
