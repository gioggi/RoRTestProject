class InitialMigration < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.timestamps
      t.string :name
    end
    create_table :workers do |t|
      t.timestamps
      t.belongs_to :team, :optional => true
      t.integer :role #enum
      t.string :name
      t.string :email
    end
    create_table :badges do |t|
      t.timestamps
      t.datetime :released_at
      t.boolean :active, :default => true, :null => false
      t.belongs_to :worker
    end
    create_table :stamps do |t|
      t.timestamps
      t.datetime :start_at
      t.string :end_at
      t.belongs_to :badge
    end
    create_table :projects do |t|
      t.timestamps
      t.string :name
      t.belongs_to :worker
    end
    create_table :tasks do |t|
      t.timestamps
      t.belongs_to :project
      t.integer :status #enum
      t.string :description
      t.datetime :deadline
    end
    create_table :commits do |t|
      t.timestamps
      t.belongs_to :task
      t.belongs_to :worker
      t.integer :type
      t.string :note
    end
    create_join_table :workers, :tasks do |t|
      t.index :worker_id
      t.index :task_id
    end
  end
end
