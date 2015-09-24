require 'test_helper'

class AnsweringMachinesControllerTest < ActionController::TestCase
  setup do
    @answering_machine = answering_machines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:answering_machines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create answering_machine" do
    assert_difference('AnsweringMachine.count') do
      post :create, answering_machine: { url: @answering_machine.url }
    end

    assert_redirected_to answering_machine_path(assigns(:answering_machine))
  end

  test "should show answering_machine" do
    get :show, id: @answering_machine
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @answering_machine
    assert_response :success
  end

  test "should update answering_machine" do
    patch :update, id: @answering_machine, answering_machine: { url: @answering_machine.url }
    assert_redirected_to answering_machine_path(assigns(:answering_machine))
  end

  test "should destroy answering_machine" do
    assert_difference('AnsweringMachine.count', -1) do
      delete :destroy, id: @answering_machine
    end

    assert_redirected_to answering_machines_path
  end
end
