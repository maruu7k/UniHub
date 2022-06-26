class AlterUnihubApplication < ActiveRecord::Migration[6.1]
  def change
    add_reference :unihub_applications, :degree, index: true, foreign_key: true
  end
end
