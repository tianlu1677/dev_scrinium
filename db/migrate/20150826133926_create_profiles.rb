class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string  :gender             # 性别
      t.string  :title              #职位，或者教授之类的
      t.string  :name,              null: false  # 真实姓名
      t.string  :mobile             #手机
      t.string  :city               #城市
      t.string  :country            #国家
      t.string  :qq                 #qq
      t.string  :weibo              #微博
      t.string  :wechat             #微信
      t.timestamps null: false
    end
  end
end
