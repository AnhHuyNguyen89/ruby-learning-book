class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @user        = current_user
      @micropost   = current_user.microposts.build
      @microposts  = current_user.microposts
                                .order(created_at: :desc)
                                .paginate(page: params[:page]) # will_paginate
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end
  def help
  end

  def about
  end

  def contact
  end
end
