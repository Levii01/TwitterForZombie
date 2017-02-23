class AddDecompToZombies < ActiveRecord::Migration[5.0]
  def change
    add_column :zombies, :decomp, :string
  end
end
