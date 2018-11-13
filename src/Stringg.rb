class String
  def shout?
    self[self.length - 1] == "!"
  end

  def shout
    if !shout?
      self << "!"
    else
      self
    end
  end
end
