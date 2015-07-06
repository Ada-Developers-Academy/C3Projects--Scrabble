require 'spec_helper'
require_relative '../lib/scrabble.rb'

	describe Scrabble::Foo do
		context "Must use a string of letters." do 
			it "returns an empty string upon integer input" do 
			foo = Scrabble::Foo.new
			expect(foo.convert(0)).to eq("")
			end
		end

		context "tallies letters to score the word" do
			it "returns the value of 16 when user inputs quarter." do
			expect(Scrabble::Foo.score("quarter")).to eq(16)
			end
		end

		context "returns the word from a given array with highest score" do
			it "returns quarter from array with [soldier(8), quarter(16), fey(9), lounged(9), wry(9)]" do
				x = ["soldier", "quarter", "fey", "lounged", "wry"]
				expect (Scrabble::Foo.highest_score_from(x))
			end
		end

		context "returns first word given in an array in where two words are equal in length and value" do
			it "returns wry from array with [soldier(8),wry(9), fey(9)]" do
				x = ["soldier", "wry", "fey"]
				expect (Scrabble::Foo.highest_score_from(x))
			end
		end

	end
# end




