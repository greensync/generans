# Copyright (c) 2015 GreenSync Pty Ltd.
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

require_relative './spec_helper.rb'
require_relative '../src/generator.rb'

describe Generator do
  let(:generator) { Generator.new(false) }

  describe '#generate' do
    before { generator.stub(:sleep) }
    let(:output) do
      o = double(:output)
      allow(o).to receive(:state=)
      o
    end

    context 'normal operation' do
      before { generator.generate(output_port: output, frequency_hz: 2, duty_percent: 50, num_pulses: 2) }

      it 'sets the state false at the start, at the end, and during each pulses' do
        output.should have_received(:state=).with(false).exactly(4).times
      end

      it 'sets the state true at the start of each pulse' do
        output.should have_received(:state=).with(true).exactly(2).times
      end

      it 'sleeps for 0.25s per level change at 2Hz' do
        generator.should have_received(:sleep).with(0.25).exactly(4).times
      end
    end

    context 'on failure' do
      before do
        generator.stub(:sleep).and_raise
        begin
          generator.generate(output_port: output, frequency_hz: 2, duty_percent: 50, num_pulses: 2)
        rescue
          # silently swallow exception; we're interested in the output behaviour
        end
      end

      it 'sets the state false at the start, and again after the exception is raised' do
        output.should have_received(:state=).with(false).exactly(2).times
      end

    end
  end
end
