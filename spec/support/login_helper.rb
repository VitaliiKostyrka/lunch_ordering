def sign_in_as(user)
  visit new_user_session_path
  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  click_button 'Log in'
end

def sign_in(resource_or_scope, resource = nil)
  resource ||= resource_or_scope
  scope = Devise::Mapping.find_scope!(resource_or_scope)
  login_as(resource, scope: scope)
end
