#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails32Mri193V3Dj::Application.load_tasks

namespace :trainer do
  task :prepare => :environment do
    Article.delete_all

    Article.create!(
      :title => 'Rails Ruby Sphinx',
      :body  => 'Lorem Ipsum and all that'
    )

    system 'flying-sphinx configure'
    system 'flying-sphinx index'
    system 'flying-sphinx start'
  end

  task :test => :environment do
    article = Article.find_by_title!('Rails Ruby Sphinx')

    puts "Checking search count"
    raise "Search count failed" if Article.search.length != 1
    puts "Checking search match"
    raise "Search match failed"  if Article.search('lorem').first != article

    system 'flying-sphinx rebuild'

    sleep 2

    puts "Checking search count"
    raise "Search count failed" if Article.search.length != 1
    puts "Checking search match"
    raise "Search match failed"  if Article.search('lorem').first != article

    latest = Article.create!(
      :title => "Latest Update",
      :body => "Read all about it!"
    )

    sleep 10

    puts "Checking count with delta"
    raise "Search count failed" if Article.search.length != 2
    puts "Checking search match"
    raise "Search match failed"  if Article.search('update').first != latest
  end

  task :cleanup => :environment do
    system 'flying-sphinx stop'
  end
end
