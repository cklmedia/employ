class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :card
      t.string :sex
      t.string :tel
      t.string :email
      t.string :like_group
      t.string :talking

      t.timestamps
    end
  end
end
