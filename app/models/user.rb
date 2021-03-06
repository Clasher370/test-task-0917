class User < ApplicationRecord
  include Sidekiq

  scope :shard_id_is_nil, (-> { where('shard_id IS NULL') })

  def self.start_work
    @workers_jid = []
    self.shard_id_is_nil.find_in_batches(batch_size: 1000) do |users|
      @workers_jid << UpdateWorker.perform_async(users.map{|user| user.id})
    end
    'Start!'
  end

  def self.stop_work
    @workers_jid.each do |jid|
      Sidekiq.redis {|c| c.setex("cancelled-#{jid}", 86400, 1) }
    end
    'Stop!'
  end
end
