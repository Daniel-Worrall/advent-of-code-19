require "./spec_helper"

describe AdventOfCode do
  describe "10.1" do
    describe AdventOfCode::AsteroidField do
      map =
        ".#..#\n" \
        ".....\n" \
        "#####\n" \
        "....#\n" \
        "...##"
      asteroids = AdventOfCode::AsteroidField.from_map(map)

      describe "self.from_map" do
        it "parses" do
          asteroids.field.should eq Set(AdventOfCode::Asteroid).new([{1, 0}, {4, 0}, {0, 2}, {1, 2}, {2, 2}, {3, 2}, {4, 2}, {4, 3}, {3, 4}, {4, 4}])
        end
      end

      describe "line_of_sight?" do
        it "sees asteroids" do
          asteroids.line_of_sight?({1, 0}, {1, 2}).should eq true
        end

        it "can't xray" do
          asteroids.line_of_sight?({1, 0}, {3, 4}).should eq false
        end
      end

      describe "visible_asteroids_num" do
        it "passes example" do
          asteroids.visible_asteroids_num({1, 0}).should eq 7
          asteroids.visible_asteroids_num({4, 0}).should eq 7
          asteroids.visible_asteroids_num({0, 2}).should eq 6
          asteroids.visible_asteroids_num({1, 2}).should eq 7
          asteroids.visible_asteroids_num({2, 2}).should eq 7
          asteroids.visible_asteroids_num({3, 2}).should eq 7
          asteroids.visible_asteroids_num({4, 2}).should eq 5
          asteroids.visible_asteroids_num({4, 3}).should eq 7
          asteroids.visible_asteroids_num({3, 4}).should eq 8
          asteroids.visible_asteroids_num({4, 4}).should eq 7
        end
      end
    end
  end
end
