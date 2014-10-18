class Room

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
