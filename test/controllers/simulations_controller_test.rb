require 'test_helper'

class SimulationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @simulation = simulations(:one)
  end

  test "should get index" do
    get simulations_url
    assert_response :success
  end

  test "should get new" do
    get new_simulation_url
    assert_response :success
  end

  test "should create simulation" do
    assert_difference('Simulation.count') do
      post simulations_url, params: { simulation: { diagnose_id: @simulation.diagnose_id, hierarchie_id: @simulation.hierarchie_id, long_term_id: @simulation.long_term_id, remark_id: @simulation.remark_id, severitie_id: @simulation.severitie_id } }
    end

    assert_redirected_to simulation_url(Simulation.last)
  end

  test "should show simulation" do
    get simulation_url(@simulation)
    assert_response :success
  end

  test "should get edit" do
    get edit_simulation_url(@simulation)
    assert_response :success
  end

  test "should update simulation" do
    patch simulation_url(@simulation), params: { simulation: { diagnose_id: @simulation.diagnose_id, hierarchie_id: @simulation.hierarchie_id, long_term_id: @simulation.long_term_id, remark_id: @simulation.remark_id, severitie_id: @simulation.severitie_id } }
    assert_redirected_to simulation_url(@simulation)
  end

  test "should destroy simulation" do
    assert_difference('Simulation.count', -1) do
      delete simulation_url(@simulation)
    end

    assert_redirected_to simulations_url
  end
end
