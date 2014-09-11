# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

# Sample Ruby with IE without Watir or WebDriver
# this works from the cmd line.

require 'rubygems'
require 'win32ole'

ie = WIN32OLE.new('InternetExplorer.Application')
ie.Visible = true
ie.Navigate('http://www.google.com')

sleep(1) until ie.ReadyState == 4

# contents are represented by the Document object
# Document.All returns a collection of elements
# for example the Google input box
ie.Document.All.q.Value = 'ruby on windows'
# and the google search button
ie.Document.All.btnG.click
sleep(1) until ie.ReadyState == 4

links = ie.Document.All.Tags('a')

for link in links do
   puts link.InnerText
   puts link.href
end

ie.Quit
