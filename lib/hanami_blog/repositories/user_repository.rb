class UserRepository < Hanami::Repository
  associations do
    has_many :posts
  end

  def find_by_email(email)
    users.where(email: email).one
  end
end
