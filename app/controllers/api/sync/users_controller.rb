class Api::Sync::UsersController < ApplicationController
  def start
    @start = GiveWorker.start_work
    render json: @start
  end

  def stop
    @stop = GiveWorker.stop_work
    render json: @stop
  end

  def count
    @count = User.shard_id_is_nil.size
    render json: @count, status: :ok
  end
end
