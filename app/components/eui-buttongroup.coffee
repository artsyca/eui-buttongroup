`import Ember from 'ember'`

###*
 * Very basic implementation of a button-group
 * based on a bunch of `eui-buttons`
 *
 * usage:
 *
 *   {{button-group options=yourOptionsObject size="..." action="yourChangeHandler"}}
 *
 * The action will be passed the exact option from `yourOptionsObject`
 *
 * @class ButtonGroupComponent
 * @requires EmberUi
###
ButtonGroupComponent = Ember.Component.extend

  tagName: "eui-buttongroup"

  ###*
   * The size of the button, accepts any option as `eui-button`
   * and will be applied to the entire group."options.[]",
   *
   * @property {String} size
  ###
  size: "small"

  ###*
   * The options to use for the buttons.
   *
   * @property {Array(Mixed)} options
  ###
  options: Ember.required()

  ###*
   * The selected option.
   *
   * @protected
   * @property {Integer} selectedIndex
  ###
  selectedIndex: 0

  ###*
   * The buttons used for drawing the template.
   *
   * @protected
   * @property {Array(Object)} internalButtons
  ###
  internalButtons: Ember.computed("options.[]", ->
    idx = @get("selectedIndex")
    Ember.A(@get("options").map (item, index) =>

      if typeof item is "object"
        result = item

      else

        result =
          label: item

      Ember.Object.createWithMixins result,
        parent: @
        __index: index
        selectedIndex: Ember.computed.oneWay "parent.selectedIndex"
        style: Ember.computed( "selectedIndex", ->
          if @get("__index") == @get("selectedIndex")
            "primary"
          else
            "default"
        )
    )
  )

  actions:

    click: (button) ->
      options = @get("options")
      idx = button.get("__index")
      @set("selectedIndex", idx)
      @sendAction "action", options[idx]

`export default ButtonGroupComponent`
