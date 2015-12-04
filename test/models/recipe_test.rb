require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

  def setup
    @recipe = Recipe.new(name: 'chicken parm', summary: 'delicious chicken parmesan', description: 'add oil and chicken and other ingredients and cook until done.')
  end

  test 'recipe should be valid' do
    assert @recipe.valid?
  end

  test 'name should be present' do
    @recipe.name = ''
    assert_not  @recipe.valid?
  end
end