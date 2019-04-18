require 'test_helper'

class WidgetTest < ActiveSupport::TestCase
  
  test "should not save without name and code" do
    widget = Widget.new
    assert_not widget.valid?
    assert_equal [:user, :name, :code], widget.errors.keys
  end

end
