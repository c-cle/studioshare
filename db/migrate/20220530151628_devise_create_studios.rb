# frozen_string_literal: true

class DeviseCreateStudios < ActiveRecord::Migration[6.1]
  def change
    create_table :studios do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      t.references :user
      t.text :name
      t.text :country
      t.text :city
      t.text :address
      t.integer :longitude
      t.integer :latitude
      t.integer :capacity
      t.boolean :mixing_console
      t.boolean :multitrack_recorder
      t.boolean :microphones
      t.boolean :reference_monitor
      t.boolean :digital_workstation
      t.boolean :music_workstation
      t.boolean :outboard_effect
      t.boolean :isolation_booth
      t.integer :photo_url
      t.timestamp :opening_hour
      t.timestamp :closing_hour

      t.timestamps null: false
    end

    add_index :studios, :email,                unique: true
    add_index :studios, :reset_password_token, unique: true
    # add_index :studios, :confirmation_token,   unique: true
    # add_index :studios, :unlock_token,         unique: true
  end
end