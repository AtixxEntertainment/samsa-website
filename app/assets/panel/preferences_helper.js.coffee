class PreferencesHelper
  preferenceChanged: (e) ->
    $(e.target).closest("form").submit()

  constructor: ->
    $(document).on "change", "#preference_value", @preferenceChanged

new PreferencesHelper()
