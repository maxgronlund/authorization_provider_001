class CreateSystemHosts < ActiveRecord::Migration[5.2]
  def change
    create_table :system_hosts, id: :uuid do |t|
      t.string :name
      t.string :url
      t.boolean :default

      t.timestamps
    end
  end
end
