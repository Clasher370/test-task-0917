class Api::Sync::UsersController < ApplicationController
  def start
    @start = User.start_work
    render json: @start
  end

  def stop
    @stop = User.stop_work
    render json: @stop
  end

  def count
    @count = User.shard_id_is_nil.size
    render json: @count, status: :ok
  end
end
