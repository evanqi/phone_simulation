require 'test_helper'

class VoicemailsControllerTest < ActionController::TestCase
  setup do
    @voicemail = voicemails(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:voicemails)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create voicemail" do
    assert_difference('Voicemail.count') do
      post :create, voicemail: { audio: @voicemail.audio, connection_id: @voicemail.connection_id, created_at: @voicemail.created_at, has_been_listened: @voicemail.has_been_listened }
    end

    assert_redirected_to voicemail_path(assigns(:voicemail))
  end

  test "should show voicemail" do
    get :show, id: @voicemail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @voicemail
    assert_response :success
  end

  test "should update voicemail" do
    patch :update, id: @voicemail, voicemail: { audio: @voicemail.audio, connection_id: @voicemail.connection_id, created_at: @voicemail.created_at, has_been_listened: @voicemail.has_been_listened }
    assert_redirected_to voicemail_path(assigns(:voicemail))
  end

  test "should destroy voicemail" do
    assert_difference('Voicemail.count', -1) do
      delete :destroy, id: @voicemail
    end

    assert_redirected_to voicemails_path
  end
end
