require 'test_helper'

class CreateArticleTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(username: "Ali", email: "ali@example.com", password: "password", admin: false)
  end

  test "should be able to create article" do
    sign_in_as(@user, "password")
    get new_article_path
    assert_template 'articles/new'
    assert_difference 'Article.count' do
      post_via_redirect articles_path, article: {title: "This is the title", desciption: "This is the description of the article"}
    end
    assert_template 'articles/show'
  end

  test "invalid creation of article" do
    sign_in_as(@user, "password")
    get new_article_path
    assert_template 'articles/new'
    assert_no_difference 'Article.count' do
      post_via_redirect articles_path, article: {title: " ", desciption: "This is the description of the article"}
    end
    assert_template 'articles/new'
  end

end
