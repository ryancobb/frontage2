class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :guid
      t.string :result

      t.timestamps
    end
  end
end
