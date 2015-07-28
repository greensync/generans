# Copyright (c) 2014 GreenSync Pty Ltd.
#
# This file is part of generans.
#
# generans is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published
# by the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# generans is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with generans.  If not, see <http://www.gnu.org/licenses/lgpl.html>.

require 'rake'
require 'rspec/core/rake_task'

desc 'Run all specs'
task default: [:specs]

RSpec::Core::RakeTask.new(:specs) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rspec_opts = ['--backtrace', '--format documentation']
end
