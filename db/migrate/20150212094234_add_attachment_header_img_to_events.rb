class AddAttachmentHeaderImgToEvents < ActiveRecord::Migration
  def self.up
    change_table :events do |t|
      t.attachment :header_img
    end
  end

  def self.down
    remove_attachment :events, :header_img
  end
end
