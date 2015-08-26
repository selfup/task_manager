require_relative "../test_helper"

class UserSeesAllTasksTest < FeatureTest
  def test_all_tasks_are_displayed
    visit "/"
    assert page.has_content?("Welcome to Task Manager")
  end

  def test_it_can_find_the_greeting_message
      visit "/"
      within("#greeting") do
      assert page.has_content?("Welcome to Task Manager")
    end
  end

  def test_it_can_create_a_task
    visit "/"
    click_link "New Task"
    fill_in "task[title]", with: "Go Home"
    fill_in "task[description]", with: "It has been a long day."
    click_link_or_button "Submit"
    assert_equal "/tasks", current_path
    save_and_open_page
    assert page.has_content?("Go Home")
  end
end
