class PostsController < ApplicationController
    def index
        @post = Post.all
    end

    def show
        @post = Post.create(params[:id])
    end
end