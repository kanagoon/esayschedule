class DonesController < ApplicationController
  def create
    done = current_user.dones.create(post_id: params[:post_id]) #user_idとtweet_idの二つを代入
    redirect_back(fallback_location: root_path)
  end

  def destroy
    done = Done.find_by(post_id: params[:post_id], user_id: current_user.id)
    done.destroy
    redirect_back(fallback_location: root_path)
  end
end
