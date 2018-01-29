module Web::Views::Registrations
  class New
    include Web::View

    def registration_form
      form_for :user, routes.registrations_path do
        label :email
        text_field :email
        label :first_name
        text_field :first_name
        label :last_name
        text_field :last_name
        label :password
        password_field :password
        label :password_confirmation
        password_field :password_confirmation
        submit 'Sign up'
      end
    end
  end
end
