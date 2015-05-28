module Scrabble
  # require your gems and classes here
  require 'pathname'

  ROOT_DIR = Pathname(__dir__).parent ## QUESTION: Is Pathname(__dir__) == Pathname.new(__dir__) ?
  require ROOT_DIR.join('lib/scrabble/scrabble')
  require ROOT_DIR.join('lib/scrabble/player')


  # puts Scrabble.highest_score_from(['michael', 'zy', 'zoog', 'zoo', 'yellow', 'jest'].shuffle)
  # puts Scrabble.highest_score_from(['michael', 'jesters', 'zy', 'zoog', 'zoo', 'yellow', 'jest'])
  # puts Scrabble.highest_score_from(['zy', 'zoog', 'jest', 'home', 'first', 'seven', 'doll', 'all'])
  # puts Scrabble.score('zoog')
  # ARRAY = ['pi', 'goo', 'pi']
  # puts Scrabble.highest_score_from(ARRAY)

end
