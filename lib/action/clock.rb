class Clock
  def start
    reset
    @in = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  end

  def stop
    @out = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    (@out - @in) * 1000
  end

  private

  def reset
    @in = nil
    @out = nil
  end
end
