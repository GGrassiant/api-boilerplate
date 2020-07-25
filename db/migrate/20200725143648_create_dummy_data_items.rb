# frozen_string_literal: true

# Create Dummy data
class CreateDummyDataItems < ActiveRecord::Migration[6.0]
  def up
    items = [
      { name: 'Item 1', description: 'Description for item 1' },
      { name: 'Item 2', description: 'Description for item 2' },
      { name: 'Item 3', description: 'Description for item 3' }
    ]
    Item.create(items)
  end

  def down
    Item.delete_all
    drop_table :items
  end
end
