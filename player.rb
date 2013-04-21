class Player
  attr_reader :now_playing, :playing

  def initialize
    @now_playing = nil
    @queue = []
  end

  def play_queue
    Thread.new(self) do
      @playing = true
      while @playing
        unless @queue.empty?
          play @queue.shift
        else
          @playing = false
          break
        end
      end
    end
  end

  def << song
    @queue.push song
  end

  def queue
    @queue.clone.freeze
  end

  def start
    unless @playing
      @playing = true
      play_queue
    end
  end

  def stop
    @playing = false
  end

  private

  def play song
    @now_playing = song
    command = %{mpg123 "#{song.path}"}
    command.untaint
    system command
  end
end
