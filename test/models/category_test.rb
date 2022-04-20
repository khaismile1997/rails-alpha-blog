# frozen_string_literal: true

require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  def setup
    @category = Category.new(name: "Musics")
  end

  test "category should be valid" do
    @category = Category.new(name: "Musics")
    assert @category.valid?
  end

  test "name should be present" do
    @category.name = " "
    assert_not @category.valid?
  end

  test "name should be uniq" do
    @category.save
    @category2 = Category.new(name: "Musics")
    assert_not @category2.valid?
  end

  test "name should be too long" do
    @category.name = "a" * 30
    assert_not @category.valid?
  end

  test "name should be too short" do
    @category.name = "a"
    assert_not @category.valid?
  end
end
