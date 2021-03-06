module Web::Controllers::Registrations
  class RegistrationParams < Web::Action::Params
    params do
      required(:user).schema do
        required(:email).filled(:str?)
        required(:first_name).filled(:str?)
        required(:last_name).filled(:str?)
        required(:password).filled(:str?, min_size?: 5).confirmation
      end
    end
  end
end
