require 'test_helper'

class VersesControllerTest < ActionController::TestCase
  setup do
    @verse = verses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:verses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create verse" do
    assert_difference('Verse.count') do
      post :create, verse: { book: @verse.book, chapter: @verse.chapter, verse: @verse.verse, verseid: @verse.verseid }
    end

    assert_redirected_to verse_path(assigns(:verse))
  end

  test "should show verse" do
    get :show, id: @verse
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @verse
    assert_response :success
  end

  test "should update verse" do
    patch :update, id: @verse, verse: { book: @verse.book, chapter: @verse.chapter, verse: @verse.verse, verseid: @verse.verseid }
    assert_redirected_to verse_path(assigns(:verse))
  end

  test "should destroy verse" do
    assert_difference('Verse.count', -1) do
      delete :destroy, id: @verse
    end

    assert_redirected_to verses_path
  end
end
