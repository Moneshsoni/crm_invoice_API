class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :book_name
      t.string :book_title
      t.string :author_name

      t.timestamps
    end
  end
end
