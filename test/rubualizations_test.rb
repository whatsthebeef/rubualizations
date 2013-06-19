require "test/unit"
require "./lib/rubualizations"

class RubualizationsTest < Test::Unit::TestCase

   def setup 
      @mock = Object.new
      @mock.extend(Rubualizations::Tableable)
      @mock.cols_def = {
         "dateplaced" => {id:"A", label: "Date Placed", type: "datetime"},
         "profit" => {id:"B", label: "Profit", type: "number"}
      }
   end

   def test_tabelize_hashes 
      assert_equal @mock.tablize_hashes({}, {cols:"dateplaced,profit"}).to_s,
         '{:cols=>[{:id=>"A", :label=>"Date Placed", :type=>"datetime"}, {:id=>"B", :label=>"Profit", :type=>"number"}], :rows=>[]}'
   end

   def test_discrete_with_cols
      assert_equal @mock.discrete_with_cols({}, ["dateplaced", "profit"]).to_s,
         '{:cols=>[{:id=>"A", :label=>"Date Placed", :type=>"datetime"}, {:id=>"B", :label=>"Profit", :type=>"number"}], :rows=>[]}'
   end

   def test_continuous_with_cols
      assert_equal @mock.continuous_with_cols({}, ["dateplaced", "profit"]).to_s,
         '{:cols=>[{:id=>"A", :label=>"Date Placed", :type=>"datetime"}, {:id=>"B", :label=>"Profit", :type=>"number"}], :rows=>[]}'
   end

   def test_format_datetime_mmyy
      assert_equal @mock.format_datetime_mmyy(Time.new(2013, 06, 30)), "06/13"
   end

   def test_format_datetime_continuous
      assert_equal @mock.format_datetime_continuous(Time.new(2013, 06, 30, 2, 2, 2)), 
         "Date(2013, 5, 30,  2, 02, 02)"
   end

   def test_cumul_col_def
      assert_equal @mock.cumul_col_def("sport").to_s, 
         '{:id=>"cumulation(col)", :label=>"Sport Cumulation", :type=>"number"}'
   end

   def test_hashes_to_table
      assert_equal @mock.hashes_to_table({}, ["dateplaced", "profit"]).to_s, 
         '{:cols=>[{:id=>"A", :label=>"Date Placed", :type=>"datetime"}, {:id=>"B", :label=>"Profit", :type=>"number"}], :rows=>[]}'
   end

   def test_col_label
      assert_equal @mock.humanize("date_placed"), "Date placed"
   end

end
