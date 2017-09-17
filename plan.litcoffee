# Document Driven Design for Habitat Plans
This is a litcoffee file. All the documentation for this plan is inline with the codewritten in markdown. It is
interpreted by coffeescript v2 and compiled into executable javascript which we can ingest by plan-build.

I imagine... that right now you're feeling a bit like Alice... tumbling down the rabit hole?


# My Example Plan
As you can see, a nice thing about coffeescript is that the syntax is very similar to the existing shell plans. It is
fairly easy to understand, easy to write, and yet has the capability of JavaScript under the hood.

    @pkg_name = 'hab-plan-build'
    @pkg_origin = 'cyborg'
    @pkg_version ='1.0.0'
    @pkg_maintainer = 'Ryan Hass <rhass@chef.io>'
    @pkg_license = 'Apache-2.0'

Lists/Arrays are defined in syntax which is similar to Python and Ruby.

    @pkg_bin_dirs = [
        'bin'
    ]

    @pkg_deps = [
        'core/node8'
    ]

Functions are defined defined by an optional list of parameters in parentheses, an arrow, and the function body.
The empty function looks like this: ->

    @example_custom_function = (str = 'Example Default') ->
        console.log str

Functions are called and accept arguments like this:

    @example_custom_function 'Hello World!'

Our existing DSL will change a little; we need to put more thought into how
this will work. The architecture I have in mind exposes the phases as part of
the target language pack (scaffolding) we use to build a plan.

    do_build [
        exec command1: ['array', 'of', 'options'],
        exec command2: ['array', 'of', 'options'],
        # I am not a fan of nested array object personally, but perhaps this syntax is more familiar.
        ['command3', 'option1', 'option2', 'option3']
    ]

Or maybe this:

    @do_install = [
        command1: ['array', 'of', 'options'],
        command2: ['array', 'of', 'options'],
        # I am not a fan of nested array object personally, but perhaps this syntax is more familiar.
        ['command3', 'option1', 'option2', 'option3']
    ]
