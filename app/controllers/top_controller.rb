class TopController < ApplicationController
  def index
    @topic = Topic.order(date: :desc).first
    @infos = ReleasedInfo.order(date: :desc).limit(5)
    @images = Admin::Image.where(image_target_id: 1)
  end

  def about
  end

  def gallarey
  end

  def link
  end

  def sns
  end

  def for_members
  end

  def for_active_members
  end

  def for_ob_members
  end

  def documents
  end

  def lab
  end
end
