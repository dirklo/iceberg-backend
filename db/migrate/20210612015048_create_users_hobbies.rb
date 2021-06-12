class CreateUsersHobbies < ActiveRecord::Migration[6.1]
  def change
    create_table :users_hobbies do |t|
      t.belongs_to :user
      t.belongs_to :hobby
    end
  end
end
