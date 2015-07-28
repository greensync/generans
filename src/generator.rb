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

class Generator

  def initialize(verbose)
    @verbose = verbose
  end

  def generate(output_port: nil, frequency_hz: nil, duty_percent: nil, num_pulses: nil)
    output_port.state = false

    pulse_width_s = 1.0 / frequency_hz.to_f
    on_width_s = pulse_width_s * (duty_percent.to_f / 100)
    off_width_s = pulse_width_s - on_width_s

    $stderr.puts "WARNING: frequencies above 60Hz have proved unreliable in testing" if frequency_hz > 60
    $stderr.puts "WARNING: duty cycles under 10% have proved unreliable in testing" if duty_percent < 10

    if @verbose
      puts "frequency (Hz): #{frequency_hz}"
      puts "duty_percent (%): #{duty_percent}"
      puts "pulse width (s): #{pulse_width_s}"
      puts "on width (s): #{on_width_s}"
      puts "off width (s): #{off_width_s}"
    end

    begin
      num_pulses.times do
        output_port.state = true
        sleep(on_width_s)
        output_port.state = false
        sleep(off_width_s)
      end
    ensure
      output_port.state = false
    end

    puts "pulses generated: #{num_pulses}" if @verbose
  end

end
