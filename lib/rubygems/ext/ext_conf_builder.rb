#--
# Copyright 2006 by Chad Fowler, Rich Kilmer, Jim Weirich and others.
# All rights reserved.
# See LICENSE.txt for permissions.
#++

require 'rubygems/ext/builder'
require 'rubygems/command'
require 'fileutils'
require 'tempfile'

class Gem::Ext::ExtConfBuilder < Gem::Ext::Builder
  FileEntry = FileUtils::Entry_ # :nodoc:

  def self.build(extension, directory, dest_path, results, args=[])
    tmp_dest = (Dir.mktmpdir(".gem.", ".") if File.identical?(dest_path, "."))

    siteconf = Tempfile.open(%w"siteconf .rb", ".") do |f|
      f.puts "require 'rbconfig'"
      f.puts "dest_path = #{(tmp_dest || dest_path).dump}"
      %w[sitearchdir sitelibdir].each do |dir|
        f.puts "RbConfig::MAKEFILE_CONFIG['#{dir}'] = dest_path"
        f.puts "RbConfig::CONFIG['#{dir}'] = dest_path"
      end
      f
    end

    rubyopt = ENV["RUBYOPT"]
    ENV["RUBYOPT"] = ["-r#{siteconf.path}", rubyopt].compact.join(' ')
    cmd = [Gem.ruby, File.basename(extension), *args].join ' '

    run cmd, results

    destdir = ENV["DESTDIR"]
    ENV["DESTDIR"] = nil

    make dest_path, results

    if tmp_dest
      FileEntry.new(tmp_dest).traverse do |ent|
        destent = ent.class.new(dest_path, ent.rel)
        destent.exist? or File.rename(ent.path, destent.path)
      end
    end

    results
  ensure
    ENV["RUBYOPT"] = rubyopt
    ENV["DESTDIR"] = destdir
    siteconf.close(true) if siteconf
    FileUtils.rm_rf tmp_dest if tmp_dest
  end

end

