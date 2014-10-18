class Room
  @scroll: ->
    $('html, body').animate
      scrollTop: $(document).height()
    , 200

class Language
  @current: 'ja'

  @change: ->
    @changeLanguage()
    @update()

  @update: ->
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

    $.cookie('current', @current)

  @setCurrentFromCache: ->
    @current = $.cookie('current') if $.cookie('current')

$ ->
  $(document).on 'page:change', ->
    Language.setCurrentFromCache()
    Language.update()

  $('.translate').on 'click', ->
    Language.change()
    Room.scroll()

window.Room = Room
