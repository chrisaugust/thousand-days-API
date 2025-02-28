class AddColorMappingToImages < ActiveRecord::Migration[7.1]
  def change
    add_column :images, :regionColorMapping, :jsonb
  end
end
