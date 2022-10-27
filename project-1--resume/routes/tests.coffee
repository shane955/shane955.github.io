
express = require 'express'
router = express.Router()

# Route for Guides to run a test
router.post '/run', (req, res) ->
  
  console.log req.body
  
  # Load the external test
  rootDir = '/home/codio/workspace/.guides/tests/'
  switch req.body.testid
    when "test-create"
      t = require rootDir + 'test-create.js'  
    when "test-rename"
      t = require rootDir + 'test-rename.js'  
    when "test-folder-1"
      t = require rootDir + 'test-folder-1.js'  
    when "test-drag-simple"
      t = require rootDir + 'test-drag-simple.js'        
    when "test-drag-tougher"
      t = require rootDir + 'test-drag-tougher.js'        
    when "test-drag-folders"
      t = require rootDir + 'test-drag-folders.js'        
    else
      res.send {syserror: true, success: false, msg: "Invalid test id"}
      return

  # Run the test
  t.test (data) ->
    console.log(data)    
    res.send data        
          
module.exports = router
