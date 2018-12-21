#!/usr/bin/env ruby
# encoding: UTF-8

$: << File.dirname(__FILE__)
$oj_dir = File.dirname(File.expand_path(File.dirname(__FILE__)))
%w(lib ext).each do |dir|
  $: << File.join($oj_dir, dir)
end

require 'oj'
require 'tracer'

#Tracer.on

Oj.load_file(ARGV[0], mode: :strict) { |obj|
  puts Oj.dump(obj, indent: 2)
}
