'use strict'
root      = @
root.ADBD = {} unless root.ADBD
root.ADBD.checkId = 'XKPW8GNRLEGYCGBWCWXBMCODQDZVWOJ4T9ERWRCC6KGXDDEPTQ'
root.ADBD.adsjsLoaded = false

class root.ADBD

  constructor: (next)->
    scriptElement = document.getElementsByTagName('script')[0]
    adsjs = document.createElement('script')
    adsjs.src = '/ads.js'
    adsjs.onload = ->
      # ads.js script loaded
      checkDOM = window.getDocumentById root.ADBD.checkId

      if checkDOM
        # AdBlock not present
        next(false)
        root.ADBD.adsjsLoaded = true
      else 
        # Adblock enabled
        next(true)
        root.ADBD.adsjsLoaded = false

    scriptElement.parentNode.insertBefore adsjs, scriptElement

  isAdblockPresent:->
    return !root.ADBD.adsjsLoaded
