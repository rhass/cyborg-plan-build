@pkg_name = 'hab-plan-build'
@pkg_origin = 'cyborg'
@pkg_version ='1.0.0'
@pkg_maintainer = 'Ryan Hass <rhass@chef.io>'
@pkg_license = 'Apache-2.0'
@pkg_bin_dirs = [
  'bin'
]

@pkg_deps = [
  'core/node8'
]


###
Functions are defined defined by an optional list of parameters in parentheses, an arrow, and the function body.
The empty function looks like this: ->
###
@example_custom_function = (str = 'Example Default') ->
  console.log str
###
# Functions are called and accept arguments like this:
example_custom_function 'Hello World!'

# Our existing DSL will change a little; we need to put more thought into how this will work.
do_build [
  command1: ['array', 'of', 'options'],
  command2: ['array', 'of', 'options'],
# I am not a fan of nested array object personally, perhaps this syntax is more familiar to people though.
  ['command3', 'option1', 'option2', 'option3']
]

# Or maybe this:
do_install = [
  command1: ['array', 'of', 'options'],
  command2: ['array', 'of', 'options'],
# I am not a fan of nested array object personally, perhaps this syntax is more familiar to people though.
  ['command3', 'option1', 'option2', 'option3']
]
###