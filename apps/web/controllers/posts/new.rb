module Web::Controllers::Posts
  class New
    include Web::Action

    before :authenticate!

    expose :post

    def call(params)
    end
  end
end
