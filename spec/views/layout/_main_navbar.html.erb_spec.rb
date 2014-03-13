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

  it "should render a link to root path when post is landing" do
    post = FactoryGirl.create :post, :navbar
    Post.any_instance.stub(:landing?).and_return(true)

    render

    selector = "a[href='/']"
    rendered.should have_selector(:css, selector)
  end
end
