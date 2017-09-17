doc = """
Usage: #{path.basename(process.argv[0]);} [PATH] [OPTION]
  -h --help       Display this help message.
  -d --debug      Enable debug output
  -c --no-color   Disable color message output.
  -q --quiet      Silence all output.
"""
{docopt} = require 'docopt'

options = docopt(doc, {argv: process.argv[2..]}, help: true, exit: false)