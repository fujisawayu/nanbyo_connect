require "application_system_test_case"

class SimulationsTest < ApplicationSystemTestCase
  setup do
    @simulation = simulations(:one)
  end

  test "visiting the index" do
    visit simulations_url
    assert_selector "h1", text: "Simulations"
  end

  test "creating a Simulation" do
    visit simulations_url
    click_on "New Simulation"

    fill_in "Diagnose", with: @simulation.diagnose_id
    fill_in "Hierarchie", with: @simulation.hierarchie_id
    fill_in "Long term", with: @simulation.long_term_id
    fill_in "Remark", with: @simulation.remark_id
    fill_in "Severitie", with: @simulation.severitie_id
    click_on "Create Simulation"

    assert_text "Simulation was successfully created"
    click_on "Back"
  end

  test "updating a Simulation" do
    visit simulations_url
    click_on "Edit", match: :first

    fill_in "Diagnose", with: @simulation.diagnose_id
    fill_in "Hierarchie", with: @simulation.hierarchie_id
    fill_in "Long term", with: @simulation.long_term_id
    fill_in "Remark", with: @simulation.remark_id
    fill_in "Severitie", with: @simulation.severitie_id
    click_on "Update Simulation"

    assert_text "Simulation was successfully updated"
    click_on "Back"
  end

  test "destroying a Simulation" do
    visit simulations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Simulation was successfully destroyed"
  end
end
