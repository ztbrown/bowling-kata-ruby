class Bowling
  def score(frames)
    (frames
    .scan /./)
    .map.with_index {|b, i| b == "X" ? b + frames[i+1].to_s + frames[i+2].to_s : b}
    .map.with_index {|x, i| x == "/" ? x + frames[i+1].to_s : x}
    .map { |c| (c
      .scan /./)
      .map {|d| d == "X" ? 10 : d}
      .map {|e| e == "/" ? 10 : e.to_i}
      .reduce(:+)
    }.reduce(:+)
  end
end
