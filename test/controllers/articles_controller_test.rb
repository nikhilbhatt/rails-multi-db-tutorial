# frozen_string_literal: true

require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get articles_url

    assert_equal 'index', @controller.action_name
    assert_match 'Articles', @response.body
  end

  test 'should show article' do
    article = articles(:one)
    get article_url(article)
    assert_response :success
  end

  test 'should get new' do
    get new_article_url
    assert_response :success
  end

  test 'should create a article' do
    assert_difference('Article.count', 1) do
      post articles_path, params: { article: { title: 'New article', body: 'New article Body' } }
    end

    assert_response :redirect
  end

  test 'should get edit' do
    article = articles(:one)

    get edit_article_url(article)

    assert_response :success
  end

  test 'should update article' do
    article = articles(:one)

    patch article_url(article), params: { article: { title: 'updated' } }

    assert_redirected_to article_path(article)

    article.reload
    assert_equal 'updated', article.title
  end

  test 'should destroy article' do
    article = articles(:two)
    assert_difference('Article.count', -1) do
      delete article_url(article)
    end
  end
end
