module Auth
  class UserCreator
    def initialize(params)
      @first_name = params[:first_name].strip
      @last_name = params[:last_name].strip
      @email = params[:email].strip
      @password = params[:password].strip
      @repository = UserRepository.new
    end

    def call
      @repository.create(new_user)
    end

    private

    def new_user
      User.new(first_name: @first_name, last_name: @last_name, email: @email, password: password)
    end

    def password
      BCrypt::Password.create(@password)
    end
  end
end
