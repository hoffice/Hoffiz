module ApplicationHelper

  def resource_class
	User
  end
  
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def avatar_for(user, size = 30, title = user.firstname)
    image_tag user.avatar, size: size, title: title, class: 'img-rounded'
  end
end
