# frozen_string_literal: true

class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  def run_background_job
    MultiDbTestingJob.perform_later(Current.tenant.to_sym)
    redirect_to root_path
  end

  def run_background_job_using_adapter
    MultiDbTestingJobUsingAdapter.set(wait: 2.seconds).perform_later
    redirect_to root_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
