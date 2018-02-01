Hanami::Model.migration do
  change do
    create_table :comments do
      primary_key :id
      column :body, 'text', null: false
      foreign_key :user_id, :users, on_delete: :cascade, null: false
      foreign_key :post_id, :posts, on_delete: :cascade, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
