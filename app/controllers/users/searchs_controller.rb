class Users::SearchsController < ApplicationController

  def search
    #@search = params[:search]
    @posts = Post.search(params[:search], params[:type])
  end
end
