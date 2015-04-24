`import { test, moduleForComponent } from 'ember-qunit'`

moduleForComponent 'eui-buttongroup', {
  # specify the other units that are required for this test
  needs: [
    'component:eui-button',
    'template:components/eui-button'
  ],

  beforeEach: ->

}

test 'it renders with string options', (assert) ->

  assert.expect 2

  # creates the component instance
  component = @subject
    options: ["one", "two", "three"]

  assert.equal component._state, 'preRender'

  # renders the component to the page
  @render()
  assert.equal component._state, 'inDOM'

test 'it renders with object options', (assert) ->

  assert.expect 2

  # creates the component instance
  component = @subject
    options: [
      {label: "one"}
      {label: "two"}
      {label: "three"}
    ]

  assert.equal component._state, 'preRender'

  # renders the component to the page
  @render()
  assert.equal component._state, 'inDOM'

test 'it calls the default `action` when clicked', (assert) ->

  assert.expect 2

  # creates the component instance
  component = @subject
    options: [
      {label: "one"}
      {label: "two"}
      {label: "three"}
    ]

    sendAction: (name, option) ->
      assert.equal name, "action", "default action is called on click"
      assert.deepEqual option, @get("options.1"), "the target object is passed in"

  @render()

  component.$("eui-button").eq(1).click()

test 'highlight state changes when clicked', (assert) ->

  assert.expect 6

  # creates the component instance
  component = @subject
    options: [
      {label: "one"}
      {label: "two"}
      {label: "three"}
    ]

  @render()

  for i in [1,2,0]
    target = component.$("eui-button").eq(i)
    target.click()
    assert.equal (button = component.$("eui-button[class$='primary']")).length, 1, "only one button should be selected"
    assert.ok button.is(target), "the selected button should be the clicked button"


test 'class attribute is passed in', (assert) ->

  assert.expect 3

  # creates the component instance
  component = @subject
    options: [
      {label: "one", class:"first"}
      {label: "two", class:"second"}
      {label: "three", class:"third"}
    ]

  @render()

  assert.equal component.$("eui-button.first").length, 1, ".first is passed to the button"
  assert.equal component.$("eui-button.second").length, 1, ".second is passed to the button"
  assert.equal component.$("eui-button.third").length, 1, ".third is passed to the button"
