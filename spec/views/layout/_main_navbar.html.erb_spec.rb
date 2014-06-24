require "spec_helper"

describe "layouts/_main_navbar" do
  it "should render the tabs" do
    posts = (1..3).map do
      FactoryGirl.create(:post, :navbar)
    end

    render

    posts.each do |post|
      rendered.should have_content("#{post.title}")
    end
  end
end
