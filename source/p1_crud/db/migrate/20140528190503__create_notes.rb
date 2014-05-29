class CreateNotes < ActiveRecord::Migration
  def change
  	create_table :notes do |t|
  		t.integer :user_id
  		t.string :title
  		t.string :content
  		t.string :theme

  		t.timestamps
  	end
  end
end
