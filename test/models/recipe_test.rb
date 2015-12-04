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

  test 'name length should not be too long' do
    @recipe.name = 'a' * 101
    assert_not @recipe.valid?
  end

  test 'name length should not be too short' do
    @recipe.name = 'aaaa'
    assert_not @recipe.valid?
  end

  test 'summary must be present' do
    @recipe.summary = ''
    assert_not @recipe.valid?
  end

  test 'summary cannot be too long' do

  end

  test 'summary cannot be too short' do

  end

  test 'description should be present' do

  end

  test 'description cannot be too long' do

  end

  test 'description cannot be too short' do
  end
end