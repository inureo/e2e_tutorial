include Warden::Test::Helpers

module FeatureHelpers
  def login(user)
    sign_in :user, user
  end
end
