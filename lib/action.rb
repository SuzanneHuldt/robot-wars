require 'birthpattern.rb'
require 'cell_checker.rb'
class Action
  def initialize
    @birth = BirthPattern.new
  end

  def new_action(t, hash)
    actions = [birth(t,hash), kill(t,hash),'pass']
    actions.sample
  end

  def birth(t,hash)
    @checker = CellChecker.new(extract_field(hash))
    @birth.birth(extract_field(hash),(@checker.get_valid_coordinates))
    #run kill and concatenate
  end

  def kill(t,hash)
    @checker = CellChecker.new(extract_field(hash))

  end

  def extract_field(hash)
    hash.field
  end
end
