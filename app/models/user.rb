class User < ApplicationRecord
  scope :shard_id_is_nil, (-> { where('shard_id IS NULL') })
end
