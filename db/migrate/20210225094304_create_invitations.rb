class CreateInvitations < ActiveRecord::Migration[6.1]
  def change
    create_table :invitations do |t|
      t.integer :atendee_id
      t.integer :attended_event_id

      t.timestamps
    end
  end
end
