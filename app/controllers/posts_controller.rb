class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    def new
      @item = Item.new
    end
  end
end
