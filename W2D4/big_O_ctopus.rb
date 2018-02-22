fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish',
  'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

# SLUGGISH OCTOPUS
# QUADRATIC SEARCH n^2
def quadratic_find(fishies)
  fishies.each_with_index do |fish1, idx1|
    biggest_fish = true

    fishies.each_with_index do |fish2, idx2|
      unless idx1 == idx2
        biggest_fish = false if fish1.length < fish2.length
      end
    end
    return fish1 if biggest_fish == true
  end
end

p quadratic_find(fish)

# DOMINANT OCTOPUS
# LOG LINEAR SEARCH n log n
class Array

  def merge_sort(&prc)
    prc ||= proc { |x,y| x <=> y }

    return self if count <= 1

    mid = count / 2
    left_sorted = self.take(mid).merge_sort(&prc)
    right_sorted = self.drop(mid).merge_sort(&prc)

    merge(left_sorted, right_sorted, &prc)
  end

  private

  def merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1, 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end
    merged.concat(left)
    merged.concat(right)
    merged
  end

end

def log_linear_search(fishies)
  prc = Proc.new {|x , y| x.length <=> y.length }
  fishies.merge_sort(&prc).last
end

p log_linear_search(fish)

# CLEVER OCTOPUS
# LINEAR SEARCH

def linear_search(fishies)
  longest = 0
  big_fish = nil
  fishies.each do |fish|
    if fish.length > longest
      longest = fish.length
      big_fish = fish
    end
  end
  big_fish
end

p linear_search(fish)


tiles_array = ["up", "right-up", "right", "right-down", "down",
  "left-down", "left",  "left-up" ]

def slow_dance(direction, tiles)
  tiles.each_with_index { |dir, idx| return idx if dir == direction }
end

tiles_hash = Hash.new
tiles_array.each_with_index { |dir, idx| tiles_hash[dir] = idx }

def fast_dance(direction, hash)
  hash[direction]
end

p slow_dance("up", tiles_array)
p slow_dance("right-down", tiles_array)
p fast_dance("up", tiles_hash)
p fast_dance("right-down", tiles_hash)
