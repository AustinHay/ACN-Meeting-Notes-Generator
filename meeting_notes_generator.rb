#!/usr/bin/env ruby

# DEPENDENCY INSTALLATION:
# To get fileutils to work is a complicated process with quite a few dependencies:
# brew install imagemagick

# gem install rmagick
# gem install fileutils

# If you have trouble installing rmagick...

# Download & install: http://support.apple.com/kb/DL1572
# sudo chown -R $(whoami) /usr/local/lib/
# brew link --overwrite imagemagick
# brew doctor
# Download & install: http://apst.stsci.edu/apt/external/downloads/installers/install.html
# sudo chown -R `whoami` /usr/local
# sudo apt-get install libmagickwand-dev

# MAKING THIS COMMAND LINE EXECUTABLE:

# chmod a+x meeting_notes_generator.rb

require 'rubygems'
require 'fileutils'
require 'date'

# To figure out your working directory for fileutils, use the following CL command:
# Dir.pwd

generator_dir = "/Users/austinahay/Coding/meeting_notes_generator"
Dir.chdir "#{generator_dir}"
meeting_notes_template = Dir.glob('*.docx').first.to_s

# USER INPUT
meeting_name_options = "WT | APJC sync | DD AMER | DD EMEAR | DD APJC | forum"
puts meeting_name_options

puts "Type the meeting name."
meeting_name = gets.chomp

# Automatically assess the date
meeting_date = Date.parse(Time.now.to_s).strftime("%m_%d_%Y")

# Match user input to possible meeting values.
if meeting_name == "WT"
	notes_label = "Waterfall Working Team Meeting Notes"

	elsif meeting_name == "APJC sync"
		notes_label = "Waterfall Adoption APJC Sync Notes"

	elsif meeting_name == "DD AMER"
		notes_label = "Regional_DeepDive_AMER_Meeting Notes"

	elsif meeting_name == "DD EMEAR"
		notes_label = "Regional_DeepDive_EMEAR_Meeting Notes"

	elsif meeting_name == "DD APJC"
		notes_label = "Regional_DeepDive_APJC_Meeting Notes"

	elsif meeting_name == "forum"
		notes_label = "GAL_Forum_MeetingNotes"

	elsif meeting_name == "forum EMEAR"
		notes_label = "GAL_Forum_EMEAR_MeetingNotes"

	elsif meeting_name == "forum APJC"
		notes_label = "GAL_Forum_APJC_MeetingNotes"

	else 
		return "You didn't pick a provided option for meeting notes."
end

# Name and move the template to the appropriate location
	FileUtils.cp("#{generator_dir}/#{meeting_notes_template}", "/Users/austinahay/desktop/#{notes_label}_#{meeting_date}.docx")
