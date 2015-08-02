class Users::SessionsController < Devise::SessionsController

  def create
    super do |resource|
      login_event = LoginEvent.create(user_id: resource.id)
      puts login_event
    end
  end
end
