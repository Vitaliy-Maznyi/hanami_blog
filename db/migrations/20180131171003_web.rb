Hanami::Model.migration do
  change do
    add_column :users, :admin, FalseClass, null: false, default: false
  end
end
