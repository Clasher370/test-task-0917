class UpdateWorker
  include Sidekiq::Worker

  def perform(array)
    users = User.find(array)
    users.each do |user|
      return if cancelled?
      if user.shard_id.nil?
        random_num = rand(1..10)
        user.update(shard_id: random_num)
      end
    end
  end

  def cancelled?
    Sidekiq.redis {|c| c.exists("cancelled-#{jid}") }
  end
end
