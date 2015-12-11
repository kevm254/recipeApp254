require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

  def setup
    @chef = Chef.create(chefname: 'bob', email: 'superbob@example.com')
    @recipe = @chef.recipes.build(name: 'chicken parm', summary: 'delicious chicken parmesan', description: 'add oil and chicken and other ingredients and cook until done.')
  end

  test 'recipe should be valid' do
    assert @recipe.valid?
  end

  test 'chef_id should be present' do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
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
    @recipe.summary = 'b' * 151
    assert_not @recipe.valid?
  end

  test 'summary cannot be too short' do
    @recipe.summary = 'b' * 9
    assert_not @recipe.valid?
  end

  test 'description should be present' do
    @recipe.description = ''
    assert_not @recipe.valid?
  end

  test 'description cannot be too long' do
    @recipe.description = 'b' * 501
    assert_not @recipe.valid?
  end

  test 'description cannot be too short' do
    @recipe.description = 'b' * 19
    assert_not @recipe.valid?
  end
end