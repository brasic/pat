class CreateConcerns < ActiveRecord::Migration
  def change
    create_table :concerns do |t|
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end
