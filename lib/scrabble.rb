module Scrabble
  # require your gems and classes here
  require 'pathname'

  ROOT_DIR = Pathname(__dir__).parent ## QUESTION: Is Pathname(__dir__) == Pathname.new(__dir__) ?
  require ROOT_DIR.join('lib/scrabble/scrabble')

end
