class Users::SearchsController < ApplicationController

  def search
    #@search = params[:search]
    @posts = Post.search(params[:search], params[:type])
    @post = Post.all.page(params[:page]).per(10)
  end
end
