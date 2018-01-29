module Auth
  class UserFinder
    def initialize(params)
      @email = params[:email]
      @password = params[:password]
    end

    def call
      found_user if found? && password_correct?
    end

    private

    def found_user
      @found_user ||= UserRepository.new.find_by_email(@email)
    end

    def found?
      !found_user.nil?
    end

    def password_correct?
      BCrypt::Password.new(found_user.password) == @password
    end
  end
end
