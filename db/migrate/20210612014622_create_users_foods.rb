class CreateUsersFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :users_foods do |t|
      t.belongs_to :user
      t.belongs_to :food
    end
  end
end
