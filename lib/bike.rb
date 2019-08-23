class Bike

attr_reader :broken

  def report_broken
    @broken = true
  end

  def report_repaired
    @broken = false
  end

  def broken?
    @broken
  end



end
