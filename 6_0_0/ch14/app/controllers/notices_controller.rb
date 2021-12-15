class NoticesController < ApplicationController
  def index
    users = User.all.includes(:notices)
    result = users.map do |user|
      {
        user_id: user.id,
        name: user.name,
        notices: user.notices.pluck(:message)
      }
    end

    render json: result and return
  end
end
