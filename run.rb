# frozen_string_literal: true

require './receipt'

all_examples_paths = ['challenge_examples/input1.txt',
                      'challenge_examples/input2.txt',
                      'challenge_examples/input3.txt']

file_paths = ARGV[0] ? [ARGV[0]] : all_examples_paths

file_paths.each do |file_path|
  receipt = Receipt.new(file_path)
  receipt.print
end
